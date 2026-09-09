#!/usr/bin/env bash
# PostToolUse hook: runs markdownlint-cli2 --fix on .md files after Write/Edit.
INPUT=$(cat)
FILE=$(jq -r '(.tool_input.file_path // .tool_input.path // "")' <<< "$INPUT")

[[ -z "$FILE" || "$FILE" != *.md ]] && exit 0
[[ -f "$FILE" ]] || exit 0

# Run from the file's own directory rather than the repository root, so the
# nearest .markdownlint-cli2.jsonc wins. callkeep carries one and lefthook lints
# its markdown against it; a run from the root would find no config and the two
# would disagree about the same file.
cd "$(dirname "$FILE")" || exit 0
npx --yes markdownlint-cli2 --fix "$(basename "$FILE")" >/dev/null 2>&1
exit 0
