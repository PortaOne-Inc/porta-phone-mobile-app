import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:data/dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseApplicationIncVersion {
  FutureOr<ApplicationModel> execute({
    required String applicationId,
  });
}

@Injectable(as: UsecaseApplicationIncVersion)
class UsecaseApplicationIncVersionImpl extends UsecaseApplicationIncVersion {
  UsecaseApplicationIncVersionImpl(
      this.applicationRepository,
      this.applicationMapper,
      );

  final ApplicationRepository applicationRepository;
  final Mapper<ApplicationDTO, ApplicationModel> applicationMapper;

  @override
  FutureOr<ApplicationModel> execute({required String applicationId}) async {
    final result = await applicationRepository.incApplicationVersion(applicationId);
    return applicationMapper.mapToModel(result);
  }
}
