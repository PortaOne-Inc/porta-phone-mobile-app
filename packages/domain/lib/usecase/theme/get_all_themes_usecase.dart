import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../models/themes/theme_model.dart';
import '../../repository/repository.dart';

abstract class GetAllThemesUsecase {
  FutureOr<List<ThemeModel>> execute();
}

@Injectable(as: GetAllThemesUsecase)
class GetAllThemesUsecaseImpl extends GetAllThemesUsecase {
  GetAllThemesUsecaseImpl({
    required this.themeRepository,
  });

  final ThemeRepository themeRepository;

  @override
  FutureOr<List<ThemeModel>> execute() async {
    return themeRepository.getAllThemes();
  }
}
