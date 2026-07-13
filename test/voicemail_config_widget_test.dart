import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/schemes/features/feature_scheme/features/voicemail/voicemail_config_widget.dart';

void main() {
  Widget wrap(AppConfigVoicemail voicemail, ValueChanged<AppConfigVoicemail> onChanged) {
    return MaterialApp(
      home: Scaffold(
        body: VoicemailConfigWidget(voicemail: voicemail, onChanged: onChanged),
      ),
    );
  }

  setUp(() {
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.views.first.physicalSize = const Size(1200, 2400);
    binding.platformDispatcher.views.first.devicePixelRatio = 1;
  });

  testWidgets('switches the mode through the radio group', (tester) async {
    AppConfigVoicemail? updated;
    await tester.pumpWidget(wrap(const AppConfigVoicemail(), (it) => updated = it));

    await tester.tap(find.widgetWithText(RadioListTile<String>, 'On-device (local)'));
    expect(updated?.transcription.mode, 'local');

    await tester.pumpWidget(wrap(updated!, (it) => updated = it));
    await tester.tap(find.widgetWithText(RadioListTile<String>, 'Remote endpoint'));
    expect(updated?.transcription.mode, 'remote');
  });

  testWidgets('unknown mode renders as disabled', (tester) async {
    await tester.pumpWidget(
      wrap(const AppConfigVoicemail(transcription: AppConfigVoicemailTranscription(mode: 'cloud')), (_) {}),
    );

    final radioGroup = tester.widget<RadioGroup<String>>(find.byType(RadioGroup<String>));
    expect(radioGroup.groupValue, 'disabled');
  });

  testWidgets('language input trims and maps empty to null', (tester) async {
    AppConfigVoicemail? updated;
    await tester.pumpWidget(
      wrap(
        const AppConfigVoicemail(
          transcription: AppConfigVoicemailTranscription(mode: 'local', language: 'en'),
        ),
        (it) => updated = it,
      ),
    );

    await tester.enterText(find.widgetWithText(TextField, 'Expected language'), ' uk ');
    expect(updated?.transcription.language, 'uk');

    await tester.enterText(find.widgetWithText(TextField, 'Expected language'), '');
    expect(updated?.transcription.language, isNull);
  });

  testWidgets('local model dropdown updates the model tier', (tester) async {
    AppConfigVoicemail? updated;
    await tester.pumpWidget(
      wrap(
        const AppConfigVoicemail(transcription: AppConfigVoicemailTranscription(mode: 'local')),
        (it) => updated = it,
      ),
    );

    await tester.tap(find.text('base (~142 MB)'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('small (~466 MB)').last);
    await tester.pumpAndSettle();

    expect(updated?.transcription.local.model, 'small');
  });

  testWidgets('unknown local model is kept as an extra dropdown item', (tester) async {
    await tester.pumpWidget(
      wrap(
        const AppConfigVoicemail(
          transcription: AppConfigVoicemailTranscription(
            mode: 'local',
            local: AppConfigVoicemailTranscriptionLocal(model: 'custom-tier'),
          ),
        ),
        (_) {},
      ),
    );

    expect(find.text('custom-tier'), findsOneWidget);
  });

  testWidgets('remote fields trim, map empty to null and default the model name', (tester) async {
    AppConfigVoicemail? updated;
    await tester.pumpWidget(
      wrap(
        const AppConfigVoicemail(
          transcription: AppConfigVoicemailTranscription(
            mode: 'remote',
            remote: AppConfigVoicemailTranscriptionRemote(url: 'https://old.example.com', apiKey: 'old'),
          ),
        ),
        (it) => updated = it,
      ),
    );

    await tester.enterText(find.widgetWithText(TextField, 'Service URL'), ' https://stt.example.com/v1 ');
    expect(updated?.transcription.remote.url, 'https://stt.example.com/v1');

    await tester.enterText(find.widgetWithText(TextField, 'API key'), '');
    expect(updated?.transcription.remote.apiKey, isNull);

    await tester.enterText(find.widgetWithText(TextField, 'Model name'), 'large-v3');
    expect(updated?.transcription.remote.model, 'large-v3');

    await tester.enterText(find.widgetWithText(TextField, 'Model name'), '');
    expect(updated?.transcription.remote.model, 'whisper-1');
  });
}
