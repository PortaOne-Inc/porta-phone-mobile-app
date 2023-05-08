import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webtrit_configurator/share/share.dart';

import 'usecase_application_create.dart';

@Injectable(as: UsecaseApplicationCreate)
class UsecaseApplicationCreateImpl extends UsecaseApplicationCreate {
  UsecaseApplicationCreateImpl(this.applicationRepository, this.authRepository, this.mapper);

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> mapper;

  @override
  FutureOr<ApplicationModel> execute({required ApplicationModel argument}) async {
    final dto = await applicationRepository.createApplication(mapper.mapToDto(argument));
    return mapper.mapToModel(dto);
  }
}
