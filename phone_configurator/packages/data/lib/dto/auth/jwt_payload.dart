import 'package:freezed_annotation/freezed_annotation.dart';

import '../converter/converter.dart';

part 'jwt_payload.freezed.dart';

part 'jwt_payload.g.dart';

@unfreezed
sealed class JwtPayload with _$JwtPayload {
  factory JwtPayload({
    required String iss,
    required String aud,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'auth_time')
    @TimestampConverter()
    required DateTime authTime,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'user_id') required String userId,
    required String sub,
    @TimestampConverter() required DateTime iat,
    @TimestampConverter() required DateTime exp,
    required String email,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'email_verified') required bool emailVerified,
    required JwtPayloadFirebase firebase,
  }) = _JwtPayload;

  factory JwtPayload.fromJson(Map<String, dynamic> json) =>
      _$JwtPayloadFromJson(json);
}

@unfreezed
sealed class JwtPayloadFirebase with _$JwtPayloadFirebase {
  factory JwtPayloadFirebase({
    required JwtPayloadFirebaseIdentities identities,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'sign_in_provider') required String signInProvider,
  }) = _JwtPayloadFirebase;

  factory JwtPayloadFirebase.fromJson(Map<String, dynamic> json) =>
      _$JwtPayloadFirebaseFromJson(json);
}

@unfreezed
sealed class JwtPayloadFirebaseIdentities with _$JwtPayloadFirebaseIdentities {
  factory JwtPayloadFirebaseIdentities({required List<String> email}) =
      _JwtPayloadFirebaseIdentities;

  factory JwtPayloadFirebaseIdentities.fromJson(Map<String, dynamic> json) =>
      _$JwtPayloadFirebaseIdentitiesFromJson(json);
}
