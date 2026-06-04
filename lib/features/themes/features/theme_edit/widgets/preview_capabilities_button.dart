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
          buildWhen: (previous, current) => previous.previewCapabilities != current.previewCapabilities,
          builder: (context, state) {
            final enabled = state.previewCapabilities.toSet();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Mock the capabilities advertised by the backend adapter. '
                    'The preview updates immediately.',
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
