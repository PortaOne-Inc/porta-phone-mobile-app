import 'dart:async';

import 'package:webtrit_phone/services/services.dart';

class MockRemoteCacheConfigService implements RemoteCacheConfigService {
  final Map<String, Object> _storage = {};

  @override
  String? getString(String key) {
    final value = _storage[key];
    return value is String ? value : null;
  }

  @override
  bool? getBool(String key) {
    final value = _storage[key];
    return value is bool ? value : null;
  }

  @override
  Future<void> cacheString(String key, String value) {
    return _updateStorage(key, value);
  }

  @override
  Future<void> cacheBool(String key, bool value) {
    return _updateStorage(key, value);
  }

  Future<void> _updateStorage(String key, Object value) async {
    _storage[key] = value;
  }
}
