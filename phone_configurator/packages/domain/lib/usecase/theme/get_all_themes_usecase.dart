import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../models/themes/themes.dart';
import '../../repository/repository.dart';

abstract class GetAllThemesUsecase {
  Future<List<ThemeModel>> execute();
}

@Injectable(as: GetAllThemesUsecase)
class GetAllThemesUsecaseImpl extends GetAllThemesUsecase {
  GetAllThemesUsecaseImpl({required this.themeRepository});

  final ThemeRepository themeRepository;

  @override
  Future<List<ThemeModel>> execute() async {
    return themeRepository.getAllThemes();
  }
}
