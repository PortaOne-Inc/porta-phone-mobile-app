import 'package:data/dto/theme/theme_dto.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

abstract class UsecaseThemeCreate {
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
  });
}

@Injectable(as: UsecaseThemeCreate)
class UsecaseThemeCreateImpl implements UsecaseThemeCreate {
  UsecaseThemeCreateImpl(
      this._themeRepository,
      this.authRepository,
      this.mapper,
      );

  final AuthRepository authRepository;
  final ThemeRepository _themeRepository;
  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required ThemeModel themeModel,
  }) async {
    final theme = await _themeRepository.createTheme(applicationId, mapper.mapToDto(themeModel)!);
    return mapper.mapToModel(theme)!;
  }
}
