// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JwtPayload _$JwtPayloadFromJson(Map<String, dynamic> json) => _JwtPayload(
  iss: json['iss'] as String,
  aud: json['aud'] as String,
  authTime: const TimestampConverter().fromJson(
    (json['auth_time'] as num).toInt(),
  ),
  userId: json['user_id'] as String,
  sub: json['sub'] as String,
  iat: const TimestampConverter().fromJson((json['iat'] as num).toInt()),
  exp: const TimestampConverter().fromJson((json['exp'] as num).toInt()),
  email: json['email'] as String,
  emailVerified: json['email_verified'] as bool,
  firebase: JwtPayloadFirebase.fromJson(
    json['firebase'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$JwtPayloadToJson(_JwtPayload instance) =>
    <String, dynamic>{
      'iss': instance.iss,
      'aud': instance.aud,
      'auth_time': const TimestampConverter().toJson(instance.authTime),
      'user_id': instance.userId,
      'sub': instance.sub,
      'iat': const TimestampConverter().toJson(instance.iat),
      'exp': const TimestampConverter().toJson(instance.exp),
      'email': instance.email,
      'email_verified': instance.emailVerified,
      'firebase': instance.firebase,
    };

_JwtPayloadFirebase _$JwtPayloadFirebaseFromJson(Map<String, dynamic> json) =>
    _JwtPayloadFirebase(
      identities: JwtPayloadFirebaseIdentities.fromJson(
        json['identities'] as Map<String, dynamic>,
      ),
      signInProvider: json['sign_in_provider'] as String,
    );

Map<String, dynamic> _$JwtPayloadFirebaseToJson(_JwtPayloadFirebase instance) =>
    <String, dynamic>{
      'identities': instance.identities,
      'sign_in_provider': instance.signInProvider,
    };

_JwtPayloadFirebaseIdentities _$JwtPayloadFirebaseIdentitiesFromJson(
  Map<String, dynamic> json,
) => _JwtPayloadFirebaseIdentities(
  email: (json['email'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$JwtPayloadFirebaseIdentitiesToJson(
  _JwtPayloadFirebaseIdentities instance,
) => <String, dynamic>{'email': instance.email};
