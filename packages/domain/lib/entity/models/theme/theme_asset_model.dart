import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_asset_model.freezed.dart';

enum ThemeAssetType {
  unknown,
  rasterImage, // JPEG, PNG, BMP, etc.
  vectorImage, // SVG, etc.
  html,
}

@freezed
class ThemeAssetModel with _$ThemeAssetModel {
  const factory ThemeAssetModel({
    required int id,
    required String name,
    @Default('') String description,
    String? url,
  }) = _ThemeAssetModel;

  factory ThemeAssetModel.create({
    required String name,
    String description = '',
    String? url,
  }) {
    final uniqueId = DateTime.now().millisecondsSinceEpoch;
    return ThemeAssetModel(
      id: uniqueId,
      name: name,
      description: description,
      url: url,
    );
  }

  const ThemeAssetModel._();

  /// Getter to determine the asset type based on the `url` or `path` extension
  ThemeAssetType get inferredType {
    if (url == null || url!.isEmpty) {
      return ThemeAssetType.unknown;
    }

    final uri = Uri.tryParse(url!);
    if (uri == null) {
      return ThemeAssetType.unknown;
    }

    final lastSegment = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
    final cleanedSegment = lastSegment.split('?').first.toLowerCase();
    final extension = cleanedSegment.split('.').last;

    // Check extension for raster and vector images
    switch (extension) {
      // Raster images
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'bmp':
      case 'webp':
        return ThemeAssetType.rasterImage;
      // Vector images
      case 'svg':
        return ThemeAssetType.vectorImage;
      // HTML files
      case 'html':
      case 'htm':
        return ThemeAssetType.html;
      default:
        return ThemeAssetType.unknown;
    }
  }
}
