import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

/// Refines (nudges) an existing theme using a prompt.
///
/// Delegates to [ThemeRepository.nudgeTheme]. This can target specific
/// config buckets (e.g., colorScheme, widgetConfig, pageConfig) and apply
/// either a "patch" (merge) or "replace" strategy.
abstract class NudgeThemeUsecase {
  Future<void> execute({
    required String applicationId,
    required String themeId,
    required String prompt,
    List<String> targets = const ['colorScheme', 'widgetConfig', 'pageConfig'],
    String variant = 'light',
    String mode = 'patch', // 'patch' | 'replace'
    String? seedColorHint,
  });
}

@Injectable(as: NudgeThemeUsecase)
class NudgeThemeUsecaseImpl extends NudgeThemeUsecase {
  NudgeThemeUsecaseImpl(this._repo);

  final ThemeRepository _repo;

  @override
  Future<void> execute({
    required String applicationId,
    required String themeId,
    required String prompt,
    List<String> targets = const ['colorScheme', 'widgetConfig', 'pageConfig'],
    String variant = 'light',
    String mode = 'patch',
    String? seedColorHint,
  }) {
    return _repo.nudgeTheme(
      applicationId,
      themeId,
      prompt,
      targets: targets,
      variant: variant,
      mode: mode,
      seedColorHint: seedColorHint,
    );
  }
}
