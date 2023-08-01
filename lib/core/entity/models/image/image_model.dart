import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';

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

  bool get isAvailable => (data?.isNotEmpty ?? false) || url != null;

  bool get isNotAvailable => !isAvailable;

  bool get isVector => mimeSVG == mime;

  bool get isNetwork => url != null;

  bool get isRaster => !isVector;
}
