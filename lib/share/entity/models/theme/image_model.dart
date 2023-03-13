class ImageModel {
  ImageModel({
    this.data,
    this.name,
    this.mime,
    this.extension,
  });

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

  final String? data;
  final String? name;
  final String? mime;
  final String? extension;

  bool get isAvailable => (data?.isNotEmpty ?? false);

  bool get isNotAvailable => !isAvailable;

  bool get isVector => mimeSVG == mime;

  bool get isRaster => !isVector;
}
