import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AuthPrefDatasource {
  AuthPrefDatasource(this.prefs);

  final SharedPreferences prefs;

  static const _authTokenKey = 'AUTH_TOKEN_KEY';
  static const _expiredTimeKey = 'EXPIRED_TIME_KEY';

  Future<void> saveAuthToken(String token, DateTime expiredTime) async {
    await prefs.setString(_authTokenKey, token);
    await prefs.setString(_expiredTimeKey, expiredTime.toIso8601String());
  }

  String? getAuthToken() {
    return prefs.getString(_authTokenKey);
  }

  DateTime? getExpiredTime() {
    final expiredTimeString = prefs.getString(_expiredTimeKey);
    if (expiredTimeString != null) {
      return DateTime.parse(expiredTimeString);
    }
    return null;
  }

  Future<void> clean() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
    await prefs.remove(_expiredTimeKey);
  }

  bool isAuthTokenExist() {
    return prefs.containsKey(_authTokenKey);
  }

  bool isAuthTokenExpired() {
    final expiredTime = getExpiredTime();
    if (expiredTime != null) {
      return DateTime.now().isAfter(expiredTime);
    }
    return true;
  }
}
