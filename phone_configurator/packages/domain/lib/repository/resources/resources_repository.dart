import 'dart:typed_data';

abstract class ResourcesRepository {
  Future<String> putBytes(String folder, String name, Uint8List data);

  Future<String> putBase64(String folder, String name, String data);

  Future<void> delete(String url);
}
