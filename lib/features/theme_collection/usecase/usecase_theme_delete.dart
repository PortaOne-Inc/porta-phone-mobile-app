import 'dart:async';

abstract class UsecaseThemeDeleteCreate {
  Future<void> execute({
    required String applicationId,
    required String themeId,
  });
}
