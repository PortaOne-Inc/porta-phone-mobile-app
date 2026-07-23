import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

abstract class UsecaseAuthLogOut {
  FutureOr<void> execute();
}

@Injectable(as: UsecaseAuthLogOut)
class UsecaseAuthLogOutImpl extends UsecaseAuthLogOut {
  UsecaseAuthLogOutImpl({required this.authRepository});

  final AuthRepository authRepository;

  @override
  FutureOr<void> execute() {
    return authRepository.logout();
  }
}
