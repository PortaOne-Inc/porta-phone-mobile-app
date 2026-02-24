# Theme Change History

The **Theme History** feature records full snapshots of a theme aggregate (theme + all sub-resources)
on demand, providing an audit trail of what a theme looked like at a specific point in time.

## Sub-docs

| Document | Description |
|---|---|
| [Themes Overview](./themes-overview.md) | Parent feature architecture, module graph |
| [Data Model](./themes-data-model.md) | ThemeHistory entity, Firestore collection |
| [API Endpoints](./themes-api-endpoints.md) | History list and detail endpoints |

---

## How It Works

Snapshots are **explicit** — they are created only when the user requests it via
`POST /applications/:appId/themes/:themeId/history`. No automatic recording happens
during theme saves or sub-resource mutations.

```
  User clicks "Create Snapshot" in the client
        |
        v
  POST /applications/:appId/themes/:themeId/history
    { "tag": "v2.1-release", "description": "Before redesign" }
        |
        v
  ThemeHistoryService.createSnapshot()
        |
        |-- 7 parallel Firestore reads (capture full aggregate)
        |-- Get next snapshotVersion
        +-- Create single ThemeHistory document
```

**Key properties:**

- **On-demand only:** no fire-and-forget, no timers, no race conditions. The user decides
  when a snapshot is worth preserving.
- **Full aggregate:** each snapshot contains the complete state of the theme and all sub-resources
  at that point in time.
- **Auto-incrementing version:** `snapshotVersion` starts at 1 and increments per theme, providing
  a simple ordering mechanism.
- **Schema versioning:** every entry records a `schemaVersion` (`THEME_SCHEMA_VERSION` constant,
  currently `1`). Bump this constant when the snapshot structure changes.

---

## Data Model

### ThemeHistory Entity

| Field | Type | Description |
|---|---|---|
| `id` | string | Auto-generated UUID |
| `themeId` | string | Parent theme reference |
| `applicationId` | string | Parent application reference |
| `snapshotVersion` | number | Auto-incrementing version per theme (starts at 1) |
| `action` | string | Always `"snapshot"` for explicit snapshots |
| `changedBy` | string | Firebase UID of the user who created the snapshot |
| `snapshot` | ThemeSnapshot | Full aggregate state at time of recording (**only returned by detail endpoint**) |
| `schemaVersion` | number | Schema version at time of recording (`THEME_SCHEMA_VERSION`, currently `1`) |
| `tag` | string | Optional user-supplied label (e.g. `"v2.1-release"`), default `""` |
| `description` | string | Optional user-supplied note, default `""` |
| `createdAt` | string | ISO timestamp |

### ThemeSnapshot Interface

| Field | Type | Description |
|---|---|---|
| `theme` | object | Theme entity fields |
| `colorSchemes` | object[] | All color scheme variants |
| `widgetConfigs` | object[] | All widget config variants |
| `pageConfigs` | object[] | All page config variants |
| `splashAsset` | object / null | Splash asset config (null if not set) |
| `launchAsset` | object / null | Launch asset config (null if not set) |
| `featureAccess` | object / null | Feature access config (null if not set) |

### Firestore Collection

| Collection | Entity | ID strategy |
|---|---|---|
| `theme_history` | ThemeHistory | UUID (auto-generated) |

### Composite Indexes

| Collection | Indexed Fields | Used By |
|---|---|---|
| `theme_history` | `applicationId` + `themeId` + `snapshotVersion` (desc) | `ThemeHistoryService.listByTheme()` |
| `theme_history` | `themeId` + `snapshotVersion` (desc) | `ThemeHistoryService.getNextVersion()` |

> **Note:** If `COLLECTION_PREFIX` is set, the actual collection name will be prefixed
> (e.g., `dev_theme_history`). The index file must be updated accordingly.

---

## API Endpoints

All endpoints are under `/applications/:applicationId/themes/:themeId/history`.
Auth: Firebase Bearer token (`admin` or `user` role).

| Method | Path | Description |
|---|---|---|
| `POST` | `/` | Create a new snapshot of the current theme state |
| `GET` | `/` | List history entries — metadata only, **no snapshot** |
| `GET` | `/:historyId` | Get a single history entry **with full snapshot** |
| `PATCH` | `/:historyId` | Update `tag` and/or `description` on a history entry |

### Create Snapshot

```
POST /applications/:appId/themes/:themeId/history
```

**Request body:**

| Field | Type | Description |
|---|---|---|
| `tag` | string (max 100) | Optional label (e.g. `"v2.1-release"`) |
| `description` | string (max 2000) | Optional note |

Both fields are optional.

**Response:** Full `ThemeHistory` object (with snapshot).

### List History

```
GET /applications/:appId/themes/:themeId/history?limit=20&startAfter=<cursor>
```

**Query parameters:**

| Param | Type | Default | Description |
|---|---|---|---|
| `limit` | number (1-100) | 20 | Number of entries to return |
| `startAfter` | string | -- | Cursor ID from previous response for pagination |

**Response:**

```json
{
  "items": [
    {
      "id": "abc-123",
      "themeId": "theme-1",
      "applicationId": "app-1",
      "snapshotVersion": 5,
      "action": "snapshot",
      "changedBy": "uid-xyz",
      "schemaVersion": 1,
      "tag": "release-v1",
      "description": "First release",
      "createdAt": "2026-02-24T10:30:00.000Z"
    }
  ],
  "nextCursor": "def-456"
}
```

`nextCursor` is `null` when there are no more entries.

> **Important:** The list response does **not** include the `snapshot` field. Use
> `GET /:historyId` to retrieve the full snapshot for a specific entry.

### Get History Entry

```
GET /applications/:appId/themes/:themeId/history/:historyId
```

Returns a single `ThemeHistory` object **with the full snapshot** containing: theme, colorSchemes,
widgetConfigs, pageConfigs, splashAsset, launchAsset, featureAccess.

### Patch History Entry

```
PATCH /applications/:appId/themes/:themeId/history/:historyId
```

**Request body:**

| Field | Type | Description |
|---|---|---|
| `tag` | string (max 100) | Optional label for this entry |
| `description` | string (max 2000) | Optional note for this entry |

Both fields are optional; only provided fields are updated.

**Response:** Updated `ThemeHistory` object (without snapshot).

---

## Directory Structure

```
src/features/themes/features/theme-history/
|-- theme-history.module.ts          # Module: registers entity, exports service
|-- theme-history.controller.ts      # POST create + GET list + GET by ID + PATCH
|-- theme-history.service.ts         # createSnapshot, listByTheme, getById, patchEntry
|-- entities/
|   +-- theme-history.entity.ts      # ThemeHistory class, ThemeSnapshot interface, THEME_SCHEMA_VERSION
+-- dto/
    +-- theme-history.dto.ts         # Zod: CreateThemeHistorySchema, ListThemeHistoryQuerySchema, PatchThemeHistorySchema
```

---

## Module Dependency Graph

```
ThemeHistoryModule
 +-- FireormModule.forFeature([ThemeHistory])

Imported by:
 +-- ThemesModule
```

No other modules depend on ThemeHistoryModule. Snapshot creation is fully decoupled from
theme/sub-resource mutation services.

---

## Backward Compatibility

- **Existing themes without history:** `GET .../history` returns `{ items: [], nextCursor: null }`.
  No errors, no migration needed.
- **Firestore:** The `theme_history` collection is created automatically on first write. No schema
  migration is required.
- **Old entries:** Entries created by previous automatic recording still exist and are returned
  normally. Their `action` field may contain values like `"colorScheme.upsert"` instead of
  `"snapshot"`.

### Breaking changes

- **Snapshots are no longer automatic.** Saving a theme no longer creates history entries.
  Clients must call `POST .../history` explicitly to create a snapshot.
- **`historyTag` / `historyDescription` removed** from all mutating theme/sub-resource endpoints.
  These fields are no longer accepted in PUT/PATCH request bodies.
- **List response:** `GET .../history` does not include the `snapshot` field in list items.
  Use `GET .../history/:historyId` to retrieve the full snapshot.
