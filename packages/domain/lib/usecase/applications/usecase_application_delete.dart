import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../repository/repository.dart';

abstract class UsecaseApplicationDeleteTemplate {
  FutureOr<void> execute({required String applicationId});
}

@Injectable(as: UsecaseApplicationDeleteTemplate)
class UsecaseApplicationDeleteTemplateImpl
    implements UsecaseApplicationDeleteTemplate {
  UsecaseApplicationDeleteTemplateImpl(
    this.applicationRepository,
    this.authRepository,
  );

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;

  @override
  FutureOr<void> execute({required String applicationId}) async {
    await applicationRepository.deleteApplication(applicationId);
    return;
  }
}
