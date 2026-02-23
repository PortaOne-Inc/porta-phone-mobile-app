# Webtrit configurator


## Components
* `Cloud databse` (_**Firestore**_)
* `Cloud storage` (_**Firebase storage**_)
* `REST` (_**HTTP Cloud functions**_)

## Firebase CORS

1.  Install https://formulae.brew.sh/cask/google-cloud-sdk
2.  In root of flutter project create a file called cors.json and add this json file which will remove all domain restrictions.
    ``[
    {
    "origin": ["*"],
    "method": ["GET"],
    "maxAgeSeconds": 3600
    }
    ]``
3. Run gcloud init (located in google-cloud-sdk/bin
4. Authenticate yourself by clicking the link and choose the project in the console.
5. Finally execute gsutil cors set cors.json gs://<your-bucket-name>.appspot.com You can find your bucket name in firebase storage.
   `` gsutil cors set cors.json gs://webtrit-configurator-stage.appspot.com
   ``


## Build variables

* `ENV` (_default **prod**_)

Env parameters:
- prod:
    - `host` (_default **https://us-central1-webtrit-configurator.cloudfunctions.net/api/v1**_)
    - `auth` (_default **Firebase auth**_)
- dev:
    - `host` (_default **http://127.0.0.1:7981/webtrit-configurator/us-central1/api/v1**_)
    - `auth` (_**Emulator**_)
        - ip  (_default **127.0.0.1**_)
        - port  (_default**7980**_)

## Melos (monorepo tooling)

The project uses [Melos](https://melos.invertase.dev/) to manage the multi-package workspace (`packages/domain`, `packages/data`, and the root app).

### Prerequisites

```bash
dart pub global activate melos
```

### Available commands

| Command | Description |
|---|---|
| `melos run generate` | Run `build_runner` code generation across all packages |
| `melos run generate:watch` | Run `build_runner` in watch mode (use `--scope` to target a package) |
| `melos run analyze` | Run `dart analyze` across all packages |
| `melos run format` | Auto-fix formatting in all packages |
| `melos run format:check` | Check formatting without modifying files |
| `melos run test` | Run tests in all packages that have a `test/` directory |
| `melos run test:coverage` | Run tests with coverage |
| `melos run clean` | `flutter clean` in all packages |
| `melos run deps:get` | `flutter pub get` in all packages |

### Useful flags

```bash
# Target a specific package
melos run generate --scope=domain

# List all workspace packages
melos list
```

## Build
    flutter build web --output firebase/public

## Debug

Env parameter for ignore cors on localhost

```
--web-browser-flag "--disable-web-security"
```
