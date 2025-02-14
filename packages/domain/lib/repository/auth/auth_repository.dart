import '../../entity/entity.dart';

abstract class AuthRepository {
  Future<String> login(String email, String password);

  Future<void> logout();

  Future<UserMetadata?> getUser();

  Future<bool> isUserAuthorized();

  Future<void> reset(String email);
}
