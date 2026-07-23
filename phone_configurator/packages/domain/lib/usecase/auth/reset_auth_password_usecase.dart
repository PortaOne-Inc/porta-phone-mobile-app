import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';

abstract class ResetAuthPasswordUsecase {
  FutureOr<void> execute({required String email});
}

// TODO(Serdun): Temporary disable this usecase
@Injectable(as: ResetAuthPasswordUsecase)
class ResetAuthPasswordUsecaseHandler extends ResetAuthPasswordUsecase {
  ResetAuthPasswordUsecaseHandler({required this.authRepository});

  final AuthRepository authRepository;

  @override
  FutureOr<void> execute({required String email}) {
    return Future.value();
  }
}
