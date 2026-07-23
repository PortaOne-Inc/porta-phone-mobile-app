import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

abstract class CopyThemeToApplicationUsecase {
  Future<ThemeModel> execute({
    required String applicationId,
    required String themeId,
    required String targetApplicationId,
    String? title,
    String? description,
    String? label,
  });
}

@Injectable(as: CopyThemeToApplicationUsecase)
class CopyThemeToApplicationUsecaseImpl extends CopyThemeToApplicationUsecase {
  CopyThemeToApplicationUsecaseImpl(this._repo);

  final ThemeRepository _repo;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required String themeId,
    required String targetApplicationId,
    String? title,
    String? description,
    String? label,
  }) {
    return _repo.copyThemeToApplication(
      applicationId,
      themeId,
      targetApplicationId: targetApplicationId,
      title: title,
      description: description,
      label: label,
    );
  }
}
