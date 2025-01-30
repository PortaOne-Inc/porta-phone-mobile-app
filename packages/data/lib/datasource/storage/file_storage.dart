import 'dart:io';

import 'package:injectable/injectable.dart';

import 'local_storage.dart';

@Named('FileStorage')
@Injectable(as: LocalStorage)
class FileStorage implements LocalStorage {
  FileStorage(this.directory);

  final String directory;

  File _getFile(String key) => File('$directory/$key.txt');

  @override
  Future<void> setString(String key, String value) async {
    await _getFile(key).writeAsString(value);
  }

  @override
  String? getString(String key) {
    final file = _getFile(key);
    return file.existsSync() ? file.readAsStringSync() : null;
  }

  @override
  Future<void> remove(String key) async {
    final file = _getFile(key);
    if (file.existsSync()) {
      await file.delete();
    }
  }

  @override
  bool containsKey(String key) {
    return _getFile(key).existsSync();
  }
}
