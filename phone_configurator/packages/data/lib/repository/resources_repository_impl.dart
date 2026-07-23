import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

@Injectable(as: ResourcesRepository)
class ResourcesRepositoryImpl extends ResourcesRepository {
  ResourcesRepositoryImpl(this.firebaseStorage);

  final FirebaseStorage firebaseStorage;

  @override
  Future<String> putBytes(String folder, String name, Uint8List data) async {
    final storageRef = firebaseStorage.ref();
    final ref = storageRef.child('$folder/$name');
    final res = await ref.putData(data);
    return res.ref.getDownloadURL();
  }

  @override
  Future<String> putBase64(String folder, String name, String data) async {
    final storageRef = firebaseStorage.ref();
    final ref = storageRef.child('$folder/$name');
    final res = await ref.putString(data, format: PutStringFormat.base64);
    return res.ref.getDownloadURL();
  }

  @override
  Future<void> delete(String url) {
    final storageRef = firebaseStorage.refFromURL(url);
    return storageRef.delete();
  }
}
