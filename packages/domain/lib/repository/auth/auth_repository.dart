abstract class AuthRepository {
  Future<String> login(String email, String password);

  Future<void> logout();

  Future<String?> getUserUID();

  Future<bool> isUserAuthorized();

  Future<void> reset(String email);
}
