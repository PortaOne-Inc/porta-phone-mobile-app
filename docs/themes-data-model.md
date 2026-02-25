# Themes: Data Model

---

## Entities

### Theme

| Field | Type | Description |
|---|---|---|
| `id` | string | Auto-generated Firestore ID |
| `applicationId` | string | Parent application reference |
| `title` | string? | Human-readable name |
| `description` | string? | Theme description |
| `label` | enum? | `'dev'` / `'stage'` / `'prod'` |
| `status` | enum? | `'draft'` / `'published'` / `'archived'` |
| `version` | number? | Optimistic locking counter (starts at 1) |
| `createdAt` | string | ISO timestamp |
| `updatedAt` | string | ISO timestamp |

### ColorScheme

| Field | Type | ID format |
|---|---|---|
| `id` | string | `{themeId}_{variant}` |
| `applicationId` | string | |
| `themeId` | string | |
| `variant` | `'light'` / `'dark'` | |
| `config` | object (39 hex colors) | Material 3 palette |
| `version` | number? | Optimistic locking |

### WidgetConfig

| Field | Type | ID format |
|---|---|---|
| `id` | string | `{themeId}_{variant}` |
| `applicationId` | string | |
| `themeId` | string | |
| `variant` | `'light'` / `'dark'` | |
| `config` | object | Fonts, buttons, dialogs, statuses, gradients |
| `version` | number? | Optimistic locking |

### PageConfig

| Field | Type | ID format |
|---|---|---|
| `id` | string | `{themeId}_{variant}` |
| `applicationId` | string | |
| `themeId` | string | |
| `variant` | `'light'` / `'dark'` | |
| `config` | object | Login page, dialing page, overlay styles |
| `version` | number? | Optimistic locking |

### SplashAsset

| Field | Type | ID format |
|---|---|---|
| `id` | string | `= themeId` |
| `applicationId` | string | |
| `themeId` | string | |
| `source` | object? | `foregroundAssetId`, `backgroundAssetId`, `backgroundColorHex` |
| `params` | object? | `fit` (SplashFit), `paddingDp`, `backgroundColorHex` |
| `mode` | enum | `'withBackground'` / `'withoutBackground'` |
| `outputsArtifacts` | object? | `splashArtifactId`, `android12SplashArtifactId` |

**Upload targets:**

| Target | Description | Export size |
|---|---|---|
| `splash` | General splash image for all platforms | 1024px (512dp x 2) |
| `android12Splash` | Android 12+ circular-masked icon area (optional) | 1152px (288dp x 4) |

**Constraints defaults** (`GET .../constraints-defaults`):

| Slice | `fullSizeDp` | `maskDiameterDp` | `toleranceDp` | Notes |
|---|---|---|---|---|
| `withBackground` | 240 | 160 | 240 | General splash with background |
| `withoutBackground` | 288 | 192 | 288 | General splash without background |
| `android12` | 288 | 192 | 288 | Android 12 circular mask safe zone |

The `android12` slice and `android12SplashArtifactId` are optional for backward compatibility.

### LaunchAssets

| Field | Type | ID format |
|---|---|---|
| `id` | string | `= themeId` |
| `applicationId` | string | |
| `themeId` | string | |
| `source` | object? | `foregroundAssetId`, `backgroundAssetId`, `backgroundColorHex` |
| `params` | object? | Per-platform padding: `androidLegacy`, `androidAdaptive`, `ios`, `web` |
| `outputsArtifacts` | object? | 5 artifact IDs: android legacy, adaptive fg/bg, iOS, web |

### FeatureAccess

| Field | Type | ID format |
|---|---|---|
| `id` | string | `= themeId` |
| `applicationId` | string | |
| `themeId` | string | |
| `status` | `'draft'` / `'published'` | |
| `config` | object | Arbitrary feature flags JSON |
| `version` | number? | Optimistic locking |

### ThemeHistory

| Field | Type | Description |
|---|---|---|
| `id` | string | Auto-generated UUID |
| `themeId` | string | Parent theme reference |
| `applicationId` | string | Parent application reference |
| `snapshotVersion` | number | Auto-incrementing per theme (starts at 1) |
| `action` | string | Always `"snapshot"` for explicit snapshots |
| `changedBy` | string | Firebase UID of the user who made the change |
| `snapshot` | ThemeSnapshot | Full aggregate: `{ theme, colorSchemes[], widgetConfigs[], pageConfigs[], splashAsset, launchAsset, featureAccess }`. **Only returned by detail endpoint**, not in list. |
| `schemaVersion` | number | Schema version at time of recording (`THEME_SCHEMA_VERSION`, currently `1`) |
| `tag` | string | Optional user-supplied label (e.g. `"v2.1-release"`), default `""` |
| `description` | string | Optional user-supplied note, default `""` |
| `createdAt` | string | ISO timestamp |

See [Change History](./theme-history.md) for API details and snapshot workflow.

---

## Firestore Collections

| Collection | Entity | ID strategy |
|---|---|---|
| `app_themes` | Theme | Auto-generated |
| `theme_config_color_schemes` | ColorScheme | `{themeId}_{variant}` |
| `theme_config_widgets` | WidgetConfig | `{themeId}_{variant}` |
| `theme_config_pages` | PageConfig | `{themeId}_{variant}` |
| `theme_assets_splash` | SplashAsset | `= themeId` |
| `theme_assets_launcher` | LaunchAssets | `= themeId` |
| `theme_feature_entitlements` | FeatureAccess | `= themeId` |
| `theme_configs_defaults` | -- | `splashAssetsDefaults`, `launchAssetsDefaults` |
| `theme_history` | ThemeHistory | UUID (auto-generated) |

---

## Composite Indexes

Queries that filter on two or more fields require Firestore composite indexes to avoid full collection scans.
These are defined in `firestore.indexes.json` and deployed via `firebase deploy --only firestore:indexes`.

| Collection | Indexed Fields | Used By |
|---|---|---|
| `theme_config_color_schemes` | `applicationId` + `themeId` | `ColorSchemesService.listForTheme()` |
| `theme_config_widgets` | `applicationId` + `themeId` | `WidgetConfigsService.listForTheme()` |
| `theme_config_pages` | `applicationId` + `themeId` | `PageConfigsService.listForTheme()` |
| `theme_feature_entitlements` | `applicationId` + `themeId` | `FeatureAccessService.getByTheme()` / `upsertByTheme()` |
| `application_assets_renditions` | `ownerId` + `applicationId` + `themeId` | `ArtifactsService.findAll()` |
| `themes` | `applicationId` + `label` | `ApplicationsService.resolveThemeIdForBuild()` |
| `translations` | `applicationId` + `locale` + `key` | `TranslationsRepository.deleteOverrideByAppId()` |
| `theme_history` | `applicationId` + `themeId` + `snapshotVersion` (desc) | `ThemeHistoryService.listByTheme()` |
| `theme_history` | `themeId` + `snapshotVersion` (desc) | `ThemeHistoryService.getNextVersion()` |

> **Note:** If `COLLECTION_PREFIX` is set, the actual collection names in Firestore will be prefixed
> (e.g., `dev_theme_config_widgets`). The index file must be updated to match the prefixed names
> before deploying to that environment.

---

## Asset Reference Utilities

Widget and page configs can reference assets via `{ $ref: 'asset', id: '<assetId>' }` nodes embedded
at any depth within the config JSON. Two utilities in `src/common/utils/` handle these references:

| Utility | Description |
|---|---|
| `extractAssetIdsDeep(config)` | Walks the config tree and returns all unique asset IDs |
| `remapAssetIdsDeep(config, idMap)` | Deep-clones a config, replacing asset IDs via an `oldId -> newId` map |

These are used by the cross-application copy flow to discover which assets need duplication and to
update references in the copied configs to point at the new asset documents.
