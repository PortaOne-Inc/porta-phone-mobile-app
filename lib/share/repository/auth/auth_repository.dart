abstract class AuthRepository {
  Future<void> login(String email, String password);

  Future<String?> getUserUID();

  Future<bool> isUserAuthorized();
}
