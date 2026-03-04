# AGENTS.md

WebTrit Phone Configurator — Flutter web app for configuring WebTrit phone themes, features, and appearance.
Melos workspace with two local packages: `domain`, `data`.
Flutter 3.41.2 (stable), backend: NestJS + Zod.

## Build & Test

```bash
melos bootstrap                                               # install all deps
melos run analyze                                             # lint all packages
melos run test                                                # test all packages
flutter test                                                  # unit/widget (app root)
dart run build_runner build --delete-conflicting-outputs      # codegen (run per package)
```

> **Note:** `melos run generate` fails in non-interactive terminals — run `dart run build_runner build --delete-conflicting-outputs` directly inside each package dir (`packages/domain`, `packages/data`, repo root).

## Code Standards

- No Cyrillic anywhere (source, comments, strings, logs, keys).
- No inline comments — DartDoc only for public APIs.
- Single quotes; 120-char line width.
- Never edit `*.g.dart` / `*.freezed.dart` — regenerate via `build_runner`.
- Required named params before optional named params.
- Callbacks: single-expression only; extract multi-statement logic to a private method.
- Imports: 6 groups, one blank line between, alphabetical within:
  1. Dart SDK
  2. Flutter SDK
  3. External
  4. Internal packages (`domain`, `data`)
  5. `package:webtrit_configurator/...`
  6. Relative

## Architecture

```
lib/                → app layer (features/, widgets/, core/, di/, exports/, extensions/)
packages/
  domain/           → abstract repos, models, use cases (pure Dart — no Flutter deps)
  data/             → repo implementations, DTOs, datasources, mappers
```

- **State**: BLoC/Cubit with `@freezed` for state; events are plain classes or `@freezed`.
- **DI**: `get_it` + `injectable` — register in `di/` modules; never pass `BuildContext` into BLoC/Service.
- **Theme schema**: `webtrit_appearance_theme` (from `webtrit_phone` package) is **source of truth** — never modify it; adapt configurator UI to what exists in the schema.
- **4 theme editors**: `ColorSchemeEditor`, `ThemeWidgetEditor`, `ThemePageEditor`, `FeatureAccessEditor`.
- **Optimistic locking**: all configs track `version` from server; send `expectedVersion` on save; 409 → conflict dialog.
- **Widgets**: `StatelessWidget` preferred; dumb widgets in `features/*/view/widgets/`.
- **Repositories**: always via domain interfaces; never call `data` layer directly from `lib/`.
