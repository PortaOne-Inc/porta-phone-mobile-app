import 'package:patrol/patrol.dart';

import '../test/features/system_notifications/system_notifications_integration_test.dart';

/// Component integration on a device, using isolated file-backed SQLite.
/// No app bootstrap, account, OS connectivity changes or live backend needed.
void main() => systemNotificationsIntegrationTests((name, body) => patrolTest(name, ($) async => body()));
