# Integration Test Commands

## Prerequisite: provision patrol

`patrol` is intentionally NOT a committed dependency. It weak-links `XCTest`, and
Flutter does not strip dev dependencies from iOS release builds
([flutter/flutter#163874](https://github.com/flutter/flutter/issues/163874)), so
shipping it makes the app reference `XCTest` and Apple rejects it (guideline 2.5.1).

Add it before running the commands below (the `tool/scripts/*` helpers do this
automatically):

```bash
flutter pub add 'dev:patrol:^4.6.1'
```

Do not commit the resulting `pubspec.yaml` / `pubspec.lock` change; restore them
when done (`git checkout pubspec.yaml pubspec.lock`).

## Run integration tests in dev mode

Run direct Patrol commands from the repository root:

```bash
patrol develop --dart-define-from-file=dart_define.json --dart-define-from-file=dart_define.integration_test.json
```

## Build integration tests

```bash
patrol build android/ios --dart-define-from-file=dart_define.json --dart-define-from-file=dart_define.integration_test.json
```

To specify a test file, use the `-t` option:

```bash
patrol build -t patrol_test/call_and_recent_test.dart ...
```

## Run the user repository refresh guards

The host integration suite needs neither Patrol nor a device:

```bash
fvm flutter test --no-pub test/repository/user_repository_integration_test.dart
```

For native persistence coverage, provision Patrol as described above and run
from the `phone/` directory using FVM. Ensure `android/local.properties` also
points `flutter.sdk` to the pinned SDK, because Patrol invokes Gradle directly.

Before running on a device whose app data must be retained, temporarily set
`testInstrumentationRunnerArguments clearPackageData: "false"` in
`android/app/build.gradle` and restore it afterwards. The default is `"true"`:
`--no-uninstall` alone does not stop Android Test Orchestrator from clearing data.

```bash
fvm exec patrol test \
  -t patrol_test/user_repository_refresh_test.dart \
  --device DEVICE_ID \
  --no-uninstall \
  --no-tree-shake-icons \
  --dart-define-from-file=dart_define.json
```

These focused tests use controlled HTTP responses with the real API client and
native preferences. No credentials, local Core, call companion or integration
environment file are needed. The previous `user-info` preference is restored
after each scenario. With the runner setting above, `--no-uninstall` also keeps
the existing installation and its unrelated data.
See [coverage and boundaries](integration_test_coverage.md#background-polling---user-repository-refresh).

## Run the polling guards

From the repository root, run the connectivity ordering, connect lifecycle, and
Contacts request-path guards separately:

```bash
patrol test -t patrol_test/connectivity_probe_ordering_test.dart \
  --no-tree-shake-icons \
  --dart-define-from-file=dart_define.json \
  --dart-define-from-file=dart_define.integration_test.json

patrol test -t patrol_test/polling_connect_invariant_test.dart \
  --no-tree-shake-icons \
  --dart-define-from-file=dart_define.json \
  --dart-define-from-file=dart_define.integration_test.json

patrol test -t patrol_test/contacts_worker_sync_e2e_test.dart \
  --no-tree-shake-icons \
  --dart-define-from-file=dart_define.json \
  --dart-define-from-file=dart_define.integration_test.json
```

All three guards disable and restore Wi-Fi and cellular service. On Android,
use a USB-connected device for these scenarios: disabling Wi-Fi also
disconnects a wireless ADB session before Patrol can restore the network. The
connectivity-ordering guard needs no account credentials; it constructs the
connectivity and polling services directly and uses the real platform stream.

The CDR pagination guard additionally requires a local Core on port 4000 and a
SIP adapter on port 3000 that exposes the `/debug/history` seed endpoint. The
example local-stack account is `555001` / `test123`. Set
`WEBTRIT_CDR_TEST_HOST` to the development machine's LAN address reachable from
the device, then run:

```bash
WEBTRIT_CDR_TEST_HOST=192.168.0.3

patrol test -t patrol_test/cdr_sync_pagination_e2e_test.dart \
  --no-tree-shake-icons \
  --dart-define-from-file=dart_define.json \
  --dart-define-from-file=dart_define.integration_test.json \
  --dart-define=WEBTRIT_APP_TEST_CUSTOM_CORE_URL=http://$WEBTRIT_CDR_TEST_HOST:4000 \
  --dart-define=WEBTRIT_APP_DEMO_CORE_URL=http://$WEBTRIT_CDR_TEST_HOST:4000 \
  --dart-define=WEBTRIT_APP_TEST_PASSWORD_USER_CREDENTIAL=555001 \
  --dart-define=WEBTRIT_APP_TEST_PASSWORD_PASSWORD_CREDENTIAL=test123 \
  --dart-define=WEBTRIT_APP_CDRS_REPOSITORY_POLLING_INTERVAL_SECONDS=300
```

The longer CDR interval isolates the pull-driven request window from the next
automatic tick. The scenario still uses the app-owned polling registration;
only its periodic test cadence changes.

## Deploy to Firebase Test Lab

Run from the `tool/scripts` directory:

```bash
./testlab_assemble_android.sh <testfile(optional)>
./testlab_assemble_ios.sh <testfile(optional)>
```

## Run Android integration tests locally with call companion

Starts the [pjsua Companion](../packages/pjsua_companion/README.md) server automatically and runs the tests:

```bash
./tool/scripts/patrol_e2e_run_local_android.sh <testfile(optional)>
```
