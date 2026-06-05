# Base theme (generator source of truth)

These JSON files are the structural base used by the AI theme generator
(`ThemeComposerService`). They guarantee a complete, valid theme; the generator
overrides a palette-driven subset on top (colors, gradients, tabs, features,
logo).

## ⚠️ Do not edit by hand — generated from the DTOs

They are produced from **pure DTO defaults** of the `webtrit_appearance_theme`
package — the schema source of truth — via a backend-only Dart tool
(`tool/base-theme/`). The DTOs carry sensible `@Default` content (the default tab
list, settings sections, full widget/page structure, default palette), so the
base is complete without copying anything from the client app.

```
webtrit_appearance_theme (DTOs)
  └─ ColorSchemeConfig() / ThemeWidgetConfig() / ThemePageConfig() / AppConfig()  .toJson()
        ↓ (tool/base-theme — Dart, reads the package; nothing written to the client)
     src/.../generate/base/*.json
        ↓ ThemeComposerService overlays design (M3 colors, gradients, tabs, features, logo)
     generated theme
```

## Regenerating / drift check

Requires the Dart SDK and a sibling `webtrit_phone` checkout (the path dependency
in `tool/base-theme/pubspec.yaml`).

```bash
npm run sync:base-theme    # regenerate base/*.json from current DTO defaults
npm run check:base-theme   # exit 1 if base drifted from the DTOs (CI)
```

When the DTOs change, re-run `sync:base-theme` and commit the result; the
generator is defensive (all fields optional-with-defaults, unknown fields carried
through), so a stale base degrades gracefully rather than breaking generation.
