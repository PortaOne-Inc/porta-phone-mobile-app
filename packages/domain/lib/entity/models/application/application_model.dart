import 'package:freezed_annotation/freezed_annotation.dart';

import 'google_services_model.dart';

part 'application_model.freezed.dart';

@freezed
class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    String? id,
    String? name,
    String? platformIdentifier,
    String? termsConditionsUrl,
    String? coreUrl,
    String? theme,
    GoogleServicesModel? googleServices,
    @Default(0) int version,
  }) = _ApplicationModel;
  const ApplicationModel._();
}

extension ApplicationModelGetters on ApplicationModel {
  bool get isGoogleServicesAvailable => googleServices?.iosUrl != null && googleServices?.androidUrl != null;

  bool get isApplicationHasDefaultThem => theme != null;
}
