class InvalidSizeImageException implements Exception {
  InvalidSizeImageException({required this.maxWidth, required this.maxHeight});

  final String maxWidth;
  final String maxHeight;

  @override
  String toString() {
    return '$maxWidth:$maxHeight';
  }
}
