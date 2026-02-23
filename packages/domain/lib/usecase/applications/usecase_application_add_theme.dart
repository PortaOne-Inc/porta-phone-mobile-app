import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/repository/repository.dart';
import 'package:domain/models/models.dart';

abstract class UsecaseApplicationAddTheme {
  Future<void> execute({
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
  Future<void> execute({
    required String applicationID,
    required ThemeModel themeModel,
  }) async {
    final applications = await applicationRepository.getUserApplications();
    final fountApplication = applications.firstWhere(
      (element) => element.id == applicationID,
    );
    final applicationDTO = fountApplication.copyWith(theme: themeModel.id);
    await applicationRepository.updateApplication(
      applicationID,
      applicationDTO,
    );
  }
}
