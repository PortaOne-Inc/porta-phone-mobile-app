import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/schemes/features/feature_scheme/features/voicemail/voicemail_config_widget.dart';

void main() {
  Widget wrap(AppConfigTranscription transcription, ValueChanged<AppConfigTranscription> onChanged) {
    return MaterialApp(
      home: Scaffold(
        body: VoicemailConfigWidget(transcription: transcription, onChanged: onChanged),
      ),
    );
  }

  setUp(() {
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.views.first.physicalSize = const Size(1200, 2400);
    binding.platformDispatcher.views.first.devicePixelRatio = 1;
  });

  testWidgets('switches the mode through the radio group', (tester) async {
    AppConfigTranscription? updated;
    await tester.pumpWidget(wrap(const AppConfigTranscription(), (it) => updated = it));

    await tester.tap(find.widgetWithText(RadioListTile<String>, 'On-device (local)'));
    expect(updated?.mode, 'local');

    await tester.pumpWidget(wrap(updated!, (it) => updated = it));
    await tester.tap(find.widgetWithText(RadioListTile<String>, 'Remote endpoint'));
    expect(updated?.mode, 'remote');
  });

  testWidgets('unknown mode renders as disabled', (tester) async {
    await tester.pumpWidget(wrap(const AppConfigTranscription(mode: 'cloud'), (_) {}));

    final radioGroup = tester.widget<RadioGroup<String>>(find.byType(RadioGroup<String>));
    expect(radioGroup.groupValue, 'disabled');
  });

  testWidgets('language input trims and maps empty to null', (tester) async {
    AppConfigTranscription? updated;
    await tester.pumpWidget(wrap(const AppConfigTranscription(mode: 'local', language: 'en'), (it) => updated = it));

    await tester.enterText(find.widgetWithText(TextField, 'Expected language'), ' uk ');
    expect(updated?.language, 'uk');

    await tester.enterText(find.widgetWithText(TextField, 'Expected language'), '');
    expect(updated?.language, isNull);
  });

  testWidgets('defaults the local model to off', (tester) async {
    await tester.pumpWidget(wrap(const AppConfigTranscription(mode: 'local'), (_) {}));

    expect(find.text('Off (the user opts in from the app)'), findsOneWidget);
  });

  testWidgets('local model dropdown updates the model tier', (tester) async {
    AppConfigTranscription? updated;
    await tester.pumpWidget(wrap(const AppConfigTranscription(mode: 'local'), (it) => updated = it));

    await tester.tap(find.text('Off (the user opts in from the app)'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('small (~466 MB)').last);
    await tester.pumpAndSettle();

    expect(updated?.local.model, 'small');
  });

  testWidgets('local model dropdown can be set back to off', (tester) async {
    AppConfigTranscription? updated;
    await tester.pumpWidget(
      wrap(const AppConfigTranscription(mode: 'local', local: AppConfigTranscriptionLocal(model: 'base')), (
        it,
      ) => updated = it),
    );

    await tester.tap(find.text('base (~142 MB)'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Off (the user opts in from the app)').last);
    await tester.pumpAndSettle();

    expect(updated?.local.model, 'off');
  });

  testWidgets('unknown local model is kept as an extra dropdown item', (tester) async {
    await tester.pumpWidget(
      wrap(
        const AppConfigTranscription(mode: 'local', local: AppConfigTranscriptionLocal(model: 'custom-tier')),
        (_) {},
      ),
    );

    expect(find.text('custom-tier'), findsOneWidget);
  });

  testWidgets('remote fields trim, map empty to null and default the model name', (tester) async {
    AppConfigTranscription? updated;
    await tester.pumpWidget(
      wrap(
        const AppConfigTranscription(
          mode: 'remote',
          remote: AppConfigTranscriptionRemote(url: 'https://old.example.com', apiKey: 'old'),
        ),
        (it) => updated = it,
      ),
    );

    await tester.enterText(find.widgetWithText(TextField, 'Service URL'), ' https://stt.example.com/v1 ');
    expect(updated?.remote.url, 'https://stt.example.com/v1');

    await tester.enterText(find.widgetWithText(TextField, 'API key'), '');
    expect(updated?.remote.apiKey, isNull);

    await tester.enterText(find.widgetWithText(TextField, 'Model name'), 'large-v3');
    expect(updated?.remote.model, 'large-v3');

    await tester.enterText(find.widgetWithText(TextField, 'Model name'), '');
    expect(updated?.remote.model, 'whisper-1');
  });
}
