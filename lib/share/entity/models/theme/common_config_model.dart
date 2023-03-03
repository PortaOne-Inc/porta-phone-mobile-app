class CommonConfigModel {
  final String appName;
  final String note;

  CommonConfigModel({required this.appName, required this.note});

  CommonConfigModel copyWith({
    final String? appName,
    final String? note,
  }) {
    return CommonConfigModel(
      appName: appName ?? this.appName,
      note: note ?? this.note,
    );
  }
}
