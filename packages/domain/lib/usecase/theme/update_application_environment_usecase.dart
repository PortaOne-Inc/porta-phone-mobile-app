import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

abstract class UpdateApplicationEnvironmentUsecase {
  Future<Map<String, dynamic>> execute({
    required String applicationId,
    required Map<String, dynamic> environment,
  });
}

@Injectable(as: UpdateApplicationEnvironmentUsecase)
class UpdateApplicationEnvironmentUsecaseImpl
    implements UpdateApplicationEnvironmentUsecase {
  UpdateApplicationEnvironmentUsecaseImpl(this._applicationRepository);

  final ApplicationRepository _applicationRepository;

  @override
  Future<Map<String, dynamic>> execute({
    required String applicationId,
    required Map<String, dynamic> environment,
  }) {
    return _applicationRepository.updateApplicationEnvironment(
      applicationId,
      environment,
    );
  }
}
