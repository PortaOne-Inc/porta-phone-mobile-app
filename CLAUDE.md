# PortaPhone mobile app — Claude Code

@AGENTS.md

## Gotchas

- **The repository root is here**, not in `phone/`. Anything that resolves paths
  from the git root - hooks, lefthook, the scripts under `tool/` - is configured
  at this level, and a copy inside a package is read by nothing.
- **Each package still owns its own rules.** `phone/CLAUDE.md`,
  `callkeep/CLAUDE.md` and `tools/CLAUDE.md` load when you work in those
  directories; nothing here replaces them.
- **`callkeep/` and `analysis/` are mirrored to GitHub**, so their `.github/`
  workflows stay where they are - a workflow only runs from the root of the
  repository it is mirrored into.
- **Commits**: create new commits; a published one is never amended.
