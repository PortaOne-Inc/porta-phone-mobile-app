#!/usr/bin/env bash
# PreToolUse hook: block reading, writing or shelling out to a secret file.
#
# One guard for the whole repository, from two that used to sit in phone/ and
# callkeep/. The callkeep one exited 1, which prints a message and lets the tool
# run - only exit 2 refuses - so of the two only one ever blocked anything. This
# keeps the wider pattern list from that one and the working exit code and shell
# scanning from the other.
INPUT=$(cat)
TOOL=$(jq -r '(.tool // .tool_name // "")' <<< "$INPUT")
COMMAND=$(jq -r '.tool_input.command // ""' <<< "$INPUT")
FILE=$(jq -r '(.tool_input.file_path // .tool_input.path // "")' <<< "$INPUT")

SECRET='\.(env($|\.)|jks|keystore|p12|pem|key|p8)'

if [[ "$TOOL" == "Bash" || "$TOOL" == "Run" ]]; then
  if grep -qE '\b(cat|less|more|head|tail|bat|view|nano|vi|vim|code|open|type|strings|xxd|hexdump|od|base64)\b' <<< "$COMMAND" \
  && grep -qE "$SECRET" <<< "$COMMAND"; then
    echo "BLOCKED: reads a secret file - credentials must not be read by the agent." >&2
    exit 2
  fi
  if grep -qE '\b(cp|mv|scp|rsync|tar|zip)\b' <<< "$COMMAND" && grep -qE "$SECRET" <<< "$COMMAND"; then
    echo "BLOCKED: copies a secret file - credentials must not be transferred." >&2
    exit 2
  fi
  if grep -qE '\b(find|grep|rg|ag|fd)\b' <<< "$COMMAND" && grep -qE "$SECRET" <<< "$COMMAND"; then
    echo "BLOCKED: searches for secret files - credential files must not be scanned." >&2
    exit 2
  fi
fi

if [[ "$TOOL" =~ ^(Read|View|Edit|Write|MultiEdit)$ ]] && grep -qE "$SECRET" <<< "$FILE"; then
  echo "BLOCKED: cannot access '$FILE' - it is a secret file." >&2
  exit 2
fi

exit 0
