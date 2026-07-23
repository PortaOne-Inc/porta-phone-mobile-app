import 'dart:typed_data';

class ArtifactUploadWire {
  ArtifactUploadWire({
    required this.target,
    required this.mimeType,
    required this.bytes,
  });

  final String target;
  final String mimeType;
  final Uint8List bytes;
}
