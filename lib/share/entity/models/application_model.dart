class ApplicationModel {
  ApplicationModel({
    this.id,
    this.theme,
    this.name,
    this.platformIdentifier,
    this.version = 0,
  });

  final String? id;
  final String? name;
  final String? platformIdentifier;
  final String? theme;
  final int version;

  ApplicationModel copyWith({
    String? id,
    String? theme,
    String? name,
    String? platformIdentifier,
    int? version,
  }) {
    return ApplicationModel(
      id: id ?? this.id,
      theme: theme ?? this.theme,
      name: name ?? this.name,
      platformIdentifier: platformIdentifier ?? this.platformIdentifier,
      version: version ?? this.version,
    );
  }
}
