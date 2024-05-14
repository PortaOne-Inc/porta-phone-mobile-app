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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApplicationModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @Deprecated('Use will be removed soon, use ios/android instead')
  String? get platformIdentifier => throw _privateConstructorUsedError;
  String? get iosPlatformId => throw _privateConstructorUsedError;
  String? get androidPlatformId => throw _privateConstructorUsedError;
  String? get termsConditionsUrl => throw _privateConstructorUsedError;
  BuildVersionModel? get androidVersion => throw _privateConstructorUsedError;
  BuildVersionModel? get iosVersion => throw _privateConstructorUsedError;
  String? get coreUrl => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;
  GoogleServicesModel? get googleServices => throw _privateConstructorUsedError;
  @Deprecated('Use will be removed soon, use ios/android instead')
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
      @Deprecated('Use will be removed soon, use ios/android instead')
      String? platformIdentifier,
      String? iosPlatformId,
      String? androidPlatformId,
      String? termsConditionsUrl,
      BuildVersionModel? androidVersion,
      BuildVersionModel? iosVersion,
      String? coreUrl,
      String? theme,
      GoogleServicesModel? googleServices,
      @Deprecated('Use will be removed soon, use ios/android instead')
      int version});

  $BuildVersionModelCopyWith<$Res>? get androidVersion;
  $BuildVersionModelCopyWith<$Res>? get iosVersion;
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
    Object? iosPlatformId = freezed,
    Object? androidPlatformId = freezed,
    Object? termsConditionsUrl = freezed,
    Object? androidVersion = freezed,
    Object? iosVersion = freezed,
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
      iosPlatformId: freezed == iosPlatformId
          ? _value.iosPlatformId
          : iosPlatformId // ignore: cast_nullable_to_non_nullable
              as String?,
      androidPlatformId: freezed == androidPlatformId
          ? _value.androidPlatformId
          : androidPlatformId // ignore: cast_nullable_to_non_nullable
              as String?,
      termsConditionsUrl: freezed == termsConditionsUrl
          ? _value.termsConditionsUrl
          : termsConditionsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      androidVersion: freezed == androidVersion
          ? _value.androidVersion
          : androidVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionModel?,
      iosVersion: freezed == iosVersion
          ? _value.iosVersion
          : iosVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionModel?,
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
  $BuildVersionModelCopyWith<$Res>? get androidVersion {
    if (_value.androidVersion == null) {
      return null;
    }

    return $BuildVersionModelCopyWith<$Res>(_value.androidVersion!, (value) {
      return _then(_value.copyWith(androidVersion: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BuildVersionModelCopyWith<$Res>? get iosVersion {
    if (_value.iosVersion == null) {
      return null;
    }

    return $BuildVersionModelCopyWith<$Res>(_value.iosVersion!, (value) {
      return _then(_value.copyWith(iosVersion: value) as $Val);
    });
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
abstract class _$$ApplicationModelImplCopyWith<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  factory _$$ApplicationModelImplCopyWith(_$ApplicationModelImpl value,
          $Res Function(_$ApplicationModelImpl) then) =
      __$$ApplicationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      @Deprecated('Use will be removed soon, use ios/android instead')
      String? platformIdentifier,
      String? iosPlatformId,
      String? androidPlatformId,
      String? termsConditionsUrl,
      BuildVersionModel? androidVersion,
      BuildVersionModel? iosVersion,
      String? coreUrl,
      String? theme,
      GoogleServicesModel? googleServices,
      @Deprecated('Use will be removed soon, use ios/android instead')
      int version});

  @override
  $BuildVersionModelCopyWith<$Res>? get androidVersion;
  @override
  $BuildVersionModelCopyWith<$Res>? get iosVersion;
  @override
  $GoogleServicesModelCopyWith<$Res>? get googleServices;
}

/// @nodoc
class __$$ApplicationModelImplCopyWithImpl<$Res>
    extends _$ApplicationModelCopyWithImpl<$Res, _$ApplicationModelImpl>
    implements _$$ApplicationModelImplCopyWith<$Res> {
  __$$ApplicationModelImplCopyWithImpl(_$ApplicationModelImpl _value,
      $Res Function(_$ApplicationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? platformIdentifier = freezed,
    Object? iosPlatformId = freezed,
    Object? androidPlatformId = freezed,
    Object? termsConditionsUrl = freezed,
    Object? androidVersion = freezed,
    Object? iosVersion = freezed,
    Object? coreUrl = freezed,
    Object? theme = freezed,
    Object? googleServices = freezed,
    Object? version = null,
  }) {
    return _then(_$ApplicationModelImpl(
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
      iosPlatformId: freezed == iosPlatformId
          ? _value.iosPlatformId
          : iosPlatformId // ignore: cast_nullable_to_non_nullable
              as String?,
      androidPlatformId: freezed == androidPlatformId
          ? _value.androidPlatformId
          : androidPlatformId // ignore: cast_nullable_to_non_nullable
              as String?,
      termsConditionsUrl: freezed == termsConditionsUrl
          ? _value.termsConditionsUrl
          : termsConditionsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      androidVersion: freezed == androidVersion
          ? _value.androidVersion
          : androidVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionModel?,
      iosVersion: freezed == iosVersion
          ? _value.iosVersion
          : iosVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionModel?,
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

class _$ApplicationModelImpl extends _ApplicationModel {
  const _$ApplicationModelImpl(
      {this.id,
      this.name,
      @Deprecated('Use will be removed soon, use ios/android instead')
      this.platformIdentifier,
      this.iosPlatformId,
      this.androidPlatformId,
      this.termsConditionsUrl,
      this.androidVersion,
      this.iosVersion,
      this.coreUrl,
      this.theme,
      this.googleServices,
      @Deprecated('Use will be removed soon, use ios/android instead')
      this.version = 0})
      : super._();

  @override
  final String? id;
  @override
  final String? name;
  @override
  @Deprecated('Use will be removed soon, use ios/android instead')
  final String? platformIdentifier;
  @override
  final String? iosPlatformId;
  @override
  final String? androidPlatformId;
  @override
  final String? termsConditionsUrl;
  @override
  final BuildVersionModel? androidVersion;
  @override
  final BuildVersionModel? iosVersion;
  @override
  final String? coreUrl;
  @override
  final String? theme;
  @override
  final GoogleServicesModel? googleServices;
  @override
  @JsonKey()
  @Deprecated('Use will be removed soon, use ios/android instead')
  final int version;

  @override
  String toString() {
    return 'ApplicationModel(id: $id, name: $name, platformIdentifier: $platformIdentifier, iosPlatformId: $iosPlatformId, androidPlatformId: $androidPlatformId, termsConditionsUrl: $termsConditionsUrl, androidVersion: $androidVersion, iosVersion: $iosVersion, coreUrl: $coreUrl, theme: $theme, googleServices: $googleServices, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.platformIdentifier, platformIdentifier) ||
                other.platformIdentifier == platformIdentifier) &&
            (identical(other.iosPlatformId, iosPlatformId) ||
                other.iosPlatformId == iosPlatformId) &&
            (identical(other.androidPlatformId, androidPlatformId) ||
                other.androidPlatformId == androidPlatformId) &&
            (identical(other.termsConditionsUrl, termsConditionsUrl) ||
                other.termsConditionsUrl == termsConditionsUrl) &&
            (identical(other.androidVersion, androidVersion) ||
                other.androidVersion == androidVersion) &&
            (identical(other.iosVersion, iosVersion) ||
                other.iosVersion == iosVersion) &&
            (identical(other.coreUrl, coreUrl) || other.coreUrl == coreUrl) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.googleServices, googleServices) ||
                other.googleServices == googleServices) &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      platformIdentifier,
      iosPlatformId,
      androidPlatformId,
      termsConditionsUrl,
      androidVersion,
      iosVersion,
      coreUrl,
      theme,
      googleServices,
      version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationModelImplCopyWith<_$ApplicationModelImpl> get copyWith =>
      __$$ApplicationModelImplCopyWithImpl<_$ApplicationModelImpl>(
          this, _$identity);
}

abstract class _ApplicationModel extends ApplicationModel {
  const factory _ApplicationModel(
      {final String? id,
      final String? name,
      @Deprecated('Use will be removed soon, use ios/android instead')
      final String? platformIdentifier,
      final String? iosPlatformId,
      final String? androidPlatformId,
      final String? termsConditionsUrl,
      final BuildVersionModel? androidVersion,
      final BuildVersionModel? iosVersion,
      final String? coreUrl,
      final String? theme,
      final GoogleServicesModel? googleServices,
      @Deprecated('Use will be removed soon, use ios/android instead')
      final int version}) = _$ApplicationModelImpl;
  const _ApplicationModel._() : super._();

  @override
  String? get id;
  @override
  String? get name;
  @override
  @Deprecated('Use will be removed soon, use ios/android instead')
  String? get platformIdentifier;
  @override
  String? get iosPlatformId;
  @override
  String? get androidPlatformId;
  @override
  String? get termsConditionsUrl;
  @override
  BuildVersionModel? get androidVersion;
  @override
  BuildVersionModel? get iosVersion;
  @override
  String? get coreUrl;
  @override
  String? get theme;
  @override
  GoogleServicesModel? get googleServices;
  @override
  @Deprecated('Use will be removed soon, use ios/android instead')
  int get version;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationModelImplCopyWith<_$ApplicationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
