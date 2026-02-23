import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:data/dto/dto.dart';
import 'package:data/datasource/datasource.dart';

import 'package:domain/domain.dart';

/// Implementation of the [AuthRepository] interface.
@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  /// Creates an instance of [AuthRepositoryImpl].
  ///
  /// Sets the unauthorized listener for the [configuratorBackandDatasource].
  AuthRepositoryImpl({
    required this.configuratorBackandDatasource,
    required this.authPrefDataSource,
    required this.userPrefDataSource,
  }) {
    configuratorBackandDatasource.setUnauthorizedListener(
      _onBackendUnauthorizedListener,
    );
  }

  final AuthPrefDatasource authPrefDataSource;
  final UserPrefDatasource userPrefDataSource;
  final ConfiguratorBackandDatasource configuratorBackandDatasource;

  late final StreamController<AuthenticationStatus> _tokenExpirationController =
      StreamController<AuthenticationStatus>.broadcast(
        onListen: _emitInitialStatus,
      );

  Future<void> _emitInitialStatus() async {
    _tokenExpirationController.add(await isUserAuthorized());
  }

  /// Logs in a user with the given [email] and [password].
  ///
  /// Returns a [String] containing the JWT token.
  @override
  Future<String> login(String email, String password) async {
    final authResponse = await configuratorBackandDatasource.login(
      LoginCredentials(email: email, password: password),
    );

    final jwtToken = authResponse.token;
    final jwtPayload = JwtPayload.fromJson(JwtDecoder.decode(jwtToken));

    await authPrefDataSource.saveAuthToken(jwtToken, jwtPayload.exp);
    await userPrefDataSource.saveUserId(jwtPayload.userId);
    await userPrefDataSource.saveEmail(jwtPayload.email);

    _tokenExpirationController.add(AuthenticationStatus.authenticated);

    return jwtToken;
  }

  /// Logs out the current user.
  ///
  /// Throws a [BaseException] if the logout fails.
  @override
  Future<void> logout() async {
    try {
      await authPrefDataSource.clean();
      _tokenExpirationController.add(AuthenticationStatus.unauthenticated);
    } on Exception catch (e) {
      throw BaseException(message: 'Logout failed: $e');
    }
  }

  /// Retrieves the current user's metadata.
  ///
  /// Returns a [UserMetadata] object or `null` if the user is not found.
  /// Throws a [BaseException] if the retrieval fails.
  @override
  Future<UserMetadata?> getUser() async {
    try {
      final userId = userPrefDataSource.getUserId();
      final email = userPrefDataSource.getEmail();
      final jwtToken = authPrefDataSource.getAuthToken();
      final expiredTime = authPrefDataSource.getExpiredTime();

      if (userId == null ||
          email == null ||
          jwtToken == null ||
          expiredTime == null) {
        return null;
      }

      return UserMetadata(
        id: userId,
        email: email,
        jwtToken: jwtToken,
        expiredTime: expiredTime,
      );
    } on Exception catch (e) {
      throw BaseException(message: 'Failed to retrieve user: $e');
    }
  }

  /// Checks if the user is authorized.
  ///
  /// Returns a [AuthenticationStatus] indicating the authorization status.
  @override
  Future<AuthenticationStatus> isUserAuthorized() async {
    if (!authPrefDataSource.isAuthTokenExist()) {
      return AuthenticationStatus.unauthenticated;
    }
    return authPrefDataSource.isAuthTokenExpired()
        ? AuthenticationStatus.expired
        : AuthenticationStatus.authenticated;
  }

  /// Monitors the token expiration status.
  ///
  /// Returns a [Stream] of [AuthenticationStatus].
  @override
  Stream<AuthenticationStatus> monitorTokenExpiration() {
    return _tokenExpirationController.stream;
  }

  /// Handles backend unauthorized events.
  Future<void> _onBackendUnauthorizedListener() async {
    _tokenExpirationController.add(await isUserAuthorized());
  }

  /// Disposes the resources used by this repository.
  @override
  @disposeMethod
  void dispose() {
    _tokenExpirationController.close();
  }
}
