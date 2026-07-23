class BaseException implements Exception {
  BaseException({
    required this.message,
    this.statusCode,
    this.errorCode,
    this.details,
  });

  final String message;
  final int? statusCode;
  final String? errorCode;
  final Map<String, dynamic>? details;

  @override
  String toString() => message;

  String toDetailedString() {
    final buffer = StringBuffer(message);
    if (statusCode != null) buffer.write(' (HTTP $statusCode)');
    if (errorCode != null) buffer.write(' [$errorCode]');
    return buffer.toString();
  }
}
