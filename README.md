# webtrit_configurator

Flutter web app for configuring WebTrit phone themes, features, and appearance. Managed
with [Melos](https://melos.invertase.dev/).

## Project structure

```
webtrit_phone_configurator/       # root Flutter app
├── lib/
│   ├── app/                      # application root
│   ├── core/                     # cross-cutting concerns
│   ├── di/                       # dependency injection
│   ├── features/                 # feature modules
│   ├── localization/             # translations (intl)
│   └── widgets/                  # reusable UI components
├── packages/
│   ├── domain/                   # domain models, entities, repository interfaces
│   └── data/                     # repositories, API client (Dio), Firebase, local storage
└── assets/
    ├── themes/                   # theme configuration files
    ├── scheme/                   # color scheme configs
    └── environment/              # environment configs (dart_define)
```

## Quick start

```bash
# install melos (one-time)
dart pub global activate melos

# get dependencies
flutter pub get

# run code generation
melos run generate

# run the app
flutter run -d chrome
```

## Melos scripts

| Command                       | Description                                                          |
|-------------------------------|----------------------------------------------------------------------|
| `melos run generate`          | Run `build_runner` code generation across all packages               |
| `melos run generate:watch`    | Run `build_runner` in watch mode                                     |
| `melos run analyze`           | Run `dart analyze` across all packages                               |
| `melos run format`            | Auto-fix formatting in all packages                                  |
| `melos run format:check`      | Check formatting without modifying files (for CI)                    |
| `melos run test`              | Run tests in all packages with a `test/` directory                   |
| `melos run test:coverage`     | Run tests with coverage                                              |
| `melos run clean`             | `flutter clean` in all packages                                      |
| `melos run deps:get`          | `flutter pub get` in all packages                                    |
| `melos run deploy:version`         | Deploy versioned release to `phone-configurator-<version>.web.app` (see [docs/versioned-deploy.md](docs/versioned-deploy.md)) |
| `melos run deploy:develop`         | Deploy `develop` build to `phone-configurator-develop.web.app`                                                               |
| `melos run deploy:versions-index`  | Regenerate the versions index at `phone-configurator-versions.web.app`                                                       |

### Useful flags

```bash
# target a specific package
melos run generate --scope=domain

# list all workspace packages
melos list
```

## Components

* **Cloud database** — Firestore
* **Cloud storage** — Firebase Storage
* **REST API** — HTTP Cloud Functions

## Build variables

* `ENV` (default: **prod**)

| Environment | Host                                                                 | Auth                        |
|-------------|----------------------------------------------------------------------|-----------------------------|
| `prod`      | `https://us-central1-webtrit-configurator.cloudfunctions.net/api/v1` | Firebase Auth               |
| `dev`       | `http://127.0.0.1:7981/webtrit-configurator/us-central1/api/v1`      | Emulator (`127.0.0.1:7980`) |

## Build

```bash
flutter build web --output firebase/public
```

## Debug

Disable CORS on localhost:

```bash
flutter run --web-browser-flag "--disable-web-security"
```

## Firebase CORS

1. Install [Google Cloud SDK](https://formulae.brew.sh/cask/google-cloud-sdk)
2. Create `cors.json` in the project root:
   ```json
   [
     {
       "origin": ["*"],
       "method": ["GET"],
       "maxAgeSeconds": 3600
     }
   ]
   ```
3. Run `gcloud init` and authenticate
4. Apply CORS config:
   ```bash
   gsutil cors set cors.json gs://<your-bucket-name>.appspot.com
   ```
