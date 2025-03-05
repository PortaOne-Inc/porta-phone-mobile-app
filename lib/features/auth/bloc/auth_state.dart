part of 'auth_cubit.dart';

enum AuthStatus {
  init,
  expired,
  authenticated,
  notAuthenticated,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.init) AuthStatus status,
  }) = _Initial;
}
