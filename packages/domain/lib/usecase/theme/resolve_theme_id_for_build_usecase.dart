import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

abstract class ResolveThemeIdForBuildUsecase {
  Future<String> execute({required String applicationId, String env});
}

@Injectable(as: ResolveThemeIdForBuildUsecase)
class ResolveThemeIdForBuildUsecaseImpl extends ResolveThemeIdForBuildUsecase {
  ResolveThemeIdForBuildUsecaseImpl(this._repo);

  final ApplicationRepository _repo;

  @override
  Future<String> execute({required String applicationId, String env = 'prod'}) {
    return _repo.resolveThemeIdForBuild(applicationId, env: env);
  }
}
