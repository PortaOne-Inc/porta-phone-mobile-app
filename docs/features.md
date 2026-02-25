# Feature Documentation Index

Quick navigation to all feature docs in the project.

---

## Cross-cutting

| Document | Description |
|---|---|
| [DTO & Validation](./validation.md) | Zod-based DTO pattern, conventions, type caveats |

---

## Themes

| Document | Description |
|---|---|
| [Overview](./themes-overview.md) | Architecture, directory structure, module graph, optimistic locking, rate limiting, auth |
| [Data Model](./themes-data-model.md) | Entities, Firestore collections, composite indexes |
| [API Endpoints](./themes-api-endpoints.md) | REST endpoints for themes and all sub-features |
| [Core Flows](./themes-core-flows.md) | Theme creation, copy, cross-app deep copy, cascade delete, asset upload, error handling |
| [AI Generation](./generate-themes.md) | OpenAI-powered theme generation and nudge, request/response schemas, fallback behavior |
| [Change History](./theme-history.md) | Theme snapshot history, tracked actions, pagination API, backward compatibility |

---

## Translations

| Document | Description |
|---|---|
| [Overview](./translations-overview.md) | Architecture, directory structure, key concepts, configuration |
| [Data Model](./translations-data-model.md) | Entity, Firestore collection, composite indexes |
| [API Endpoints](./translations-api-endpoints.md) | REST endpoints for base translations and overrides |
| [Core Flows](./translations-core-flows.md) | Override upsert, ARB composition, base translation fetch |
