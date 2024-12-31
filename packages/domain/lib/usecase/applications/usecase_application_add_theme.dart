import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseApplicationAddTheme {
  FutureOr<void> execute({
    required String applicationID,
    required ThemeModel themeModel,
  });
}

@Injectable(as: UsecaseApplicationAddTheme)
class UsecaseApplicationAddThemeImpl extends UsecaseApplicationAddTheme {
  UsecaseApplicationAddThemeImpl(
    this.applicationRepository,
    this.authRepository,
  );

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;

  @override
  FutureOr<void> execute({required String applicationID, required ThemeModel themeModel}) async {
    final applications = await applicationRepository.getUserApplications();
    final fountApplication = applications.firstWhere((element) => element.id == applicationID);
    final applicationDTO = fountApplication.copyWith(theme: themeModel.id);
    await applicationRepository.updateApplication(applicationID, applicationDTO);
  }
}
