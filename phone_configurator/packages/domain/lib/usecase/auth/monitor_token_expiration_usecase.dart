import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/models/models.dart';

abstract class MonitorTokenExpirationUsecase {
  Stream<AuthenticationStatus> execute();
}

@Injectable(as: MonitorTokenExpirationUsecase)
class MonitorTokenExpirationUsecaseImpl extends MonitorTokenExpirationUsecase {
  MonitorTokenExpirationUsecaseImpl({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Stream<AuthenticationStatus> execute() {
    return authRepository.monitorTokenExpiration();
  }
}
