import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:data/data/data.dart';
import 'package:domain/exception/exception.dart';
import 'package:domain/repository/repository.dart';

// TODO(DMITRO): Models can be used in both the data and domain layers to ensure a proper way to return models from a repository.
// TODO(DMITRO): The domain layer should be aware of DTOs
@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.datasource,
  });

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

  @override
  Future<void> logout() async {
    try {
      return await datasource.logout();
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

  Future<UserCredential> _tryLogin(String email, String password) async {
    return datasource.checkCredential(email, password);
  }

  @override
  Future<bool> isUserAuthorized() {
    return datasource.isAuthorized();
  }

  @override
  Future<void> reset(String email) {
    return datasource.reset(email);
  }
}
