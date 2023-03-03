// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThemeDTO _$ThemeDTOFromJson(Map<String, dynamic> json) {
  return _ThemeDTO.fromJson(json);
}

/// @nodoc
mixin _$ThemeDTO {
  String? get id => throw _privateConstructorUsedError;
  TextStyleCollectionDTO? get textStyles => throw _privateConstructorUsedError;
  ThemeCommonDTO? get commonConfig => throw _privateConstructorUsedError;
  ImageCollectionDTO? get images => throw _privateConstructorUsedError;
  ColorDTO? get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemeDTOCopyWith<ThemeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeDTOCopyWith<$Res> {
  factory $ThemeDTOCopyWith(ThemeDTO value, $Res Function(ThemeDTO) then) =
      _$ThemeDTOCopyWithImpl<$Res, ThemeDTO>;
  @useResult
  $Res call(
      {String? id,
      TextStyleCollectionDTO? textStyles,
      ThemeCommonDTO? commonConfig,
      ImageCollectionDTO? images,
      ColorDTO? colors});

  $TextStyleCollectionDTOCopyWith<$Res>? get textStyles;
  $ThemeCommonDTOCopyWith<$Res>? get commonConfig;
  $ImageCollectionDTOCopyWith<$Res>? get images;
  $ColorDTOCopyWith<$Res>? get colors;
}

/// @nodoc
class _$ThemeDTOCopyWithImpl<$Res, $Val extends ThemeDTO>
    implements $ThemeDTOCopyWith<$Res> {
  _$ThemeDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? textStyles = freezed,
    Object? commonConfig = freezed,
    Object? images = freezed,
    Object? colors = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      textStyles: freezed == textStyles
          ? _value.textStyles
          : textStyles // ignore: cast_nullable_to_non_nullable
              as TextStyleCollectionDTO?,
      commonConfig: freezed == commonConfig
          ? _value.commonConfig
          : commonConfig // ignore: cast_nullable_to_non_nullable
              as ThemeCommonDTO?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImageCollectionDTO?,
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TextStyleCollectionDTOCopyWith<$Res>? get textStyles {
    if (_value.textStyles == null) {
      return null;
    }

    return $TextStyleCollectionDTOCopyWith<$Res>(_value.textStyles!, (value) {
      return _then(_value.copyWith(textStyles: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ThemeCommonDTOCopyWith<$Res>? get commonConfig {
    if (_value.commonConfig == null) {
      return null;
    }

    return $ThemeCommonDTOCopyWith<$Res>(_value.commonConfig!, (value) {
      return _then(_value.copyWith(commonConfig: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageCollectionDTOCopyWith<$Res>? get images {
    if (_value.images == null) {
      return null;
    }

    return $ImageCollectionDTOCopyWith<$Res>(_value.images!, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ColorDTOCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $ColorDTOCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ThemeDTOCopyWith<$Res> implements $ThemeDTOCopyWith<$Res> {
  factory _$$_ThemeDTOCopyWith(
          _$_ThemeDTO value, $Res Function(_$_ThemeDTO) then) =
      __$$_ThemeDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      TextStyleCollectionDTO? textStyles,
      ThemeCommonDTO? commonConfig,
      ImageCollectionDTO? images,
      ColorDTO? colors});

  @override
  $TextStyleCollectionDTOCopyWith<$Res>? get textStyles;
  @override
  $ThemeCommonDTOCopyWith<$Res>? get commonConfig;
  @override
  $ImageCollectionDTOCopyWith<$Res>? get images;
  @override
  $ColorDTOCopyWith<$Res>? get colors;
}

/// @nodoc
class __$$_ThemeDTOCopyWithImpl<$Res>
    extends _$ThemeDTOCopyWithImpl<$Res, _$_ThemeDTO>
    implements _$$_ThemeDTOCopyWith<$Res> {
  __$$_ThemeDTOCopyWithImpl(
      _$_ThemeDTO _value, $Res Function(_$_ThemeDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? textStyles = freezed,
    Object? commonConfig = freezed,
    Object? images = freezed,
    Object? colors = freezed,
  }) {
    return _then(_$_ThemeDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      textStyles: freezed == textStyles
          ? _value.textStyles
          : textStyles // ignore: cast_nullable_to_non_nullable
              as TextStyleCollectionDTO?,
      commonConfig: freezed == commonConfig
          ? _value.commonConfig
          : commonConfig // ignore: cast_nullable_to_non_nullable
              as ThemeCommonDTO?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImageCollectionDTO?,
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ThemeDTO implements _ThemeDTO {
  const _$_ThemeDTO(
      {this.id, this.textStyles, this.commonConfig, this.images, this.colors});

  factory _$_ThemeDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ThemeDTOFromJson(json);

  @override
  final String? id;
  @override
  final TextStyleCollectionDTO? textStyles;
  @override
  final ThemeCommonDTO? commonConfig;
  @override
  final ImageCollectionDTO? images;
  @override
  final ColorDTO? colors;

  @override
  String toString() {
    return 'ThemeDTO(id: $id, textStyles: $textStyles, commonConfig: $commonConfig, images: $images, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThemeDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.textStyles, textStyles) ||
                other.textStyles == textStyles) &&
            (identical(other.commonConfig, commonConfig) ||
                other.commonConfig == commonConfig) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.colors, colors) || other.colors == colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, textStyles, commonConfig, images, colors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThemeDTOCopyWith<_$_ThemeDTO> get copyWith =>
      __$$_ThemeDTOCopyWithImpl<_$_ThemeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThemeDTOToJson(
      this,
    );
  }
}

abstract class _ThemeDTO implements ThemeDTO {
  const factory _ThemeDTO(
      {final String? id,
      final TextStyleCollectionDTO? textStyles,
      final ThemeCommonDTO? commonConfig,
      final ImageCollectionDTO? images,
      final ColorDTO? colors}) = _$_ThemeDTO;

  factory _ThemeDTO.fromJson(Map<String, dynamic> json) = _$_ThemeDTO.fromJson;

  @override
  String? get id;
  @override
  TextStyleCollectionDTO? get textStyles;
  @override
  ThemeCommonDTO? get commonConfig;
  @override
  ImageCollectionDTO? get images;
  @override
  ColorDTO? get colors;
  @override
  @JsonKey(ignore: true)
  _$$_ThemeDTOCopyWith<_$_ThemeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
