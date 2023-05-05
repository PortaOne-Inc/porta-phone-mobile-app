import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webtrit_configurator/features/application_collection/usecase/usecase_application_inc_version.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_application_add_theme.dart';

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
