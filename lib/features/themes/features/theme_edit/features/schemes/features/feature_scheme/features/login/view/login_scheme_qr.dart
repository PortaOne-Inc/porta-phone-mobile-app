import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

/// Editor for the QR-code sign-in tab configuration (`loginConfig.qr`).
///
/// The QR code carries plain credentials in a provisioning payload; scanning it
/// signs the user in through the regular password login. The tab appears in the
/// app only when it is enabled here and the backend supports password sign-in.
class LoginSchemeQr extends StatefulWidget {
  const LoginSchemeQr({required this.config, required this.callback, super.key});

  final AppConfigLoginQr config;
  final ObjectCallback<AppConfigLoginQr> callback;

  @override
  State<LoginSchemeQr> createState() => _LoginSchemeQrState();
}

class _LoginSchemeQrState extends State<LoginSchemeQr> {
  static const _uriType = 'uri';
  static const _jsonType = 'json';

  final _expectedHostController = TextEditingController();
  final _uriSchemesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _expectedHostController.text = widget.config.expectedHost ?? '';
    _uriSchemesController.text = _uriFormat?.schemes?.join(', ') ?? '';

    _expectedHostController.addListener(_onExpectedHostChanged);
    _uriSchemesController.addListener(_onUriSchemesChanged);
  }

  @override
  void dispose() {
    _expectedHostController.dispose();
    _uriSchemesController.dispose();
    super.dispose();
  }

  AppConfigLoginQrFormat? get _uriFormat => widget.config.formats.where((it) => it.type == _uriType).firstOrNull;

  bool _hasFormat(String type) => widget.config.formats.any((it) => it.type == type);

  List<String>? get _uriSchemesOrNull {
    final schemes = _uriSchemesController.text
        .split(RegExp(r'[,\s]+'))
        .map((it) => it.trim())
        .where((it) => it.isNotEmpty)
        .toList();
    return schemes.isEmpty ? null : schemes;
  }

  void _onEnabledChanged(bool value) {
    widget.callback(widget.config.copyWith(enabled: value));
  }

  void _onExpectedHostChanged() {
    final host = _expectedHostController.text.trim();
    widget.callback(widget.config.copyWith(expectedHost: host.isEmpty ? null : host));
  }

  void _onUriSchemesChanged() {
    final formats = [
      for (final format in widget.config.formats)
        if (format.type == _uriType) AppConfigLoginQrFormat(type: _uriType, schemes: _uriSchemesOrNull) else format,
    ];
    widget.callback(widget.config.copyWith(formats: formats));
  }

  void _onFormatToggled(String type, bool include) {
    final formats = include
        ? [
            ...widget.config.formats,
            AppConfigLoginQrFormat(type: type, schemes: type == _uriType ? _uriSchemesOrNull : null),
          ]
        : widget.config.formats.where((it) => it.type != type).toList();
    widget.callback(widget.config.copyWith(formats: formats));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uriEnabled = _hasFormat(_uriType);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BorderContainer(
          title: 'QR code sign-in',
          description:
              'Adds a QR code tab next to the other sign-in tabs. Scanning a code with credentials signs '
              'the user in through the regular password login, so the tab is shown only when the backend supports '
              'password sign-in. The tab position follows the sign-in tabs order.',
          child: SwitchListTile(
            title: const Text('Enable QR code sign-in tab'),
            value: widget.config.enabled,
            onChanged: _onEnabledChanged,
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Accepted code formats',
          description:
              'Formats are probed in order; the first one that recognizes a scanned code decides the '
              'outcome. A code that no format recognizes is rejected as invalid.',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(
                title: const Text('Provisioning URI'),
                subtitle: const Text(
                  'scheme:username:password@host with percent-encoded segments, '
                  'e.g. csc:user123:p%40ss@DEE-CALL',
                ),
                value: uriEnabled,
                onChanged: (value) => _onFormatToggled(_uriType, value ?? false),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlineInput(
                      controller: _uriSchemesController,
                      label: 'Accepted URI schemes',
                      icon: Icons.qr_code,
                      enabled: uriEnabled,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Comma-separated scheme names, matched case-insensitively. Leave empty to accept the '
                      'default "csc" scheme.',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              CheckboxListTile(
                title: const Text('WebTrit JSON'),
                subtitle: const Text('Marker-discriminated JSON object reserved for WebTrit-issued codes'),
                value: _hasFormat(_jsonType),
                onChanged: (value) => _onFormatToggled(_jsonType, value ?? false),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Expected host',
          description:
              'Pins codes to the issuing host (the cloud id after "@" in the code). Codes issued for a '
              'different host are rejected as invalid. Leave empty to accept any host.',
          child: OutlineInput(controller: _expectedHostController, label: 'Expected host', icon: Icons.dns_outlined),
        ),
      ],
    );
  }
}
