import 'dart:async';

import 'package:injectable/injectable.dart';

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
  );

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;

  @override
  FutureOr<List<ApplicationModel>> execute({void argument}) async {
    return applicationRepository.getUserApplications();
  }
}
