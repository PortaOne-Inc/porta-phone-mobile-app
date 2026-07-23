import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_credentials.freezed.dart';

part 'login_credentials.g.dart';

@unfreezed
sealed class LoginCredentials with _$LoginCredentials {
  factory LoginCredentials({required String email, required String password}) =
      _LoginCredentials;

  factory LoginCredentials.fromJson(Map<String, dynamic> json) =>
      _$LoginCredentialsFromJson(json);
}
