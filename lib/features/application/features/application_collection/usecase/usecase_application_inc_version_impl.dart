import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webtrit_configurator/features/application/features/application_collection/usecase/usecase_application_inc_version.dart';

import 'package:webtrit_configurator/core/core.dart';

@Injectable(as: UsecaseApplicationIncVersion)
class UsecaseApplicationIncVersionImpl extends UsecaseApplicationIncVersion {
  UsecaseApplicationIncVersionImpl(this.applicationRepository, this.applicationMapper);

  final ApplicationRepository applicationRepository;
  final Mapper<ApplicationDTO, ApplicationModel> applicationMapper;

  @override
  FutureOr<ApplicationModel> execute({required String applicationId}) async {
    final result = await applicationRepository.incApplicationVersion(applicationId);
    return applicationMapper.mapToModel(result);
  }
}
