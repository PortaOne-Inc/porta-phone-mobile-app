/// Enum representing the authentication status of a user.
enum AuthenticationStatus {
  /// The user is authenticated, and the token is available and not expired.
  authenticated,

  /// The user is unauthenticated, either because there is no cached token or the token has expired.
  unauthenticated,

  /// The token is available but has expired.
  expired,
}
