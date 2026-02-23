import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_metadata.freezed.dart';

@unfreezed
sealed class UserMetadata with _$UserMetadata {
  factory UserMetadata({
    required String id,
    required String email,
    required String jwtToken,
    DateTime? expiredTime,
  }) = _UserMetadata;
}
