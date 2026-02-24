# Translations Feature

The **Translations** feature manages application-specific translation overrides on top of base
translations hosted in Localizely. It supports fetching base translations, storing per-app overrides
in Firestore, and composing Flutter ARB files with overrides applied.

## Sub-docs

| Document | Description |
|---|---|
| [Data Model](./translations-data-model.md) | Entity, Firestore collection, composite indexes |
| [API Endpoints](./translations-api-endpoints.md) | REST endpoints for translations |
| [Core Flows](./translations-core-flows.md) | Override upsert, ARB composition, base translation fetch |

---

## Architecture Overview

```
+-----------------------------------------------------+
|                 TranslationsModule                   |
|                                                      |
|  TranslationsController --> TranslationsService      |
|                                  |                   |
|                                  v                   |
|                        TranslationsRepository        |
|                          |              |            |
|                          v              v            |
|                    Firestore       Localizely API    |
|                   (overrides)    (base translations) |
+-----------------------------------------------------+
```

`TranslationsService` is a thin pass-through to `TranslationsRepository`, which handles
both Firestore persistence (overrides) and external Localizely API calls (base translations).

---

## Directory Structure

```
src/features/translations/
|-- translations.module.ts         # NestJS module registration
|-- translations.controller.ts     # REST endpoints
|-- translations.service.ts        # Delegates to repository
|-- translations.repository.ts     # Core logic: Firestore + Localizely
+-- entities/
    +-- translation.ts             # Translation Firestore entity
```

---

## Key Concepts

**Base translations** are fetched on-demand from Localizely (JSON or ARB ZIP format).
They are not persisted locally.

**Overrides** are per-application translation values stored in Firestore. An override replaces
a base translation value for a specific `(applicationId, locale, key)` tuple.

**ARB composition** downloads the base Flutter ARB ZIP from Localizely, applies app-specific
overrides per locale, and returns a new ZIP stream with the modified ARB files.

---

## Configuration

| Variable | Required | Description |
|---|---|---|
| `LOCALIZELY_DOWNLOAD_URL` | Yes | Localizely API endpoint for downloading translations |
| `LOCALIZELY_API_KEY` | Yes | API token sent as `X-Api-Token` header |

---

## Authentication

The translations controller does not apply `FirebaseAuthGuard` -- endpoints are open.
