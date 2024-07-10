import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class UserPrefDatasource {
  UserPrefDatasource(this.prefs);

  final SharedPreferences prefs;

  static const _userIdKey = 'USER_ID_KEY';
  static const _emailKey = 'EMAIL_KEY';

  Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
  }

  String? getUserId() {
    return prefs.getString(_userIdKey);
  }

  String? getEmail() {
    return prefs.getString(_emailKey);
  }

  Future<void> removeUserId() async {
    await prefs.remove(_userIdKey);
  }

  Future<void> removeEmail() async {
    await prefs.remove(_emailKey);
  }

  Future<void> clean() async {
    await removeUserId();
    await removeEmail();
  }
}
