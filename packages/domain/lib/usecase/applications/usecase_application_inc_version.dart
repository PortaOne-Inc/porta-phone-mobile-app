import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseApplicationIncVersion {
  FutureOr<ApplicationModel> execute({
    required String applicationId,
  });
}

@Injectable(as: UsecaseApplicationIncVersion)
class UsecaseApplicationIncVersionImpl extends UsecaseApplicationIncVersion {
  UsecaseApplicationIncVersionImpl(
    this.applicationRepository,
  );

  final ApplicationRepository applicationRepository;

  @override
  FutureOr<ApplicationModel> execute({required String applicationId}) async {
    return applicationRepository.incApplicationVersion(applicationId);
  }
}
