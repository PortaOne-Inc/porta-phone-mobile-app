#!/usr/bin/env bash
# Deploy Flutter web app to a Firebase Hosting site derived from a version tag.
#
# When run from a versioned branch the version is resolved automatically:
#   Branch format:  webtrit-phone/<semver>  (e.g. webtrit-phone/1.13.1)
#   Site name:      phone-configurator-<semver with dots replaced by dashes>
#                   (e.g. phone-configurator-1-13-1)
#   Site URL:       https://phone-configurator-1-13-1.web.app
#
# Usage (auto — must be on a webtrit-phone/<version> branch):
#   ./tool/deploy_hosting.sh
#
# Usage (manual override — works from any branch, including develop):
#   ./tool/deploy_hosting.sh <version>   (e.g. 1-13-1  or  1.13.1)
#
# The script:
#   1. Resolves version from current branch or argument
#   2. Creates the Firebase Hosting site if it does not exist yet
#   3. Applies the Firebase hosting target
#   4. Builds the Flutter web app (release, prod env)
#   5. Deploys to the corresponding Firebase Hosting site
#
# Prerequisites:
#   - Firebase CLI installed and authenticated (firebase login)
#   - Flutter SDK on PATH

set -euo pipefail

# ─── Resolve version ──────────────────────────────────────────────────────────

if [[ $# -ge 1 ]]; then
  # Manual override — normalise dots to dashes for Firebase site ID
  VERSION="${1//./-}"
else
  # Auto-detect from branch: webtrit-phone/1.13.1 → 1-13-1
  BRANCH=$(git rev-parse --abbrev-ref HEAD)

  if [[ ! "$BRANCH" =~ ^webtrit-phone/(.+)$ ]]; then
    echo "Error: current branch '${BRANCH}' does not match 'webtrit-phone/<version>'." >&2
    echo "Either switch to a versioned branch or pass the version manually:" >&2
    echo "  $0 <version>  (e.g. 1-13-1 or 1.13.1)" >&2
    exit 1
  fi

  VERSION="${BASH_REMATCH[1]//./-}"
fi

# Allow only lowercase alphanumeric + hyphens (Firebase site ID rules)
VERSION_LOWER=$(echo "${VERSION}" | tr '[:upper:]' '[:lower:]')
if [[ ! "$VERSION_LOWER" =~ ^[a-z0-9]([a-z0-9-]*[a-z0-9])?$ ]]; then
  echo "Error: resolved version '${VERSION_LOWER}' is not a valid Firebase site ID segment." >&2
  echo "Allowed: lowercase letters, digits, hyphens (e.g. 1-13-1)." >&2
  exit 1
fi

SITE_NAME="phone-configurator-${VERSION_LOWER}"
TARGET="backend-version"

echo "==> Branch    : $(git rev-parse --abbrev-ref HEAD)"
echo "==> Version   : ${VERSION_LOWER}"
echo "==> Site name : ${SITE_NAME}"
echo "==> Target    : ${TARGET}"
echo ""

# ─── Ensure site exists ───────────────────────────────────────────────────────

echo "==> Ensuring Firebase Hosting site '${SITE_NAME}' exists..."
firebase hosting:sites:create "${SITE_NAME}" --non-interactive 2>&1 || true

# ─── Apply hosting target ─────────────────────────────────────────────────────

echo ""
echo "==> Applying Firebase hosting target..."
firebase target:clear hosting "${TARGET}" 2>&1 || true
firebase target:apply hosting "${TARGET}" "${SITE_NAME}"

# ─── Build Flutter web ────────────────────────────────────────────────────────

echo ""
echo "==> Building Flutter web (release, prod)..."
flutter build web --dart-define-from-file=launcher/prod.env.json --no-tree-shake-icons

# ─── Deploy ───────────────────────────────────────────────────────────────────

echo ""
echo "==> Deploying to Firebase Hosting site: ${SITE_NAME}..."
firebase deploy --only "hosting:${TARGET}"

echo ""
echo "==> Done. Site live at: https://${SITE_NAME}.web.app"

# ─── Refresh versions index ───────────────────────────────────────────────────

echo ""
echo "==> Refreshing versions index..."
"$(dirname "$0")/update_versions_index.sh"
