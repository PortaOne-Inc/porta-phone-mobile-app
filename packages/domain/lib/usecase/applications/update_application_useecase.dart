import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UpdateApplicationUsecase {
  FutureOr<ApplicationModel> execute(ApplicationModel model);
}

@Injectable(as: UpdateApplicationUsecase)
class UpdateApplicationUsecaseImpl extends UpdateApplicationUsecase {
  UpdateApplicationUsecaseImpl({
    required this.applicationRepository,
    required this.authRepository,
    required this.resourcesRepository,
    required this.mapper,
  });

  final ApplicationRepository applicationRepository;
  final AuthRepository authRepository;
  final ResourcesRepository resourcesRepository;

  final Mapper<ApplicationDTO, ApplicationModel> mapper;

  @override
  Future<ApplicationModel> execute(ApplicationModel model) async {
    final dto = mapper.mapToDto(model);

    // Update the application using the repository
    final updatedDto = await applicationRepository.updateApplication(model.id!, dto);
    // Map the updated DTO back to the ApplicationModel and return
    return mapper.mapToModel(updatedDto);
  }
}
