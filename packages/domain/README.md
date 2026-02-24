# domain

Domain layer for WebtritConfigurator — contains business entities, repository interfaces, and use-cases.

## Dependencies

| Package | Purpose |
|---------|---------|
| `injectable` / `get_it` | Dependency injection |
| `freezed_annotation` | Immutable data classes |
| `json_annotation` | JSON serialization |
| `logging` | Structured logging |

## Usage

This package is a workspace dependency of the root app and `data` package:

```yaml
dependencies:
  domain:
    path: ./packages/domain
```
