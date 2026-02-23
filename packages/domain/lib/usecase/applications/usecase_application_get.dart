import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UsecaseApplicationGet {
  Future<ApplicationModel> execute({required String id});
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
  Future<ApplicationModel> execute({required String id}) async {
    return applicationRepository.getApplication(id);
  }
}
