# Themes: Core Flows

---

## Theme Creation

```
POST /applications/:appId/themes
  { title, description, label? }
        |
        v
  ThemesService.createTheme()
        |
        v
  Save Theme entity to Firestore (app_themes)
        |
        v
  Return { id, applicationId, title, ... }
```

At this point the theme has no configs, colors, or assets -- those are added separately via
sub-feature endpoints or via AI generation.

---

## Theme Copy

The copy operation is **atomic** -- all documents are written in a single Firestore `WriteBatch`.
If any write fails, nothing is committed.

```
POST /applications/:appId/themes/:themeId/copy
  { title?, description?, label? }
        |
        v
  ThemesService.copyTheme()
        |
        |-- 1. Read source theme
        |
        |-- 2. Collect all writes into a single Firestore WriteBatch:
        |      |-- New Theme entity (version: 1, optional overrides)
        |      |-- Color schemes (both light & dark variants)
        |      |-- Widget configs (both variants)
        |      |-- Page configs (both variants)
        |      |-- Splash asset config (reset outputsArtifacts)
        |      |-- Launch asset config (reset outputsArtifacts)
        |      +-- Feature access entitlements
        |
        |-- 3. batch.commit() -- atomic write
        |
        +-- Return new theme with all cloned data
```

Note: artifact binaries are NOT copied -- only configuration is cloned. The user must re-upload
splash/launch images for the new theme. Feature access entitlements are now included in the copy.

---

## Theme Deletion (Cascade)

```
DELETE /applications/:appId/themes/:themeId?purgeOrphanAssets=true
        |
        v
  ThemesService.deleteTheme()
        |
        |-- Delete color schemes      (themeId_light, themeId_dark)
        |-- Delete widget configs      (themeId_light, themeId_dark)
        |-- Delete page configs        (themeId_light, themeId_dark)
        |-- Delete splash asset        (themeId)
        |     +-- if purgeOrphanAssets: delete Cloud Storage artifacts (splash + android12Splash)
        |-- Delete launch assets       (themeId)
        |     +-- if purgeOrphanAssets: delete 5 Cloud Storage artifacts
        |-- Delete feature access      (themeId)
        +-- Delete Theme entity        (themeId)
```

---

## AI Generation Flow

```
POST /themes/generate
        |
        v
  GenerateThemesService.generateAndCreate()
        |
        |-- Create Theme entity
        |
        |-- ColorSchemeGenerator.generate(prompt, seedColor?)
        |     |-- OpenAI GPT-4o-mini -> JSON (39 hex colors)
        |     |-- Zod validate (strict: all fields required)
        |     +-- On failure -> hardcoded fallback (#F95A14 seed)
        |
        |-- Promise.all([
        |     WidgetConfigGenerator.generate(prompt, colorScheme)
        |       |-- OpenAI -> JSON (fonts, buttons, avatars, etc.)
        |       |-- Zod validate (lenient: all fields optional)
        |       +-- On failure -> fallback(colorScheme)
        |     ,
        |     PageConfigGenerator.generate(prompt, colorScheme)
        |       |-- OpenAI -> JSON (login, dialing pages)
        |       |-- Zod validate (lenient)
        |       +-- On failure -> fallback(colorScheme)
        |   ])
        |
        |-- Save all 3 configs to Firestore
        +-- Return { theme, colorSchemeConfig, widgetConfig, pageConfig }
```

**Nudge** (incremental refinement) follows a similar flow but loads existing configs first and
supports `mode: 'patch'` (deep merge AI delta over current) or `'replace'` (full replacement).
Only requested `targets` are updated.

See [AI Generation docs](./generate-themes.md) for detailed request/response schemas.

---

## Asset Upload & Resolution

### Upload (Splash/Launch)

```
PUT /:themeId/splash-asset/upload-batch
  Content-Type: multipart/form-data
  |-- dto (JSON):     { source, params, mode }
  |-- targets (JSON): { "field1": "splash", "field2": "android12Splash" }
  +-- files:          field1 -> general splash, field2 -> Android 12 splash
        |
        v
  SplashAssetsService.upsertWithFiles()
        |
        |-- Remove previous artifacts (splash + android12Splash)
        |-- Upload each file mapped to its target -> ArtifactsService -> Cloud Storage
        |-- Deep merge config with existing doc
        +-- Save to Firestore:
              |-- outputsArtifacts.splashArtifactId = ...
              +-- outputsArtifacts.android12SplashArtifactId = ... (optional)
```

### Resolution (Widget/Page configs)

```
GET /:themeId/widget-configs/:variant
        |
        v
  WidgetConfigsService.getByThemeVariant()
        |
        |-- Load config from Firestore
        |-- resolveImageSourceUrlsDeep(config)
        |     +-- Recursively find asset ID references
        |         +-- AssetsService -> CloudStorageService.getSignedUrl()
        +-- Return config with signed URLs (TTL: urlTtlSec, default 3600s)
```

This allows widget/page configs to reference assets by ID. On read, IDs are transparently
resolved to time-limited signed URLs that the client can fetch directly.

---

## Change History Recording

Every mutating operation triggers a fire-and-forget snapshot after the primary write completes.

```
  Any mutation (theme CRUD, sub-resource upsert, AI generation)
        |
        v
  Primary write completes (returns result to caller)
        |
        v
  ThemeHistoryService.recordSnapshot()   <-- async, non-blocking
        |
        |-- 7 parallel Firestore reads:
        |     |-- Theme doc
        |     |-- ColorSchemes (query by themeId)
        |     |-- WidgetConfigs (query by themeId)
        |     |-- PageConfigs (query by themeId)
        |     |-- SplashAsset doc (id = themeId)
        |     |-- LaunchAsset doc (id = themeId)
        |     +-- FeatureAccess (query by themeId)
        |
        |-- nextVersion: query latest snapshotVersion + 1
        |
        +-- Create ThemeHistory doc in theme_history collection
```

If `recordSnapshot()` fails, the error is logged but the original mutation is unaffected.
See [Change History docs](./theme-history.md) for the full list of tracked actions.

---

## Error Handling in Asset Services

Asset upload and resolution operations use **fail-fast** error handling -- errors are surfaced
to the caller rather than swallowed silently:

| Operation | Service | Behavior |
|---|---|---|
| Image URL resolution | `WidgetConfigsService` | If a signed URL cannot be generated for a known asset ID, the request fails (500). Prevents returning configs with silently broken image references. |
| Old artifact removal | `SplashAssetsService` | If removing a previous artifact fails during re-upload, the operation aborts (`400`). Prevents orphaned files in Cloud Storage. |
| Platform uploads | `LaunchAssetsService` | All platform uploads run in parallel. If any upload fails, the entity is **not** persisted -- prevents saving partial state with missing artifact IDs. |
