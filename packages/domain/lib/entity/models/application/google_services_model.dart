import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_services_model.freezed.dart';

@freezed
class GoogleServicesModel with _$GoogleServicesModel {
  const factory GoogleServicesModel({
    String? androidUrl,
    String? iosUrl,
  }) = _GoogleServicesModel;
  const GoogleServicesModel._();
}
