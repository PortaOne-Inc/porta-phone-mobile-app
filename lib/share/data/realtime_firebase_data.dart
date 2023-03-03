import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@singleton
class RealtimeFirebaseData {
  const RealtimeFirebaseData({required this.firebaseDatabase});

  final FirebaseDatabase firebaseDatabase;

  Future<List<MapEntry<K, V>>> get<K, V>(String path) async {
    final reference = await firebaseDatabase.ref('/').child(path).once();
    final snapshot = reference.snapshot.value;

    if (snapshot == null) return [];
    if (snapshot is! Map) return [];

    return (snapshot).entries.map((e) => MapEntry<K, V>(e.key, e.value)).toList();
  }

  Future<void> delete(String path) async {
    final reference = await firebaseDatabase.ref('/').child(path).once();
    reference.snapshot.ref.remove();
  }

  Future<void> patch(String path, Map<String, dynamic> data) async {
    //todo fix workaround
    final firebaseSupportedMap = jsonDecode(jsonEncode(data));
    final reference = await firebaseDatabase.ref('/').child(path).once();
    await reference.snapshot.ref.update(firebaseSupportedMap);
  }

  Future<String?> post(String path, Map<String, dynamic> data) async {
    //todo fix workaround
    final firebaseSupportedMap = jsonDecode(jsonEncode(data));
    final reference = firebaseDatabase.ref(path).push();
    await reference.set(firebaseSupportedMap);
    return reference.key;
  }
}
