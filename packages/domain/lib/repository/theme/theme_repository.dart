import 'package:domain/domain.dart';

/// Contract for working with application themes.
///
/// Provides methods to create, update, delete, fetch, download,
/// and also generate or nudge (AI-assisted updates) for themes.
abstract class ThemeRepository {
  /// Creates a new theme under the given [applicationId].
  ///
  /// Returns the created [ThemeModel].
  Future<ThemeModel> createTheme(
    String applicationId,
    String title,
    String description,
  );

  /// Updates an existing [theme] under the given [applicationId].
  ///
  /// Returns the updated [ThemeModel].
  Future<ThemeModel> updateTheme(String applicationId, ThemeModel? theme);

  /// Deletes the theme with the given [themeId] under the [applicationId].
  ///
  /// Returns `void` when the operation completes.
  Future<void> deleteTheme(String applicationId, String themeId);

  /// Retrieves all themes associated with the given [applicationId].
  ///
  /// Returns a list of [ThemeModel].
  Future<List<ThemeModel>> getApplicationThemes(String applicationId);

  /// Retrieves all themes across all applications.
  ///
  /// Returns a list of [ThemeModel].
  Future<List<ThemeModel>> getAllThemes();

  /// Retrieves a specific theme by [themeId] under the given [applicationId].
  ///
  /// Returns the requested [ThemeModel].
  Future<ThemeModel> getTheme(String applicationId, String themeId);

  /// Downloads theme assets/config for offline use.
  ///
  /// Returns `void` when the operation completes.
  Future<void> downloadTheme(String applicationId, String themeId);

  /// Generates a new theme from a natural-language [prompt].
  ///
  /// Requires:
  /// - [applicationId]: ID of the application to create the theme under
  /// - [title]: title for the new theme
  /// - [description]: description for the new theme
  /// - [prompt]: natural language description of the desired theme
  /// Optional:
  /// - [seedColor]: hex code of a seed color to guide the theme generation
  /// - [variant]: theme variant, either 'light' or 'dark' (defaults to 'light')
  ///
  /// Returns `void` when the theme is successfully generated.
  Future<void> generateTheme({
    required String applicationId,
    required String title,
    required String description,
    required String prompt,
    String? seedColor,
    String variant = 'light',
  });

  /// Nudges (AI-assisted modification) of an existing theme with [themeId].
  ///
  /// Accepts a [prompt] describing the desired changes.
  /// You can specify:
  /// - [targets]: which parts of the theme to update (e.g. `'colorScheme'`, `'widgetConfig'`, `'pageConfig'`)
  /// - [variant]: theme variant to target (defaults to `'light'`)
  /// - [mode]: update mode (`'patch'` to merge changes, `'replace'` to fully override configs)
  /// - [seedColorHint]: optional hint for the AI when adjusting colors
  ///
  /// Returns `void` when the theme is successfully updated.
  Future<void> nudgeTheme(
    String applicationId,
    String themeId,
    String prompt, {
    List<String> targets = const ['colorScheme', 'widgetConfig', 'pageConfig'],
    String variant = 'light',
    String mode = 'patch',
    String? seedColorHint,
  });

  /// Deep-copy an existing theme so edits to the copy do NOT affect the original.
  /// Optional overrides for [title], [description], [label] ('dev' | 'stage' | 'prod').
  Future<ThemeModel> copyTheme(
    String applicationId,
    String themeId, {
    String? title,
    String? description,
    String? label,
  });
}
