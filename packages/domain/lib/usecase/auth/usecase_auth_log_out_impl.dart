import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';
import 'usecase_auth_log_out.dart';

@Injectable(as: UsecaseAuthLogOut)
class UsecaseAuthLogOutImpl extends UsecaseAuthLogOut {
  UsecaseAuthLogOutImpl({
    required this.authRepository,
  });
  final AuthRepository authRepository;

  @override
  FutureOr<void> execute() {
    return authRepository.logout();
  }
}
