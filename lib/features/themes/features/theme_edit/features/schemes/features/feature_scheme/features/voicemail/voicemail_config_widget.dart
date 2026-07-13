import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

/// Editor for [AppConfigVoicemail.transcription] - client-side voicemail
/// transcription. Transcripts are produced by the app itself: either on the
/// device or through an OpenAI-compatible speech-to-text endpoint, depending
/// on the selected mode.
class VoicemailConfigWidget extends StatefulWidget {
  const VoicemailConfigWidget({required this.voicemail, required this.onChanged, super.key});

  final AppConfigVoicemail voicemail;
  final ValueChanged<AppConfigVoicemail> onChanged;

  @override
  State<VoicemailConfigWidget> createState() => _VoicemailConfigWidgetState();
}

class _VoicemailConfigWidgetState extends State<VoicemailConfigWidget> {
  static const _disabledMode = 'disabled';
  static const _localMode = 'local';
  static const _remoteMode = 'remote';

  static const _defaultRemoteModel = 'whisper-1';

  /// Whisper ggml tiers accepted by the phone's on-device engine, with the
  /// approximate download size; `.en` variants are English-only.
  static const _localModels = <String, String>{
    'tiny': 'tiny (~75 MB)',
    'base': 'base (~142 MB)',
    'small': 'small (~466 MB)',
    'medium': 'medium (~1.5 GB)',
    'large-v3': 'large-v3 (~2.9 GB)',
    'tiny.en': 'tiny.en (~75 MB, English only)',
    'base.en': 'base.en (~142 MB, English only)',
    'small.en': 'small.en (~466 MB, English only)',
    'medium.en': 'medium.en (~1.5 GB, English only)',
  };

  final _languageController = TextEditingController();
  final _remoteUrlController = TextEditingController();
  final _remoteApiKeyController = TextEditingController();
  final _remoteModelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final transcription = widget.voicemail.transcription;
    _languageController.text = transcription.language ?? '';
    _remoteUrlController.text = transcription.remote.url ?? '';
    _remoteApiKeyController.text = transcription.remote.apiKey ?? '';
    _remoteModelController.text = transcription.remote.model;

    _languageController.addListener(_onLanguageChanged);
    _remoteUrlController.addListener(_onRemoteChanged);
    _remoteApiKeyController.addListener(_onRemoteChanged);
    _remoteModelController.addListener(_onRemoteChanged);
  }

  @override
  void dispose() {
    _languageController.dispose();
    _remoteUrlController.dispose();
    _remoteApiKeyController.dispose();
    _remoteModelController.dispose();
    super.dispose();
  }

  AppConfigVoicemailTranscription get _transcription => widget.voicemail.transcription;

  String get _mode {
    final mode = _transcription.mode.trim().toLowerCase();
    return (mode == _localMode || mode == _remoteMode) ? mode : _disabledMode;
  }

  String? _trimmedOrNull(TextEditingController controller) {
    final text = controller.text.trim();
    return text.isEmpty ? null : text;
  }

  void _update(AppConfigVoicemailTranscription transcription) {
    widget.onChanged(widget.voicemail.copyWith(transcription: transcription));
  }

  void _onModeChanged(String? mode) {
    _update(_transcription.copyWith(mode: mode ?? _disabledMode));
  }

  void _onLanguageChanged() {
    _update(_transcription.copyWith(language: _trimmedOrNull(_languageController)));
  }

  void _onLocalModelChanged(String? model) {
    if (model == null) return;
    _update(_transcription.copyWith(local: _transcription.local.copyWith(model: model)));
  }

  void _onRemoteChanged() {
    _update(
      _transcription.copyWith(
        remote: _transcription.remote.copyWith(
          url: _trimmedOrNull(_remoteUrlController),
          apiKey: _trimmedOrNull(_remoteApiKeyController),
          model: _trimmedOrNull(_remoteModelController) ?? _defaultRemoteModel,
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get _localModelItems {
    final model = _transcription.local.model;
    return [
      for (final entry in _localModels.entries) DropdownMenuItem(value: entry.key, child: Text(entry.value)),
      if (!_localModels.containsKey(model)) DropdownMenuItem(value: model, child: Text(model)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mode = _mode;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BorderContainer(
          title: 'Transcription source',
          description:
              'Voicemail transcription runs in the app: each voice message gets a text transcript below the '
              'audio player. Pick where the speech-to-text happens.',
          child: RadioGroup<String>(
            groupValue: mode,
            onChanged: _onModeChanged,
            child: const Column(
              children: [
                RadioListTile<String>(
                  title: Text('Disabled'),
                  subtitle: Text('Voicemails stay audio-only'),
                  value: _disabledMode,
                ),
                RadioListTile<String>(
                  title: Text('On-device (local)'),
                  subtitle: Text(
                    'Whisper runs on the phone; the model is downloaded on first use. '
                    'Audio never leaves the device. Not available in the web client.',
                  ),
                  value: _localMode,
                ),
                RadioListTile<String>(
                  title: Text('Remote endpoint'),
                  subtitle: Text(
                    'The app sends the voicemail audio to an OpenAI-compatible speech-to-text service '
                    '(OpenAI, a self-hosted Speaches/faster-whisper server, ...)',
                  ),
                  value: _remoteMode,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Language',
          description:
              'Expected voicemail language as an ISO 639-1 code (e.g. "en", "it"). Leave empty to auto-detect '
              'the language of every message.',
          child: OutlineInput(
            controller: _languageController,
            label: 'Expected language',
            icon: Icons.language,
            enabled: mode != _disabledMode,
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'On-device model',
          description:
              'Whisper model tier used by the local mode. Larger tiers transcribe better but cost more '
              'download size, memory and CPU; "base" and "small" are the practical phone choices.',
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: DropdownButtonFormField<String>(
              initialValue: _transcription.local.model,
              decoration: const InputDecoration(labelText: 'Model', border: OutlineInputBorder()),
              items: _localModelItems,
              onChanged: mode == _localMode ? _onLocalModelChanged : null,
            ),
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Remote endpoint',
          description:
              'OpenAI-compatible speech-to-text service used by the remote mode. The URL is either the full '
              '".../audio/transcriptions" endpoint or its API base (e.g. "https://stt.example.com/v1"); the '
              'remote mode stays disabled in the app while the URL is empty.',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              OutlineInput(
                controller: _remoteUrlController,
                label: 'Service URL',
                icon: Icons.link,
                enabled: mode == _remoteMode,
              ),
              const SizedBox(height: 12),
              OutlineInput(
                controller: _remoteApiKeyController,
                label: 'API key',
                icon: Icons.key_outlined,
                enabled: mode == _remoteMode,
              ),
              const SizedBox(height: 4),
              Text(
                'Optional bearer token; leave empty when the endpoint needs no auth.',
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              OutlineInput(
                controller: _remoteModelController,
                label: 'Model name',
                icon: Icons.smart_toy_outlined,
                enabled: mode == _remoteMode,
              ),
              const SizedBox(height: 4),
              Text(
                'Model identifier sent to the service; empty falls back to "$_defaultRemoteModel".',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
