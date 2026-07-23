# TODO: Improvements & Security Audit

## CRITICAL

### 1. Add CORS configuration
**File:** `src/main.ts`

No CORS configured — default Express behavior allows all origins.

```ts
app.enableCors({
  origin: process.env.ALLOWED_ORIGINS?.split(','),
  credentials: true,
});
```

Add `ALLOWED_ORIGINS` environment variable.

---

### 2. Add rate limiting to auth endpoints
**File:** `src/features/auth/auth.controller.ts`

`/auth/register` and `/auth/login` have no rate limiting — vulnerable to brute-force attacks.
Add `@Throttle()` decorator. `ThrottlerModule` is already used in `generate.module.ts` — apply globally in `app.module.ts`.

---

### 3. Fix weak password validation in LoginDto
**File:** `src/features/auth/dto/login.dto.ts` (line 7)

`password: z.string().min(1)` allows 1-character passwords. Change to `.min(6)` to match Firebase Auth minimum.

---

## HIGH

### 4. Add auth guards to unguarded endpoints
**Files:**
- `src/features/translations/translations.controller.ts` — `getTranslations()` and `composeArb()` have no `@UseGuards()`
- `src/features/applications/applications.controller.ts` (line 73) — `findApplicationById()` has no ownership verification

Verify if intentionally public or add guards.

---

### 5. Add .limit() to unbounded Firestore queries
**Files:**
- `src/features/users/users.service.ts` (line 26): `admin.auth().listUsers()` — no limit
- `src/features/artifacts/artifacts.service.ts` (line 63): `.find()` with no `.limit()`
- `src/features/themes/themes.service.ts` (line 91): `getAllThemes()` fetches ALL themes
- `src/features/embeds/embeds.controller.ts` (line 40): accepts `_limit`/`_cursor` but service ignores them

Add reasonable `.limit()` + implement pagination where missing.

---

### 6. Validate file upload size and type
**File:** `src/features/artifacts/artifacts.controller.ts`

File upload accepts files without size or MIME type validation.

```ts
@UseInterceptors(FileInterceptor('file', { limits: { fileSize: 10 * 1024 * 1024 } }))
```

Also validate MIME type against allowed types (image/png, image/jpeg, image/svg+xml, etc.).

---

## MEDIUM

### 7. Stop leaking internal error details to clients
**Files:**
- `src/features/auth/auth.service.ts` (lines 54, 69, 79): `'Login failed: ' + error.message` leaks Firebase internals
- `src/features/github-proxy/github-proxy.service.ts` (lines 43-44, 69-70): includes raw API response body

Return generic messages to clients, log full details via Logger.

---

### 8. Replace silent .catch(() => undefined) with logged errors
**Files:**
- `src/features/artifacts/artifacts.service.ts` (line 70): signed URL generation
- `src/features/themes/themes.service.ts` (line 402): asset removal

```ts
.catch((err) => { this.logger.warn('Operation failed', err.message); return undefined; })
```

---

### 9. Type Express Request objects instead of `any`
20+ controller methods use `@Req() req: any`.

Create a typed interface:
```ts
export interface AuthenticatedRequest extends Request {
  user: { uid: string; role?: string; email?: string };
}
```

---

### 10. Add DTO validation to unvalidated endpoints
**Files:**
- `src/features/applications/capabilities/capabilities.controller.ts` (line 35): body is `unknown`
- `src/features/applications/applications.controller.ts` (line 86): accepts raw `Application` entity

Create Zod DTOs for each.

---

### 11. Implement actual unit and integration tests
All 30 existing `.spec.ts` files are stubs — only test `"should be defined"`.

**Key areas:**
1. Auth flow — register, login, token refresh, invalid credentials
2. Theme CRUD — create, update, copy, delete, version conflicts
3. Theme history — snapshot creation, listing, pagination, patch
4. Artifacts — upload, signed URLs, deletion
5. Guards — role checks, ownership verification

**Infrastructure needed:**
- Firestore emulator setup
- Firebase Auth mocking
- Jest coverage thresholds (e.g., 60% minimum)

---

## LOW

### 12. Make PORT configurable via environment variable
**File:** `src/main.ts` (line 23)

Port hardcoded to `3000`. Change to `process.env.PORT || 3000`.

---

### 13. Extract hardcoded constants to configuration
- `ASSET_URL_TTL_SEC = 3600` (`themes.service.ts` line 15)
- `GITHUB_API_BASE_URL` (`github-proxy.service.ts` lines 8-13)
- Throttle limits `{ ttl: 60_000, limit: 5 }` (`generate.module.ts` line 25)

Move to `ConfigService` / env variables with sensible defaults.

---

### 14. Create @CurrentUser() decorator
Replace repeated `@Req() req: any` + `req.user.uid` pattern across 20+ methods:

```ts
export const CurrentUser = createParamDecorator((data: string, ctx: ExecutionContext) => {
  const request = ctx.switchToHttp().getRequest();
  return data ? request.user?.[data] : request.user;
});
```

Usage: `@CurrentUser('uid') uid: string`

---

### 15. Add .env.example file
Document all required environment variables:
- `FB_API_KEY`, `FB_AUTH_DOMAIN`, `FB_PROJECT_ID`, `FB_STORAGE_BUCKET`, `FB_MESSAGING_SENDER_ID`, `FB_APP_ID`
- `GOOGLE_APPLICATION_CREDENTIALS`
- `OPENAI_API_KEY`, `GITHUB_TOKEN`
- `STORAGE_PREFIX`, `COLLECTION_PREFIX`
- `NODE_ENV`, `ALLOWED_ORIGINS`

---

### 16. Resolve TODO comments in codebase
- `src/features/users/users.service.ts` (line 21): `// TODO: Move here user creation logic from auth service`
- `src/features/artifacts/artifacts.service.ts` (line 379): `// TODO: handle other source types (embed, feature, ...)`
