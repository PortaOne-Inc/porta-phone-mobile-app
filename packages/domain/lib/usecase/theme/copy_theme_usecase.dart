import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

abstract class CopyThemeUsecase {
  Future<ThemeModel> execute({
    required String applicationId,
    required String themeId,
    String? title,
    String? description,
    String? label, // 'dev' | 'stage' | 'prod'
  });
}

@Injectable(as: CopyThemeUsecase)
class CopyThemeUsecaseImpl extends CopyThemeUsecase {
  CopyThemeUsecaseImpl(this._repo);

  final ThemeRepository _repo;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required String themeId,
    String? title,
    String? description,
    String? label,
  }) {
    return _repo.copyTheme(
      applicationId,
      themeId,
      title: title,
      description: description,
      label: label,
    );
  }
}
