import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';

extension ContextExtensions on BuildContext {
  Future<Color?> pickColor({required Color initial}) {
    return showDialog<Color?>(
      context: this,
      builder: (context) => Center(
        child: ColorPicker(
          onDeclineColor: () => Navigator.of(context).pop(),
          onAcceptColor: (c) => Navigator.of(context).pop(c),
          initialColor: initial,
        ),
      ),
      useRootNavigator: false,
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

  Future<EmbeddedResourceModel?> pickEmbeddedResource({
    required List<EmbeddedResourceModel> items,
    String title = 'Select embedded resources',
    Set<String> initialSelectedIds = const <String>{},
    int crossAxisCount = 4,
  }) async {
    final res = await EmbedPickerDialog.show(
      this,
      items: items,
      title: title,
      initialSelectedIds: initialSelectedIds,
      crossAxisCount: crossAxisCount,
    );
    return (res == null || res.isEmpty) ? null : res.first;
  }
}
