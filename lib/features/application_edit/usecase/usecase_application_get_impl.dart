import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:webtrit_configurator/share/share.dart';

import 'usecase_application_get.dart';

@Injectable(as: UsecaseApplicationGet)
class UsecaseApplicationGetImpl extends UsecaseApplicationGet {
  UsecaseApplicationGetImpl({
    required this.applicationRepository,
    required this.authRepository,
    required this.mapper,
  });

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> mapper;

  @override
  FutureOr<ApplicationModel> execute({
    required String id,
  }) async {
    final dto = await applicationRepository.getApplication(
      id,
    );
    return mapper.mapToModel(dto);
  }
}
