# Versioned Firebase Hosting Deploy

## Versioning concept

The configurator and the WebTrit Phone app are versioned together.
Each phone release gets a dedicated, permanently available configurator URL
so that operators can always configure the exact version they have deployed —
without the risk of a newer configurator breaking an older phone build.

```
develop branch  →  active development, always targets webtrit-phone/develop
1.13.1 release  →  https://phone-configurator-1-13-1.web.app  (frozen, backward-compatible)
1.14.0 release  →  https://phone-configurator-1-14-0.web.app  (frozen, backward-compatible)
```

### Two parallel tracks

| Track              | Branch                    | URL                                               | Purpose                                            |
|--------------------|---------------------------|---------------------------------------------------|----------------------------------------------------|
| Active development | `develop`                 | `https://phone-configurator-develop.web.app`      | New features, works with `webtrit-phone` `develop` |
| Versioned release  | `webtrit-phone/<version>` | `https://phone-configurator-<version>.web.app`    | Frozen build pinned to a specific phone version    |

All deployed URLs are listed on the versions index page:
**`https://phone-configurator-versions.web.app`**

### Why a separate branch per version?

When a new phone version ships (e.g. `1.14.0`) its theme schema or feature flags
may differ from `develop`. A configurator built from `develop` at that moment
would work correctly. But as `develop` moves forward it can introduce changes
that are incompatible with the `1.14.0` phone build.

Cutting a `webtrit-phone/1.14.0` branch from `develop` at release time freezes
the configurator source that is known to work with that phone version.
The deployed URL stays stable and backward-compatible indefinitely.

### Lifecycle of a new phone version

```
develop ──────────────────────────────────────────► (ongoing)
         │
         │  phone 1.14.0 released
         ▼
  webtrit-phone/1.14.0  →  deploy  →  phone-configurator-1-14-0.web.app
         │
         │  version-specific fixes only (no new features)
         ▼
  stays frozen, always compatible with phone 1.14.0
```

---

## Deploy scripts

### `tool/deploy_hosting.sh` — deploy a versioned release or develop

Derives the Firebase site name from the version:

```
webtrit-phone/1.13.1  →  phone-configurator-1-13-1
develop argument      →  phone-configurator-develop
```

On each run it:

1. Creates the Firebase Hosting site if it does not exist yet.
2. Binds the `backend-version` target to that site.
3. Builds the Flutter web app (`launcher/prod.env.json`).
4. Deploys to the site.
5. Calls `tool/update_versions_index.sh` to refresh the index page.

### `tool/update_versions_index.sh` — regenerate the versions index

Queries `firebase hosting:sites:list`, deduplicates the results (each site
appears twice in CLI output — in the ID column and in the URL column), then
builds an HTML page listing all `phone-configurator-*` sites:

- `develop` pinned to the top with a **latest** badge
- versioned releases sorted newest → oldest

Deploys the result to `phone-configurator-versions`.
Can be called independently to refresh the index without a full deploy.

---

## Melos commands

| Command                              | What it does                                                          |
|--------------------------------------|-----------------------------------------------------------------------|
| `melos run deploy:version`           | Deploy versioned release (auto from branch, or pass version manually) |
| `melos run deploy:develop`           | Deploy `develop` build to `phone-configurator-develop.web.app`        |
| `melos run deploy:versions-index`    | Regenerate and deploy the versions index page only                    |

---

## Deploying

### develop build

```bash
melos run deploy:develop
# → https://phone-configurator-develop.web.app
```

### versioned release — from the versioned branch (auto-detected)

```bash
git checkout webtrit-phone/1.14.0
melos run deploy:version
# → https://phone-configurator-1-14-0.web.app
```

### versioned release — manual override from any branch

```bash
# dots or dashes both accepted
melos run deploy:version -- 1-14-0
melos run deploy:version -- 1.14.0
```

### refresh index only (without a new deploy)

```bash
melos run deploy:versions-index
# → https://phone-configurator-versions.web.app
```

---

## Prerequisites

| Requirement  | How to satisfy                  |
|--------------|---------------------------------|
| Firebase CLI | `npm install -g firebase-tools` |
| CLI auth     | `firebase login`                |
| Flutter SDK  | must be on `PATH`               |

---

## `firebase.json` structure

The hosting config uses the array form to support multiple named targets:

```json
{
  "hosting": [
    {
      "target": "backend-version",
      "public": "build/web",
      "rewrites": [{ "source": "**", "destination": "/index.html" }]
    },
    {
      "target": "versions-index",
      "public": "tool/versions_index",
      "rewrites": [{ "source": "**", "destination": "/index.html" }]
    }
  ]
}
```

`tool/versions_index/` is a generated directory (gitignored) — produced by
`update_versions_index.sh` before each deploy.

Each `target` is a logical alias re-bound to the correct Firebase site on
every deploy via `firebase target:apply`.

---

## `.firebaserc`

After `firebase target:apply` the CLI writes the binding into `.firebaserc`.
Commit this file so that the current target is preserved for CI and teammates.

Example state after deploying `1.13.1`:

```json
{
  "projects": {
    "default": "webtrit-configurator"
  },
  "targets": {
    "webtrit-configurator": {
      "hosting": {
        "backend-version": [
          "phone-configurator-1-13-1"
        ]
      }
    }
  }
}
```

---

## Releasing a new version — checklist

1. Ensure `develop` is stable and compatible with the target phone version.
2. Create branch `webtrit-phone/<version>` from `develop` (e.g. `webtrit-phone/1.14.0`).
3. Run `melos run deploy:version` from that branch (or pass the version manually).
4. Verify the live URL: `https://phone-configurator-<version>.web.app`.
5. Commit the updated `.firebaserc` back to the versioned branch.
6. Apply any version-specific hotfixes directly to `webtrit-phone/<version>` — do **not** merge back
   to `develop`.

---

## Versions index page

All deployed builds are listed at:
**`https://phone-configurator-versions.web.app`**

The page is regenerated automatically after every `deploy:version` or
`deploy:develop` run. To refresh it manually without a new deploy:

```bash
melos run deploy:versions-index
```

To see the raw list of Firebase Hosting sites:

```bash
firebase hosting:sites:list
```
