import 'dart:async';

import 'package:domain/entity/entity.dart';
import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';

abstract class GetUserUsecase {
  Future<UserMetadata?> execute();
}

@Injectable(as: GetUserUsecase)
class GetUserUsecaseImpl extends GetUserUsecase {
  GetUserUsecaseImpl({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<UserMetadata?> execute() {
    return authRepository.getUser();
  }
}
