import 'theme/app_configuration_model.dart';

class ApplicationModel {
  ApplicationModel({
    this.id,
    this.theme,
    this.title,
    this.applicationIdentifier,
  });

  final String? id;
  final AppConfigurationModel? theme;
  final String? title;
  final String? applicationIdentifier;

  ApplicationModel copyWith({
    String? id,
    AppConfigurationModel? theme,
    String? title,
    String? applicationIdentifier,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      theme: theme ?? this.theme,
      title: title ?? this.title,
    );
  }
}
