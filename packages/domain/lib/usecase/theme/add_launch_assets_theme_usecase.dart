import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

abstract class AddLaunchAssetsThemeUsecase {
  Future<ThemeModel> execute({
    required String applicationId,
    required String themeId,
    required LaunchAssetsModel launchAssets,
  });
}

@Injectable(as: AddLaunchAssetsThemeUsecase)
class AddLaunchAssetsThemeUsecaseImpl implements AddLaunchAssetsThemeUsecase {
  AddLaunchAssetsThemeUsecaseImpl(
    this._themeRepository,
  );

  final ThemeRepository _themeRepository;

  @override
  Future<ThemeModel> execute({
    required String applicationId,
    required String themeId,
    required LaunchAssetsModel launchAssets,
  }) {
    return _themeRepository.updateLaunchAssets(applicationId, themeId, launchAssets);
  }
}
