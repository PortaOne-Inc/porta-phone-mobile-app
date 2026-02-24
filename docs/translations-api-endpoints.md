# Translations: API Endpoints

All endpoints are under `/translations`.

---

## Base Translations

| Method | Path | Description                                                      |
|--------|------|------------------------------------------------------------------|
| `GET`  | `/`  | Fetch all base translations from Localizely (flattened to array) |

Returns `Translation[]` sorted by key. Each entry has `locale`, `key`, and `value`;
`id` and `applicationId` are empty strings (base translations are not persisted).

---

## Overrides

| Method   | Path                | Description                                       |
|----------|---------------------|---------------------------------------------------|
| `GET`    | `/overrides/:appId` | List all translation overrides for an application |
| `POST`   | `/overrides/:appId` | Upsert a single translation override              |
| `DELETE` | `/overrides/:appId` | Delete a single translation override              |

### POST /overrides/:appId

**Body:** `{ locale, key, value }`

Performs an upsert: if an override with the same `(applicationId, locale, key)` exists, its
`value` is updated; otherwise a new override document is created.

### DELETE /overrides/:appId

**Body:** `{ locale, key }`

Finds the override by `(applicationId, locale, key)` and deletes it. No error if not found.

---

## ARB Composition

| Method | Path                  | Description                                                |
|--------|-----------------------|------------------------------------------------------------|
| `GET`  | `/compose-arb/:appId` | Download a ZIP of Flutter ARB files with overrides applied |

Returns `Content-Type: application/zip`. The ZIP contains one `.arb` file per locale with
app-specific overrides merged into the base Localizely translations.
