import 'theme/app_configuration_model.dart';

class ApplicationModel {
  ApplicationModel({
    this.id,
    this.theme,
    this.name,
    this.platformIdentifier,
  });

  final String? id;
  final String? name;
  final String? platformIdentifier;
  final AppConfigurationModel? theme;

  ApplicationModel copyWith({
    String? id,
    AppConfigurationModel? theme,
    String? name,
    String? platformIdentifier,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      theme: theme ?? this.theme,
      name: name ?? this.name,
      platformIdentifier: platformIdentifier ?? this.platformIdentifier,
    );
  }
}
