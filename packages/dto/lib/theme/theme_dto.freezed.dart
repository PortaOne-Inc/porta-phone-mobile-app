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
  String? get name => throw _privateConstructorUsedError;
  String? get fontFamily => throw _privateConstructorUsedError;
  ImageCollectionDTO? get images => throw _privateConstructorUsedError;
  ColorDTO? get colors => throw _privateConstructorUsedError;
  TextsDTO? get texts => throw _privateConstructorUsedError;
  Map<String, dynamic>? get style => throw _privateConstructorUsedError;

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
      String? name,
      String? fontFamily,
      ImageCollectionDTO? images,
      ColorDTO? colors,
      TextsDTO? texts,
      Map<String, dynamic>? style});

  $ImageCollectionDTOCopyWith<$Res>? get images;
  $ColorDTOCopyWith<$Res>? get colors;
  $TextsDTOCopyWith<$Res>? get texts;
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
    Object? name = freezed,
    Object? fontFamily = freezed,
    Object? images = freezed,
    Object? colors = freezed,
    Object? texts = freezed,
    Object? style = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fontFamily: freezed == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImageCollectionDTO?,
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorDTO?,
      texts: freezed == texts
          ? _value.texts
          : texts // ignore: cast_nullable_to_non_nullable
              as TextsDTO?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $TextsDTOCopyWith<$Res>? get texts {
    if (_value.texts == null) {
      return null;
    }

    return $TextsDTOCopyWith<$Res>(_value.texts!, (value) {
      return _then(_value.copyWith(texts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThemeDTOImplCopyWith<$Res>
    implements $ThemeDTOCopyWith<$Res> {
  factory _$$ThemeDTOImplCopyWith(
          _$ThemeDTOImpl value, $Res Function(_$ThemeDTOImpl) then) =
      __$$ThemeDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? fontFamily,
      ImageCollectionDTO? images,
      ColorDTO? colors,
      TextsDTO? texts,
      Map<String, dynamic>? style});

  @override
  $ImageCollectionDTOCopyWith<$Res>? get images;
  @override
  $ColorDTOCopyWith<$Res>? get colors;
  @override
  $TextsDTOCopyWith<$Res>? get texts;
}

/// @nodoc
class __$$ThemeDTOImplCopyWithImpl<$Res>
    extends _$ThemeDTOCopyWithImpl<$Res, _$ThemeDTOImpl>
    implements _$$ThemeDTOImplCopyWith<$Res> {
  __$$ThemeDTOImplCopyWithImpl(
      _$ThemeDTOImpl _value, $Res Function(_$ThemeDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? fontFamily = freezed,
    Object? images = freezed,
    Object? colors = freezed,
    Object? texts = freezed,
    Object? style = freezed,
  }) {
    return _then(_$ThemeDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fontFamily: freezed == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImageCollectionDTO?,
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorDTO?,
      texts: freezed == texts
          ? _value.texts
          : texts // ignore: cast_nullable_to_non_nullable
              as TextsDTO?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeDTOImpl implements _ThemeDTO {
  const _$ThemeDTOImpl(
      {this.id,
      this.name,
      this.fontFamily,
      this.images,
      this.colors,
      this.texts,
      this.style});

  factory _$ThemeDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeDTOImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? fontFamily;
  @override
  final ImageCollectionDTO? images;
  @override
  final ColorDTO? colors;
  @override
  final TextsDTO? texts;
  @override
  final Map<String, dynamic>? style;

  @override
  String toString() {
    return 'ThemeDTO(id: $id, name: $name, fontFamily: $fontFamily, images: $images, colors: $colors, texts: $texts, style: $style)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.texts, texts) || other.texts == texts) &&
            const DeepCollectionEquality().equals(other.style, style));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, fontFamily, images,
      colors, texts, const DeepCollectionEquality().hash(style));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeDTOImplCopyWith<_$ThemeDTOImpl> get copyWith =>
      __$$ThemeDTOImplCopyWithImpl<_$ThemeDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeDTOImplToJson(
      this,
    );
  }
}

abstract class _ThemeDTO implements ThemeDTO {
  const factory _ThemeDTO(
      {final String? id,
      final String? name,
      final String? fontFamily,
      final ImageCollectionDTO? images,
      final ColorDTO? colors,
      final TextsDTO? texts,
      final Map<String, dynamic>? style}) = _$ThemeDTOImpl;

  factory _ThemeDTO.fromJson(Map<String, dynamic> json) =
      _$ThemeDTOImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get fontFamily;
  @override
  ImageCollectionDTO? get images;
  @override
  ColorDTO? get colors;
  @override
  TextsDTO? get texts;
  @override
  Map<String, dynamic>? get style;
  @override
  @JsonKey(ignore: true)
  _$$ThemeDTOImplCopyWith<_$ThemeDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
