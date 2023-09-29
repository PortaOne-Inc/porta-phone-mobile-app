// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ColorDTOImpl _$$ColorDTOImplFromJson(Map<String, dynamic> json) =>
    _$ColorDTOImpl(
      primary: json['primary'] as String?,
      onPrimary: json['onPrimary'] as String?,
      secondary: json['secondary'] as String?,
      secondaryContainer: json['secondaryContainer'] as String?,
      onSecondaryContainer: json['onSecondaryContainer'] as String?,
      tertiary: json['tertiary'] as String?,
      error: json['error'] as String?,
      outline: json['outline'] as String?,
      background: json['background'] as String?,
      onBackground: json['onBackground'] as String?,
      surface: json['surface'] as String?,
      onSurface: json['onSurface'] as String?,
      gradientTabColor: (json['gradientTabColor'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      launch: json['launch'] == null
          ? null
          : LaunchDTO.fromJson(json['launch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ColorDTOImplToJson(_$ColorDTOImpl instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'onPrimary': instance.onPrimary,
      'secondary': instance.secondary,
      'secondaryContainer': instance.secondaryContainer,
      'onSecondaryContainer': instance.onSecondaryContainer,
      'tertiary': instance.tertiary,
      'error': instance.error,
      'outline': instance.outline,
      'background': instance.background,
      'onBackground': instance.onBackground,
      'surface': instance.surface,
      'onSurface': instance.onSurface,
      'gradientTabColor': instance.gradientTabColor,
      'launch': instance.launch,
    };

_$LaunchDTOImpl _$$LaunchDTOImplFromJson(Map<String, dynamic> json) =>
    _$LaunchDTOImpl(
      adaptiveIconBackground: json['adaptiveIconBackground'] as String?,
      splashBackground: json['splashBackground'] as String?,
    );

Map<String, dynamic> _$$LaunchDTOImplToJson(_$LaunchDTOImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adaptiveIconBackground', instance.adaptiveIconBackground);
  writeNotNull('splashBackground', instance.splashBackground);
  return val;
}
