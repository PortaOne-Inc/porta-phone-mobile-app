import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:data/dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseApplicationDeleteTemplate {
  FutureOr<void> execute({
    required String applicationId,
  });
}

@Injectable(as: UsecaseApplicationDeleteTemplate)
class UsecaseApplicationDeleteTemplateImpl implements UsecaseApplicationDeleteTemplate {
  UsecaseApplicationDeleteTemplateImpl(
    this.applicationRepository,
    this.authRepository,
    this.applicationMapper,
  );

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> applicationMapper;

  @override
  FutureOr<void> execute({required String applicationId}) async {
    await applicationRepository.deleteApplication(applicationId);
    return;
  }
}
