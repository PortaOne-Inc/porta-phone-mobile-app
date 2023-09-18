// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApplicationModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get platformIdentifier => throw _privateConstructorUsedError;
  String? get coreUrl => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;
  GoogleServicesModel? get googleServices => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationModelCopyWith<ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationModelCopyWith<$Res> {
  factory $ApplicationModelCopyWith(
          ApplicationModel value, $Res Function(ApplicationModel) then) =
      _$ApplicationModelCopyWithImpl<$Res, ApplicationModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? platformIdentifier,
      String? coreUrl,
      String? theme,
      GoogleServicesModel? googleServices,
      int version});

  $GoogleServicesModelCopyWith<$Res>? get googleServices;
}

/// @nodoc
class _$ApplicationModelCopyWithImpl<$Res, $Val extends ApplicationModel>
    implements $ApplicationModelCopyWith<$Res> {
  _$ApplicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? platformIdentifier = freezed,
    Object? coreUrl = freezed,
    Object? theme = freezed,
    Object? googleServices = freezed,
    Object? version = null,
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
      platformIdentifier: freezed == platformIdentifier
          ? _value.platformIdentifier
          : platformIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      coreUrl: freezed == coreUrl
          ? _value.coreUrl
          : coreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      googleServices: freezed == googleServices
          ? _value.googleServices
          : googleServices // ignore: cast_nullable_to_non_nullable
              as GoogleServicesModel?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GoogleServicesModelCopyWith<$Res>? get googleServices {
    if (_value.googleServices == null) {
      return null;
    }

    return $GoogleServicesModelCopyWith<$Res>(_value.googleServices!, (value) {
      return _then(_value.copyWith(googleServices: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApplicationModelCopyWith<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  factory _$$_ApplicationModelCopyWith(
          _$_ApplicationModel value, $Res Function(_$_ApplicationModel) then) =
      __$$_ApplicationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? platformIdentifier,
      String? coreUrl,
      String? theme,
      GoogleServicesModel? googleServices,
      int version});

  @override
  $GoogleServicesModelCopyWith<$Res>? get googleServices;
}

/// @nodoc
class __$$_ApplicationModelCopyWithImpl<$Res>
    extends _$ApplicationModelCopyWithImpl<$Res, _$_ApplicationModel>
    implements _$$_ApplicationModelCopyWith<$Res> {
  __$$_ApplicationModelCopyWithImpl(
      _$_ApplicationModel _value, $Res Function(_$_ApplicationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? platformIdentifier = freezed,
    Object? coreUrl = freezed,
    Object? theme = freezed,
    Object? googleServices = freezed,
    Object? version = null,
  }) {
    return _then(_$_ApplicationModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      platformIdentifier: freezed == platformIdentifier
          ? _value.platformIdentifier
          : platformIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      coreUrl: freezed == coreUrl
          ? _value.coreUrl
          : coreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      googleServices: freezed == googleServices
          ? _value.googleServices
          : googleServices // ignore: cast_nullable_to_non_nullable
              as GoogleServicesModel?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ApplicationModel extends _ApplicationModel {
  const _$_ApplicationModel(
      {this.id,
      this.name,
      this.platformIdentifier,
      this.coreUrl,
      this.theme,
      this.googleServices,
      this.version = 0})
      : super._();

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? platformIdentifier;
  @override
  final String? coreUrl;
  @override
  final String? theme;
  @override
  final GoogleServicesModel? googleServices;
  @override
  @JsonKey()
  final int version;

  @override
  String toString() {
    return 'ApplicationModel(id: $id, name: $name, platformIdentifier: $platformIdentifier, coreUrl: $coreUrl, theme: $theme, googleServices: $googleServices, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platformIdentifier, platformIdentifier) ||
                other.platformIdentifier == platformIdentifier) &&
            (identical(other.coreUrl, coreUrl) || other.coreUrl == coreUrl) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.googleServices, googleServices) ||
                other.googleServices == googleServices) &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, platformIdentifier,
      coreUrl, theme, googleServices, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplicationModelCopyWith<_$_ApplicationModel> get copyWith =>
      __$$_ApplicationModelCopyWithImpl<_$_ApplicationModel>(this, _$identity);
}

abstract class _ApplicationModel extends ApplicationModel {
  const factory _ApplicationModel(
      {final String? id,
      final String? name,
      final String? platformIdentifier,
      final String? coreUrl,
      final String? theme,
      final GoogleServicesModel? googleServices,
      final int version}) = _$_ApplicationModel;
  const _ApplicationModel._() : super._();

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get platformIdentifier;
  @override
  String? get coreUrl;
  @override
  String? get theme;
  @override
  GoogleServicesModel? get googleServices;
  @override
  int get version;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicationModelCopyWith<_$_ApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
