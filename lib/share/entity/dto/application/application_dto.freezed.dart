// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplicationDTO _$ApplicationDTOFromJson(Map<String, dynamic> json) {
  return _ApplicationDTO.fromJson(json);
}

/// @nodoc
mixin _$ApplicationDTO {
  ThemeDTO? get theme => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get platformIdentifier => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationDTOCopyWith<ApplicationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationDTOCopyWith<$Res> {
  factory $ApplicationDTOCopyWith(
          ApplicationDTO value, $Res Function(ApplicationDTO) then) =
      _$ApplicationDTOCopyWithImpl<$Res, ApplicationDTO>;
  @useResult
  $Res call(
      {ThemeDTO? theme, String? name, String? platformIdentifier, String? id});

  $ThemeDTOCopyWith<$Res>? get theme;
}

/// @nodoc
class _$ApplicationDTOCopyWithImpl<$Res, $Val extends ApplicationDTO>
    implements $ApplicationDTOCopyWith<$Res> {
  _$ApplicationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = freezed,
    Object? name = freezed,
    Object? platformIdentifier = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeDTO?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      platformIdentifier: freezed == platformIdentifier
          ? _value.platformIdentifier
          : platformIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThemeDTOCopyWith<$Res>? get theme {
    if (_value.theme == null) {
      return null;
    }

    return $ThemeDTOCopyWith<$Res>(_value.theme!, (value) {
      return _then(_value.copyWith(theme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApplicationDTOCopyWith<$Res>
    implements $ApplicationDTOCopyWith<$Res> {
  factory _$$_ApplicationDTOCopyWith(
          _$_ApplicationDTO value, $Res Function(_$_ApplicationDTO) then) =
      __$$_ApplicationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeDTO? theme, String? name, String? platformIdentifier, String? id});

  @override
  $ThemeDTOCopyWith<$Res>? get theme;
}

/// @nodoc
class __$$_ApplicationDTOCopyWithImpl<$Res>
    extends _$ApplicationDTOCopyWithImpl<$Res, _$_ApplicationDTO>
    implements _$$_ApplicationDTOCopyWith<$Res> {
  __$$_ApplicationDTOCopyWithImpl(
      _$_ApplicationDTO _value, $Res Function(_$_ApplicationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = freezed,
    Object? name = freezed,
    Object? platformIdentifier = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_ApplicationDTO(
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeDTO?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      platformIdentifier: freezed == platformIdentifier
          ? _value.platformIdentifier
          : platformIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplicationDTO implements _ApplicationDTO {
  const _$_ApplicationDTO(
      {this.theme, this.name, this.platformIdentifier, this.id});

  factory _$_ApplicationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ApplicationDTOFromJson(json);

  @override
  final ThemeDTO? theme;
  @override
  final String? name;
  @override
  final String? platformIdentifier;
  @override
  final String? id;

  @override
  String toString() {
    return 'ApplicationDTO(theme: $theme, name: $name, platformIdentifier: $platformIdentifier, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicationDTO &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platformIdentifier, platformIdentifier) ||
                other.platformIdentifier == platformIdentifier) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, theme, name, platformIdentifier, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplicationDTOCopyWith<_$_ApplicationDTO> get copyWith =>
      __$$_ApplicationDTOCopyWithImpl<_$_ApplicationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplicationDTOToJson(
      this,
    );
  }
}

abstract class _ApplicationDTO implements ApplicationDTO {
  const factory _ApplicationDTO(
      {final ThemeDTO? theme,
      final String? name,
      final String? platformIdentifier,
      final String? id}) = _$_ApplicationDTO;

  factory _ApplicationDTO.fromJson(Map<String, dynamic> json) =
      _$_ApplicationDTO.fromJson;

  @override
  ThemeDTO? get theme;
  @override
  String? get name;
  @override
  String? get platformIdentifier;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicationDTOCopyWith<_$_ApplicationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
