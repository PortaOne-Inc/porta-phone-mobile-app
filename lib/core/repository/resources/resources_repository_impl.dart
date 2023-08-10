import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'resources_repository.dart';

@Injectable(as: ResourcesRepository)
class ResourcesRepositoryImpl extends ResourcesRepository {
  ResourcesRepositoryImpl(this.firebaseStorage);

  final FirebaseStorage firebaseStorage;

  @override
  Future<String> putBytes(String folder, String name, Uint8List data) async {
    final storageRef = firebaseStorage.ref();
    final mountainImagesRef = storageRef.child('$folder/$name');
    final res = await mountainImagesRef.putData(data);
    return res.ref.getDownloadURL();
  }

  @override
  Future<String> putBase64(String folder, String name, String data) async {
    final storageRef = firebaseStorage.ref();
    final mountainImagesRef = storageRef.child('$folder/$name}');
    final res = await mountainImagesRef.putString(data, format: PutStringFormat.base64);
    return res.ref.getDownloadURL();
  }
}
