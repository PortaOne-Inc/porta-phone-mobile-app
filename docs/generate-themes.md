# AI Theme Generation

The **Generate Themes** feature uses OpenAI to create complete Flutter/WebTrit themes (color scheme, widget config, page
config) from a plain-text description. It also supports incremental theme adjustment ("nudge").

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Configuration](#configuration)
- [API Endpoints](#api-endpoints)
    - [POST /applications/:applicationId/themes/generate](#post-applicationsapplicationidthemesgenerate)
    - [POST /applications/:applicationId/themes/:themeId/generate/nudge](#post-applicationsapplicationidthemesthemeidgeneratenudge)
- [Request & Response Schemas](#request--response-schemas)
- [Generation Flow](#generation-flow)
- [Nudge Flow](#nudge-flow)
- [Fallback Behavior](#fallback-behavior)
- [Zod Validation](#zod-validation)

---

## Overview

When called, the service:

1. Generates a **color scheme** (35 Material 3 color fields) via OpenAI
2. In parallel, generates a **widget config** and a **page config** using the color scheme as context
3. Saves all three to Firestore and returns the full result

If `OPENAI_API_KEY` is not set, or if OpenAI returns invalid JSON, hardcoded **fallback values** are used — the endpoint
never errors due to AI unavailability.

---

## Architecture

```
src/features/themes/features/generate/
├── generate.module.ts          — NestJS module, registers all providers
├── generate.controller.ts      — HTTP endpoints (POST generate, POST nudge)
├── generate.service.ts         — Orchestrator (~230 lines); delegates to generators
├── dto/
│   ├── create-generate.dto.ts  — Zod: GenerateThemeSchema (title, description, prompt, seedColor, variant, assetIds, options)
│   ├── nudge-theme.dto.ts      — Zod: NudgeThemeSchema (prompt, targets, mode, variant, seedColorHint)
│   └── update-generate.dto.ts
├── guards/
│   └── firebase-uid-throttler.guard.ts — Rate limiting by Firebase UID (extends ThrottlerGuard)
├── schemas/
│   ├── color-scheme.schema.ts  — Zod schema for ColorSchemeConfig (35 fields, all #RRGGBB)
│   ├── widget-config.schema.ts — Zod schema for ThemeWidgetConfig (fonts, buttons, avatars, dialogs, statuses, gradients)
│   └── page-config.schema.ts   — Zod schema for ThemePageConfig (login, dialing, overlayStyle, callInfo)
└── generators/
    ├── openai-client.service.ts   — Shared OpenAI wrapper; json_object format, 30s timeout
    ├── color-scheme.generator.ts  — generate() / nudge() / fallback()
    ├── widget-config.generator.ts — generate() / nudge() / fallback()
    └── page-config.generator.ts   — generate() / nudge() / fallback()
```

### Dependency graph

```
GenerateThemesService
  ├── OpenAiClientService          (injected into all generators)
  ├── ColorSchemeGenerator
  ├── WidgetConfigGenerator
  └── PageConfigGenerator
```

---

## Configuration

| Variable         | Required | Description                                    |
|------------------|----------|------------------------------------------------|
| `OPENAI_API_KEY` | No       | If absent, all generators return fallback data |

The model used is `gpt-4o-mini` at temperature `0.2` with a **30-second request timeout**. Both model and temperature can
be overridden inside `OpenAiClientService.chatJson()` via the `options` parameter if needed.

---

## API Endpoints

### POST `/applications/:applicationId/themes/generate`

Generates a **new theme** from scratch.

**Auth:** Firebase Bearer token required (`admin` or `user` role)

**Rate limit:** 5 requests per minute per user (429 on exceed)

#### Request body

All fields are validated via Zod (`GenerateThemeSchema`). Extra fields are rejected (`.strict()`).

```json
{
  "title": "Ocean Breeze",
  "description": "A calm, professional app for VoIP calls. Blue and teal tones.",
  "prompt": "Create a light theme with cool blues and subtle green accents.",
  "seedColor": "#1A73E8",
  "variant": "light",
  "assetIds": ["asset_01"],
  "options": {}
}
```

| Field       | Type                      | Required | Constraints              | Description                                            |
|-------------|---------------------------|----------|--------------------------|--------------------------------------------------------|
| `title`     | `string`                  | Yes      | 1..120 chars, trimmed    | Theme name; used as the Firestore Theme document title |
| `description` | `string`               | No       | max 2000 chars, trimmed  | Business/design context appended to the prompt         |
| `prompt`    | `string`                  | Yes      | 1..5000 chars, trimmed   | LLM instruction (what to generate, constraints)        |
| `seedColor` | `string` (`#RRGGBB[AA]`)  | No       | Regex: `^#([0-9A-Fa-f]{6}\|[0-9A-Fa-f]{8})$` | Seed color for the palette        |
| `variant`   | `"light" \| "dark"`       | No       | Default: `"light"`       |                                                        |
| `assetIds`  | `string[]`                | No       | max 20 items             | IDs of assets to reference during generation           |
| `options`   | `Record<string, unknown>` | No       |                          | Advanced generation options                            |

#### Response

```json
{
  "theme": {
    "id": "abc123",
    "applicationId": "app_01",
    "title": "Ocean Breeze"
  },
  "colorSchemeConfig": {
    "seedColor": "#1A73E8",
    "colorSchemeOverride": {
      "primary": "#1A73E8",
      "onPrimary": "#FFFFFF",
      "secondary": "#00796B",
      "..."
    }
  },
  "themeWidgetConfig": {
    "fonts": {
      "fontFamily": "Montserrat"
    },
    "dialog": {
      "snackBar": {
        "successBackgroundColor": "#75B943",
        "errorBackgroundColor": "#E74C3C"
      }
    },
    "..."
  },
  "themePageConfig": {
    "light": {
      "login": {
        "modeSelect": {
          "buttonLoginStyleType": "neutralOnDark",
          "buttonSignupStyleType": "neutralOnDark"
        }
      },
      "dialing": {
        "callInfo": {
          "usernameTextStyle": {
            "fontSize": 24,
            "color": "#FFFFFF"
          }
        }
      }
    }
  }
}
```

---

### POST `/applications/:applicationId/themes/:themeId/generate/nudge`

**Adjusts an existing theme** based on a short prompt. Loads current configs from Firestore, applies AI-generated
changes, and saves.

**Auth:** Firebase Bearer token required (`admin` or `user` role)

**Rate limit:** 10 requests per minute per user (429 on exceed)

#### Request body

All fields are validated via Zod (`NudgeThemeSchema`). Extra fields are rejected (`.strict()`).

```json
{
  "prompt": "Make the primary color warmer, closer to orange.",
  "targets": [
    "colorScheme",
    "widgetConfig"
  ],
  "mode": "patch",
  "variant": "light",
  "seedColorHint": "#F95A14"
}
```

| Field           | Type                                                  | Required | Constraints                     | Description                                                                               |
|-----------------|-------------------------------------------------------|----------|---------------------------------|-------------------------------------------------------------------------------------------|
| `prompt`        | `string`                                              | Yes      | 1..5000 chars, trimmed          | What to change                                                                            |
| `targets`       | `("colorScheme" \| "widgetConfig" \| "pageConfig")[]` | No       | min 1 item if provided          | Which configs to update. Default: all three                                               |
| `mode`          | `"patch" \| "replace"`                                | No       | Default: `"patch"`              | `patch` = deep-merge AI output over current. `replace` = full replace                     |
| `variant`       | `"light" \| "dark"`                                   | No       | Default: `"light"`              |                                                                                           |
| `seedColorHint` | `string \| null` (`#RRGGBB[AA]`)                      | No       | Regex validated, nullable       | Hints the color generator toward a specific seed                                          |

#### Response

```json
{
  "theme": {
    "id": "abc123",
    "..."
  },
  "colorSchemeConfig": {
    "..."
  },
  "themeWidgetConfig": {
    "..."
  },
  "themePageConfig": {
    "light": {
      "..."
    }
  },
  "updated": [
    "colorScheme",
    "widgetConfig"
  ],
  "mode": "patch"
}
```

---

## Request & Response Schemas

### ColorSchemeConfig

Produced by `ColorSchemeGenerator`. All color fields are `#RRGGBB` hex strings.

```typescript
{
  seedColor: string;              // e.g. "#1A73E8"
  colorSchemeOverride: {
    primary, onPrimary,
      primaryContainer, onPrimaryContainer,
      primaryFixed, primaryFixedDim,
      onPrimaryFixed, onPrimaryFixedVariant,
      secondary, onSecondary,
      secondaryContainer, onSecondaryContainer,
      secondaryFixed, secondaryFixedDim,
      onSecondaryFixed, onSecondaryFixedVariant,
      tertiary, onTertiary,
      tertiaryContainer, onTertiaryContainer,
      tertiaryFixed, tertiaryFixedDim,
      onTertiaryFixed, onTertiaryFixedVariant,
      error, onError, errorContainer, onErrorContainer,
      outline, outlineVariant,
      surface, onSurface,
      surfaceDim, surfaceBright,
      surfaceContainerLowest, surfaceContainerLow,
      surfaceContainer, surfaceContainerHigh ?, surfaceContainerHighest,
      onSurfaceVariant,
      inverseSurface, onInverseSurface, inversePrimary,
      shadow, scrim, surfaceTint
  }
}
```

### WidgetConfig (ThemeWidgetConfig)

Produced by `WidgetConfigGenerator`.

```typescript
{
  fonts ? : {fontFamily? : string};
  button ? : {
    primaryElevatedButton? : {
      backgroundColor?, foregroundColor?,
      disabledBackgroundColor?, disabledForegroundColor?
    }
  };
  imageAssets ? : {
    primaryOnboardingLogo? : {uri?, widthFactor?};
    secondaryOnboardingLogo? : {uri?, widthFactor?};
    leadingAvatarStyle? : {
      backgroundColor?, radius?,
      initialsTextStyle? : TextStyle,
      placeholderIcon? : IconConfig,
      loading? : {showByDefault?, padding?, strokeWidth?},
      smartIndicator? : {backgroundColor?, icon?, sizeFactor?},
      registeredBadge? : {registeredColor?, unregisteredColor?, sizeFactor?}
    }
  };
  dialog ? : {
    snackBar? : {
      successBackgroundColor?, errorBackgroundColor?,
      infoBackgroundColor?, warningBackgroundColor?
    }
  };
  statuses ? : {
    registrationStatuses? : {online?, offline?};
    calStatuses? : {
      connectivityNone?, connectError?, appUnregistered?,
      connectIssue?, inProgress?, ready?
    }
  };
  decorationConfig ? : {
    primaryGradientColorsConfig? : {
      colors? : Array<{ color: string, blend: boolean }>
    }
  }
}
```

### PageConfig (ThemePageConfig)

Produced by `PageConfigGenerator`.

```typescript
{
  login ? : {
    modeSelect? : {
      systemUiOverlayStyle? : OverlayStyle,
      buttonLoginStyleType? : ButtonStyleType,
      buttonSignupStyleType? : ButtonStyleType
    }
  };
  dialing ? : {
    systemUiOverlayStyle? : OverlayStyle,
    appBarStyle? : {backgroundColor?, foregroundColor?, primary?},
    callInfo? : {
      usernameTextStyle? : TextStyle,
      numberTextStyle? : TextStyle,
      callStatusTextStyle? : TextStyle,
      processingStatusTextStyle? : TextStyle
    }
  }
}

// ButtonStyleType = "primary" | "neutral" | "primaryOnDark" | "neutralOnDark"
// OverlayStyle = { statusBarIconBrightness, statusBarBrightness, systemNavigationBarColor, systemNavigationBarIconBrightness }
```

---

## Generation Flow

```
POST /themes/generate
        │
        ▼
  Zod validation (GenerateThemeSchema — title, prompt required; auto-trim, length limits)
        │
        ▼
  Rate limit check (5/min per Firebase UID)
        │
        ▼
  Create Theme doc in Firestore
        │
        ▼
  ColorSchemeGenerator.generate(prompt, seedColor?)
    ├── OpenAI: response_format json_object
    ├── Zod validate (ColorSchemeConfigSchema)
    └── On failure → fallback(seedColor)
        │
        ▼
  ┌─────────────────────────────────┐
  │  Promise.all                    │
  │  ├── WidgetConfigGenerator      │
  │  │     .generate(prompt, cs)    │
  │  │     ├── template = fallback  │
  │  │     ├── OpenAI call          │
  │  │     ├── Zod validate         │
  │  │     └── On failure → fallback│
  │  │                              │
  │  └── PageConfigGenerator        │
  │        .generate(prompt, cs)    │
  │        ├── template = fallback  │
  │        ├── OpenAI call          │
  │        ├── Zod validate         │
  │        └── On failure → fallback│
  └─────────────────────────────────┘
        │
        ▼
  Save ColorScheme, WidgetConfig, PageConfig → Firestore
        │
        ▼
  Return { theme, colorSchemeConfig, themeWidgetConfig, themePageConfig }
```

---

## Nudge Flow

```
POST /themes/:themeId/generate/nudge
        │
        ▼
  Zod validation (NudgeThemeSchema — prompt required; auto-trim, length limits)
  Rate limit check (10/min per Firebase UID)
        │
        ▼
  Load Theme from Firestore (404 if not found or wrong applicationId)
        │
        ▼
  Load existing configs from Firestore (or fallback if not found)
        │
        ▼
  For each target in [colorScheme, widgetConfig, pageConfig]:
    ├── if "patch" mode:
    │     AI returns partial JSON → deepMerge over current → Zod validate
    └── if "replace" mode:
          AI returns full JSON → Zod validate → replace current
        │
        ▼
  Save updated configs (only for requested targets)
        │
        ▼
  Return { theme, colorSchemeConfig, themeWidgetConfig, themePageConfig, updated, mode }
```

---

## Fallback Behavior

If `OPENAI_API_KEY` is not configured, or if the OpenAI call fails, or if Zod validation fails on the response, the
generators return deterministic fallback values derived from the seed color:

| Generator             | Fallback source                                                      |
|-----------------------|----------------------------------------------------------------------|
| ColorSchemeGenerator  | Hardcoded WebTrit brand palette (`#F95A14` as seed if none provided) |
| WidgetConfigGenerator | Built from the color scheme (`fallback(cs)`)                         |
| PageConfigGenerator   | Built from the color scheme (`fallback(cs)`)                         |

This ensures the endpoint **always returns a valid, complete theme** regardless of API availability.

---

## Zod Validation

Validation happens at two levels:

### 1. Request DTOs (input validation)

Request bodies are validated via Zod schemas + `nestjs-zod` global pipe before reaching the service:

| Schema                 | File                         | Validates                                                      |
|------------------------|------------------------------|----------------------------------------------------------------|
| `GenerateThemeSchema`  | `dto/create-generate.dto.ts` | title (1..120), prompt (1..5000), seedColor regex, variant, assetIds (max 20) |
| `NudgeThemeSchema`     | `dto/nudge-theme.dto.ts`     | prompt (1..5000), targets enum array, mode, variant, seedColorHint regex      |

Both schemas use `.strict()` to reject unknown fields. String fields are auto-trimmed.

### 2. AI Response schemas (output validation)

All three response schemas live in `schemas/` and validate OpenAI output:

1. **Generate**: validates the full AI response; falls back if invalid
2. **Nudge (replace mode)**: validates the full AI response; keeps current if invalid
3. **Nudge (patch mode)**: deepMerges AI patch over current, then validates the merged result

| Schema                    | File                              | Validates                                      |
|---------------------------|-----------------------------------|------------------------------------------------|
| `ColorSchemeConfigSchema` | `schemas/color-scheme.schema.ts`  | `seedColor` + 40 `#RRGGBB` fields              |
| `WidgetConfigSchema`      | `schemas/widget-config.schema.ts` | All widget fields, strict + optional/nullable |
| `PageConfigSchema`        | `schemas/page-config.schema.ts`   | Login + dialing pages, strict + optional/nullable |

All three AI response schemas use `.strict()` — unknown fields returned by the AI are rejected to prevent
arbitrary field injection. Widget and page schema fields are individually `optional().nullable()` so partial
AI output still passes, but no extra keys are allowed. The color scheme schema requires all 40 fields to be
valid `#RRGGBB` strings.
