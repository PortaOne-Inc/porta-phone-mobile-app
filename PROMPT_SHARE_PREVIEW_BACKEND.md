# Theme Share Preview — Backend Implementation

## Overview

The backend provides a "Share Preview" feature via a snapshot-based approach:
1. **Authenticated** endpoint to create share tokens (which also creates a ThemeHistory snapshot)
2. **Public** endpoint to fetch the frozen snapshot by share token

---

## Architecture

When a share token is created, the backend:
1. Validates the theme exists
2. Creates a ThemeHistory snapshot (frozen copy of all theme data at that point in time)
3. Sets `shareTokenId` on the snapshot document
4. Creates a `ThemeShareToken` document linking to the snapshot

The public preview endpoint returns `historyEntry.snapshot` — an immutable copy of the theme data.

---

## Firestore Collections

- `theme_share_tokens` — stores share token documents
- `theme_history` — existing collection; share-created entries have `shareTokenId` set

---

## Entity: ThemeShareToken

**File**: `src/features/theme-shares/entities/theme-share-token.entity.ts`

```typescript
@Collection(Collections.themeShareTokens)
export class ThemeShareToken {
  id!: string;            // UUID v4 — this IS the share token
  applicationId!: string;
  themeId!: string;
  snapshotId!: string;    // ID of the ThemeHistory snapshot
  ownerId!: string;       // Firebase UID of the creator
  active!: boolean;       // For future deactivation
  createdAt!: string;     // ISO 8601
}
```

---

## Service

**File**: `src/features/theme-shares/theme-shares.service.ts`

### `createShareToken(applicationId, themeId, uid, tag?)`

1. Validates theme exists and matches applicationId
2. Generates UUID token
3. Creates ThemeHistory snapshot via `themeHistoryService.createSnapshot()`
4. Sets `shareTokenId` on the snapshot via direct Firestore update
5. Creates `ThemeShareToken` with `snapshotId` pointing to the snapshot
6. Returns `{ token }`

### `getSharedThemePreview(token)`

1. Finds token doc, checks `active === true`
2. Fetches history entry via `themeHistoryService.getById()`
3. Returns `historyEntry.snapshot`

---

## Controller

**File**: `src/features/theme-shares/theme-shares.controller.ts`

### `POST /theme-shares` (authenticated)

Request:
```json
{
  "applicationId": "abc123",
  "themeId": "theme456",
  "tag": "v1.0"          // optional, max 100 chars
}
```

Response (201):
```json
{
  "token": "550e8400-e29b-41d4-a716-446655440000"
}
```

### `GET /theme-shares/:token` (public, no auth)

Response (200) — the snapshot object:
```json
{
  "theme": { "id": "...", "title": "...", "description": "...", ... },
  "colorSchemes": [
    { "variant": "light", "config": { ... }, ... },
    { "variant": "dark", "config": { ... }, ... }
  ],
  "widgetConfigs": [
    { "variant": "light", "config": { ... }, ... },
    { "variant": "dark", "config": { ... }, ... }
  ],
  "pageConfigs": [
    { "variant": "light", "config": { ... }, ... },
    { "variant": "dark", "config": { ... }, ... }
  ],
  "splashAsset": { ... } | null,
  "launchAsset": { ... } | null,
  "featureAccess": { "config": { ... }, ... } | null
}
```

Key points:
- `colorSchemes`, `widgetConfigs`, `pageConfigs` are **arrays** with a `variant` field on each item
- `splashAsset`, `launchAsset`, `featureAccess` are nullable objects
- Data is an immutable snapshot — does not change even if the theme is later modified

---

## ThemeHistory integration

When a share token is created, the resulting ThemeHistory entry has:
- `shareTokenId`: the UUID of the share token
- `description`: "Created for share link"
- `tag`: optional, set from the POST request body

The history list endpoint (`GET /applications/:appId/themes/:themeId/history`) includes `shareTokenId` in each entry, allowing the frontend to show share link indicators.

---

## Module registration

**File**: `src/features/theme-shares/theme-shares.module.ts`

Imports `ThemeHistoryModule`, registers service + controller. Registered in `AppModule`.
