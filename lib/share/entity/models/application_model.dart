class ApplicationModel {
  final String? id;
  final String uuid;
  final String? theme;
  final String title;
  final String description;

  ApplicationModel({
    required this.id,
    this.theme,
    required this.title,
    required this.description,
    required this.uuid,
  });

  ApplicationModel copyWith({
    final String? id,
    final String? uuid,
    final String? theme,
    final String? title,
    final String? description,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      theme: theme ?? this.theme,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
