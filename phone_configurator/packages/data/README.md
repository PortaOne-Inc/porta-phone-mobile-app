# data

Data layer for WebtritConfigurator — contains repository implementations, API client, Firebase integration, and local storage.

## Dependencies

| Package | Purpose |
|---------|---------|
| `domain` | Domain entities and interfaces |
| `dio` | HTTP client |
| `firebase_core` / `firebase_storage` | Firebase integration |
| `shared_preferences` | Local storage |
| `jwt_decoder` | JWT token handling |
| `injectable` / `get_it` | Dependency injection |
| `freezed_annotation` | Immutable data classes |

## Usage

```yaml
dependencies:
  data:
    path: ./packages/data
```
