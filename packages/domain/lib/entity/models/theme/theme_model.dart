import 'package:freezed_annotation/freezed_annotation.dart';

import '../texts/texts_model.dart';

import 'launch_assets_model.dart';
import 'splash_asset_model.dart';
import 'theme_asset_model.dart';

part 'theme_model.freezed.dart';

@freezed
class ThemeModel with _$ThemeModel {
  const factory ThemeModel({
    String? id,
    String? name,
    String? fontFamily,
    @Default({}) Map<String, dynamic> colorSchemeConfig,
    @Default({}) Map<String, dynamic> themeWidgetConfig,
    @Default({}) Map<String, dynamic> themePageConfig,
    @Default({}) Map<String, dynamic> appConfig,
    @Default([]) List<ThemeAssetModel> assets,
    @Default(LaunchAssetsModel()) LaunchAssetsModel launchAssets,
    @Default(SplashAssetModel()) SplashAssetModel splashAsset,
    TextsModel? texts,
  }) = _ThemeModel;

  const ThemeModel._();

  List<String> get colorSchemeCollection {
    return [];
  }

  List<String>? get colorGradientCollection {
    return [];
  }
}
