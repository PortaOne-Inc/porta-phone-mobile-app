# Translations: Data Model

---

## Entity

### Translation

| Field           | Type   | Description                                |
|-----------------|--------|--------------------------------------------|
| `id`            | string | Auto-generated Firestore document ID       |
| `applicationId` | string | Parent application reference               |
| `locale`        | string | Locale code (e.g., `"en"`, `"de"`, `"fr"`) |
| `key`           | string | Translation key (e.g., `"login_button"`)   |
| `value`         | string | Translated text value                      |

The composite key `(applicationId, locale, key)` uniquely identifies an override.

---

## Firestore Collection

| Collection     | Entity      | ID strategy    |
|----------------|-------------|----------------|
| `translations` | Translation | Auto-generated |

> **Note:** If `COLLECTION_PREFIX` is set, the actual collection name will be prefixed
> (e.g., `dev_translations`).

---

## Composite Indexes

| Collection     | Indexed Fields                     | Used By                                           |
|----------------|------------------------------------|---------------------------------------------------|
| `translations` | `applicationId` + `locale` + `key` | `setOverrideByAppId()`, `deleteOverrideByAppId()` |
