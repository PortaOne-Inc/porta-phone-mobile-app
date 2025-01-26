import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_asset_model.freezed.dart';

enum ThemeAssetType {
  unknown,
  image,
  html,
}

@freezed
class ThemeAssetModel with _$ThemeAssetModel {
  const factory ThemeAssetModel({
    required int id,
    required String name,
    @Default(ThemeAssetType.unknown) ThemeAssetType type,
    @Default('') String description,
    Uint8List? file,
    String? url,
  }) = _ThemeAssetModel;

  factory ThemeAssetModel.create({
    required String name,
    required ThemeAssetType type,
    String description = '',
    Uint8List? file,
    String? url,
  }) {
    // Generate a unique ID using the current timestamp and a counter
    final uniqueId = DateTime.now().millisecondsSinceEpoch;
    return ThemeAssetModel(
      id: uniqueId,
      name: name,
      type: type,
      description: description,
      file: file,
      url: url,
    );
  }

  const ThemeAssetModel._();
}
