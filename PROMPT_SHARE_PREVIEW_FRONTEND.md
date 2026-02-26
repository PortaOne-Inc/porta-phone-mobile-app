# Theme Share Preview — Frontend (Configurator) Implementation

## Overview

Users can generate a shareable link for any theme. Anyone with the link opens a read-only full preview — no authentication required, no editing. Share links are snapshot-based (immutable).

---

## 1. Route: `/share/:shareToken`

### Route constant

**File**: `lib/app/route/app_route_consts.dart`

```dart
static const sharePreview = DestinationInfo(
  name: 'share-preview',
  path: '/share/:$keyShareToken',
);
static const String keyShareToken = 'shareToken';
```

### Route registration

**File**: `lib/app/route/app_route.dart`

Added as a **top-level route before** the `ShellRoute`, so it's outside `AuthReLoginShell` and requires no authentication. Creates `SharedPreviewCubit` with the token from path parameters.

### Auth redirect bypass

**File**: `lib/features/auth/bloc/auth_cubit.dart`

In `redirectGuard()`: early return `null` for paths starting with `/share/`.

---

## 2. API Layer

### API paths

**File**: `packages/data/lib/datasource/configurator_backend/configurator_backand_api.dart`

```dart
class ThemeShareConfiguratorBackendAPI {
  static String get createToken => '/theme-shares';
  static String preview(String token) => '/theme-shares/$token';
}
```

### Datasource methods

**File**: `packages/data/lib/datasource/configurator_backend/configurator_backand_datasource.dart`

- `createShareToken({applicationId, themeId, tag?})` → `POST /theme-shares`
- `getSharedThemePreview(token)` → `GET /theme-shares/{token}`

---

## 3. DTO

**File**: `packages/data/lib/dto/theme/shared_theme_preview_dto.dart`

```dart
@freezed
sealed class SharedThemePreviewDto with _$SharedThemePreviewDto {
  const factory SharedThemePreviewDto({
    required Map<String, dynamic> theme,
    required List<Map<String, dynamic>> colorSchemes,
    required List<Map<String, dynamic>> widgetConfigs,
    required List<Map<String, dynamic>> pageConfigs,
    Map<String, dynamic>? splashAsset,
    Map<String, dynamic>? launchAsset,
    Map<String, dynamic>? featureAccess,
  }) = _SharedThemePreviewDto;
}
```

The backend returns arrays for `colorSchemes`, `widgetConfigs`, `pageConfigs` — each item has a `variant` field (`'light'` or `'dark'`) and a `config` field.

---

## 4. Domain Layer

### Model

**File**: `packages/domain/lib/models/themes/shared_theme_preview_model.dart`

- `SharedThemePreviewModel` — holds theme metadata, variants for each config type, plus optional splashAsset/launchAsset/featureAccess
- `SharedThemePreviewVariants` — extracts `{light, dark}` from arrays via `fromArray()` factory (filters by `variant` field, extracts `config`)

### Repository

Added to existing `ThemeRepository`:
- `createShareToken(applicationId, themeId, {tag?})` → `Future<String>`
- `getSharedThemePreview(token)` → `Future<SharedThemePreviewModel>`

**Implementation** (`theme_repository_impl.dart`): uses `SharedThemePreviewVariants.fromArray()` to convert array-based response to `{light, dark}` structure.

### Use cases

- `CreateShareTokenUsecase` — wraps `themeRepository.createShareToken()`
- `GetSharedThemePreviewUsecase` — wraps `themeRepository.getSharedThemePreview()`

---

## 5. SharedPreviewCubit

**File**: `lib/features/share_preview/bloc/shared_preview_cubit.dart`

Freezed state: `loading | loaded(SharedThemePreviewModel) | error(String)`

On init: calls `getSharedThemePreview(token)`, emits loaded/error. Has `retry()` method.

---

## 6. SharedPreviewPage

**File**: `lib/features/share_preview/view/shared_preview_page.dart`

Full-screen page with:
- **AppBar**: theme name + light/dark toggle
- **Body**: `TypePreview` (device frame) + `DrawerPreview` (thumbnail navigation)

Converts raw config maps to `ThemeSettings` using `ColorSchemeConfig.fromJson()`, `ThemeWidgetConfig.fromJson()`, `ThemePageConfig.fromJson()`. Builds `FeatureAccess` from feature access config JSON. Wraps with `ThemeProvider` + mock providers.

---

## 7. Share Button & Dialog

### ItemTheme popup menu

**File**: `lib/features/applications/features/application_details/widgets/item_theme.dart`

Added "Share Preview" menu item with `Icons.share_outlined`. Triggers `onShare(theme)` callback.

### ShareThemeDialog

**File**: `lib/features/applications/features/application_details/widgets/dialogs/share_theme_dialog.dart`

4-state dialog:
1. **Initial** — tag text field (max 100 chars) + "Generate Link" button
2. **Loading** — spinner with "Generating share link..."
3. **Success** — read-only URL field + copy button + "Link copied!" indicator
4. **Error** — error message + retry button

### ApplicationDetailsCubit

Added `shareTheme(ThemeModel, {tag?})` method that calls `createShareTokenUsecase.execute()` and returns the token.

### Wiring

`ApplicationDetailsPage._onShareTheme()` → `ShareThemeDialog.show()` → `bloc.shareTheme(theme, tag: tag)` → returns token → dialog constructs URL as `${Uri.base.origin}/share/$token`.

---

## 8. Theme History — Share Link Indicator

### Data layer

`ThemeHistoryEntryDto` and `ThemeHistoryEntryModel` include `String? shareTokenId` field. The mapper passes it through.

### UI

**File**: `lib/features/themes/features/theme_history/view/theme_history_page.dart`

In `_HistoryEntryTile`:
- When `shareTokenId != null`: shows a link icon badge next to the tag chip in the title row
- Shows a share button in trailing that copies `${Uri.base.origin}/share/${shareTokenId}` to clipboard with a snackbar confirmation

---

## Data Flow

### Creating a share link

```
User clicks "Share Preview" in theme popup menu
  → ShareThemeDialog opens (initial state with optional tag field)
  → User clicks "Generate Link"
  → ApplicationDetailsCubit.shareTheme(theme, tag: tag)
    → POST /theme-shares {applicationId, themeId, tag?}
      → Backend creates ThemeHistory snapshot + ThemeShareToken
      → Returns { token }
  → Dialog shows URL: https://host/share/{token}
  → User clicks copy icon → clipboard
```

### Viewing shared preview

```
Anyone opens /share/{token}
  → GoRouter matches (outside auth shell)
  → Auth redirect skipped
  → SharedPreviewCubit fetches data
    → GET /theme-shares/{token} (no auth)
      → Returns frozen snapshot
  → SharedPreviewPage renders:
    → Converts arrays → {light, dark} variants via fromArray()
    → Builds ThemeSettings + FeatureAccess
    → Shows TypePreview + DrawerPreview
```

### Share link in history

```
User opens Theme History
  → GET /applications/:appId/themes/:themeId/history
  → Entries with shareTokenId show link icon + share button
  → Click share button → copies share URL to clipboard
```
