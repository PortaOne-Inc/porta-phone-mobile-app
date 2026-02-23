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
        │   ├── create-generate.dto.ts
        │   └── nudge-theme.dto.ts
        ├── schemas/
        │   ├── color-scheme.schema.ts  # Zod — 39 Material 3 color fields
        │   ├── widget-config.schema.ts # Zod — fonts, buttons, dialogs, statuses
        │   └── page-config.schema.ts   # Zod — login & dialing page styles
        └── generators/
            ├── openai-client.service.ts     # OpenAI wrapper (gpt-4o-mini, temp 0.2)
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
| `label`         | enum?   | `'dev'` / `'stage'` / `'prod'` |
| `createdAt`     | string  | ISO timestamp                  |
| `updatedAt`     | string  | ISO timestamp                  |

### ColorScheme

| Field           | Type                   | ID format             |
|-----------------|------------------------|-----------------------|
| `id`            | string                 | `{themeId}_{variant}` |
| `applicationId` | string                 |                       |
| `themeId`       | string                 |                       |
| `variant`       | `'light'` / `'dark'`   |                       |
| `config`        | object (39 hex colors) | Material 3 palette    |

### WidgetConfig

| Field           | Type                 | ID format                                    |
|-----------------|----------------------|----------------------------------------------|
| `id`            | string               | `{themeId}_{variant}`                        |
| `applicationId` | string               |                                              |
| `themeId`       | string               |                                              |
| `variant`       | `'light'` / `'dark'` |                                              |
| `config`        | object               | Fonts, buttons, dialogs, statuses, gradients |

### PageConfig

| Field           | Type                 | ID format                                |
|-----------------|----------------------|------------------------------------------|
| `id`            | string               | `{themeId}_{variant}`                    |
| `applicationId` | string               |                                          |
| `themeId`       | string               |                                          |
| `variant`       | `'light'` / `'dark'` |                                          |
| `config`        | object               | Login page, dialing page, overlay styles |

### SplashAsset

| Field              | Type    | ID format                                                      |
|--------------------|---------|----------------------------------------------------------------|
| `id`               | string  | `= themeId`                                                    |
| `applicationId`    | string  |                                                                |
| `themeId`          | string  |                                                                |
| `source`           | object? | `foregroundAssetId`, `backgroundAssetId`, `backgroundColorHex` |
| `params`           | object? | `fit` (SplashFit), `paddingDp`, `backgroundColorHex`           |
| `mode`             | enum    | `'withBackground'` / `'withoutBackground'`                     |
| `outputsArtifacts` | object? | `splashArtifactId` → Cloud Storage artifact                    |

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
| `PATCH`  | `/:themeId`        | Update theme title / description / label      |
| `DELETE` | `/:themeId`        | Cascade delete theme + all related data       |
| `POST`   | `/:themeId/copy`   | Clone theme with all configs                  |

**DELETE** accepts `?purgeOrphanAssets=true` to also remove orphaned Cloud Storage artifacts.

### Color Schemes

| Method | Path                                  | Description                    |
|--------|---------------------------------------|--------------------------------|
| `GET`  | `/:themeId/color-schemes`             | List all variants (light/dark) |
| `GET`  | `/:themeId/color-schemes/:variant`    | Get specific variant           |
| `PUT`  | `/:themeId/color-schemes/ensure-pair` | Ensure both light & dark exist |
| `PUT`  | `/:themeId/color-schemes/:variant`    | Upsert with deep merge         |

### Widget Configs

| Method | Path                                   | Description                                |
|--------|----------------------------------------|--------------------------------------------|
| `GET`  | `/:themeId/widget-configs`             | List all variants                          |
| `GET`  | `/:themeId/widget-configs/:variant`    | Get specific variant (resolves image URLs) |
| `PUT`  | `/:themeId/widget-configs/ensure-pair` | Ensure both light & dark exist             |
| `PUT`  | `/:themeId/widget-configs/:variant`    | Upsert with deep merge                     |

### Page Configs

| Method | Path                                 | Description                                |
|--------|--------------------------------------|--------------------------------------------|
| `GET`  | `/:themeId/page-configs`             | List all variants                          |
| `GET`  | `/:themeId/page-configs/:variant`    | Get specific variant (resolves image URLs) |
| `PUT`  | `/:themeId/page-configs/ensure-pair` | Ensure both light & dark exist             |
| `PUT`  | `/:themeId/page-configs/:variant`    | Upsert with deep merge                     |

### Splash Assets

| Method   | Path                                          | Description                                                        |
|----------|-----------------------------------------------|--------------------------------------------------------------------|
| `GET`    | `/:themeId/splash-asset`                      | Get config (optional: `withValidation`, `includeUrl`, `urlTtlSec`) |
| `PUT`    | `/:themeId/splash-asset/upload-batch`         | Multipart upload + config merge                                    |
| `DELETE` | `/:themeId/splash-asset`                      | Delete config + Cloud Storage artifact                             |
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
| `PUT`    | `/:themeId/feature-access` | Upsert feature access config |
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

```
POST /applications/:appId/themes/:themeId/copy
  { title?, description?, label? }
        │
        ▼
  ThemesService.copyTheme()
        │
        ├── 1. Create new Theme entity (with optional overrides)
        │
        ├── 2. Clone color schemes (both light & dark variants)
        │      └── Copy config, assign new themeId in doc ID
        │
        ├── 3. Clone widget configs (both variants)
        │      └── Copy config, assign new themeId
        │
        ├── 4. Clone page configs (both variants)
        │      └── Copy config, assign new themeId
        │
        ├── 5. Clone splash asset config
        │      └── Copy config, reset outputsArtifacts (no binary copy)
        │
        ├── 6. Clone launch asset config
        │      └── Copy config, reset outputsArtifacts (no binary copy)
        │
        └── Return new theme with all cloned data
```

Note: artifact binaries are NOT copied — only configuration is cloned. The user must re-upload
splash/launch images for the new theme.

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
        │     └── if purgeOrphanAssets: delete Cloud Storage artifact
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
  ├── config (JSON): { source, params, mode }
  └── files: foreground image, background image
        │
        ▼
  SplashAssetsService.upsertWithFiles()
        │
        ├── Upload images → ArtifactsService → Cloud Storage
        ├── Get artifact IDs
        ├── Deep merge config with existing doc
        └── Save to Firestore (outputsArtifacts.splashArtifactId = ...)
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

---

## Configuration

| Variable         | Required | Description                                                   |
|------------------|----------|---------------------------------------------------------------|
| `OPENAI_API_KEY` | No       | Enables AI generation. If absent, fallback palettes are used. |

OpenAI settings (inside `OpenAiClientService`):

- Model: `gpt-4o-mini`
- Temperature: `0.2`
- Response format: `{ type: 'json_object' }`

---

## Authentication

All theme endpoints require a Firebase Bearer token via `FirebaseAuthGuard`.

- Token is validated against Firebase Auth
- User UID is extracted from the token
- Required roles: `admin` or `user`
- `applicationId` is scoped per request (path param)
