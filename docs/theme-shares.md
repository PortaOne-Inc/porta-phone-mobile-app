# Theme Share Preview

The **Theme Shares** feature allows users to create shareable tokens for themes.
Anyone with a valid token can view a **frozen snapshot** of the theme preview
(color schemes, widget configs, page configs, feature access) without authentication.

When a share token is created, a `ThemeHistory` snapshot is automatically captured.
The public endpoint returns this **snapshot data**, not live theme data — so changes
to the theme after sharing do not affect the preview.

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
    { "applicationId": "app-1", "themeId": "theme-1", "tag": "v2 launch" }
        |
        v
  ThemeSharesService.createShareToken()
        |-- Validate theme exists and belongs to application
        |-- Create ThemeHistory snapshot (frozen copy of all sub-configs)
        |-- Set shareTokenId on the snapshot (links snapshot → token)
        +-- Create ThemeShareToken with snapshotId (links token → snapshot)
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
        +-- Fetch ThemeHistory snapshot by snapshotId
        |
        v
  Returns frozen snapshot data (unchanged regardless of later theme edits)
```

**Key properties:**

- **Snapshot-based:** share tokens point to a `ThemeHistory` snapshot, not live data.
  Modifying the theme after sharing does not affect the preview.
- **Token-based access:** each share token is a UUID that maps to a specific
  application + theme + snapshot.
- **Public read:** the `GET /theme-shares/:token` endpoint requires no
  authentication, enabling external sharing.
- **Full aggregate:** the snapshot includes theme metadata, color schemes,
  widget configs, page configs, splash/launch assets, and feature access.
- **`shareTokenId` linkage:** the `ThemeHistory` snapshot has a `shareTokenId`
  field that links it back to the share token that created it.

---

## Data Model

### ThemeShareToken Entity

| Field           | Type    | Description                                    |
|-----------------|---------|------------------------------------------------|
| `id`            | string  | UUID token (also the share token value)        |
| `applicationId` | string  | Application the shared theme belongs to        |
| `themeId`       | string  | Theme being shared                             |
| `snapshotId`    | string  | References the `ThemeHistory.id` snapshot      |
| `ownerId`       | string  | Firebase UID of the user who created the token |
| `active`        | boolean | Whether the token is currently valid           |
| `createdAt`     | string  | ISO timestamp of creation                      |

### ThemeHistory (snapshot fields)

| Field            | Type   | Description                                          |
|------------------|--------|------------------------------------------------------|
| `shareTokenId`   | string | When set, indicates snapshot was created for a share  |

> See [Data Model](./themes-data-model.md) for full `ThemeHistory` entity docs.

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

| Field           | Type   | Required | Description                       |
|-----------------|--------|----------|-----------------------------------|
| `applicationId` | string | Yes      | Application ID                    |
| `themeId`       | string | Yes      | Theme ID to share                 |
| `tag`           | string | No       | Optional tag for the snapshot     |

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

Returns the `ThemeSnapshot` captured at the time the share token was created:

```json
{
  "theme": { "id": "theme-1", "title": "My Theme", "applicationId": "app-1", "..." : "..." },
  "colorSchemes": [
    { "id": "cs-1", "themeId": "theme-1", "variant": "light", "config": {} },
    { "id": "cs-2", "themeId": "theme-1", "variant": "dark", "config": {} }
  ],
  "widgetConfigs": [
    { "id": "wc-1", "themeId": "theme-1", "variant": "light", "config": {} }
  ],
  "pageConfigs": [
    { "id": "pc-1", "themeId": "theme-1", "variant": "light", "config": {} },
    { "id": "pc-2", "themeId": "theme-1", "variant": "dark", "config": {} }
  ],
  "splashAsset": null,
  "launchAsset": null,
  "featureAccess": { "id": "fa-1", "themeId": "theme-1", "config": {} }
}
```

- `colorSchemes`, `widgetConfigs`, `pageConfigs` are arrays of all variants (empty array if none exist).
- `splashAsset`, `launchAsset`, `featureAccess` are `null` when not configured.

**Errors:**

| Code | Condition                                  |
|------|--------------------------------------------|
| 404  | Token not found, inactive, or snapshot missing |

---

## Directory Structure

```
src/features/theme-shares/
|-- theme-shares.module.ts              # Module: registers entities, imports ThemeHistoryModule
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
 +-- FireormModule.forFeature([ThemeShareToken])
 +-- ThemeHistoryModule

Imported by:
 +-- AppModule
```

---

## Backward Compatibility

- **Response format changed.** The `GET /theme-shares/:token` endpoint now returns
  a `ThemeSnapshot` structure (arrays of sub-configs) instead of the previous
  `{ light, dark }` nested format. Clients consuming share previews must update.
- **Firestore:** The `theme_share_tokens` collection gains a `snapshotId` field.
  Existing tokens without `snapshotId` will fail to resolve previews.
