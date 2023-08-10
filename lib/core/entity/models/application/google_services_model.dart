import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_services_model.freezed.dart';

@freezed
class GoogleServicesModel with _$GoogleServicesModel {
  const GoogleServicesModel._();

  const factory GoogleServicesModel({
    final String? androidUrl,
    final String? iosUrl,
  }) = _GoogleServicesModel;
}
