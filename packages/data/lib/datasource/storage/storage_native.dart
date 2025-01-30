import 'dart:io';

import 'file_storage.dart';
import 'local_storage.dart';

Future<LocalStorage> providePlatformSpecificStorage() async {
  if (_isCLI) {
    return FileStorage(Directory.systemTemp.path);
  } else {
    throw UnsupportedError('SharedPreferences is not available in CLI mode.');
  }
}

bool get _isCLI {
  try {
    return stdin.hasTerminal && Platform.environment.containsKey('TERM');
  } catch (_) {
    return false;
  }
}
