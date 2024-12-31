import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseApplicationGet {
  FutureOr<ApplicationModel> execute({
    required String id,
  });
}

@Injectable(as: UsecaseApplicationGet)
class UsecaseApplicationGetImpl extends UsecaseApplicationGet {
  UsecaseApplicationGetImpl({
    required this.applicationRepository,
    required this.authRepository,
  });

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;

  @override
  FutureOr<ApplicationModel> execute({
    required String id,
  }) async {
    return applicationRepository.getApplication(
      id,
    );
  }
}
