import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UseCaseSetThemeDefault {
  Future<ApplicationModel> execute({
    required String applicationId,
    required String themeId,
  });
}

@Injectable(as: UseCaseSetThemeDefault)
class UseCaseSetThemeDefaultImpl extends UseCaseSetThemeDefault {
  UseCaseSetThemeDefaultImpl(this.applicationRepository, this.authRepository);

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;

  @override
  Future<ApplicationModel> execute({
    required String applicationId,
    required String themeId,
  }) async {
    return applicationRepository.updateApplication(
      applicationId,
      ApplicationModel(id: applicationId, theme: themeId),
    );
  }
}
