import 'package:domain/models/models.dart';

/// An abstract class that defines the contract for authentication-related operations.
abstract class AuthRepository {
  /// Logs in a user with the provided [email] and [password].
  ///
  /// Returns a [Future] that completes with a [String] token if the login is successful.
  /// Throws an exception if the login fails.
  Future<String> login(String email, String password);

  /// Logs out the currently authenticated user.
  ///
  /// Returns a [Future] that completes when the logout operation is finished.
  Future<void> logout();

  /// Retrieves the metadata of the currently authenticated user.
  ///
  /// Returns a [Future] that completes with a [UserMetadata] object if the user is authenticated,
  /// or `null` if no user is authenticated.
  Future<UserMetadata?> getUser();

  /// Checks if the currently authenticated user's token is still valid.
  ///
  /// Returns a [Future] that completes with a [AuthenticationStatus] indicating the token's status.
  Future<AuthenticationStatus> isUserAuthorized();

  /// Monitors the token expiration status of the currently authenticated user.
  ///
  /// Returns a [Stream] that emits [AuthenticationStatus] updates.
  Stream<AuthenticationStatus> monitorTokenExpiration();

  /// Disposes the resources.dart used by this repository.
  void dispose();
}
