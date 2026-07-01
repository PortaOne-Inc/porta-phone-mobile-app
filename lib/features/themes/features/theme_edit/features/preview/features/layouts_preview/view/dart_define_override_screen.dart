import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/applications/features/application_details/features/environment/widgets/widgets.dart';
import 'package:webtrit_configurator/features/common/common.dart';

import '../dart_define_overrides.dart';

/// Temporary dart-define override editor for the realtime preview.
///
/// Loads the application's saved environment, lets the user layer temporary
/// values on top, and returns the resulting override map via `Navigator.pop`
/// (an empty map clears the overrides). Nothing is persisted to the backend.
class DartDefineOverrideScreen extends StatefulWidget {
  const DartDefineOverrideScreen({
    required this.applicationId,
    required this.environmentUsecase,
    required this.initialOverrides,
    super.key,
  });

  final String applicationId;

  final GetApplicationEnvironmentUsecase environmentUsecase;

  final Map<String, String> initialOverrides;

  @override
  State<DartDefineOverrideScreen> createState() => _DartDefineOverrideScreenState();
}

class _DartDefineOverrideScreenState extends State<DartDefineOverrideScreen> {
  late final Future<Map<String, dynamic>> _environment;
  final Map<String, dynamic> _config = {};
  bool _seeded = false;

  @override
  void initState() {
    super.initState();
    _environment = widget.environmentUsecase.execute(applicationId: widget.applicationId);
  }

  void _seed(Map<String, dynamic> saved) {
    if (_seeded) return;
    _seeded = true;
    _config
      ..addEntries(
        saved.entries.where((entry) => entry.value != null).map((entry) => MapEntry(entry.key, '${entry.value}')),
      )
      ..addAll(widget.initialOverrides);
  }

  void _update<T>(String key, T value) {
    setState(() => _config[key] = value);
  }

  void _toggle(bool enabled, String key, dynamic value) {
    setState(() => enabled ? _config[key] = value?.toString() ?? '' : _config.remove(key));
  }

  void _apply() {
    Navigator.of(context).pop(_config.map((key, value) => MapEntry(key, '$value')));
  }

  void _reset() {
    Navigator.of(context).pop(<String, String>{});
  }

  void _onThemeModeChanged(ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }

  List<Widget> _buildFields() {
    final catalogKeys = kDartDefineFields.map((field) => field.key).toSet();
    final extraKeys = _config.keys.where((key) => !catalogKeys.contains(key)).toList()..sort();
    return [
      for (final field in kDartDefineFields)
        ConfigField(
          key: ValueKey(field.key),
          label: field.label,
          keyName: field.key,
          options: field.options,
          config: _config,
          defaultValue: '',
          onConfigUpdate: _update,
          onEnabledChanged: _toggle,
        ),
      for (final key in extraKeys)
        ConfigField(
          key: ValueKey(key),
          label: key,
          keyName: key,
          config: _config,
          defaultValue: '',
          onConfigUpdate: _update,
          onEnabledChanged: _toggle,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(
        name: 'Override dart-define',
        themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
        onThemeChange: _onThemeModeChanged,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _environment,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Failed to load environment: ${snapshot.error}'));
          }
          final saved = snapshot.data;
          if (saved == null) {
            return const Center(child: CircularProgressIndicator());
          }
          _seed(saved);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ElevatedButton(onPressed: _apply, child: const Text('Apply to preview')),
                    const SizedBox(width: 8),
                    TextButton(onPressed: _reset, child: const Text('Reset to saved')),
                  ],
                ),
                ConfigSection(title: 'Dart-define overrides', fields: _buildFields()),
              ],
            ),
          );
        },
      ),
    );
  }
}
