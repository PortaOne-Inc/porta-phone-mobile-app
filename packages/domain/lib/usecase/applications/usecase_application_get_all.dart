import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseApplicationGetAll {
  FutureOr<List<ApplicationModel>> execute();
}

@Injectable(as: UsecaseApplicationGetAll)
class UsecaseApplicationGetAllImpl implements UsecaseApplicationGetAll {
  UsecaseApplicationGetAllImpl(
    this.applicationRepository,
    this.authRepository,
    this.applicationMapper,
  );

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<ApplicationDTO, ApplicationModel> applicationMapper;

  @override
  FutureOr<List<ApplicationModel>> execute({void argument}) async {
    final result = await applicationRepository.getUserApplications();
    return result.map(applicationMapper.mapToModel).toList();
  }
}
