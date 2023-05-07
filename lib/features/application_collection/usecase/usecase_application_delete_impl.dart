import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_application_delete.dart';

@Injectable(as: UsecaseApplicationDeleteTemplate)
class UsecaseVendorDeleteTemplateImpl implements UsecaseApplicationDeleteTemplate {
  UsecaseVendorDeleteTemplateImpl(this.applicationRepository, this.authRepository, this.applicationMapper);

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> applicationMapper;

  @override
  FutureOr<void> execute({required String applicationId}) async {
    await applicationRepository.deleteApplication(applicationId);
    return;
  }
}
