import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage.dart';
import 'shared_preferences.dart';

Future<LocalStorage> providePlatformSpecificStorage() async {
  final prefs = await SharedPreferences.getInstance();
  return SharedPreferencesStorage(prefs);
}
