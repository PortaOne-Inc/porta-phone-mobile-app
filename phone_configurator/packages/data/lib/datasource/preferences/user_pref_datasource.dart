import 'package:injectable/injectable.dart';

import '../storage/storage.dart';

@lazySingleton
class UserPrefDatasource {
  UserPrefDatasource(this.storage);

  final LocalStorage storage;

  static const _userIdKey = 'USER_ID_KEY';
  static const _emailKey = 'EMAIL_KEY';

  Future<void> saveUserId(String userId) async {
    await storage.setString(_userIdKey, userId);
  }

  Future<void> saveEmail(String email) async {
    await storage.setString(_emailKey, email);
  }

  String? getUserId() {
    return storage.getString(_userIdKey);
  }

  String? getEmail() {
    return storage.getString(_emailKey);
  }

  Future<void> removeUserId() async {
    await storage.remove(_userIdKey);
  }

  Future<void> removeEmail() async {
    await storage.remove(_emailKey);
  }

  Future<void> clean() async {
    await removeUserId();
    await removeEmail();
  }
}
