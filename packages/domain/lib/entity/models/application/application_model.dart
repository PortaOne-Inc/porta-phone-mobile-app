import 'package:freezed_annotation/freezed_annotation.dart';

import 'build_version_model.dart';

part 'application_model.freezed.dart';

@freezed
class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    String? id,
    String? name,
    String? iosPlatformId,
    String? androidPlatformId,
    String? termsConditionsUrl,
    BuildVersionModel? androidVersion,
    BuildVersionModel? iosVersion,
    String? coreUrl,
    String? theme,
    @Default(false) bool demo,
  }) = _ApplicationModel;

  const ApplicationModel._();
}
