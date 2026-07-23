import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/update_theme_cubit.dart';
import '../consts/preview_capabilities.dart';

/// App bar action that lets the user toggle the adapter capabilities
/// (`system-info.adapter.supported`) used to render the live preview.
class PreviewCapabilitiesButton extends StatelessWidget {
  const PreviewCapabilitiesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Preview adapter capabilities',
      child: IconButton(icon: const Icon(Icons.tune), onPressed: () => _openDialog(context)),
    );
  }

  void _openDialog(BuildContext context) {
    final cubit = context.read<UpdateThemCubit>();
    showDialog<void>(
      context: context,
      builder: (_) => BlocProvider<UpdateThemCubit>.value(value: cubit, child: const _PreviewCapabilitiesDialog()),
    );
  }
}

class _PreviewCapabilitiesDialog extends StatelessWidget {
  const _PreviewCapabilitiesDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Preview capabilities'),
      content: SizedBox(
        width: 360,
        child: BlocBuilder<UpdateThemCubit, UpdateThemeState>(
          buildWhen: (previous, current) =>
              previous.effectivePreviewCapabilities != current.effectivePreviewCapabilities,
          builder: (context, state) {
            final enabled = state.effectivePreviewCapabilities.toSet();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _CoreVersionField(),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Capabilities advertised by the backend adapter. Defaults to the '
                    'real backend values once the realtime preview has loaded them; '
                    'toggling overrides them. The preview updates immediately.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: kPreviewCapabilities.length,
                    itemBuilder: (context, index) => _CapabilityTile(
                      capability: kPreviewCapabilities[index],
                      enabled: enabled.contains(kPreviewCapabilities[index].flag),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
    );
  }
}

/// Editable core version reported by the preview's mocked `system-info`.
/// Gates version-aware features (e.g. hybrid presence) so the preview can match
/// the backend the app actually talks to.
class _CoreVersionField extends StatefulWidget {
  const _CoreVersionField();

  @override
  State<_CoreVersionField> createState() => _CoreVersionFieldState();
}

class _CoreVersionFieldState extends State<_CoreVersionField> {
  // Lightweight semver check so an invalid entry does not silently break the
  // preview; the exact constraint lives in the app's CoreInfo version gates.
  static final _versionPattern = RegExp(r'^\d+\.\d+\.\d+([-+][0-9A-Za-z.-]+)*$');

  late final TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: context.read<UpdateThemCubit>().state.previewCoreVersion);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    final trimmed = value.trim();
    if (!_versionPattern.hasMatch(trimmed)) {
      setState(() => _error = 'Invalid version (e.g. 1.0.0)');
      return;
    }
    setState(() => _error = null);
    context.read<UpdateThemCubit>().add(PreviewCapabilitiesEvent.setCoreVersion(trimmed));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Core version',
        helperText: 'system-info core version — gates features like hybrid presence',
        errorText: _error,
        isDense: true,
        border: const OutlineInputBorder(),
      ),
      onChanged: _onChanged,
    );
  }
}

class _CapabilityTile extends StatelessWidget {
  const _CapabilityTile({required this.capability, required this.enabled});

  final PreviewCapability capability;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      dense: true,
      title: Text(capability.label),
      subtitle: Text(capability.flag, style: Theme.of(context).textTheme.bodySmall),
      value: enabled,
      onChanged: (value) =>
          context.read<UpdateThemCubit>().add(PreviewCapabilitiesEvent.toggle(capability.flag, value)),
    );
  }
}
