# Theme Share Preview

The **Theme Shares** feature allows users to create shareable tokens for themes.
Anyone with a valid token can view the full aggregated theme preview (color schemes,
widget configs, page configs, feature access) without authentication.

## Sub-docs

| Document                                   | Description                               |
|--------------------------------------------|-------------------------------------------|
| [Themes Overview](./themes-overview.md)    | Parent feature architecture, module graph |
| [Data Model](./themes-data-model.md)       | Theme and sub-resource entities           |
| [API Endpoints](./themes-api-endpoints.md) | All theme-related endpoints               |

---

## How It Works

```
  User clicks "Share Theme" in the client
        |
        v
  POST /theme-shares   (authenticated)
    { "applicationId": "app-1", "themeId": "theme-1" }
        |
        v
  ThemeSharesService.createShareToken()
        |-- Validate theme exists and belongs to application
        +-- Create ThemeShareToken document with UUID token
        |
        v
  Returns { "token": "uuid-token" }

  ---

  Anyone opens the share link
        |
        v
  GET /theme-shares/:token   (public, no auth)
        |
        v
  ThemeSharesService.getSharedThemePreview()
        |-- Find token document, validate it is active
        |-- Fetch theme entity
        +-- 7 parallel fetches for all sub-configs
        |
        v
  Returns aggregated theme preview
```

**Key properties:**

- **Token-based access:** each share token is a UUID that maps to a specific
  application + theme pair.
- **Public read:** the `GET /theme-shares/:token` endpoint requires no
  authentication, enabling external sharing.
- **Full aggregate:** the preview includes theme metadata, color schemes
  (light/dark), widget configs (light/dark), page configs (light/dark),
  and feature access.
- **Signed URLs:** widget and page config images are returned with
  pre-signed Cloud Storage URLs (resolved automatically by the underlying
  services).
- **Graceful degradation:** if any sub-config is missing, it returns `null`
  for that field instead of failing the entire request.

---

## Data Model

### ThemeShareToken Entity

| Field           | Type    | Description                                    |
|-----------------|---------|------------------------------------------------|
| `id`            | string  | UUID token (also the share token value)        |
| `applicationId` | string  | Application the shared theme belongs to        |
| `themeId`       | string  | Theme being shared                             |
| `ownerId`       | string  | Firebase UID of the user who created the token |
| `active`        | boolean | Whether the token is currently valid           |
| `createdAt`     | string  | ISO timestamp of creation                      |

### Firestore Collection

| Collection           | Entity          | ID strategy                   |
|----------------------|-----------------|-------------------------------|
| `theme_share_tokens` | ThemeShareToken | UUID (the share token itself) |

> **Note:** If `COLLECTION_PREFIX` is set, the actual collection name will be prefixed
> (e.g., `dev_theme_share_tokens`).

---

## API Endpoints

### Create Share Token

```
POST /theme-shares
```

**Auth:** Firebase Bearer token (`admin` or `user` role).

**Request body:**

| Field           | Type   | Required | Description       |
|-----------------|--------|----------|-------------------|
| `applicationId` | string | Yes      | Application ID    |
| `themeId`       | string | Yes      | Theme ID to share |

**Response (201):**

```json
{
  "token": "550e8400-e29b-41d4-a716-446655440000"
}
```

**Errors:**

| Code | Condition                                             |
|------|-------------------------------------------------------|
| 401  | Missing or invalid auth token                         |
| 404  | Theme not found or does not belong to the application |

---

### Get Shared Theme Preview

```
GET /theme-shares/:token
```

**Auth:** None (public endpoint).

**Path parameters:**

| Param   | Type   | Description      |
|---------|--------|------------------|
| `token` | string | Share token UUID |

**Response (200):**

```json
{
  "theme": {
    "id": "theme-1",
    "title": "My Theme",
    "description": "...",
    "label": "prod",
    "status": "published",
    "applicationId": "app-1",
    "version": 3,
    "createdAt": "2026-01-15T10:00:00.000Z",
    "updatedAt": "2026-02-20T14:30:00.000Z"
  },
  "colorSchemes": {
    "light": {
      "id": "...",
      "config": {
        ...
      }
    },
    "dark": {
      "id": "...",
      "config": {
        ...
      }
    }
  },
  "widgetConfigs": {
    "light": {
      "id": "...",
      "config": {
        ...
      }
    },
    "dark": null
  },
  "pageConfigs": {
    "light": {
      "id": "...",
      "config": {
        ...
      }
    },
    "dark": {
      "id": "...",
      "config": {
        ...
      }
    }
  },
  "featureAccess": {
    "id": "...",
    "config": {
      ...
    }
  }
}
```

Any sub-config that does not exist returns `null`.

**Errors:**

| Code | Condition                                                       |
|------|-----------------------------------------------------------------|
| 404  | Token not found, inactive, or referenced theme no longer exists |

---

## Directory Structure

```
src/features/theme-shares/
|-- theme-shares.module.ts              # Module: registers entities, imports sub-config modules
|-- theme-shares.controller.ts          # POST create + GET preview
|-- theme-shares.service.ts             # createShareToken, getSharedThemePreview
|-- entities/
|   +-- theme-share-token.entity.ts     # ThemeShareToken class
+-- dto/
    +-- theme-shares.dto.ts             # Zod: CreateShareTokenSchema
```

---

## Module Dependency Graph

```
ThemeSharesModule
 +-- FireormModule.forFeature([ThemeShareToken, Theme])
 +-- ColorSchemesModule
 +-- WidgetConfigsModule
 +-- PageConfigsModule
 +-- FeatureAccessModule

Imported by:
 +-- AppModule
```

---

## Backward Compatibility

- **No breaking changes.** This feature adds new endpoints only; no existing
  endpoints or behavior are modified.
- **Firestore:** The `theme_share_tokens` collection is created automatically
  on first write. No migration required.
