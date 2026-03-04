# WebTrit Phone Configurator — Claude Code

@AGENTS.md

## Gotchas

- **Source of truth**: `webtrit_appearance_theme` schema must never be modified to match configurator UI — adapt the UI instead.
- **Codegen**: after changing Freezed models or annotated files, run `dart run build_runner build --delete-conflicting-outputs` inside the relevant package dir; `melos run generate` fails non-interactively.
- **Optimistic locking**: always send `expectedVersion` on save; handle 409 as `VersionConflictException` → show conflict dialog.
- **Partial sync**: use `SyncDetail` per config; `SyncStatus.partiallyFailed` for mixed success/failure; `SyncConfigEvent(retryOnly:)` for selective retry.
- **Race condition guards**: pause editor subscriptions during variant switch / init; `_onUpdateLocalConfigEvent` drops events while loading.
- **withValues**: use `withValues(alpha: 0.x)` — not deprecated `withOpacity()`.
- **No Co-Authored-By**: never add `Co-Authored-By` lines to commits, PRs, or any git artifacts.
- **Commits**: create new commits only — never amend published commits.
