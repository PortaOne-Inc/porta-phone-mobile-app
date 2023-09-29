import 'package:injectable/injectable.dart';

import 'package:dto/dto.dart';

import '../../entity/entity.dart';
import '../../repository/repository.dart';

abstract class UsecaseThemeGet {
  static const String applicationUsecaseKey = 'applicationUsecaseKey';
  static const String staticUsecaseKey = 'staticUsecaseKey';

  Future<ThemeModel> execute();
}

@Named(UsecaseThemeGet.applicationUsecaseKey)
@Injectable(as: UsecaseThemeGet)
class UsecaseThemeGetImpl implements UsecaseThemeGet {
  UsecaseThemeGetImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.mapper,
    @factoryParam required this.applicationId,
    @factoryParam required this.themeId,
  });

  String applicationId;
  String themeId;
  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel> execute() async {
    final dto = await themeRepository.getTheme(applicationId, themeId);
    return mapper.mapToModel(dto)!;
  }
}

@Named(UsecaseThemeGet.staticUsecaseKey)
@Injectable(as: UsecaseThemeGet)
class UsecaseThemeStaticGetImpl implements UsecaseThemeGet {
  UsecaseThemeStaticGetImpl({
    required this.themeRepository,
    required this.authRepository,
    required this.mapper,
  });

  final ThemeRepository themeRepository;
  final AuthRepository authRepository;

  final Mapper<ThemeDTO?, ThemeModel?> mapper;

  @override
  Future<ThemeModel> execute() async {
    final dto = await themeRepository.getStaticTheme();
    return mapper.mapToModel(dto)!;
  }
}
