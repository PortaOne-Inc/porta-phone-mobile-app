// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_style_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TextStyleDTO _$TextStyleDTOFromJson(Map<String, dynamic> json) {
  return _TextStyleDTO.fromJson(json);
}

/// @nodoc
mixin _$TextStyleDTO {
  String? get name => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get letterSpacing => throw _privateConstructorUsedError;
  double? get wordSpacing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextStyleDTOCopyWith<TextStyleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextStyleDTOCopyWith<$Res> {
  factory $TextStyleDTOCopyWith(
          TextStyleDTO value, $Res Function(TextStyleDTO) then) =
      _$TextStyleDTOCopyWithImpl<$Res, TextStyleDTO>;
  @useResult
  $Res call(
      {String? name,
      double? height,
      double? letterSpacing,
      double? wordSpacing});
}

/// @nodoc
class _$TextStyleDTOCopyWithImpl<$Res, $Val extends TextStyleDTO>
    implements $TextStyleDTOCopyWith<$Res> {
  _$TextStyleDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? height = freezed,
    Object? letterSpacing = freezed,
    Object? wordSpacing = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      letterSpacing: freezed == letterSpacing
          ? _value.letterSpacing
          : letterSpacing // ignore: cast_nullable_to_non_nullable
              as double?,
      wordSpacing: freezed == wordSpacing
          ? _value.wordSpacing
          : wordSpacing // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextStyleDTOCopyWith<$Res>
    implements $TextStyleDTOCopyWith<$Res> {
  factory _$$_TextStyleDTOCopyWith(
          _$_TextStyleDTO value, $Res Function(_$_TextStyleDTO) then) =
      __$$_TextStyleDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      double? height,
      double? letterSpacing,
      double? wordSpacing});
}

/// @nodoc
class __$$_TextStyleDTOCopyWithImpl<$Res>
    extends _$TextStyleDTOCopyWithImpl<$Res, _$_TextStyleDTO>
    implements _$$_TextStyleDTOCopyWith<$Res> {
  __$$_TextStyleDTOCopyWithImpl(
      _$_TextStyleDTO _value, $Res Function(_$_TextStyleDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? height = freezed,
    Object? letterSpacing = freezed,
    Object? wordSpacing = freezed,
  }) {
    return _then(_$_TextStyleDTO(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      letterSpacing: freezed == letterSpacing
          ? _value.letterSpacing
          : letterSpacing // ignore: cast_nullable_to_non_nullable
              as double?,
      wordSpacing: freezed == wordSpacing
          ? _value.wordSpacing
          : wordSpacing // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TextStyleDTO implements _TextStyleDTO {
  const _$_TextStyleDTO(
      {this.name, this.height, this.letterSpacing, this.wordSpacing});

  factory _$_TextStyleDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TextStyleDTOFromJson(json);

  @override
  final String? name;
  @override
  final double? height;
  @override
  final double? letterSpacing;
  @override
  final double? wordSpacing;

  @override
  String toString() {
    return 'TextStyleDTO(name: $name, height: $height, letterSpacing: $letterSpacing, wordSpacing: $wordSpacing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextStyleDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.letterSpacing, letterSpacing) ||
                other.letterSpacing == letterSpacing) &&
            (identical(other.wordSpacing, wordSpacing) ||
                other.wordSpacing == wordSpacing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, height, letterSpacing, wordSpacing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextStyleDTOCopyWith<_$_TextStyleDTO> get copyWith =>
      __$$_TextStyleDTOCopyWithImpl<_$_TextStyleDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TextStyleDTOToJson(
      this,
    );
  }
}

abstract class _TextStyleDTO implements TextStyleDTO {
  const factory _TextStyleDTO(
      {final String? name,
      final double? height,
      final double? letterSpacing,
      final double? wordSpacing}) = _$_TextStyleDTO;

  factory _TextStyleDTO.fromJson(Map<String, dynamic> json) =
      _$_TextStyleDTO.fromJson;

  @override
  String? get name;
  @override
  double? get height;
  @override
  double? get letterSpacing;
  @override
  double? get wordSpacing;
  @override
  @JsonKey(ignore: true)
  _$$_TextStyleDTOCopyWith<_$_TextStyleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
