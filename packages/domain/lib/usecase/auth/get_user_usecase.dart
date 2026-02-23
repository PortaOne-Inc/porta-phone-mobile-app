import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class GetUserUsecase {
  Future<UserMetadata?> execute();
}

@Injectable(as: GetUserUsecase)
class GetUserUsecaseImpl extends GetUserUsecase {
  GetUserUsecaseImpl({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<UserMetadata?> execute() {
    return authRepository.getUser();
  }
}
