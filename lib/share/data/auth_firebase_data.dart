import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthFirebaseData {
  const AuthFirebaseData(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;

  Future checkCredential(String emailAddress, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }

  Future<String?> getUID() async {
    final uid = firebaseAuth.currentUser?.uid;
    return uid;
  }

  Future<bool> isAuthorized() async {
    return firebaseAuth.currentUser != null;
  }
}
