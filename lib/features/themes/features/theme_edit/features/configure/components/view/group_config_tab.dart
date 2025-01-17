import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_phone/features/settings/widgets/widgets.dart';

import '../models/models.dart';

class GroupConfigTab extends StatelessWidget {
  const GroupConfigTab({
    required this.sourceGroupWidgetConfig,
    required this.callback,
    super.key,
    this.groupTitleListStyles,
    this.callActionsStyles,
  });

  final GroupTitleListStyles? groupTitleListStyles;
  final CallActionsStyles? callActionsStyles;
  final GroupWidgetConfig? sourceGroupWidgetConfig;
  final ObjectCallback<GroupWidgetConfig?> callback;

  @override
  Widget build(BuildContext context) {
    final groupTitleListStylesPrimary = groupTitleListStyles?.primary;
    final callActionsStylesPrimary = callActionsStyles?.primary;

    final buttons = <ObjectDescriptor<ButtonStyle, String?>>[
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.callStart,
        title: 'callStart',
        data: sourceGroupWidgetConfig?.callActions.callStartBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(callStartBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.keypad,
        title: 'keypad',
        data: sourceGroupWidgetConfig?.callActions.keypadBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(keypadBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.keypadActive,
        title: 'keypadActive',
        data: sourceGroupWidgetConfig?.callActions.keypadActiveBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(keypadActiveBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.camera,
        title: 'camera',
        data: sourceGroupWidgetConfig?.callActions.cameraBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(cameraBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.cameraActive,
        title: 'cameraActive',
        data: sourceGroupWidgetConfig?.callActions.cameraActiveBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(cameraActiveBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.muted,
        title: 'muted',
        data: sourceGroupWidgetConfig?.callActions.mutedBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(mutedBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.mutedActive,
        title: 'mutedActive',
        data: sourceGroupWidgetConfig?.callActions.mutedActiveBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(mutedActiveBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.speaker,
        title: 'speaker',
        data: sourceGroupWidgetConfig?.callActions.speakerBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(speakerBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.speakerActive,
        title: 'speakerActive',
        data: sourceGroupWidgetConfig?.callActions.speakerActiveBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(speakerActiveBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.transfer,
        title: 'transfer',
        data: sourceGroupWidgetConfig?.callActions.transferBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(transferBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.held,
        title: 'held',
        data: sourceGroupWidgetConfig?.callActions.heldBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(heldBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.heldActive,
        title: 'heldActive',
        data: sourceGroupWidgetConfig?.callActions.heldActiveBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(heldActiveBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.swap,
        title: 'swap',
        data: sourceGroupWidgetConfig?.callActions.swapBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(swapBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.hangup,
        title: 'hangup',
        data: sourceGroupWidgetConfig?.callActions.hangupBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(hangupBackgroundColor: data!),
        )),
      ),
      ObjectDescriptor<ButtonStyle, String>(
        style: callActionsStylesPrimary?.key,
        title: 'key',
        data: sourceGroupWidgetConfig?.callActions.keyBackgroundColor,
        callback: (data) => callback(sourceGroupWidgetConfig?.copyWith(
          callActions: sourceGroupWidgetConfig!.callActions!.copyWith(keyBackgroundColor: data!),
        )),
      ),
    ].nonNulls;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Group Title List Tile Background',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ColorField(
                  title: 'Background color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: groupTitleListStylesPrimary?.background,
                  onTap: (color) => context.selectColor(
                    initialColor: groupTitleListStylesPrimary?.background,
                    onColorSelected: (color) => callback(sourceGroupWidgetConfig?.copyWith(
                        groupTitleListTile:
                            sourceGroupWidgetConfig!.groupTitleListTile!.copyWith(backgroundColor: color?.toHex()))),
                  ),
                ),
                ColorField(
                  title: 'Text color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: groupTitleListStylesPrimary?.textStyle?.color,
                  onTap: (color) => context.selectColor(
                    initialColor: groupTitleListStylesPrimary?.textStyle?.color,
                    onColorSelected: (color) => callback(sourceGroupWidgetConfig?.copyWith(
                        groupTitleListTile:
                            sourceGroupWidgetConfig!.groupTitleListTile!.copyWith(textColor: color?.toHex()))),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Call actions',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: buttons
                  .map(
                    (it) => ColorField(
                      title: it.title,
                      constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                      color: it.style?.backgroundColor?.resolve({}),
                      onTap: (color) => context.selectColor(
                        initialColor: it.style?.backgroundColor?.resolve({}),
                        onColorSelected: (color) => it.callback?.call(color.toHex()),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
