import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthFirebaseData {
  const AuthFirebaseData(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;

  Future<UserCredential> checkCredential(String emailAddress, String password) {
    return firebaseAuth.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }

  Future<void> logout() {
    return firebaseAuth.signOut();
  }

  Future<String?> getUID() async {
    final uid = firebaseAuth.currentUser?.uid;
    return uid;
  }

  Future<bool> isAuthorized() async {
    return firebaseAuth.currentUser != null;
  }

  Future<void> reset(String email) async {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
