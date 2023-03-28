import 'theme/app_configuration_model.dart';

class ApplicationModel {
  ApplicationModel({
    this.id,
    this.theme,
    this.name,
    this.applicationIdentifier,
  });

  final String? id;
  final String? name;
  final String? applicationIdentifier;
  final AppConfigurationModel? theme;

  ApplicationModel copyWith({
    String? id,
    AppConfigurationModel? theme,
    String? name,
    String? applicationIdentifier,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      theme: theme ?? this.theme,
      name: name ?? this.name,
      applicationIdentifier: applicationIdentifier ?? this.applicationIdentifier,
    );
  }
}
