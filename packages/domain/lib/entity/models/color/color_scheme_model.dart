import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_scheme_model.freezed.dart';

@freezed
class ColorSchemeModel with _$ColorSchemeModel {
  const factory ColorSchemeModel({
    @Default('#FFFFFF') String seed,
    @Default({}) Map<String, String?> colors,
    List<String>? gradientTabColor,
    LaunchModel? launch,
  }) = _ColorModel;

  const ColorSchemeModel._();

  List<String> get asList => colors.values.nonNulls.toList();
}

@freezed
class LaunchModel with _$LaunchModel {
  const factory LaunchModel({
    String? adaptiveIconBackground,
    String? splashBackground,
  }) = _LaunchModel;
}
