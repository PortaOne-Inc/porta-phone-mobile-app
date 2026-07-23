import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:webtrit_configurator/widgets/widgets.dart';

import '../core/core.dart';

extension ConfiguratorDialogsExtension on BuildContext {
  Future<Color?> showColorPicker({Color? currentColor}) async {
    return showDialog<Color?>(
      context: this,
      useRootNavigator: false,
      builder: (context) => Center(
        child: ColorPicker(
          initialColor: currentColor ?? Colors.black,
          onDeclineColor: () => Navigator.of(context).pop(),
          onAcceptColor: (color) => Navigator.of(context).pop(color),
        ),
      ),
    );
  }

  Future<String?> showFontPicker() async {
    return showDialog<String?>(
      context: this,
      useRootNavigator: false,
      builder: (context) => Center(
        child: FontsPicker(
          onChoose: (name) => Navigator.of(context).pop(name),
          onClose: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  Future<AssetModel?> pickAsset(List<AssetModel> assets) async {
    final picked = await AssetPickerDialog.showFromFuture(
      this,
      title: 'Select image',
      futureAssets: (() async => assets)(),
    );
    if ((picked ?? const []).isEmpty) return null;
    return picked!.first;
  }
}
