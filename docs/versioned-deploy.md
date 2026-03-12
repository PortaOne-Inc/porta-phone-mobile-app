# Versioned Firebase Hosting Deploy

Each WebTrit Phone version gets its own stable Firebase Hosting URL so that the
configurator can be used against a specific backend build without touching the
production site.

```
https://phone-configurator-1-13-1.web.app   ← webtrit-phone 1.13.1
https://phone-configurator-1-14-0.web.app   ← webtrit-phone 1.14.0
```

## How it works

The script `tool/deploy_hosting.sh` derives the Firebase site name from a version:

```
webtrit-phone/1.13.1  →  phone-configurator-1-13-1
```

On each run it:

1. Creates the Firebase Hosting site if it does not exist yet.
2. Binds the `backend-version` target to that site.
3. Builds the Flutter web app (`launcher/prod.env.json`).
4. Deploys to the site.

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

## Prerequisites

| Requirement | How to satisfy |
|---|---|
| Firebase CLI | `npm install -g firebase-tools` |
| CLI auth | `firebase login` |
| Flutter SDK | must be on `PATH` |

## `firebase.json` structure

The hosting config uses the array form to support multiple named targets:

```json
{
  "hosting": [
    {
      "target": "backend-version",
      "public": "build/web",
      "rewrites": [{ "source": "**", "destination": "/index.html" }]
    }
  ]
}
```

The `target` value `backend-version` is a logical alias that the script
re-binds to the correct site on each deploy via `firebase target:apply`.

## `.firebaserc`

After `firebase target:apply` the CLI writes the binding into `.firebaserc`.
Commit this file so that the current target is preserved for CI and teammates.

Example state after deploying `1.13.1`:

```json
{
  "projects": { "default": "webtrit-configurator" },
  "targets": {
    "webtrit-configurator": {
      "hosting": {
        "backend-version": ["phone-configurator-1-13-1"]
      }
    }
  }
}
```

## Adding a new version — checklist

1. Create branch `webtrit-phone/<version>` (e.g. `webtrit-phone/1.14.0`).
2. Apply any version-specific fixes on that branch.
3. Run `melos run deploy:version` (or pass the version manually from `develop`).
4. Verify the live URL: `https://phone-configurator-<version>.web.app`.
5. Commit the updated `.firebaserc`.

## Listing all deployed sites

```bash
firebase hosting:sites:list
```
