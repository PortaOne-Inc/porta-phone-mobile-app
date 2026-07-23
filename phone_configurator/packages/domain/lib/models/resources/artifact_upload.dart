import 'dart:typed_data';

class ArtifactUpload {
  ArtifactUpload({
    required this.target,
    required this.mimeType,
    required this.bytes,
  });

  final String target;
  final String mimeType;
  final Uint8List bytes;
}

class SplashUploadTarget {
  static const String splash = 'splash';
  static const String android12Splash = 'android12Splash';
}
