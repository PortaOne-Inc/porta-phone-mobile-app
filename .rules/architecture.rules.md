### LLM Coding Rules: WebTrit Phone Configurator

**1. Project Context & Ecosystem**

* **Core Purpose:** This project is a web-based UI configurator for the WebTrit Phone application.
* **Shared DTOs & Theming:** The configurator strictly consumes DTOs and theme definitions from the
  `webtrit_appearance_theme` package.
* **UI Rendering & Mocks:** Web UI previews and rendering rely on the `screenshots` project. When
  working with UI rendering, previews, or mock data, you must align with the architecture and data
  structures established in the `screenshots` rendering pipeline.

**2. Monorepo Structure & Layered Architecture**

* **Clean Architecture:** The project separates concerns into specific layers:
* `packages/domain`: Contains core business logic, models, exceptions, repository interfaces, and
  use cases. Must remain pure and independent of external frameworks or the data layer.
* `packages/data`: Implements data sources, mappers, and repository implementations. Depends on the
  `domain` package.
* `lib/` (Main App): The presentation layer containing UI, state management (BLoC/Cubit), DI setup,
  and routing.


* **Strict Boundaries:** Code inside `packages/` must **not** import anything from the main `lib/`
  folder. Ensure unidirectional dependency flow (`lib` -> `domain` <- `data`).

**3. Features Folder & UI Components**

* **Location:** App-specific business logic, UI screens, and feature-specific BLoCs reside in
  `lib/features/`. Each feature module encapsulates its own `bloc`, `models`, `view`, and `widgets`.
* **Stateless Widgets over Methods:** Never use a method to return a Widget (except for list
  generation). Always extract UI components into a `StatelessWidget` class.
* **Surface Styling:** Prefer `Card` for surfaces with elevation, shadows, and material styling. Do
  not use a `Container` with `BoxShadow` when a `Card` is suitable.
* **Material Theme:** Always rely on the parent Material theme and styles (`Theme.of(context)`). Do
  not override Material properties locally unless strictly necessary.

**4. Code Style & Dart Specific Constraints**

* **Callbacks:** If a callback contains more than one statement, extract its logic into a private
  method. Callbacks must be concise and single-expression only. Multi-line callback bodies are not
  allowed.
* **Opacity:** Always use `withValues(alpha: ...)` instead of `withOpacity(...)`. The latter is
  deprecated and causes precision loss. Example: `Colors.black.withValues(alpha: 0.04)`.
* **Named Parameters:** Always declare required named parameters before optional named parameters.
  Do not place optional named parameters before required ones.
* **Double Literals:** Avoid unnecessary use of double literals. Do not add `.0` or force double
  values when not required by the API or type context.

**5. Imports Formatting**

* Imports must be grouped into ordered sections and sorted alphabetically within each group.
* Sections must be separated by exactly one empty line. Omit any section with no imports. Do not add
  comments or extra blank lines between or inside groups.
* **Section order:** 1. Dart SDK (`dart:`)

1. Flutter SDK (`package:flutter/`)
2. External dependencies (`package:external_lib/`)
3. Internal dependencies (e.g., `package:domain/`, `package:data/`,
   `package:webtrit_appearance_theme/`)
4. Project package imports (`package:webtrit_phone_configurator/`)
5. Relative imports (`./` or `../`)

**6. Language, Comments & Output Constraints**

* **NO CYRILLIC IN CODE:** Never output Cyrillic characters anywhere inside code. This includes
  source files, code blocks, inline code, comments, strings, logs, exceptions, identifiers, file
  paths, configuration files, JSON/YAML/TOML keys & values, SQL, and commit messages.
* **No Russian Language:** Russian must never be used in any context.
* **Comment Style:** Do not add your own conversational comments in the code. Code should be clean
  and ready to commit. Do not add comments that are obvious, redundant, or describe UI structure.
  Avoid comments used as section titles, numbering, or visual separators. Write comments **only**
  when they add non-obvious context, and strictly use DartDoc (`///`) style.