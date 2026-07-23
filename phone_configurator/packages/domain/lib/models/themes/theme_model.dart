import 'package:freezed_annotation/freezed_annotation.dart';

import '../resources/asset_model.dart';

part 'theme_model.freezed.dart';

part 'theme_model.g.dart';

enum ThemeStatus { draft, published, archived }

@freezed
sealed class ThemeModel with _$ThemeModel {
  const factory ThemeModel({
    String? id,
    String? applicationId,
    String? title,
    String? slug,
    String? description,
    String? previewAssetId,
    AssetModel? previewAsset,
    @Default(ThemeStatus.published) ThemeStatus status,
    @Default(false) bool isDefault,
    @Default(0) int version,
    int? sortIndex,
    int? assetsCount,
    int? embedsCount,
    bool? featureAccessExists,
    String? createdBy,
    String? updatedBy,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? parentThemeId,
    @Default(<String>[]) List<String> tags,
  }) = _ThemeModel;

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);

  const ThemeModel._();

  String get displayTitle => title ?? id ?? 'No name';
}
