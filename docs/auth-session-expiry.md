# Session Expiry & Re-login

How the app reacts when the auth token expires or the backend returns **HTTP 401**.
This behaviour is intentional — change it deliberately, not by accident.

## Goals

1. **Never lose the user's place.** An expired session must not throw the user back to a
   blank login route and discard the page they were on.
2. **One clear call to action.** The user is told the session expired and asked to log in
   again — nothing else competes for attention.
3. **Recover cleanly.** After re-login the app returns to a working state without a manual
   refresh, and without destroying unsaved edits.

## The status model

`AuthenticationStatus` (`packages/domain`) has three values, streamed into the global
`AuthCubit` via `MonitorTokenExpirationUsecase`:

| Status | Meaning | UI reaction |
| --- | --- | --- |
| `authenticated` | Valid token. | Normal app. |
| `expired` | Token exists but is past `exp`, **or** a backend call returned 401 while a token is stored. | Full-screen re-login **on top of** the current page. |
| `unauthenticated` | No token at all. | Navigate to the login route. |

Detection chain: 401 interceptor / local `exp` check → `AuthRepositoryImpl` broadcast stream →
`MonitorTokenExpirationUsecase` → `AuthCubit` → `AuthReLoginShell`.

> Do **not** move re-login decisions off this status stream. Classify on the streamed status
> (or on the typed exception, see below), never on ad-hoc timers or one-off flags.

## Re-login is a screen, not a dialog

`AuthReLoginShell` (`lib/features/auth/view/auth_relogin_shell.dart`) is the single
`ShellRoute` wrapper that every authenticated page lives under. It owns the re-login surface:

- **`expired`** → push a **full-screen** re-login route (`WelcomeScreen` + `LoginScreen`) on the
  **root navigator**, on top of the current page. The underlying page stays mounted (its state
  is preserved). `redirectGuard` returns `null` for `expired`, so the router does **not**
  navigate — the overlay is intentional.
- **`authenticated`** → remove the re-login route and show the success snackbar.
- **`unauthenticated`** → remove the re-login route and `goNamed(login)`.

Rules to keep:

- The re-login surface is built through a **`WidgetBuilder`** (`reloginBuilder`), so each show
  gets a **fresh `LoginCubit`** — repeated expiry cycles must not reuse a disposed subtree.
- Dismissal is **status-driven** (the shell removes the route on `authenticated`), not tied to
  the login form's callback. `LoginScreen.onLogin` is therefore optional/nullable and is left
  unset for the re-login instance.
- Guard against showing twice, and never show it while already on the login route.

## Error dialogs are suppressed on 401

When the token expires, in-flight requests fail with 401. We already told the user to re-login,
so those failures must **not** raise error dialogs.

- HTTP 401 is mapped to a typed **`UnauthorizedException`** (`packages/domain`), mirroring the
  existing 409 → `VersionConflictException` pattern, inside `mapDioException`
  (`packages/data/lib/common/api_exception_mapper.dart`).
- `showFailureMessage` (`lib/core/mixin/mixin_messages.dart`) — the single choke point every
  error dialog goes through — returns early for an `UnauthorizedException`. Every other error
  still shows a dialog.

Classification is done on the **exception object** (synchronous), not on the async auth-status
stream, to avoid a race with the re-login flow.

**Repository contract:** for this to work app-wide, a 401 must reach the UI *as* an
`UnauthorizedException`. Repository methods that hit the backend must therefore surface **domain
exceptions**, never a raw `DioException`. Wrap backend calls with the standard pattern:

```dart
try {
  return await datasource.something();
} on DioException catch (e) {
  throw mapDioException(e);
} catch (e) {
  throw BaseException(message: e.toString());
}
```

Do not flatten a `DioException` straight to `BaseException(message: ...)` — that discards the
status code and defeats the 401 classification. Firebase Storage and local-prefs repositories
are exempt (they never produce a backend 401).

**Login / reset are exempt.** Those flows do not route through `mapDioException`; their failures
stay `AuthException` so wrong-password / no-user feedback is still shown.

## The page re-initializes after re-login

Because the page stays mounted under the re-login overlay, a page whose data load failed on the
401 is left in a broken/empty state. On recovery it must re-fetch.

- **`AuthReloginTrigger`** (`lib/features/auth/view/auth_relogin_trigger.dart`) fires its
  `onRelogin` callback **only** on the `expired → authenticated` transition (via `listenWhen`).
  It does not fire on every `authenticated` emit.
- **Read-only view pages that fetch on init are wrapped** in `AuthReloginTrigger` and reload on
  recovery: application collection, application details, theme collection, and the embeds /
  publication resources / assets sub-tabs. New view pages of this kind should follow suit.

### Editor / form pages are deliberately NOT auto-reloaded

Pages that hold in-place editable state are **not** wrapped, so unsaved work survives a
re-login: **theme editor**, application **edit / create**, **translations**, **environment**,
**deployment**.

Rationale: if the token expired mid-edit, the page's loaded data is still valid and only a
later mutation returned 401 — auto-reloading would discard the user's edits. If such a page's
*initial* load itself failed there are no edits yet; it may be added later if that case matters.

## Checklist when adding a new authenticated page

- [ ] Backend repository methods it calls wrap `DioException` → `mapDioException` (so 401 →
      `UnauthorizedException`).
- [ ] If it is a **read-only view that fetches on init**, wrap it in `AuthReloginTrigger` with a
      public reload method, so it recovers after re-login.
- [ ] If it holds **editable/form state**, leave it unwrapped to preserve unsaved edits.
- [ ] Surface errors through `showFailureMessage` (401s are suppressed there automatically).

## Key files

| Concern | File |
| --- | --- |
| Status enum | `packages/domain/lib/models/auth/authentication_status.dart` |
| Status stream / global state | `lib/features/auth/bloc/auth_cubit.dart` |
| Re-login overlay (shell) | `lib/features/auth/view/auth_relogin_shell.dart` |
| Re-login route wiring | `lib/app/route/app_route.dart` |
| Recover-on-relogin trigger | `lib/features/auth/view/auth_relogin_trigger.dart` |
| 401 → typed exception | `packages/data/lib/common/api_exception_mapper.dart` |
| `UnauthorizedException` | `packages/domain/lib/exception/unauthorized_exception.dart` |
| Error-dialog suppression | `lib/core/mixin/mixin_messages.dart` |
