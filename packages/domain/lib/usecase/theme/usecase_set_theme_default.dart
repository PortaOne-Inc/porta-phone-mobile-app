import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:data/dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UseCaseSetThemeDefault {
  Future<ApplicationModel> execute({
    required String applicationId,
    required String themeId,
  });
}

@Injectable(as: UseCaseSetThemeDefault)
class UseCaseSetThemeDefaultImpl extends UseCaseSetThemeDefault {
  UseCaseSetThemeDefaultImpl(
    this.applicationRepository,
    this.authRepository,
    this.applicationMapper,
  );

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> applicationMapper;

  @override
  Future<ApplicationModel> execute({
    required String applicationId,
    required String themeId,
  }) async {
    final dto = await applicationRepository.updateApplication(
      applicationId,
      ApplicationDTO(id: applicationId, theme: themeId),
    );
    return applicationMapper.mapToModel(dto);
  }
}
