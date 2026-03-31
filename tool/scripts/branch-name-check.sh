#!/bin/bash
set -euo pipefail

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "🔍 Current branch: $BRANCH"

# Allow protected long-lived branches
if [[ "$BRANCH" =~ ^(main|master|develop)$ ]]; then
  echo "✅ Protected branch — skipping name check."
  exit 0
fi

if ! [[ "$BRANCH" =~ ^(feature|feat|refactor|fix|chore|build|style|docs|release|webtrit-phone)/.+$ ]]; then
  echo "❌ Invalid branch name: '$BRANCH'"
  echo "💡 Use: feature/name, fix/bug-name, release/1.0.0, webtrit-phone/1.14.0, etc."
  exit 1
fi

echo "✅ Branch name OK."
