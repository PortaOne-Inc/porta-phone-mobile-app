import 'package:injectable/injectable.dart';

import '../storage/storage.dart';

@lazySingleton
class AuthPrefDatasource {
  AuthPrefDatasource(this.storage);

  final LocalStorage storage;

  static const _authTokenKey = 'AUTH_TOKEN_KEY';
  static const _expiredTimeKey = 'EXPIRED_TIME_KEY';

  Future<void> saveAuthToken(String token, DateTime expiredTime) async {
    await storage.setString(_authTokenKey, token);
    await storage.setString(_expiredTimeKey, expiredTime.toIso8601String());
  }

  String? getAuthToken() {
    return storage.getString(_authTokenKey);
  }

  DateTime? getExpiredTime() {
    final expiredTimeString = storage.getString(_expiredTimeKey);
    return expiredTimeString != null ? DateTime.parse(expiredTimeString) : null;
  }

  Future<void> clean() async {
    await storage.remove(_authTokenKey);
    await storage.remove(_expiredTimeKey);
  }

  bool isAuthTokenExist() {
    return storage.containsKey(_authTokenKey);
  }

  bool isAuthTokenExpired() {
    final expiredTime = getExpiredTime();
    return expiredTime == null || DateTime.now().isAfter(expiredTime);
  }
}
