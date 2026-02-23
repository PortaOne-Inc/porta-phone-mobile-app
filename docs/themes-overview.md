# Themes Feature

The **Themes** feature manages the full lifecycle of application themes: CRUD, AI-powered generation,
color schemes, widget & page configs, splash/launch assets, and feature entitlements.

## Sub-docs

| Document | Description |
|---|---|
| [Data Model](./themes-data-model.md) | Entities, Firestore collections, composite indexes |
| [API Endpoints](./themes-api-endpoints.md) | REST endpoints for themes and all sub-features |
| [Core Flows](./themes-core-flows.md) | Theme creation, copy, cascade delete, asset upload, error handling |
| [AI Generation](./generate-themes.md) | OpenAI-powered theme generation and nudge |

---

## Architecture Overview

```
+-----------------------------------------------------------+
|                     ThemesModule                          |
|                                                           |
|  ThemesController --> ThemesService                       |
|                          |                                |
|         +----------------+----------------+               |
|         v                v                v               |
|  ArtifactsModule   AssetsModule   CloudStorageModule      |
|                                                           |
|  +----------------- Sub-features -------------------+    |
|  |                                                   |    |
|  |  ColorSchemesModule   WidgetConfigsModule         |    |
|  |  PageConfigsModule    SplashAssetsModule           |    |
|  |  LaunchAssetsModule   FeatureAccessModule          |    |
|  |  GenerateModule                                    |    |
|  |                                                   |    |
|  +---------------------------------------------------+    |
+-----------------------------------------------------------+
```

Each sub-feature has its own controller, service, DTOs, and entity. `ThemesService` orchestrates
cross-feature operations (copy, cascade delete, legacy aggregation).

---

## Directory Structure

```
src/features/themes/
|-- themes.module.ts              # Root module - imports all sub-feature modules
|-- themes.controller.ts          # CRUD + copy + legacy endpoints
|-- themes.service.ts             # Orchestrator: copy, cascade delete, aggregation
|-- entities/
|   |-- theme.ts                  # Theme Firestore entity
|   +-- build-version.ts          # BuildVersion helper
|-- dto/
|   +-- themes.dto.ts             # CreateThemeDto, UpdateThemeDto, CopyThemeDto
|
+-- features/
    |-- color-schemes/
    |   |-- color-schemes.module.ts
    |   |-- color-schemes.controller.ts
    |   |-- color-schemes.service.ts
    |   |-- dto/
    |   |   +-- upsert-color-scheme.dto.ts   # Zod: UpsertColorSchemeSchema
    |   +-- entities/color-scheme.ts
    |
    |-- widget-configs/
    |   |-- widget-configs.module.ts
    |   |-- widget-configs.controller.ts
    |   |-- widget-configs.service.ts
    |   |-- dto/
    |   |   +-- upsert-widget-config.dto.ts  # Zod: UpsertWidgetConfigSchema
    |   +-- entities/widget-config.entity.ts
    |
    |-- page-configs/
    |   |-- page-configs.module.ts
    |   |-- page-configs.controller.ts
    |   |-- page-configs.service.ts
    |   |-- dto/
    |   |   +-- create-page-config.dto.ts    # Zod: UpsertPageConfigSchema
    |   +-- entities/page-config.entity.ts
    |
    |-- splash-assets/
    |   |-- splash-assets.module.ts
    |   |-- splash-assets.controller.ts
    |   |-- splash-assets.service.ts
    |   |-- dto/
    |   |   |-- upsert-splash-asset.dto.ts   # Zod: UpsertSplashAssetSchema
    |   |   +-- get-splash-asset.zod.ts      # Zod: GetSplashAssetZ (response)
    |   +-- entities/splash-asset.entity.ts
    |
    |-- launch-assets/
    |   |-- launch-assets.module.ts
    |   |-- launch-assets.controller.ts
    |   |-- launch-assets.service.ts
    |   +-- entities/launch-assets.entity.ts
    |
    |-- feature-access/
    |   |-- feature-access.module.ts
    |   |-- feature-access.controller.ts
    |   |-- feature-access.service.ts
    |   |-- dto/
    |   |   |-- create-feature-access.dto.ts # Zod: CreateFeatureAccessSchema
    |   |   |-- update-feature-access.dto.ts # Zod: CreateFeatureAccessSchema.partial()
    |   |   +-- upsert-feature-access.dto.ts # Zod: UpsertFeatureAccessSchema
    |   +-- entities/feature-access.ts
    |
    +-- generate/
        |-- generate.module.ts
        |-- generate.controller.ts
        |-- generate.service.ts         # Orchestrates 3 generators
        |-- dto/
        |   |-- create-generate.dto.ts  # Zod: GenerateThemeSchema
        |   +-- nudge-theme.dto.ts      # Zod: NudgeThemeSchema
        |-- guards/
        |   +-- firebase-uid-throttler.guard.ts  # Rate limiting by Firebase UID
        |-- schemas/
        |   |-- color-scheme.schema.ts  # Zod - 39 Material 3 color fields
        |   |-- widget-config.schema.ts # Zod - fonts, buttons, dialogs, statuses
        |   +-- page-config.schema.ts   # Zod - login & dialing page styles
        +-- generators/
            |-- openai-client.service.ts     # OpenAI wrapper (gpt-4o-mini, temp 0.2, 30s)
            |-- color-scheme.generator.ts    # generate / nudge / fallback
            |-- widget-config.generator.ts   # generate / nudge / fallback
            +-- page-config.generator.ts     # generate / nudge / fallback
```

---

## Module Dependency Graph

```
ThemesModule
 |-- CommonModule
 |-- ArtifactsModule          <-- image artifact storage (Cloud Storage)
 |-- AssetsModule             <-- user-uploaded assets
 |-- ColorSchemesModule
 |-- WidgetConfigsModule
 |     +-- AssetsModule       <-- resolves image asset IDs -> signed URLs
 |-- PageConfigsModule
 |     +-- AssetsModule       <-- resolves image asset IDs -> signed URLs
 |-- SplashAssetsModule
 |     +-- ArtifactsModule    <-- manages splash image artifacts
 |-- LaunchAssetsModule
 |     +-- ArtifactsModule    <-- manages launcher icon artifacts (5 platforms)
 |-- FeatureAccessModule
 +-- GenerateModule
       |-- ColorSchemesModule
       |-- WidgetConfigsModule
       |-- PageConfigsModule
       +-- OpenAiClientService
```

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

| Endpoint | Limit | Window |
|---|---|---|
| `POST /themes/generate` | 5 req | 60 sec |
| `POST /themes/:id/generate/nudge` | 10 req | 60 sec |

When the limit is exceeded, the server returns **429 Too Many Requests** with a `Retry-After` header.
Falls back to IP-based throttling if the Firebase UID is not available.

---

## Configuration

| Variable | Required | Description |
|---|---|---|
| `OPENAI_API_KEY` | No | Enables AI generation. If absent, fallback palettes are used. |

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
