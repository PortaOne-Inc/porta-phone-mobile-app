import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.datasource});

  static const String _exceptionCodeNoUser = 'user-not-found';
  static const String _exceptionCodeWrongPassword = 'wrong-password';

  final AuthFirebaseData datasource;

  @override
  Future<void> login(String email, String password) async {
    try {
      await _tryLogin(email, password);
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  void _handleFirebaseAuthException(FirebaseAuthException? e) {
    switch (e?.code) {
      case _exceptionCodeNoUser:
        throw AuthUserNotFountException();
      case _exceptionCodeWrongPassword:
        throw AuthUserNotFountException();
    }

    throw BaseException(message: e.toString());
  }

  @override
  Future<String?> getUserUID() async {
    return datasource.getUID();
  }

  Future<void> _tryLogin(String email, String password) async {
   return await datasource.checkCredential(email, password);
  }

  @override
  Future<bool> isUserAuthorized() {
    return datasource.isAuthorized();
  }
}
