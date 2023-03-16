import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_theme_do_as_default.dart';

@Injectable(as: SetThemeForApplicationUseCase)
class SetThemeForApplicationUseCaseImpl extends SetThemeForApplicationUseCase {
  SetThemeForApplicationUseCaseImpl(
      this.applicationRepository, this.authRepository, this.applicationMapper, this.themeModel);

  final VendorRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<VendorDTO, ApplicationModel> applicationMapper;
  final Mapper<ThemeDTO, AppConfigurationModel> themeModel;

  @override
  FutureOr<void> execute({required String applicationID, required AppConfigurationModel themeModel}) async {
    final uid = await authRepository.getUserUID();
    final applications = await applicationRepository.getUserApplications(uid!);
    final fountApplication = applications.firstWhere((element) => element.id == applicationID);
    final applicationDTO = fountApplication.copyWith(theme: themeModel.id);
    applicationRepository.updateApplication(uid, applicationDTO);
  }
}
