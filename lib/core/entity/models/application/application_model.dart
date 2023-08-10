import 'package:freezed_annotation/freezed_annotation.dart';

import 'google_services_model.dart';

part 'application_model.freezed.dart';

@freezed
class ApplicationModel with _$ApplicationModel {
  const ApplicationModel._();

  const factory ApplicationModel({
    final String? id,
    final String? name,
    final String? platformIdentifier,
    final String? theme,
    final GoogleServicesModel? googleServices,
    @Default(0) final int version,
  }) = _ApplicationModel;
}
