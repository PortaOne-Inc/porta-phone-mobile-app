import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_application_add_theme.dart';

@Injectable(as: UsecaseApplicationAddTheme)
class UsecaseApplicationAddThemeImpl extends UsecaseApplicationAddTheme {
  UsecaseApplicationAddThemeImpl(this.applicationRepository, this.authRepository, this.applicationMapper, this.themeMapper);

  final VendorRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<VendorDTO, ApplicationModel> applicationMapper;
  final Mapper<ThemeDTO?, AppConfigurationModel> themeMapper;

  @override
  FutureOr<void> execute({required String applicationID, required AppConfigurationModel themeModel}) async {
    final uid = await authRepository.getUserUID();
    final applications = await applicationRepository.getUserApplications(uid!);
    final fountApplication = applications.firstWhere((element) => element.id == applicationID);
    final applicationDTO = fountApplication.copyWith(theme: themeMapper.mapToDto(themeModel));
    applicationRepository.updateApplication(uid, applicationDTO);
  }
}
