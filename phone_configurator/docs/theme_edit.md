# Theme Edit Feature

## Overview

The **Theme Edit** feature is a comprehensive theme configuration system for the WebTrit Phone
Configurator. It enables administrators to customize the visual appearance, layout, and feature set
of the mobile application through an interactive editor with real-time preview.

**Location:** `lib/features/themes/features/theme_edit/`

**Route:** `/applications/{applicationId}/{themeId}` (name: `themes/edit`)

---

## Directory Structure

```
theme_edit/
├── bloc/                        # State management (Bloc-based)
│   ├── update_theme_cubit.dart  # Main Bloc (events + handlers)
│   ├── update_theme_event.dart  # Event definitions
│   └── update_theme_state.dart  # State definitions
├── consts/                      # Constants and type definitions
├── controllers/                 # Editor APIs for configuration management
│   ├── color_scheme_editor_api.dart
│   ├── feature_access_editor_api.dart
│   ├── theme_page_editor_api.dart
│   └── theme_widget_editor_api.dart
├── extension/                   # Extensions and utilities
├── features/                    # Sub-features
│   ├── preview/                 # Theme preview functionality
│   ├── resources/               # Asset management (launch, splash)
│   └── schemes/                 # Core theme configuration
│       ├── color_scheme/        # Color picker UI
│       ├── components/          # Widget styling (fonts, buttons, bars, etc.)
│       ├── feature_scheme/      # App features and navigation config
│       └── pages/               # Page layout configurations
├── models/                      # Local data models
├── routes/                      # GoRouter navigation
│   ├── theme_shell_route.dart   # Theme provider wrapper
│   ├── scheme_route.dart        # Configuration editor routes
│   └── preview_route.dart       # Preview routes
├── store/                       # Data stores
├── view/
│   └── page_theme_edit.dart     # Main scaffold page
└── widgets/                     # Shared UI components
```

---

## Architecture

### High-Level Layout

The editor page (`PageThemeEdit`) is a split-panel layout:

- **Left panel (65%):** Configuration editor with navigation (GoRouter: `SchemeRoute`)
- **Right panel (35%):** Live theme preview (GoRouter: `PreviewRoute`)

Both panels use independent `GoRouter` instances, allowing separate navigation within each section.

### Component Diagram

```
PageThemeEdit (Scaffold)
├── AppBar
│   ├── Update (refresh from server)
│   ├── Save (sync to server)
│   └── Theme mode switcher (light/dark)
├── Drawer
│   ├── App info
│   └── Navigation links
└── Body (ResizableColumns)
    ├── SchemeRoute (left) ─────────────────────────────┐
    │   ├── /colors    → ColorSchemeConfigurationView    │
    │   ├── /widgets   → ConfigureWidgetsView            │
    │   ├── /pages     → ConfigureThemePageView          │
    │   ├── /features  → ConfigureAppConfigView          │
    │   ├── /launch    → LaunchAssetsScreen              │
    │   └── /splash    → SplashScreen                    │
    │                                                    │
    └── PreviewRoute (right) ───────────────────────────┘
        └── /edit/preview → PageThemePreview
```

---

## State Management

### UpdateThemCubit (Main Bloc)

Central state management for all theme configurations. Uses `bloc_concurrency` transformers for
event handling.

**State (`UpdateThemeState`):**

| Property            | Type                          | Description                             |
|---------------------|-------------------------------|-----------------------------------------|
| `status`            | `ThemePropertyStatus`         | Loading / success / error               |
| `appConfig`         | `AppConfig`                   | Features & navigation config            |
| `colorSchemeConfig` | `ColorSchemeConfig`           | Colors for current variant              |
| `themeWidgetConfig` | `ThemeWidgetConfig`           | Widget/component styles                 |
| `themePageConfig`   | `ThemePageConfig`             | Page layout config                      |
| `selectedVariant`   | `BrightnessVariant`           | Light or Dark                           |
| `assets`            | `List<AssetModel>`            | Available image assets                  |
| `embeddedResources` | `List<EmbeddedResourceModel>` | Embedded web pages                      |
| `loadedComponents`  | `List<ThemeComponents>`       | Loading progress tracker (5 components) |
| `applicationModel`  | `ApplicationModel?`           | Current application                     |
| `theme`             | `ThemeModel?`                 | Current theme                           |
| `error`             | `Exception?`                  | Error details                           |

**Events:**

| Event                    | Transformer     | Purpose                      |
|--------------------------|-----------------|------------------------------|
| `InitializeEvent`        | `droppable()`   | Load all configs from server |
| `SyncConfigEvent`        | `droppable()`   | Save all changes to server   |
| `UpdateColorSchemeEvent` | `restartable()` | Color scheme changes         |
| `AppConfigEvent`         | `concurrent()`  | Feature/navigation updates   |
| `ThemePageEvent`         | `concurrent()`  | Page layout updates          |
| `ThemeWidgetEvent`       | `concurrent()`  | Widget style updates         |
| `UpdateVariantEvent`     | —               | Switch light/dark variant    |
| `ResourcesEvent`         | —               | Asset/resource updates       |
| `LoadingEvent`           | —               | Track loading status         |
| `UpdateLocalConfigEvent` | —               | In-memory config sync        |

### Loading Progress

Initialization tracks 5 components: **widgets, pages, colors, navigation, embeds**. The app bar
displays loading status (e.g., "Loading (3/5): Colors, Pages, Widgets").

---

## Editor Controller Pattern

The feature uses a stateful editor pattern with stream-based updates. Each editor manages a specific
configuration domain.

### Editor API Interface

```dart
Stream<T> get stream; // Emit changes to Cubit

T get initial; // Original server state

T get current; // Edited state

void setInitial(T value); // Initialize from server data

void resetToInitial(); // Discard all changes

T buildFull(); // Prepare config for sync

bool get isDirty; // Has unsaved changes
```

### Editors

| Editor                | Domain                    | Key Methods                                                     |
|-----------------------|---------------------------|-----------------------------------------------------------------|
| `ColorSchemeEditor`   | Color scheme config       | `patchOverride()`, `replaceOverride()`                          |
| `ThemePageEditor`     | Page layouts              | `setLoginPage()`, `setDialingPage()`, `setSettingsPage()`, etc. |
| `FeatureAccessEditor` | App features & navigation | `setLoginConfig()`, `setBottomMenu()`, `setCallConfig()`        |
| `ThemeWidgetEditor`   | Widget styling            | Per-widget-type setters                                         |

### Data Flow

```
User edits a field (e.g., color picker)
    ↓
Editor.set*() / Editor.patch*()
    ↓
Editor emits via StreamController
    ↓
Stream subscription → UpdateLocalConfigEvent
    ↓
Cubit updates state via copyWith()
    ↓
BlocBuilder rebuilds UI
```

---

## Data Flow Diagrams

### Initialization

```
User navigates to theme_edit
    ↓
UpdateThemCubit ← InitializeEvent
    ↓
Parallel fetch (5 components):
    ├── GetFeatureAccessUsecase        → FeatureAccessEditor.setInitial()
    ├── GetColorSchemeByVariantUsecase  → ColorSchemeEditor.setInitial()
    ├── GetPageConfigByVariantUsecase   → ThemePageEditor.setInitial()
    ├── GetWidgetConfigUsecase          → ThemeWidgetEditor.setInitial()
    └── GetApplicationEmbedsUsecase     → embeddedResources
    ↓
Each component → LoadingEvent.markLoaded()
    ↓
UI ready when all 5 loaded
```

### Save (Sync)

```
User clicks "Save"
    ↓
SyncConfigEvent
    ↓
Build full configs from all editors:
    ├── _featureAccessEditor.buildFull()
    ├── _colorSchemeEditor.buildFull()
    ├── _pageEditor.buildFull()
    └── _widgetEditor.buildFull()
    ↓
Parallel Future.wait():
    ├── UpdateFeatureAccessUsecase
    ├── UpsertColorSchemeByThemeVariantUsecase
    ├── UpsertPageConfigByVariantUsecase
    └── UpsertWidgetConfigUsecase
    ↓
Status → ThemePropertyStatus.success
```

### Variant Switching

```
User switches Light ↔ Dark
    ↓
UpdateVariantEvent(BrightnessVariant)
    ↓
Clear variant-specific configs
    ↓
Reload all configs for new variant
    ↓
Editors re-initialized with new data
```

---

## Sub-Features

### 1. Color Scheme (`features/schemes/color_scheme/`)

Interactive color configuration with grouped categories:

- **Primary:** primary, onPrimary, primaryContainer, onPrimaryContainer
- **Secondary:** secondary, onSecondary, secondaryContainer, onSecondaryContainer
- **Tertiary:** tertiary, onTertiary, tertiaryContainer, onTertiaryContainer
- **Error:** error, onError, errorContainer, onErrorContainer
- **Surface:** surface, onSurface, outline, shadow, scrim, etc.

Supports JSON import/export and variant-specific (light/dark) overrides.

### 2. Widget Styling (`features/schemes/components/`)

Tabbed interface with 10+ categories:

| Tab            | Configuration                    |
|----------------|----------------------------------|
| Fonts          | Font family, size                |
| Buttons        | Button styles, elevation         |
| Groups         | Group containers, titles         |
| Bars           | Navigation bar, app bar          |
| Images & Icons | Image assets, app icons          |
| Inputs         | Text field borders, cursors      |
| Texts          | Text styles                      |
| Dialogs        | Dialog and snackbar styles       |
| Statuses       | Registration, call status colors |
| Containers     | Decoration and container styles  |

### 3. Feature Access (`features/schemes/feature_scheme/`)

Tabbed interface for app behavior:

| Tab       | Configuration                                                                                    |
|-----------|--------------------------------------------------------------------------------------------------|
| Supported | Feature flags                                                                                    |
| Login     | Authentication mode (default/custom)                                                             |
| Main      | Bottom menu tabs (add/remove/reorder: Favorites, Recents, Contacts, Keypad, Messaging, Embedded) |
| Settings  | Settings sections and items                                                                      |
| Call      | Video/audio, transfer, encoding, peer connection                                                 |

### 4. Page Configuration (`features/schemes/pages/`)

Per-page layout and styling for:

- Login screen (base + mode select)
- About page
- Dialing/Call page (overlay, app bar, info styling)
- Settings, Keypad, Contacts, Recents, Favorites
- Conversations (chat)
- Embedded resource pages

Each page supports: background images, text styles, metadata display, system UI overlay.

### 5. Preview (`features/preview/`)

- Real-time theme preview with device frame mockup
- Toggleable device frame visibility (`PreviewThemeCubit`)
- Reflects all configuration changes live

### 6. Resources (`features/resources/`)

Both Launch Assets and Splash Screen use the shared `ConfigurableAssetDesigner` widget — a
single-page grid designer with proportional padding, shared background color, and safe zone overlay.

**ConfigurableAssetDesigner:**

- All pages are shown simultaneously in a 2-column grid (no tabs)
- A shared base padding slider at the top controls all platforms proportionally via a ratio
- Each card can be **locked** (follows proportional ratio) or **unlocked** (independent override)
- One shared background color for all platforms (no per-card bg override)
- `safeZoneDp` draws a white circle guide showing the guaranteed visible area
- Padding is clamped to `minPaddingDp = (sizeDp - safeZoneDp) / 2`
- The "common" page (isCommon: true) acts as the reference for ratio calculation
- PatternPainter checkerboard background gives a workspace/dashboard feel
- Export renders each page at its `exportSizePx` resolution

**Proportional padding math:**

```
ratio = (commonPad - commonMinPad) / (commonMaxPad - commonMinPad)

For each locked platform:
  platformPad = minPad + ratio * (maxPad - minPad)
  where minPad = (sizeDp - safeZoneDp) / 2, maxPad = sizeDp / 2
```

On load, saved padding is compared to the proportional value (1dp tolerance) — if it matches,
the page auto-locks; otherwise it stays unlocked with its saved override.

**Launch Assets:**

- 5-card grid: **Common**, **Android (Adaptive)**, **Android (Legacy)**, **iOS**, **Web**
- Common page mirrors Android Adaptive constraints and sets shared foreground/background
- Platform constraints loaded from backend (`GetConstraintsDefaultsUsecase`), with hardcoded
  fallbacks
- Saved padding values are clamped to per-platform minimums on load to prevent clipping on real
  devices
- State managed by `LaunchAssetsCubit`

Platform constraints (hardcoded fallbacks in `default_constraints_model.dart`):

| Platform         | sizeDp | safeZoneDp | minPaddingDp | Notes                                 |
|------------------|--------|------------|--------------|---------------------------------------|
| Android Adaptive | 432    | 264        | 84           | 108dp canvas ×4; 66dp safe zone ×4    |
| Android Legacy   | 512    | 384        | 64           | No system mask                        |
| iOS              | 1024   | 832        | 96           | Superellipse mask, ~22% corner radius |
| Web              | 512    | 460.8      | 25.6         | No system mask                        |

Android Adaptive geometry (
per [official spec](https://developer.android.com/develop/ui/views/launch/icon_design_adaptive)):

- Canvas: 108×108 dp per layer, outer 18dp per side reserved for masking/parallax
- Safe zone: 66×66 dp (centered) — content here is never clipped regardless of OEM mask shape

**Splash Screen:**

- 2-card grid: **Splash** (common/primary) and **Android 12**
- The Splash page acts as the common page; Android 12 inherits foreground and background from it
- Each page manages its own padding independently (no padding inheritance between pages)
- Android 12 page uses dedicated sizing constraints optimized for the circular mask area (
  288/192/288 dp)
- Constraints loaded from backend (`GET .../splash-asset/constraints-defaults`), with hardcoded
  fallbacks
- On save, exports both pages and uploads via `upload-batch` with targets `splash` and
  `android12Splash`
- Backward compatible: if backend doesn't return `android12` constraints, fallback defaults are used
- State managed by `SplashAssetsBloc` with per-page padding tracking

---

## API Integration (Use Cases)

| Use Case                                 | Operation                              |
|------------------------------------------|----------------------------------------|
| `UsecaseThemeGet`                        | Fetch theme by applicationId + themeId |
| `UsecaseThemeUpdate`                     | Update theme metadata                  |
| `UsecaseApplicationGet`                  | Fetch application info                 |
| `GetFeatureAccessUsecase`                | Get app feature configuration          |
| `UpdateFeatureAccessUsecase`             | Save feature configuration             |
| `GetColorSchemeByThemeVariantUsecase`    | Get colors for light/dark variant      |
| `UpsertColorSchemeByThemeVariantUsecase` | Save colors for variant                |
| `GetWidgetConfigUsecase`                 | Get widget styling                     |
| `UpsertWidgetConfigUsecase`              | Save widget styling                    |
| `GetPageConfigByVariantUsecase`          | Get page layouts for variant           |
| `UpsertPageConfigByVariantUsecase`       | Save page layouts for variant          |
| `WatchApplicationAssetsUsecase`          | Stream application assets              |
| `GetApplicationEmbedsUsecase`            | Get embedded web resources             |
| `GetLaunchAssetsUsecase`                 | Get launch screen assets               |
| `UpsertLaunchAssetsUsecase`              | Save launch screen assets              |
| `DeleteLaunchAssetsUsecase`              | Remove launch screen assets            |
| `GetConstraintsDefaultsUsecase`          | Get launch designer canvas defaults    |
| `GetSplashAssetUsecase`                  | Get splash screen asset                |
| `UpsertSplashAssetUsecase`               | Save splash screen asset (with files)  |
| `DeleteSplashAssetUsecase`               | Remove splash screen asset             |
| `GetSplashConstraintsDefaultsUsecase`    | Get splash designer canvas defaults    |

---

## Navigation Context

### Entry Point

Accessed from the themes collection within an application context:

```
ApplicationDetails
    → ThemeCollectionDetailsPage
        → ThemeEdit (route: themes/edit)
```

### Route Definition

Defined in `lib/app/route/app_route.dart`:

```
/applications/{applicationId}/{themeId}
```

Path parameters:

- `applicationId` — target application ID
- `themeId` — theme to edit

### Internal Navigation

The editor uses two independent GoRouter instances:

- **SchemeRoute** — left panel configuration sections
- **PreviewRoute** — right panel preview

Navigation between configuration sections happens within `SchemeRoute` without affecting the preview
panel.

---

## Key Technical Details

### Concurrency Transformers

```dart
on<InitializeEvent>
(
handler, transformer: droppable()); // Drop if running
on<SyncConfigEvent>(handler, transformer: droppable()); // Drop if running
on<UpdateColorSchemeEvent>(handler, transformer: restartable()); // Cancel + restart
on<AppConfigEvent>(handler, transformer: concurrent()); // Run in parallel
on<ThemePageEvent>(handler, transformer: concurrent()); // Run in parallel
on<ThemeWidgetEvent>(handler,
transformer
:
concurrent
(
)
); // Run in parallel
```

### Stream Binding

Editors are connected to the Cubit via stream subscriptions:

```dart
_pageEditorSub ??= _pageEditor.stream.listen
(
(config) {
add(UpdateLocalConfigEvent.page(config));
});
```

Subscriptions are cleaned up in `Cubit.close()`.

### Dirty State Tracking

Each editor tracks unsaved changes by comparing JSON representations of initial vs. current state.
The `isDirty` getter enables unsaved changes warnings.

---

## Architecture Decisions

### Config Validation: Client-Side Only (by design)

The backend stores theme configs (color schemes, widget configs, page configs, feature access) as
**arbitrary JSON** (`Record<string, any>` / `Map<String, dynamic>`) without schema validation.
This is an intentional architectural decision, not a gap.

**Why:** All config schemas are defined in the shared
[`webtrit_appearance_theme`](../../../webtrit_phone/packages/webtrit_appearance_theme/) package
as strongly-typed Dart models (freezed + json_serializable). The backend acts as **transparent
storage** — it persists and returns JSON as-is, with deep merge on PUT.

**Benefits:**

- Schema changes only require updating the `webtrit_appearance_theme` package and the client apps
- No backend deployment needed when the theme model evolves (new fields, renamed fields, etc.)
- Faster iteration cycle for UI/design changes

**How integrity is maintained:**

- `webtrit_appearance_theme` models provide type safety via Dart's type system and freezed
  immutability
- `fromJson()` / `toJson()` handle serialization with defaults for missing fields
- Optional fields (`String?`, `TextStyleConfig?`) ensure backwards compatibility — new fields don't
  break older stored JSON
- Enum deserialization uses `unknownEnumValue: JsonKey.nullForUndefinedEnumValue` for graceful
  handling of unknown values
- Deprecated fields coexist with new ones during migration periods (`@Deprecated` annotation)

**Data flow:**

```
Backend (Map<String, dynamic>)
    ↓
DTO (config: Map<String, dynamic>)
    ↓
Domain Model (config: Map<String, dynamic>)
    ↓
webtrit_appearance_theme model (.fromJson())
    ↓
Strongly-typed: ColorSchemeConfig / ThemeWidgetConfig / ThemePageConfig
```

**Implication for developers:** All config validation and schema evolution is the responsibility of
`webtrit_appearance_theme`. Never add config schema validation to the backend — it would couple the
backend to the client's schema and break the decoupled iteration model.

### Zod `.passthrough()` in Backend AI Generation (by design)

The backend's AI generation feature uses Zod schemas with `.passthrough()` (not `.strict()`) for
validating AI-generated configs. This allows the AI to return fields from newer schema versions
that the current backend Zod schema doesn't yet define, preserving forward compatibility.

---

## Dependencies

### Packages

- `flutter_bloc` — state management
- `go_router` — nested routing
- `freezed_annotation` — immutable models / code generation
- `provider` — dependency injection
- `webtrit_appearance_theme` — shared theme models (source of truth for config schemas)

### Domain Layer

- `packages/domain/` — use cases, models, repository interfaces
- `packages/data/` — DTOs, mappers, repository implementations
