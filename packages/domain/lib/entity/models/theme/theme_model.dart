import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain/entity/models/theme/system_assets_model.dart';

import '../texts/texts_model.dart';

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
    @Default(SystemAssetsModel()) SystemAssetsModel systemAssets,
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
