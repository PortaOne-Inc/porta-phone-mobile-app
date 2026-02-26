# Themes: API Endpoints

All endpoints are under `/applications/:applicationId/themes`. Auth: Firebase Bearer token (`admin` or `user` role).

---

## Themes (CRUD)

| Method   | Path                            | Description                                                                                                              |
|----------|---------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| `GET`    | `/`                             | List all themes for the application                                                                                      |
| `GET`    | `/all`                          | List all themes across all applications                                                                                  |
| `GET`    | `/:themeId`                     | Get a specific theme                                                                                                     |
| `GET`    | `/:themeId/legacy`              | Get aggregated legacy theme (backward compat)                                                                            |
| `POST`   | `/`                             | Create a new theme                                                                                                       |
| `PATCH`  | `/:themeId`                     | Update theme fields: `title`, `description`, `label`, `status`, `expectedVersion`. Unknown fields are silently stripped. |
| `DELETE` | `/:themeId`                     | Cascade delete theme + all related data                                                                                  |
| `POST`   | `/:themeId/copy`                | Clone theme with all configs (same application)                                                                          |
| `POST`   | `/:themeId/copy-to-application` | Deep copy theme to another application (with asset copy)                                                                 |

**DELETE** accepts `?purgeOrphanAssets=true` to also remove orphaned Cloud Storage artifacts.

### Copy to Application

Deep copies a theme to a different application owned by the same user. All referenced assets (images in Cloud Storage)
are duplicated so the copy is fully independent.

**Request:**

```json
{
  "targetApplicationId": "abc-123",
  "title": "My Theme Copy",
  "description": "...",
  "label": "dev"
}
```

| Field                 | Type   | Required | Description                                                |
|-----------------------|--------|----------|------------------------------------------------------------|
| `targetApplicationId` | string | Yes      | ID of the target application (must be owned by the caller) |
| `title`               | string | No       | Override title (default: `"{source title} (Copy)"`)        |
| `description`         | string | No       | Override description (default: source description)         |
| `label`               | enum   | No       | `'dev'` / `'stage'` / `'prod'` (default: `'dev'`)          |

**Response:** The newly created Theme object in the target application (aggregated form).

**Errors:**

| Code | Condition                                    |
|------|----------------------------------------------|
| 404  | Source theme not found in source application |
| 404  | Target application not found                 |
| 403  | Caller does not own the target application   |

---

## Color Schemes

| Method | Path                                  | Description                                         |
|--------|---------------------------------------|-----------------------------------------------------|
| `GET`  | `/:themeId/color-schemes`             | List all variants (light/dark)                      |
| `GET`  | `/:themeId/color-schemes/:variant`    | Get specific variant                                |
| `PUT`  | `/:themeId/color-schemes/ensure-pair` | Ensure both light & dark exist                      |
| `PUT`  | `/:themeId/color-schemes/:variant`    | Upsert with deep merge (supports `expectedVersion`) |

---

## Widget Configs

| Method | Path                                   | Description                                         |
|--------|----------------------------------------|-----------------------------------------------------|
| `GET`  | `/:themeId/widget-configs`             | List all variants                                   |
| `GET`  | `/:themeId/widget-configs/:variant`    | Get specific variant (resolves image URLs)          |
| `PUT`  | `/:themeId/widget-configs/ensure-pair` | Ensure both light & dark exist                      |
| `PUT`  | `/:themeId/widget-configs/:variant`    | Upsert with deep merge (supports `expectedVersion`) |

---

## Page Configs

| Method | Path                                 | Description                                         |
|--------|--------------------------------------|-----------------------------------------------------|
| `GET`  | `/:themeId/page-configs`             | List all variants                                   |
| `GET`  | `/:themeId/page-configs/:variant`    | Get specific variant (resolves image URLs)          |
| `PUT`  | `/:themeId/page-configs/ensure-pair` | Ensure both light & dark exist                      |
| `PUT`  | `/:themeId/page-configs/:variant`    | Upsert with deep merge (supports `expectedVersion`) |

---

## Splash Assets

| Method   | Path                                          | Description                                                        |
|----------|-----------------------------------------------|--------------------------------------------------------------------|
| `GET`    | `/:themeId/splash-asset`                      | Get config (optional: `withValidation`, `includeUrl`, `urlTtlSec`) |
| `PUT`    | `/:themeId/splash-asset/upload-batch`         | Multipart upload + config merge                                    |
| `DELETE` | `/:themeId/splash-asset`                      | Delete config + Cloud Storage artifacts (splash + android12)       |
| `GET`    | `/:themeId/splash-asset/constraints-defaults` | Get default constraints from Firestore                             |

---

## Launch Assets

| Method   | Path                                          | Description                                                        |
|----------|-----------------------------------------------|--------------------------------------------------------------------|
| `GET`    | `/:themeId/launch-asset`                      | Get config (optional: `withValidation`, `includeUrl`, `urlTtlSec`) |
| `PUT`    | `/:themeId/launch-asset/upload-batch`         | Multipart upload for 5 platform targets                            |
| `DELETE` | `/:themeId/launch-asset`                      | Delete config + all platform artifacts                             |
| `GET`    | `/:themeId/launch-asset/constraints-defaults` | Get default constraints from Firestore                             |

---

## Feature Access

| Method   | Path                       | Description                                               |
|----------|----------------------------|-----------------------------------------------------------|
| `GET`    | `/:themeId/feature-access` | Get feature entitlements                                  |
| `PUT`    | `/:themeId/feature-access` | Upsert feature access config (supports `expectedVersion`) |
| `DELETE` | `/:themeId/feature-access` | Delete feature entitlements                               |

---

## Change History

| Method | Path                           | Description                                                                                               |
|--------|--------------------------------|-----------------------------------------------------------------------------------------------------------|
| `GET`  | `/:themeId/history`            | List history entries (paginated, newest first). Query: `limit` (1-100, default 20), `startAfter` (cursor) |
| `GET`  | `/:themeId/history/:historyId` | Get a single history entry with full theme snapshot                                                       |

See [Change History docs](./theme-history.md) for response schemas and tracked actions.

---

## Share Preview

| Method | Path                   | Description                                                   |
|--------|------------------------|---------------------------------------------------------------|
| `POST` | `/theme-shares`        | Create a share token and snapshot for a theme (authenticated)       |
| `GET`  | `/theme-shares/:token` | Get frozen snapshot theme preview by share token (public, no auth) |

See [Share Preview docs](./theme-shares.md) for data model, response schemas, and module structure.

---

## AI Generation

| Method | Path                       | Description                         |
|--------|----------------------------|-------------------------------------|
| `POST` | `/generate`                | Generate a new theme from AI prompt |
| `POST` | `/:themeId/generate/nudge` | Refine existing theme via AI prompt |

See [AI Generation docs](./generate-themes.md) for detailed request/response schemas and flow diagrams.
