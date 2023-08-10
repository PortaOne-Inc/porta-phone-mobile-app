import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthFirebaseData {
  const AuthFirebaseData(this.firebaseAuth);

  final FirebaseAuth firebaseAuth;

  Future checkCredential(String emailAddress, String password) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }

  Future logout() {
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
