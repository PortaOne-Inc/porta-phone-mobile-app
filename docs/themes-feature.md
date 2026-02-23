# Themes Feature

The **Themes** feature manages the full lifecycle of application themes: CRUD, AI-powered generation,
color schemes, widget & page configs, splash/launch assets, and feature entitlements.

---

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [Directory Structure](#directory-structure)
- [Module Dependency Graph](#module-dependency-graph)
- [Data Model](#data-model)
- [Firestore Collections](#firestore-collections)
    - [Composite Indexes](#composite-indexes)
- [API Endpoints](#api-endpoints)
    - [Themes (CRUD)](#themes-crud)
    - [Color Schemes](#color-schemes)
    - [Widget Configs](#widget-configs)
    - [Page Configs](#page-configs)
    - [Splash Assets](#splash-assets)
    - [Launch Assets](#launch-assets)
    - [Feature Access](#feature-access)
    - [AI Generation](#ai-generation)
- [Core Flows](#core-flows)
    - [Theme Creation](#theme-creation)
    - [Theme Copy](#theme-copy)
    - [Theme Deletion (Cascade)](#theme-deletion-cascade)
    - [AI Generation Flow](#ai-generation-flow)
    - [Asset Upload & Resolution](#asset-upload--resolution)
    - [Error Handling in Asset Services](#error-handling-in-asset-services)
- [Configuration](#configuration)
- [Authentication](#authentication)

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│                     ThemesModule                        │
│                                                         │
│  ThemesController ──► ThemesService                     │
│                          │                              │
│         ┌────────────────┼────────────────┐             │
│         ▼                ▼                ▼             │
│  ArtifactsModule   AssetsModule   CloudStorageModule    │
│                                                         │
│  ┌───────────────── Sub-features ─────────────────┐    │
│  │                                                 │    │
│  │  ColorSchemesModule   WidgetConfigsModule       │    │
│  │  PageConfigsModule    SplashAssetsModule         │    │
│  │  LaunchAssetsModule   FeatureAccessModule        │    │
│  │  GenerateModule                                  │    │
│  │                                                 │    │
│  └─────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────┘
```

Each sub-feature has its own controller, service, DTOs, and entity. `ThemesService` orchestrates
cross-feature operations (copy, cascade delete, legacy aggregation).

---

## Directory Structure

```
src/features/themes/
├── themes.module.ts              # Root module — imports all sub-feature modules
├── themes.controller.ts          # CRUD + copy + legacy endpoints
├── themes.service.ts             # Orchestrator: copy, cascade delete, aggregation
├── entities/
│   ├── theme.ts                  # Theme Firestore entity
│   └── build-version.ts          # BuildVersion helper
├── dto/
│   └── themes.dto.ts             # CreateThemeDto, UpdateThemeDto, CopyThemeDto
│
└── features/
    ├── color-schemes/
    │   ├── color-schemes.module.ts
    │   ├── color-schemes.controller.ts
    │   ├── color-schemes.service.ts
    │   └── entities/color-scheme.ts
    │
    ├── widget-configs/
    │   ├── widget-configs.module.ts
    │   ├── widget-configs.controller.ts
    │   ├── widget-configs.service.ts
    │   └── entities/widget-config.entity.ts
    │
    ├── page-configs/
    │   ├── page-configs.module.ts
    │   ├── page-configs.controller.ts
    │   ├── page-configs.service.ts
    │   └── entities/page-config.entity.ts
    │
    ├── splash-assets/
    │   ├── splash-assets.module.ts
    │   ├── splash-assets.controller.ts
    │   ├── splash-assets.service.ts
    │   └── entities/splash-asset.entity.ts
    │
    ├── launch-assets/
    │   ├── launch-assets.module.ts
    │   ├── launch-assets.controller.ts
    │   ├── launch-assets.service.ts
    │   └── entities/launch-assets.entity.ts
    │
    ├── feature-access/
    │   ├── feature-access.module.ts
    │   ├── feature-access.controller.ts
    │   ├── feature-access.service.ts
    │   └── entities/feature-access.ts
    │
    └── generate/
        ├── generate.module.ts
        ├── generate.controller.ts
        ├── generate.service.ts         # Orchestrates 3 generators
        ├── dto/
        │   ├── create-generate.dto.ts  # Zod schema: GenerateThemeSchema
        │   └── nudge-theme.dto.ts      # Zod schema: NudgeThemeSchema
        ├── guards/
        │   └── firebase-uid-throttler.guard.ts  # Rate limiting by Firebase UID
        ├── schemas/
        │   ├── color-scheme.schema.ts  # Zod — 39 Material 3 color fields
        │   ├── widget-config.schema.ts # Zod — fonts, buttons, dialogs, statuses
        │   └── page-config.schema.ts   # Zod — login & dialing page styles
        └── generators/
            ├── openai-client.service.ts     # OpenAI wrapper (gpt-4o-mini, temp 0.2, 30s timeout)
            ├── color-scheme.generator.ts    # generate / nudge / fallback
            ├── widget-config.generator.ts   # generate / nudge / fallback
            └── page-config.generator.ts     # generate / nudge / fallback
```

---

## Module Dependency Graph

```
ThemesModule
 ├── CommonModule
 ├── ArtifactsModule          ← image artifact storage (Cloud Storage)
 ├── AssetsModule             ← user-uploaded assets
 ├── ColorSchemesModule
 ├── WidgetConfigsModule
 │     └── AssetsModule       ← resolves image asset IDs → signed URLs
 ├── PageConfigsModule
 │     └── AssetsModule       ← resolves image asset IDs → signed URLs
 ├── SplashAssetsModule
 │     └── ArtifactsModule    ← manages splash image artifacts
 ├── LaunchAssetsModule
 │     └── ArtifactsModule    ← manages launcher icon artifacts (5 platforms)
 ├── FeatureAccessModule
 └── GenerateModule
       ├── ColorSchemesModule
       ├── WidgetConfigsModule
       ├── PageConfigsModule
       └── OpenAiClientService
```

---

## Data Model

### Theme

| Field           | Type    | Description                    |
|-----------------|---------|--------------------------------|
| `id`            | string  | Auto-generated Firestore ID    |
| `applicationId` | string  | Parent application reference   |
| `title`         | string? | Human-readable name            |
| `description`   | string? | Theme description              |
| `label`         | enum?   | `'dev'` / `'stage'` / `'prod'`              |
| `version`       | number? | Optimistic locking counter (starts at 1)    |
| `createdAt`     | string  | ISO timestamp                               |
| `updatedAt`     | string  | ISO timestamp                               |

### ColorScheme

| Field           | Type                   | ID format             |
|-----------------|------------------------|-----------------------|
| `id`            | string                 | `{themeId}_{variant}` |
| `applicationId` | string                 |                       |
| `themeId`       | string                 |                       |
| `variant`       | `'light'` / `'dark'`   |                       |
| `config`        | object (39 hex colors) | Material 3 palette    |
| `version`       | number?                | Optimistic locking    |

### WidgetConfig

| Field           | Type                 | ID format                                    |
|-----------------|----------------------|----------------------------------------------|
| `id`            | string               | `{themeId}_{variant}`                        |
| `applicationId` | string               |                                              |
| `themeId`       | string               |                                              |
| `variant`       | `'light'` / `'dark'` |                                              |
| `config`        | object               | Fonts, buttons, dialogs, statuses, gradients |
| `version`       | number?              | Optimistic locking                           |

### PageConfig

| Field           | Type                 | ID format                                |
|-----------------|----------------------|------------------------------------------|
| `id`            | string               | `{themeId}_{variant}`                    |
| `applicationId` | string               |                                          |
| `themeId`       | string               |                                          |
| `variant`       | `'light'` / `'dark'` |                                          |
| `config`        | object               | Login page, dialing page, overlay styles |
| `version`       | number?              | Optimistic locking                       |

### SplashAsset

| Field              | Type    | ID format                                                      |
|--------------------|---------|----------------------------------------------------------------|
| `id`               | string  | `= themeId`                                                    |
| `applicationId`    | string  |                                                                |
| `themeId`          | string  |                                                                |
| `source`           | object? | `foregroundAssetId`, `backgroundAssetId`, `backgroundColorHex` |
| `params`           | object? | `fit` (SplashFit), `paddingDp`, `backgroundColorHex`           |
| `mode`             | enum    | `'withBackground'` / `'withoutBackground'`                     |
| `outputsArtifacts` | object? | `splashArtifactId`, `android12SplashArtifactId` → Cloud Storage artifacts |

**Upload targets:**

| Target             | Description                                                        | Export size          |
|--------------------|--------------------------------------------------------------------|----------------------|
| `splash`           | General splash image for all platforms                             | 1024px (512dp × 2)  |
| `android12Splash`  | Android 12+ circular-masked icon area (optional)                   | 1152px (288dp × 4)  |

**Constraints defaults** (`GET .../constraints-defaults`):

| Slice              | `fullSizeDp` | `maskDiameterDp` | `toleranceDp` | Notes                              |
|--------------------|--------------|-------------------|---------------|------------------------------------|
| `withBackground`   | 240          | 160               | 240           | General splash with background     |
| `withoutBackground`| 288          | 192               | 288           | General splash without background  |
| `android12`        | 288          | 192               | 288           | Android 12 circular mask safe zone |

The `android12` slice and `android12SplashArtifactId` are optional for backward compatibility — old clients that don't send the `android12Splash` upload target continue working unchanged.

### LaunchAssets

| Field              | Type    | ID format                                                              |
|--------------------|---------|------------------------------------------------------------------------|
| `id`               | string  | `= themeId`                                                            |
| `applicationId`    | string  |                                                                        |
| `themeId`          | string  |                                                                        |
| `source`           | object? | `foregroundAssetId`, `backgroundAssetId`, `backgroundColorHex`         |
| `params`           | object? | Per-platform padding: `androidLegacy`, `androidAdaptive`, `ios`, `web` |
| `outputsArtifacts` | object? | 5 artifact IDs: android legacy, adaptive fg/bg, iOS, web               |

### FeatureAccess

| Field           | Type                      | ID format                    |
|-----------------|---------------------------|------------------------------|
| `id`            | string                    | `= themeId`                  |
| `applicationId` | string                    |                              |
| `themeId`       | string                    |                              |
| `status`        | `'draft'` / `'published'` |                              |
| `config`        | object                    | Arbitrary feature flags JSON |
| `version`       | number?                   | Optimistic locking           |

---

## Firestore Collections

| Collection                   | Entity        | ID strategy                                    |
|------------------------------|---------------|------------------------------------------------|
| `app_themes`                 | Theme         | Auto-generated                                 |
| `theme_config_color_schemes` | ColorScheme   | `{themeId}_{variant}`                          |
| `theme_config_widgets`       | WidgetConfig  | `{themeId}_{variant}`                          |
| `theme_config_pages`         | PageConfig    | `{themeId}_{variant}`                          |
| `theme_assets_splash`        | SplashAsset   | `= themeId`                                    |
| `theme_assets_launcher`      | LaunchAssets  | `= themeId`                                    |
| `theme_feature_entitlements` | FeatureAccess | `= themeId`                                    |
| `theme_configs_defaults`     | —             | `splashAssetsDefaults`, `launchAssetsDefaults` |

### Composite Indexes

Queries that filter on two or more fields require Firestore composite indexes to avoid full collection scans.
These are defined in `firestore.indexes.json` and deployed via `firebase deploy --only firestore:indexes`.

| Collection                       | Indexed Fields                              | Used By                                     |
|----------------------------------|---------------------------------------------|---------------------------------------------|
| `theme_config_color_schemes`     | `applicationId` + `themeId`                 | `ColorSchemesService.listForTheme()`        |
| `theme_config_widgets`           | `applicationId` + `themeId`                 | `WidgetConfigsService.listForTheme()`       |
| `theme_config_pages`             | `applicationId` + `themeId`                 | `PageConfigsService.listForTheme()`         |
| `theme_feature_entitlements`     | `applicationId` + `themeId`                 | `FeatureAccessService.getByTheme()` / `upsertByTheme()` |
| `application_assets_renditions`  | `ownerId` + `applicationId` + `themeId`     | `ArtifactsService.findAll()`                |
| `themes`                         | `applicationId` + `label`                   | `ApplicationsService.resolveThemeIdForBuild()` |
| `translations`                   | `applicationId` + `locale` + `key`          | `TranslationsRepository.deleteOverrideByAppId()` |

> **Note:** If `COLLECTION_PREFIX` is set, the actual collection names in Firestore will be prefixed
> (e.g., `dev_theme_config_widgets`). The index file must be updated to match the prefixed names
> before deploying to that environment.

---

## API Endpoints

All endpoints are under `/applications/:applicationId/themes`. Auth: Firebase Bearer token (`admin` or `user` role).

### Themes (CRUD)

| Method   | Path               | Description                                   |
|----------|--------------------|-----------------------------------------------|
| `GET`    | `/`                | List all themes for the application           |
| `GET`    | `/all`             | List all themes across all applications       |
| `GET`    | `/:themeId`        | Get a specific theme                          |
| `GET`    | `/:themeId/legacy` | Get aggregated legacy theme (backward compat) |
| `POST`   | `/`                | Create a new theme                            |
| `PATCH`  | `/:themeId`        | Update theme (supports `expectedVersion` for optimistic locking) |
| `DELETE` | `/:themeId`        | Cascade delete theme + all related data       |
| `POST`   | `/:themeId/copy`   | Clone theme with all configs                  |

**DELETE** accepts `?purgeOrphanAssets=true` to also remove orphaned Cloud Storage artifacts.

### Color Schemes

| Method | Path                                  | Description                    |
|--------|---------------------------------------|--------------------------------|
| `GET`  | `/:themeId/color-schemes`             | List all variants (light/dark) |
| `GET`  | `/:themeId/color-schemes/:variant`    | Get specific variant           |
| `PUT`  | `/:themeId/color-schemes/ensure-pair` | Ensure both light & dark exist |
| `PUT`  | `/:themeId/color-schemes/:variant`    | Upsert with deep merge (supports `expectedVersion`) |

### Widget Configs

| Method | Path                                   | Description                                |
|--------|----------------------------------------|--------------------------------------------|
| `GET`  | `/:themeId/widget-configs`             | List all variants                          |
| `GET`  | `/:themeId/widget-configs/:variant`    | Get specific variant (resolves image URLs) |
| `PUT`  | `/:themeId/widget-configs/ensure-pair` | Ensure both light & dark exist             |
| `PUT`  | `/:themeId/widget-configs/:variant`    | Upsert with deep merge (supports `expectedVersion`) |

### Page Configs

| Method | Path                                 | Description                                |
|--------|--------------------------------------|--------------------------------------------|
| `GET`  | `/:themeId/page-configs`             | List all variants                          |
| `GET`  | `/:themeId/page-configs/:variant`    | Get specific variant (resolves image URLs) |
| `PUT`  | `/:themeId/page-configs/ensure-pair` | Ensure both light & dark exist             |
| `PUT`  | `/:themeId/page-configs/:variant`    | Upsert with deep merge (supports `expectedVersion`) |

### Splash Assets

| Method   | Path                                          | Description                                                        |
|----------|-----------------------------------------------|--------------------------------------------------------------------|
| `GET`    | `/:themeId/splash-asset`                      | Get config (optional: `withValidation`, `includeUrl`, `urlTtlSec`) |
| `PUT`    | `/:themeId/splash-asset/upload-batch`         | Multipart upload + config merge                                    |
| `DELETE` | `/:themeId/splash-asset`                      | Delete config + Cloud Storage artifacts (splash + android12)       |
| `GET`    | `/:themeId/splash-asset/constraints-defaults` | Get default constraints from Firestore                             |

### Launch Assets

| Method   | Path                                          | Description                                                        |
|----------|-----------------------------------------------|--------------------------------------------------------------------|
| `GET`    | `/:themeId/launch-asset`                      | Get config (optional: `withValidation`, `includeUrl`, `urlTtlSec`) |
| `PUT`    | `/:themeId/launch-asset/upload-batch`         | Multipart upload for 5 platform targets                            |
| `DELETE` | `/:themeId/launch-asset`                      | Delete config + all platform artifacts                             |
| `GET`    | `/:themeId/launch-asset/constraints-defaults` | Get default constraints from Firestore                             |

### Feature Access

| Method   | Path                       | Description                  |
|----------|----------------------------|------------------------------|
| `GET`    | `/:themeId/feature-access` | Get feature entitlements     |
| `PUT`    | `/:themeId/feature-access` | Upsert feature access config (supports `expectedVersion`) |
| `DELETE` | `/:themeId/feature-access` | Delete feature entitlements  |

### AI Generation

| Method | Path                       | Description                         |
|--------|----------------------------|-------------------------------------|
| `POST` | `/generate`                | Generate a new theme from AI prompt |
| `POST` | `/:themeId/generate/nudge` | Refine existing theme via AI prompt |

See [docs/generate-themes.md](./generate-themes.md) for detailed generation documentation.

---

## Core Flows

### Theme Creation

```
POST /applications/:appId/themes
  { title, description, label? }
        │
        ▼
  ThemesService.createTheme()
        │
        ▼
  Save Theme entity to Firestore (app_themes)
        │
        ▼
  Return { id, applicationId, title, ... }
```

At this point the theme has no configs, colors, or assets — those are added separately via
sub-feature endpoints or via AI generation.

### Theme Copy

The copy operation is **atomic** — all documents are written in a single Firestore `WriteBatch`.
If any write fails, nothing is committed.

```
POST /applications/:appId/themes/:themeId/copy
  { title?, description?, label? }
        │
        ▼
  ThemesService.copyTheme()
        │
        ├── 1. Read source theme
        │
        ├── 2. Collect all writes into a single Firestore WriteBatch:
        │      ├── New Theme entity (version: 1, optional overrides)
        │      ├── Color schemes (both light & dark variants)
        │      ├── Widget configs (both variants)
        │      ├── Page configs (both variants)
        │      ├── Splash asset config (reset outputsArtifacts)
        │      ├── Launch asset config (reset outputsArtifacts)
        │      └── Feature access entitlements
        │
        ├── 3. batch.commit() — atomic write
        │
        └── Return new theme with all cloned data
```

Note: artifact binaries are NOT copied — only configuration is cloned. The user must re-upload
splash/launch images for the new theme. Feature access entitlements are now included in the copy.

### Theme Deletion (Cascade)

```
DELETE /applications/:appId/themes/:themeId?purgeOrphanAssets=true
        │
        ▼
  ThemesService.deleteTheme()
        │
        ├── Delete color schemes      (themeId_light, themeId_dark)
        ├── Delete widget configs      (themeId_light, themeId_dark)
        ├── Delete page configs        (themeId_light, themeId_dark)
        ├── Delete splash asset        (themeId)
        │     └── if purgeOrphanAssets: delete Cloud Storage artifacts (splash + android12Splash)
        ├── Delete launch assets       (themeId)
        │     └── if purgeOrphanAssets: delete 5 Cloud Storage artifacts
        ├── Delete feature access      (themeId)
        └── Delete Theme entity        (themeId)
```

### AI Generation Flow

```
POST /themes/generate
        │
        ▼
  GenerateThemesService.generateAndCreate()
        │
        ├── Create Theme entity
        │
        ├── ColorSchemeGenerator.generate(prompt, seedColor?)
        │     ├── OpenAI GPT-4o-mini → JSON (39 hex colors)
        │     ├── Zod validate (strict: all fields required)
        │     └── On failure → hardcoded fallback (#F95A14 seed)
        │
        ├── Promise.all([
        │     WidgetConfigGenerator.generate(prompt, colorScheme)
        │       ├── OpenAI → JSON (fonts, buttons, avatars, etc.)
        │       ├── Zod validate (lenient: all fields optional)
        │       └── On failure → fallback(colorScheme)
        │     ,
        │     PageConfigGenerator.generate(prompt, colorScheme)
        │       ├── OpenAI → JSON (login, dialing pages)
        │       ├── Zod validate (lenient)
        │       └── On failure → fallback(colorScheme)
        │   ])
        │
        ├── Save all 3 configs to Firestore
        └── Return { theme, colorSchemeConfig, widgetConfig, pageConfig }
```

**Nudge** (incremental refinement) follows a similar flow but loads existing configs first and
supports `mode: 'patch'` (deep merge AI delta over current) or `'replace'` (full replacement).
Only requested `targets` are updated.

### Asset Upload & Resolution

**Upload (Splash/Launch)**:

```
PUT /:themeId/splash-asset/upload-batch
  Content-Type: multipart/form-data
  ├── dto (JSON):     { source, params, mode }
  ├── targets (JSON): { "field1": "splash", "field2": "android12Splash" }
  └── files:          field1 → general splash, field2 → Android 12 splash
        │
        ▼
  SplashAssetsService.upsertWithFiles()
        │
        ├── Remove previous artifacts (splash + android12Splash)
        ├── Upload each file mapped to its target → ArtifactsService → Cloud Storage
        ├── Deep merge config with existing doc
        └── Save to Firestore:
              ├── outputsArtifacts.splashArtifactId = ...
              └── outputsArtifacts.android12SplashArtifactId = ... (optional)
```

**Resolution (Widget/Page configs)**:

```
GET /:themeId/widget-configs/:variant
        │
        ▼
  WidgetConfigsService.getByThemeVariant()
        │
        ├── Load config from Firestore
        ├── resolveImageSourceUrlsDeep(config)
        │     └── Recursively find asset ID references
        │         └── AssetsService → CloudStorageService.getSignedUrl()
        └── Return config with signed URLs (TTL: urlTtlSec, default 3600s)
```

This allows widget/page configs to reference assets by ID. On read, IDs are transparently
resolved to time-limited signed URLs that the client can fetch directly.

### Error Handling in Asset Services

Asset upload and resolution operations use **fail-fast** error handling — errors are surfaced
to the caller rather than swallowed silently:

| Operation | Service | Behavior |
|---|---|---|
| Image URL resolution | `WidgetConfigsService` | If a signed URL cannot be generated for a known asset ID, the request fails (500). Prevents returning configs with silently broken image references. |
| Old artifact removal | `SplashAssetsService` | If removing a previous artifact fails during re-upload, the operation aborts (`400`). Prevents orphaned files in Cloud Storage. |
| Platform uploads | `LaunchAssetsService` | All platform uploads run in parallel. If any upload fails, the entity is **not** persisted — prevents saving partial state with missing artifact IDs. |

---

## Optimistic Locking

All theme entities and sub-config entities include an optional `version` field for optimistic concurrency control.

**How it works:**

1. Client reads an entity and receives its current `version` (e.g., `3`)
2. Client sends an update with `expectedVersion: 3`
3. Server checks: if `expectedVersion` matches the current `version`, the update proceeds and `version` is incremented
4. If `expectedVersion` does not match (another client updated in between), the server returns **409 Conflict**

**Backwards compatible:** If `expectedVersion` is not provided, the update proceeds without version checking (overwrite semantics).

Supported on: `PATCH /themes/:themeId`, `PUT` color-schemes, widget-configs, page-configs, and feature-access upsert endpoints.

New entities start at `version: 1`. Copied themes and all their sub-resources also start at `version: 1`.

---

## Rate Limiting

AI generation endpoints are rate-limited per Firebase UID using `@nestjs/throttler`:

| Endpoint                          | Limit    | Window |
|-----------------------------------|----------|--------|
| `POST /themes/generate`          | 5 req    | 60 sec |
| `POST /themes/:id/generate/nudge`| 10 req   | 60 sec |

When the limit is exceeded, the server returns **429 Too Many Requests** with a `Retry-After` header.
Falls back to IP-based throttling if the Firebase UID is not available.

---

## Configuration

| Variable         | Required | Description                                                   |
|------------------|----------|---------------------------------------------------------------|
| `OPENAI_API_KEY` | No       | Enables AI generation. If absent, fallback palettes are used. |

OpenAI settings (inside `OpenAiClientService`):

- Model: `gpt-4o-mini`
- Temperature: `0.2`
- Response format: `{ type: 'json_object' }`
- Request timeout: `30 seconds`

---

## Authentication

All theme endpoints require a Firebase Bearer token via `FirebaseAuthGuard`.

- Token is validated against Firebase Auth
- User UID is extracted from the token
- Required roles: `admin` or `user`
- `applicationId` is scoped per request (path param)
