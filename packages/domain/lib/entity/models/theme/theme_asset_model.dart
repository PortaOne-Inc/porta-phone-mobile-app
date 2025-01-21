import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_asset_model.freezed.dart';

@freezed
class ThemeAssetModel with _$ThemeAssetModel {
  const factory ThemeAssetModel({
    required String id,
    required String name,
    @Default('') String description,
    Uint8List? file,
  }) = _ThemeAssetModel;

  factory ThemeAssetModel.create({
    required String name,
    String description = '',
    Uint8List? file,
  }) {
    // Generate a unique ID using the current timestamp and a counter
    final uniqueId = '${DateTime.now().millisecondsSinceEpoch}_${_counter++}';
    return ThemeAssetModel(
      id: uniqueId,
      name: name,
      description: description,
      file: file,
    );
  }

  const ThemeAssetModel._();

  static int _counter = 0;
}
