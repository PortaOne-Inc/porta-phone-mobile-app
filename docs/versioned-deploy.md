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

| Track              | Branch                    | URL                                            | Purpose                                            |
|--------------------|---------------------------|------------------------------------------------|----------------------------------------------------|
| Active development | `develop`                 | —                                              | New features, works with `webtrit-phone` `develop` |
| Versioned release  | `webtrit-phone/<version>` | `https://phone-configurator-<version>.web.app` | Frozen build pinned to a specific phone version    |

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

## How the deploy script works

`tool/deploy_hosting.sh` derives the Firebase site name from the version:

```
webtrit-phone/1.13.1  →  phone-configurator-1-13-1
```

On each run it:

1. Creates the Firebase Hosting site if it does not exist yet.
2. Binds the `backend-version` target to that site.
3. Builds the Flutter web app (`launcher/prod.env.json`).
4. Deploys to the site.

---

## Deploying a new version

### From a versioned branch (version auto-detected)

```bash
git checkout webtrit-phone/1.14.0
melos run deploy:version
```

### From any branch with a manual version

```bash
# dots or dashes both accepted
melos run deploy:version -- 1-14-0
melos run deploy:version -- 1.14.0
```

### Directly via the script

```bash
./tool/deploy_hosting.sh           # auto — must be on webtrit-phone/<version>
./tool/deploy_hosting.sh 1-14-0   # manual override
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
      "rewrites": [
        {
          "source": "**",
          "destination": "/index.html"
        }
      ]
    }
  ]
}
```

The `target` value `backend-version` is a logical alias that the script
re-binds to the correct site on each deploy via `firebase target:apply`.

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

## Listing all deployed sites

```bash
firebase hosting:sites:list
```
