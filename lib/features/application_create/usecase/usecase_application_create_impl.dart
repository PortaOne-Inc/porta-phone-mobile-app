import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webtrit_configurator/share/share.dart';

import 'usecase_application_create.dart';

@Injectable(as: UsecaseApplicationCreate)
class UsecaseApplicationCreateImpl extends UsecaseApplicationCreate {
  UsecaseApplicationCreateImpl(this.applicationRepository, this.authRepository, this.mapper);

  final VendorRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<VendorDTO, ApplicationModel> mapper;

  @override
  FutureOr<ApplicationModel> execute({required ApplicationModel argument}) async {
    final uid = await authRepository.getUserUID();
    final dto = await applicationRepository.createApplication(uid!, mapper.mapToDto(argument));
    return mapper.mapToModel(dto);
  }
}
