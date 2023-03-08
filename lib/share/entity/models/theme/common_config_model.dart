class CommonConfigModel {
  final String appName;

  CommonConfigModel({
    required this.appName,
  });

  CommonConfigModel copyWith({
    final String? appName,
  }) {
    return CommonConfigModel(
      appName: appName ?? this.appName,
    );
  }
}
