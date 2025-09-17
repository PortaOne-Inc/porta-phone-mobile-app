import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

abstract class UpdateThemeBindingsUsecase {
  Future<ApplicationModel> execute({
    required String applicationId,
    String? defaultThemeId,
    Map<String, String>? themeByEnv,
  });
}

@Injectable(as: UpdateThemeBindingsUsecase)
class UpdateThemeBindingsUsecaseImpl extends UpdateThemeBindingsUsecase {
  UpdateThemeBindingsUsecaseImpl(this._repo);

  final ApplicationRepository _repo;

  @override
  Future<ApplicationModel> execute({
    required String applicationId,
    String? defaultThemeId,
    Map<String, String>? themeByEnv,
  }) {
    return _repo.updateThemeBindings(
      applicationId,
      defaultThemeId: defaultThemeId,
      themeByEnv: themeByEnv,
    );
  }
}
