# Base theme (generator source of truth)

These JSON files are the **canonical "original" theme** used as the structural
base by the AI theme generator (`ThemeComposerService`). They guarantee a
complete, valid theme; the generator only overrides a palette-driven subset.

## ⚠️ Do not edit by hand

They are **copied verbatim** from the single source of truth — the
DTO-normalized canonical artifacts in the `webtrit_appearance_theme` package
(`<phone>/packages/webtrit_appearance_theme/canonical/*.json`). Those are
generated from the DTOs themselves (`tool/dump_canonical.dart`) and drift-guarded
by the package's `test/canonical_test.dart`, so they always conform to the
current schema. Same file names here as there.

## Keeping in sync

When the phone app's theme / the `webtrit_appearance_theme` package evolves,
re-sync from a local `webtrit_phone` checkout:

```bash
# defaults WEBTRIT_PHONE_DIR to ../webtrit_phone
npm run sync:base-theme

# or point at an explicit checkout
WEBTRIT_PHONE_DIR=/path/to/webtrit_phone npm run sync:base-theme
```

CI / drift detection (fails if these files diverged from the source):

```bash
npm run check:base-theme
```

> The generator is defensive about schema evolution: unknown fields are carried
> through, and every field is optional-with-defaults, so a stale base degrades
> gracefully rather than breaking generation.
