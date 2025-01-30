import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage.dart';

@Named('SharedPrefsStorage')
@Injectable(as: LocalStorage)
class SharedPreferencesStorage implements LocalStorage {
  SharedPreferencesStorage(this.prefs);

  final SharedPreferences prefs;

  @override
  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  String? getString(String key) {
    return prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  @override
  bool containsKey(String key) {
    return prefs.containsKey(key);
  }
}
