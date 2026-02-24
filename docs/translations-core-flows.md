# Translations: Core Flows

---

## Fetch Base Translations

```
GET /translations
      |
      v
TranslationsRepository.getTranslations()
      |
      |-- Download JSON ZIP from Localizely (?type=json&export_empty_as=empty)
      |-- Parse each .json file from the ZIP
      |-- Extract locale from filename (e.g., "en" from "en.json" or "app_en.json")
      |-- Flatten all key-value pairs into Translation[] (with empty id/applicationId)
      +-- Return sorted by key
```

Base translations are never persisted -- they are fetched on-demand from Localizely.

---

## Upsert Override

```
POST /translations/overrides/:appId
  { locale, key, value }
      |
      v
TranslationsRepository.setOverrideByAppId()
      |
      |-- Query Firestore: applicationId + locale + key
      |
      |-- If found:
      |     Update existing document's value
      |
      +-- If not found:
            Create new document with { applicationId, locale, key, value }
```

---

## Delete Override

```
DELETE /translations/overrides/:appId
  { locale, key }
      |
      v
TranslationsRepository.deleteOverrideByAppId()
      |
      |-- Query Firestore: applicationId + locale + key
      |-- If found: delete by document ID
      +-- If not found: no-op
```

---

## Compose ARB

```
GET /translations/compose-arb/:appId
      |
      v
TranslationsRepository.composeArb()
      |
      |-- 1. Load all overrides for appId from Firestore
      |
      |-- 2. Download ARB ZIP from Localizely (?type=flutter_arb&export_empty_as=empty)
      |
      |-- 3. For each .arb file in the ZIP:
      |     |-- Parse JSON content
      |     |-- Extract locale from filename
      |     |-- Apply matching overrides (same locale + key exists in base)
      |     +-- Append modified JSON to response ZIP
      |
      +-- 4. Return ZIP stream (Content-Type: application/zip)
```

Overrides are only applied when the key already exists in the base ARB file.
New keys introduced via overrides are **not** added to the ARB output.
