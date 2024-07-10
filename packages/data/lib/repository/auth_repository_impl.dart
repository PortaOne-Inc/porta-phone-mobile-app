import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:data/dto/auth/auth.dart';

import 'package:domain/domain.dart';

import 'package:data/datasource/datasource.dart';

// TODO(DMITRO): Models can be used in both the data and domain layers to ensure a proper way to return models from a repository.
// TODO(DMITRO): The domain layer should be aware of DTOs
@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.configuratorBackandDatasource,
    required this.authPrefDataSource,
    required this.userPrefDataSource,
  });

  final AuthPrefDatasource authPrefDataSource;
  final UserPrefDatasource userPrefDataSource;
  final ConfiguratorBackandDatasource configuratorBackandDatasource;

  @override
  Future<String> login(String email, String password) async {
    final authResponse = await configuratorBackandDatasource.login(LoginCredentials(email: email, password: password));

    final jwtToken = authResponse.token;
    final jwtPayload = JwtPayload.fromJson(JwtDecoder.decode(jwtToken));

    await authPrefDataSource.saveAuthToken(jwtToken, jwtPayload.exp);
    await userPrefDataSource.saveUserId(jwtPayload.userId);
    await userPrefDataSource.saveEmail(jwtPayload.email);

    return jwtToken;
  }

  @override
  Future<void> logout() async {
    try {
      return await authPrefDataSource.clean();
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<String?> getUserUID() async {
    // TODO(Serdun): remove this method
    return userPrefDataSource.getUserId();
  }

  @override
  Future<bool> isUserAuthorized() {
    return Future.value(authPrefDataSource.isAuthTokenExist());
  }

  @override
  Future<void> reset(String email) {
    // TODO(Serdun): implement method
    return Future.value();
  }
}
