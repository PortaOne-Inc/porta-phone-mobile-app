import 'local_storage.dart';

Future<LocalStorage> providePlatformSpecificStorage() {
  throw UnsupportedError('Storage is not supported on this platform.');
}
