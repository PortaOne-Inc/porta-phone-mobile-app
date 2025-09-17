import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:domain/models/models.dart';
import 'package:domain/repository/repository.dart';

abstract class UpdateApplicationUsecase {
  FutureOr<ApplicationModel> execute(ApplicationModel model);
}

@Injectable(as: UpdateApplicationUsecase)
class UpdateApplicationUsecaseImpl extends UpdateApplicationUsecase {
  UpdateApplicationUsecaseImpl({
    required this.applicationRepository,
    required this.authRepository,
    required this.resourcesRepository,
  });

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final ResourcesRepository resourcesRepository;

  @override
  Future<ApplicationModel> execute(ApplicationModel model) async {
    // Update the application using the repository
    return applicationRepository.updateApplication(model.id!, model);
    // Map the updated DTO back to the ApplicationModel and return
  }
}
