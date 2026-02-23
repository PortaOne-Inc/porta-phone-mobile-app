import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

abstract class GetApplicationEnvironmentUsecase {
  Future<Map<String, dynamic>> execute({required String applicationId});
}

@Injectable(as: GetApplicationEnvironmentUsecase)
class GetApplicationEnvironmentUsecaseImpl
    implements GetApplicationEnvironmentUsecase {
  GetApplicationEnvironmentUsecaseImpl(this._applicationRepository);

  final ApplicationRepository _applicationRepository;

  @override
  Future<Map<String, dynamic>> execute({required String applicationId}) {
    return _applicationRepository.getApplicationEnvironment(applicationId);
  }
}
