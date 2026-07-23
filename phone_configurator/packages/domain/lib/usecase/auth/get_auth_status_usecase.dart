import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class GetAuthStatusUsecase {
  FutureOr<AuthenticationStatus> execute();
}

@Injectable(as: GetAuthStatusUsecase)
class GetAuthStatusUsecaseHandler extends GetAuthStatusUsecase {
  GetAuthStatusUsecaseHandler({required this.authRepository});

  final AuthRepository authRepository;

  @override
  FutureOr<AuthenticationStatus> execute({void argument}) {
    return authRepository.isUserAuthorized();
  }
}
