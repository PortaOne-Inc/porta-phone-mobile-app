import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/schemes/features/feature_scheme/features/login/view/login_scheme_qr.dart';

void main() {
  Widget wrap(AppConfigLoginQr config, ValueChanged<AppConfigLoginQr> callback) {
    return MaterialApp(
      home: Scaffold(
        body: LoginSchemeQr(config: config, callback: callback),
      ),
    );
  }

  setUp(() {
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.views.first.physicalSize = const Size(1200, 2400);
    binding.platformDispatcher.views.first.devicePixelRatio = 1;
  });

  testWidgets('toggles enabled through the switch', (tester) async {
    AppConfigLoginQr? updated;
    await tester.pumpWidget(wrap(const AppConfigLoginQr(), (it) => updated = it));

    await tester.tap(find.byType(SwitchListTile));
    expect(updated?.enabled, isTrue);
  });

  testWidgets('empty expected host maps to null and non-empty is trimmed', (tester) async {
    AppConfigLoginQr? updated;
    await tester.pumpWidget(wrap(const AppConfigLoginQr(expectedHost: 'DEE-CALL'), (it) => updated = it));

    await tester.enterText(find.widgetWithText(TextField, 'Expected host'), ' HOST-1 ');
    expect(updated?.expectedHost, 'HOST-1');

    await tester.enterText(find.widgetWithText(TextField, 'Expected host'), '');
    expect(updated?.expectedHost, isNull);
  });

  testWidgets('unchecking a format removes it and checking appends it', (tester) async {
    AppConfigLoginQr? updated;
    await tester.pumpWidget(wrap(const AppConfigLoginQr(), (it) => updated = it));

    await tester.tap(find.widgetWithText(CheckboxListTile, 'WebTrit JSON'));
    expect(updated?.formats.map((it) => it.type), ['uri']);

    await tester.pumpWidget(wrap(updated!, (it) => updated = it));
    await tester.tap(find.widgetWithText(CheckboxListTile, 'WebTrit JSON'));
    expect(updated?.formats.map((it) => it.type), ['uri', 'json']);
  });

  testWidgets('schemes input rewrites the uri format and empty falls back to null', (tester) async {
    AppConfigLoginQr? updated;
    await tester.pumpWidget(wrap(const AppConfigLoginQr(), (it) => updated = it));

    await tester.enterText(find.widgetWithText(TextField, 'Accepted URI schemes'), 'csc, acme');
    expect(updated?.formats.firstWhere((it) => it.type == 'uri').schemes, ['csc', 'acme']);

    await tester.enterText(find.widgetWithText(TextField, 'Accepted URI schemes'), '');
    expect(updated?.formats.firstWhere((it) => it.type == 'uri').schemes, isNull);
  });
}
