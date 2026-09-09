#!/usr/bin/env bash
# Checks the commit messages a push would publish.
#
# The rules are the department's, not this repository's:
# https://wiki.portaone.com/pages/viewpage.action?pageId=302270444
#
#   <TICKET-ID> <Capitalised summary>     50 characters or fewer, no full stop
#   <blank line>
#   Body explaining why, wrapped at 72.
#   Change-Id: I...                       written by Gerrit's own commit-msg hook
#
# The test for a subject: after removing the ticket id and lowering the first
# letter, "If applied, this commit will <subject>" has to read as English.
#
# This runs at pre-push rather than commit-msg on purpose. commit-msg belongs to
# Gerrit - it is where the Change-Id trailer comes from - and `lefthook install`
# moves aside any hook it claims without ever calling it, so taking that hook
# over would stop Change-Id being written and Gerrit would refuse every push.
# Here the whole series is visible and a bad subject can still be amended.
#
# Usage: commit-subject-check.sh [<range>]

set -uo pipefail

RANGE="${1:-}"
if [[ -z "$RANGE" ]]; then
  if upstream=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null); then
    RANGE="${upstream}..HEAD"
  elif git rev-parse --verify -q origin/master >/dev/null; then
    # The ordinary case here: a Gerrit topic branch tracks nothing, because a
    # push goes to refs/for/master rather than to a branch of its own.
    RANGE="origin/master..HEAD"
  else
    echo "commit-subject-check: no upstream and no origin/master, nothing to check."
    exit 0
  fi
fi

if ! commits=$(git rev-list --no-merges "$RANGE" 2>/dev/null); then
  echo "commit-subject-check: cannot read the range '$RANGE'." >&2
  exit 1
fi

if [[ -z "$commits" ]]; then
  echo "commit-subject-check: no commits in $RANGE."
  exit 0
fi

failed=0

for sha in $commits; do
  subject=$(git log -1 --format=%s "$sha")
  message=$(git log -1 --format=%B "$sha")
  problems=()

  if [[ ! "$subject" =~ ^[A-Z][A-Z0-9]*-[0-9]+\  ]]; then
    problems+=("the ticket id has to come first, as in 'WT-1234 Add the thing'")
  elif [[ ! "$subject" =~ ^[A-Z][A-Z0-9]*-[0-9]+\ [A-Z] ]]; then
    problems+=("the word after the ticket id is capitalised")
  fi

  if (( ${#subject} > 50 )); then
    problems+=("the subject is ${#subject} characters; 50 is the limit")
  fi

  if [[ "$subject" == *. ]]; then
    problems+=("the subject does not end in a full stop")
  fi

  # A conventional-commits type is the shape this repository used before it moved
  # to Gerrit, and it is still the first thing habit produces.
  if [[ "$subject" =~ ^(feat|fix|chore|refactor|test|docs|style|ci|perf|build|revert)(\(.+\))?: ]]; then
    problems+=("conventional-commits types are not used here; lead with the ticket id")
  fi

  if ! grep -q '^Change-Id: I[0-9a-f]\{40\}$' <<<"$message"; then
    problems+=("no Change-Id trailer - install Gerrit's commit-msg hook, then amend")
  fi

  if ! perl -CS -ne 'exit 1 if /\p{Cyrillic}/' <<<"$message"; then
    problems+=("the message contains Cyrillic; commit messages are English")
  fi

  if grep -qEi 'co-authored-by:.*(claude|chatgpt|gpt|copilot)|generated with|🤖' <<<"$message"; then
    problems+=("no AI attribution in commit messages")
  fi

  # The body is wrapped at 72. A line with no space in it cannot be wrapped -
  # a URL, a path, a stack frame - so it is left alone.
  while IFS= read -r line; do
    [[ "$line" =~ ^[A-Za-z-]+:\  ]] && continue
    [[ "$line" != *" "* ]] && continue
    (( ${#line} > 72 )) && problems+=("a body line is ${#line} characters; 72 is the limit")
  done < <(tail -n +3 <<<"$message")

  if (( ${#problems[@]} > 0 )); then
    failed=1
    echo
    echo "$(git log -1 --format='%h' "$sha") $subject"
    printf '  - %s\n' "${problems[@]}"
  fi
done

if (( failed )); then
  echo
  echo "Fix with 'git commit --amend' (or 'git rebase -i' for an earlier commit)."
  exit 1
fi

echo "commit-subject-check: $(wc -l <<<"$commits" | tr -d ' ') commit(s) in $RANGE are well formed."
