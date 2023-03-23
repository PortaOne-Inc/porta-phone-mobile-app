import 'theme/app_configuration_model.dart';

class ApplicationModel {
  ApplicationModel({
    this.id,
    this.theme,
    this.title,
    this.description,
    required this.uuid,
    this.iosIdentifier,
    this.androidIdentifier,
  });

  final String? id;
  final String uuid;
  final AppConfigurationModel? theme;
  final String? title;
  final String? description;
  final String? iosIdentifier;
  final String? androidIdentifier;

  ApplicationModel copyWith({
    String? id,
    String? uuid,
    AppConfigurationModel? theme,
    String? title,
    String? description,
    String? iosIdentifier,
    String? androidIdentifier,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      theme: theme ?? this.theme,
      title: title ?? this.title,
      description: description ?? this.description,
      iosIdentifier: iosIdentifier ?? this.iosIdentifier,
      androidIdentifier: androidIdentifier ?? this.androidIdentifier,
    );
  }
}
