#!/usr/bin/env bash
# PostToolUse hook: auto-format .dart files after Write/Edit/MultiEdit.
# Generated files are skipped - they are rewritten by build_runner and pigeon,
# and formatting them only produces a diff the next generation throws away.
INPUT=$(cat)
FILE=$(jq -r '(.tool_input.file_path // .tool_input.path // "")' <<< "$INPUT")

[[ -z "$FILE" || ! -f "$FILE" ]] && exit 0
[[ "$FILE" != *.dart ]] && exit 0
[[ "$FILE" == *.g.dart || "$FILE" == *.freezed.dart || "$FILE" == *.gr.dart || "$FILE" == *.pigeon.dart ]] && exit 0

# No line length here on purpose: each package declares its own page_width in
# analysis_options.yaml, and dart format resolves it per file.
ROOT=$(git rev-parse --show-toplevel 2>/dev/null) && cd "$ROOT"
dart format "$FILE"
