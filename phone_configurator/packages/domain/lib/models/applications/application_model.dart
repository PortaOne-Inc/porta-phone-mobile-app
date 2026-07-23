import 'package:freezed_annotation/freezed_annotation.dart';

import 'build_version_model.dart';

part 'application_model.freezed.dart';

@freezed
sealed class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    String? id,
    String? name,
    Map<String, dynamic>? environment,
    String? iosPlatformId,
    String? androidPlatformId,
    String? termsConditionsUrl,
    BuildVersionModel? appVersion,
    BuildVersionModel? androidVersion,
    BuildVersionModel? iosVersion,
    String? theme,
  }) = _ApplicationModel;

  const ApplicationModel._();
}
