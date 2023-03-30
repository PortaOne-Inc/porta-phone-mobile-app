import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_application_delete.dart';

@Injectable(as: UsecaseApplicationDeleteTemplate)
class UsecaseVendorDeleteTemplateImpl implements UsecaseApplicationDeleteTemplate {
  UsecaseVendorDeleteTemplateImpl(this.applicationRepository, this.authRepository, this.applicationMapper);

  final VendorRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> applicationMapper;

  @override
  FutureOr<void> execute({required ApplicationModel model}) async {
    final uid = await authRepository.getUserUID();
    applicationRepository.deleteApplication(uid!, applicationMapper.mapToDto(model));
  }
}
