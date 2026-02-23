# Themes: API Endpoints

All endpoints are under `/applications/:applicationId/themes`. Auth: Firebase Bearer token (`admin` or `user` role).

---

## Themes (CRUD)

| Method | Path | Description |
|---|---|---|
| `GET` | `/` | List all themes for the application |
| `GET` | `/all` | List all themes across all applications |
| `GET` | `/:themeId` | Get a specific theme |
| `GET` | `/:themeId/legacy` | Get aggregated legacy theme (backward compat) |
| `POST` | `/` | Create a new theme |
| `PATCH` | `/:themeId` | Update theme (supports `expectedVersion` for optimistic locking) |
| `DELETE` | `/:themeId` | Cascade delete theme + all related data |
| `POST` | `/:themeId/copy` | Clone theme with all configs |

**DELETE** accepts `?purgeOrphanAssets=true` to also remove orphaned Cloud Storage artifacts.

---

## Color Schemes

| Method | Path | Description |
|---|---|---|
| `GET` | `/:themeId/color-schemes` | List all variants (light/dark) |
| `GET` | `/:themeId/color-schemes/:variant` | Get specific variant |
| `PUT` | `/:themeId/color-schemes/ensure-pair` | Ensure both light & dark exist |
| `PUT` | `/:themeId/color-schemes/:variant` | Upsert with deep merge (supports `expectedVersion`) |

---

## Widget Configs

| Method | Path | Description |
|---|---|---|
| `GET` | `/:themeId/widget-configs` | List all variants |
| `GET` | `/:themeId/widget-configs/:variant` | Get specific variant (resolves image URLs) |
| `PUT` | `/:themeId/widget-configs/ensure-pair` | Ensure both light & dark exist |
| `PUT` | `/:themeId/widget-configs/:variant` | Upsert with deep merge (supports `expectedVersion`) |

---

## Page Configs

| Method | Path | Description |
|---|---|---|
| `GET` | `/:themeId/page-configs` | List all variants |
| `GET` | `/:themeId/page-configs/:variant` | Get specific variant (resolves image URLs) |
| `PUT` | `/:themeId/page-configs/ensure-pair` | Ensure both light & dark exist |
| `PUT` | `/:themeId/page-configs/:variant` | Upsert with deep merge (supports `expectedVersion`) |

---

## Splash Assets

| Method | Path | Description |
|---|---|---|
| `GET` | `/:themeId/splash-asset` | Get config (optional: `withValidation`, `includeUrl`, `urlTtlSec`) |
| `PUT` | `/:themeId/splash-asset/upload-batch` | Multipart upload + config merge |
| `DELETE` | `/:themeId/splash-asset` | Delete config + Cloud Storage artifacts (splash + android12) |
| `GET` | `/:themeId/splash-asset/constraints-defaults` | Get default constraints from Firestore |

---

## Launch Assets

| Method | Path | Description |
|---|---|---|
| `GET` | `/:themeId/launch-asset` | Get config (optional: `withValidation`, `includeUrl`, `urlTtlSec`) |
| `PUT` | `/:themeId/launch-asset/upload-batch` | Multipart upload for 5 platform targets |
| `DELETE` | `/:themeId/launch-asset` | Delete config + all platform artifacts |
| `GET` | `/:themeId/launch-asset/constraints-defaults` | Get default constraints from Firestore |

---

## Feature Access

| Method | Path | Description |
|---|---|---|
| `GET` | `/:themeId/feature-access` | Get feature entitlements |
| `PUT` | `/:themeId/feature-access` | Upsert feature access config (supports `expectedVersion`) |
| `DELETE` | `/:themeId/feature-access` | Delete feature entitlements |

---

## AI Generation

| Method | Path | Description |
|---|---|---|
| `POST` | `/generate` | Generate a new theme from AI prompt |
| `POST` | `/:themeId/generate/nudge` | Refine existing theme via AI prompt |

See [AI Generation docs](./generate-themes.md) for detailed request/response schemas and flow diagrams.
