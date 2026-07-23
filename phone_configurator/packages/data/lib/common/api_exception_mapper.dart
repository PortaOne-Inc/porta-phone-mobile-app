import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

/// Runs [body] and converts any failure into a domain exception.
///
/// A [DioException] is mapped via [mapDioException] (so HTTP 401/409 become their
/// typed subclasses); any other error becomes a [BaseException]. Wrap every
/// backend call with this so repositories never leak a raw [DioException] and the
/// error contract is enforced in one place instead of copied per method.
Future<T> guardApiCall<T>(Future<T> Function() body) async {
  try {
    return await body();
  } on DioException catch (e) {
    throw mapDioException(e);
  } catch (e) {
    throw BaseException(message: e.toString());
  }
}

/// Maps a [DioException] to a typed [BaseException].
///
/// Parses the backend JSON response to extract structured error info:
/// `message`, `statusCode`, `error`, `details.exceptionCode`, `details.cause`.
///
/// Returns [VersionConflictException] for HTTP 409 and
/// [UnauthorizedException] for HTTP 401.
BaseException mapDioException(DioException e) {
  final response = e.response;
  final statusCode = response?.statusCode;
  final data = response?.data;

  String? message;
  String? errorCode;
  Map<String, dynamic>? details;

  if (data is Map<String, dynamic>) {
    message = _extractMessage(data);
    final detailsRaw = data['details'];
    if (detailsRaw is Map<String, dynamic>) {
      errorCode = detailsRaw['exceptionCode'] as String?;
      details = detailsRaw;
    }
  }

  final resolvedMessage = message ?? e.message ?? 'Network error';

  if (statusCode == 409) {
    return VersionConflictException(
      message: resolvedMessage,
      statusCode: statusCode,
      errorCode: errorCode,
      details: details,
    );
  }

  if (statusCode == 401) {
    return UnauthorizedException(
      message: resolvedMessage,
      statusCode: statusCode,
      errorCode: errorCode,
      details: details,
    );
  }

  return BaseException(message: resolvedMessage, statusCode: statusCode, errorCode: errorCode, details: details);
}

String? _extractMessage(Map<String, dynamic> body) {
  final msg = body['message'];
  if (msg is String) return msg;
  if (msg is List) return msg.join(', ');
  if (msg != null) return msg.toString();

  final error = body['error'];
  if (error is String) return error;

  return null;
}
