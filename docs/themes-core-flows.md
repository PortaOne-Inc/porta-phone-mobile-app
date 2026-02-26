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

## Cross-Application Theme Copy (Deep Copy)

Unlike the same-app copy above, `copy-to-application` performs a **deep copy** that includes all
referenced assets (images in Cloud Storage). The copied theme is fully independent -- deleting the
original does not affect it.

```
POST /applications/:appId/themes/:themeId/copy-to-application
  { targetApplicationId, title?, description?, label? }
        |
        v
  ThemesService.copyThemeToApplication()
        |
        |-- 1. Validate source theme exists in source app
        |-- 2. Validate target app exists and is owned by uid (else 403)
        |
        |-- 3. Read all sub-resources in parallel:
        |      widget configs, color schemes, page configs,
        |      splash, launch, feature entitlements
        |
        |-- 4. Collect all referenced asset IDs:
        |      |-- Deep walk widget/page config objects for { $ref: 'asset', id }
        |      +-- Explicit fields: splash/launch source.foregroundAssetId,
        |          source.backgroundAssetId
        |
        |-- 5. For each referenced asset:
        |      |-- Load source asset doc
        |      |-- Generate new ID + storage path under target app
        |      |-- Server-side GCS copy (no data through backend)
        |      |-- Create new Asset doc in Firestore
        |      +-- Build oldId -> newId mapping
        |
        |-- 6. Build Firestore WriteBatch:
        |      |-- New Theme entity (version: 1, target applicationId)
        |      |-- Widget configs with remapped asset IDs
        |      |-- Color schemes (no asset references)
        |      |-- Page configs with remapped asset IDs
        |      |-- Splash config (remapped source asset IDs, outputsArtifacts: {})
        |      |-- Launch config (remapped source asset IDs, outputsArtifacts: {})
        |      +-- Feature entitlements
        |
        |-- 7. batch.commit() -- atomic write
        |
        |-- On failure: best-effort rollback of created asset docs + GCS files
        |
        +-- Return new aggregated theme
```

**Key differences from same-app copy:**

| Aspect             | Same-app copy         | Cross-app copy                       |
|--------------------|-----------------------|--------------------------------------|
| Assets             | Shared (same IDs)     | Deep copied (new IDs, new GCS files) |
| GCS files          | Not copied            | Server-side copy via `File.copy()`   |
| Auth               | Same app ownership    | Caller must own **both** apps        |
| `outputsArtifacts` | Reset to `{}`         | Reset to `{}`                        |
| Rollback           | Atomic (single batch) | Asset cleanup on batch failure       |

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

| Operation            | Service                | Behavior                                                                                                                                               |
|----------------------|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| Image URL resolution | `WidgetConfigsService` | If a signed URL cannot be generated for a known asset ID, the request fails (500). Prevents returning configs with silently broken image references.   |
| Old artifact removal | `SplashAssetsService`  | If removing a previous artifact fails during re-upload, the operation aborts (`400`). Prevents orphaned files in Cloud Storage.                        |
| Platform uploads     | `LaunchAssetsService`  | All platform uploads run in parallel. If any upload fails, the entity is **not** persisted -- prevents saving partial state with missing artifact IDs. |
