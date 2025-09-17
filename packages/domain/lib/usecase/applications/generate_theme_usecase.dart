import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

/// Generates a new theme from a natural-language description.
///
/// Delegates to [ThemeRepository.generateTheme]. Does not return a value;
/// callers can re-fetch themes or listen to UI/state updates as needed.
abstract class GenerateThemeUsecase {
  Future<void> execute({
    required String applicationId,
    required String title,
    required String description,
    required String prompt,
    String? seedColor,
    String variant = 'light',
  });
}

@Injectable(as: GenerateThemeUsecase)
class GenerateThemeUsecaseImpl extends GenerateThemeUsecase {
  GenerateThemeUsecaseImpl(this._repo);

  final ThemeRepository _repo;

  @override
  Future<void> execute({
    required String applicationId,
    required String title,
    required String description,
    required String prompt,
    String? seedColor,
    String variant = 'light',
  }) {
    return _repo.generateTheme(
      applicationId: applicationId,
      title: title,
      description: description,
      prompt: prompt,
      seedColor: seedColor,
      variant: variant,
    );
  }
}
