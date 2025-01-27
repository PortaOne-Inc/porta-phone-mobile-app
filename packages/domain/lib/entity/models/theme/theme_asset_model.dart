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

  /// Getter to determine the asset type based on the `url` or `path` extension
  ThemeAssetType get inferredType {
    if (url == null || url!.isEmpty) {
      return ThemeAssetType.unknown;
    }

    // Extract the meaningful part of the URL or path
    final uri = Uri.tryParse(url!);
    if (uri == null) {
      return ThemeAssetType.unknown;
    }

    // Get the last segment of the path and remove query parameters
    final lastSegment = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
    final cleanedSegment = lastSegment.split('?').first.toLowerCase();

    // Extract the extension and match it with known types
    final extension = cleanedSegment.split('.').last;
    print('extension: $extension');
    switch (extension) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'bmp':
      case 'svg':
      case 'webp':
        return ThemeAssetType.image;
      case 'html':
      case 'htm':
        return ThemeAssetType.html;
      default:
        return ThemeAssetType.unknown;
    }
  }
}
