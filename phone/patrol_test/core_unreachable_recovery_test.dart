import 'package:patrol/patrol.dart';

import 'package:webtrit_phone/bootstrap.dart';
import 'package:webtrit_phone/data/app_preferences.dart';
import 'package:webtrit_phone/data/secure_storage.dart';
import 'package:webtrit_phone/features/login/view/login_mode_select_screen.dart';

import 'subsequences/pump_root_and_wait_until_visible.dart';

/// The state a storage move leaves behind, on a device: the session survives,
/// the system-info cache does not, and the core it points at does not answer.
///
/// The app used to sit on a white screen here - the main shell guard cannot
/// build without system info and routes to login, the login guard sees a
/// logged-in session and routes straight back - so it swapped routes forever
/// and built neither screen. This drives the real navigator, which is the part
/// no host test can stand in for: `replaceAll` returning is not the same thing
/// as a screen being on the display.
///
/// DESTRUCTIVE: the scenario ends the session on purpose, so it signs the
/// device out and clears local application data. Run it on a device whose
/// session you are willing to lose, and expect to sign in again afterwards.
void main() {
  patrolTest('an unreachable core with no cached system info ends at login, not on a white screen', ($) async {
    final preferences = await AppPreferencesImpl.init();
    final secureStorage = await SecureStorageImpl.init();

    // Nothing listens on port 1, so every request is refused at once - the
    // same transport failure as a core that has been shut down, without
    // needing one to shut down.
    await preferences.removeSystemInfo();
    await secureStorage.writeCoreUrl('http://127.0.0.1:1');
    await secureStorage.writeTenantId('');
    await secureStorage.writeToken('patrol-unreachable-core-token');
    await secureStorage.writeUserId('patrol-unreachable-core-user');

    final dependencies = await bootstrap();
    await pumpRootAndWaitUntilVisible(dependencies, $);

    // The guard fetches, is refused, ends the session and puts up the teardown
    // screen, which hands over to login once the sequence finishes. The only
    // assertion that matters is that something is on the display and it is the
    // screen where another core can be entered.
    await $(LoginModeSelectScreen).waitUntilVisible(timeout: const Duration(seconds: 60));
  });
}
