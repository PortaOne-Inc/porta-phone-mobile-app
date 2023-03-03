// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_common_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThemeCommonDTO _$ThemeCommonDTOFromJson(Map<String, dynamic> json) {
  return _ThemeCommonDTO.fromJson(json);
}

/// @nodoc
mixin _$ThemeCommonDTO {
  String? get appName => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThemeCommonDTOCopyWith<ThemeCommonDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeCommonDTOCopyWith<$Res> {
  factory $ThemeCommonDTOCopyWith(
          ThemeCommonDTO value, $Res Function(ThemeCommonDTO) then) =
      _$ThemeCommonDTOCopyWithImpl<$Res, ThemeCommonDTO>;
  @useResult
  $Res call({String? appName, String? note});
}

/// @nodoc
class _$ThemeCommonDTOCopyWithImpl<$Res, $Val extends ThemeCommonDTO>
    implements $ThemeCommonDTOCopyWith<$Res> {
  _$ThemeCommonDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThemeCommonDTOCopyWith<$Res>
    implements $ThemeCommonDTOCopyWith<$Res> {
  factory _$$_ThemeCommonDTOCopyWith(
          _$_ThemeCommonDTO value, $Res Function(_$_ThemeCommonDTO) then) =
      __$$_ThemeCommonDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? appName, String? note});
}

/// @nodoc
class __$$_ThemeCommonDTOCopyWithImpl<$Res>
    extends _$ThemeCommonDTOCopyWithImpl<$Res, _$_ThemeCommonDTO>
    implements _$$_ThemeCommonDTOCopyWith<$Res> {
  __$$_ThemeCommonDTOCopyWithImpl(
      _$_ThemeCommonDTO _value, $Res Function(_$_ThemeCommonDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = freezed,
    Object? note = freezed,
  }) {
    return _then(_$_ThemeCommonDTO(
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ThemeCommonDTO implements _ThemeCommonDTO {
  const _$_ThemeCommonDTO({this.appName, this.note});

  factory _$_ThemeCommonDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ThemeCommonDTOFromJson(json);

  @override
  final String? appName;
  @override
  final String? note;

  @override
  String toString() {
    return 'ThemeCommonDTO(appName: $appName, note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThemeCommonDTO &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appName, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThemeCommonDTOCopyWith<_$_ThemeCommonDTO> get copyWith =>
      __$$_ThemeCommonDTOCopyWithImpl<_$_ThemeCommonDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThemeCommonDTOToJson(
      this,
    );
  }
}

abstract class _ThemeCommonDTO implements ThemeCommonDTO {
  const factory _ThemeCommonDTO({final String? appName, final String? note}) =
      _$_ThemeCommonDTO;

  factory _ThemeCommonDTO.fromJson(Map<String, dynamic> json) =
      _$_ThemeCommonDTO.fromJson;

  @override
  String? get appName;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$_ThemeCommonDTOCopyWith<_$_ThemeCommonDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
