part of 'auth_cubit.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({AuthenticationStatus? status}) = _Initial;
}
