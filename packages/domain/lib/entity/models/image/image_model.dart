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
    final String? mime,
    final String? extension,
  }) = _ImageModel;

  static String mimeSVG = 'image/svg+xml';
  static String mimePNG = 'image/png';
  static String mimeJPEG = 'image/jpeg';
  static String mimeBMB = 'image/bmp';

  static List<String> get supportedMIME => [
        mimeSVG,
        mimePNG,
        mimeJPEG,
        mimeBMB,
      ];

  bool get isAvailable => location != ImageLocation.empty;

  bool get isNotAvailable => !isAvailable;

  ImageFormat get type {
    if (mimeSVG.contains(mime ?? '')) {
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
