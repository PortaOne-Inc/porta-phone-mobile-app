import 'dart:convert';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/gen/assets.gen.dart';

extension ImageModelExtension on ImageModel {
  ThemeSvgAsset toThemeSvgAsset() {
    if (isAvailable == true) {
      switch (location) {
        case ImageLocation.network:
          return ThemeNetworkSvgAsset(url!);
        case ImageLocation.memory:
          return data == null ? ThemeAssetSvgAsset(Assets.emptySvg) : ThemeMemorySvgAsset(base64.decode(data!));
        case ImageLocation.empty:
          return ThemeAssetSvgAsset(Assets.emptySvg);
      }
    } else {
      return ThemeAssetSvgAsset(Assets.emptySvg);
    }
  }
}

// List<CustomColor> toCustomColorGradientCollection() {
//   const emptyGradient = <Color>[Colors.transparent, Colors.transparent];
//   final isEnoughGradientColor = (colorGradientCollection ?? []).length < 2;
//   final colors = isEnoughGradientColor ? emptyGradient : colorGradientCollection?.map((it) => it.toColor());
//   return colors!.map((color) => CustomColor(color: "color", blend: false)).toList();
// }
//}
