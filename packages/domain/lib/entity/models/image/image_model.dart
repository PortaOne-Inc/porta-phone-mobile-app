import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';

enum ImageFormat {
  vector,
  raster,
}

enum ImageLocation {
  network,
  memory,
  empty,
}

@freezed
class ImageModel with _$ImageModel {
  const ImageModel._();

  const factory ImageModel({
    final String? data,
    final String? url,
    final String? name,
    final String? extension,
  }) = _ImageModel;

  factory ImageModel.svg(String base64) => ImageModel(
        data: base64,
        extension: formatSVG,
      );

  factory ImageModel.png(String base64) => ImageModel(
        data: base64,
        extension: formatPNG,
      );

  static String formatSVG = 'svg';
  static String formatPNG = 'png';

  static List<String> get supportedFormats => [
        formatSVG,
        formatPNG,
      ];

  bool get isAvailable => location != ImageLocation.empty;

  bool get isNotAvailable => !isAvailable;

  ImageFormat get type {
    if (formatSVG == extension) {
      return ImageFormat.vector;
    } else {
      return ImageFormat.raster;
    }
  }

  ImageLocation get location {
    if (url != null) {
      return ImageLocation.network;
    } else if (data != null) {
      return ImageLocation.memory;
    } else {
      return ImageLocation.empty;
    }
  }
}
