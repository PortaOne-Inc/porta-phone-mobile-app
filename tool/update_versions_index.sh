#!/usr/bin/env bash
# Generates an HTML index page listing all versioned configurator deployments
# (including the develop build) and deploys it to the versions index site.
#
# Index site:  phone-configurator-versions
# Index URL:   https://phone-configurator-versions.web.app
#
# Called automatically by deploy_hosting.sh after each version deploy,
# or run manually to refresh the index:
#   ./tool/update_versions_index.sh
#
# Prerequisites:
#   - Firebase CLI installed and authenticated (firebase login)

set -euo pipefail

INDEX_SITE="phone-configurator-versions"
INDEX_TARGET="versions-index"
DEVELOP_SITE="phone-configurator-develop"
OUT_DIR="tool/versions_index"

mkdir -p "${OUT_DIR}"

# ─── Fetch all deployed configurator sites ────────────────────────────────────

echo "==> Fetching deployed configurator sites..."
RAW=$(firebase hosting:sites:list 2>/dev/null || true)

# Extract site IDs matching phone-configurator-* (skip index and develop — handled separately)
VERSIONS=$(echo "$RAW" \
  | grep -oE 'phone-configurator-[a-z0-9][a-z0-9-]+' \
  | sort -u \
  | grep -v "^phone-configurator-versions$" \
  | grep -v "^phone-configurator-develop$" \
  | python3 -c "
import sys, re
lines = [l.strip() for l in sys.stdin if l.strip()]
def key(v):
    parts = re.sub(r'[^0-9-]', '', v.replace('phone-configurator-', '')).split('-')
    return [int(x) if x.isdigit() else 0 for x in parts if x]
lines.sort(key=key, reverse=True)
print('\n'.join(lines))
" 2>/dev/null \
  || echo "$RAW" | grep -oE 'phone-configurator-[0-9][a-z0-9-]+' | sort -r)

DEVELOP_EXISTS=$(echo "$RAW" | grep -c "phone-configurator-develop" || true)

# ─── Build HTML rows ──────────────────────────────────────────────────────────

ROWS=""

# develop row — always at the top if the site exists
if [[ "${DEVELOP_EXISTS}" -gt 0 ]]; then
  ROWS+="      <tr class=\"develop\">"
  ROWS+="<td><code>develop</code><span class=\"badge\">latest</span></td>"
  ROWS+="<td><a href=\"https://${DEVELOP_SITE}.web.app\" target=\"_blank\" rel=\"noopener\">https://${DEVELOP_SITE}.web.app</a></td>"
  ROWS+="</tr>\n"
fi

# versioned release rows
while IFS= read -r site; do
  [[ -z "$site" ]] && continue
  version="${site#phone-configurator-}"
  url="https://${site}.web.app"
  ROWS+="      <tr>"
  ROWS+="<td><code>${version}</code></td>"
  ROWS+="<td><a href=\"${url}\" target=\"_blank\" rel=\"noopener\">${url}</a></td>"
  ROWS+="</tr>\n"
done <<< "$VERSIONS"

if [[ -z "$ROWS" ]]; then
  ROWS="      <tr><td colspan=\"2\" style=\"text-align:center;color:#9ca3af;\">No versions deployed yet.</td></tr>\n"
fi

VERSION_COUNT=$(echo "$VERSIONS" | grep -c . 2>/dev/null || echo 0)
echo "==> Found ${VERSION_COUNT} versioned release(s)$([ "${DEVELOP_EXISTS}" -gt 0 ] && echo ' + develop' || true)"

# ─── Generate HTML ────────────────────────────────────────────────────────────

GENERATED_AT=$(date -u '+%Y-%m-%d %H:%M UTC')

cat > "${OUT_DIR}/index.html" << HTMLEOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>WebTrit Phone Configurator — Versions</title>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      background: #f5f7fa;
      color: #1a1a2e;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 48px 16px;
    }
    header { text-align: center; margin-bottom: 40px; }
    header h1 { font-size: 1.75rem; font-weight: 700; }
    header p { margin-top: 8px; color: #6b7280; font-size: 0.95rem; }
    .card {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 1px 4px rgba(0,0,0,.08), 0 4px 16px rgba(0,0,0,.06);
      width: 100%;
      max-width: 760px;
      overflow: hidden;
    }
    table { width: 100%; border-collapse: collapse; }
    thead th {
      background: #1a1a2e;
      color: #fff;
      text-align: left;
      padding: 14px 20px;
      font-size: 0.8rem;
      text-transform: uppercase;
      letter-spacing: .06em;
    }
    tbody tr:not(:last-child) { border-bottom: 1px solid #f0f0f0; }
    tbody tr:hover { background: #f9fafb; }
    tbody tr.develop { background: #f0fdf4; }
    tbody tr.develop:hover { background: #dcfce7; }
    tbody td { padding: 14px 20px; font-size: 0.95rem; }
    tbody td:first-child { width: 200px; white-space: nowrap; }
    code {
      background: #eef2ff;
      color: #4338ca;
      padding: 2px 8px;
      border-radius: 4px;
      font-size: 0.88rem;
    }
    .develop code { background: #dcfce7; color: #166534; }
    .badge {
      display: inline-block;
      margin-left: 8px;
      background: #16a34a;
      color: #fff;
      font-size: 0.7rem;
      font-weight: 600;
      padding: 1px 7px;
      border-radius: 99px;
      vertical-align: middle;
      text-transform: uppercase;
      letter-spacing: .04em;
    }
    a { color: #2563eb; text-decoration: none; }
    a:hover { text-decoration: underline; }
    footer { margin-top: 24px; color: #9ca3af; font-size: 0.8rem; }
  </style>
</head>
<body>
  <header>
    <h1>WebTrit Phone Configurator</h1>
    <p>Each URL is pinned to a specific phone release and remains backward-compatible.</p>
  </header>
  <div class="card">
    <table>
      <thead>
        <tr>
          <th>Version</th>
          <th>URL</th>
        </tr>
      </thead>
      <tbody>
$(printf "${ROWS}")
      </tbody>
    </table>
  </div>
  <footer>Updated: ${GENERATED_AT}</footer>
</body>
</html>
HTMLEOF

echo "==> Generated ${OUT_DIR}/index.html"

# ─── Ensure index site exists ─────────────────────────────────────────────────

echo ""
echo "==> Ensuring Firebase Hosting site '${INDEX_SITE}' exists..."
firebase hosting:sites:create "${INDEX_SITE}" --non-interactive 2>&1 || true

# ─── Apply target and deploy ──────────────────────────────────────────────────

echo ""
echo "==> Applying Firebase hosting target..."
firebase target:clear hosting "${INDEX_TARGET}" 2>&1 || true
firebase target:apply hosting "${INDEX_TARGET}" "${INDEX_SITE}"

echo ""
echo "==> Deploying versions index..."
firebase deploy --only "hosting:${INDEX_TARGET}"

echo ""
echo "==> Index live at: https://${INDEX_SITE}.web.app"
