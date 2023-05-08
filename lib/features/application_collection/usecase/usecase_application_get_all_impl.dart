import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_application_get_all.dart';

@Injectable(as: UsecaseApplicationGetAll)
class UsecaseApplicationGetAllImpl implements UsecaseApplicationGetAll {
  UsecaseApplicationGetAllImpl(this.applicationRepository, this.authRepository, this.applicationMapper);

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> applicationMapper;

  @override
  FutureOr<List<ApplicationModel>> execute({void argument}) async {
    final result = await applicationRepository.getUserApplications();
    return result.map((e) => applicationMapper.mapToModel(e)).toList();
  }
}
