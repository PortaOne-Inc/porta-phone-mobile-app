import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UsecaseApplicationGetAll {
  Future<List<ApplicationModel>> execute();
}

@Injectable(as: UsecaseApplicationGetAll)
class UsecaseApplicationGetAllImpl implements UsecaseApplicationGetAll {
  UsecaseApplicationGetAllImpl(this.applicationRepository, this.authRepository);

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;

  @override
  Future<List<ApplicationModel>> execute() async {
    return applicationRepository.getUserApplications();
  }
}
