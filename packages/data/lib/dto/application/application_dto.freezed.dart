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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplicationDTO _$ApplicationDTOFromJson(Map<String, dynamic> json) {
  return _ApplicationDTO.fromJson(json);
}

/// @nodoc
mixin _$ApplicationDTO {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get iosPlatformId => throw _privateConstructorUsedError;
  String? get androidPlatformId => throw _privateConstructorUsedError;
  String? get termsConditionsUrl => throw _privateConstructorUsedError;
  BuildVersionDTO? get appVersion => throw _privateConstructorUsedError;
  BuildVersionDTO? get androidVersion => throw _privateConstructorUsedError;
  BuildVersionDTO? get iosVersion => throw _privateConstructorUsedError;
  String? get coreUrl => throw _privateConstructorUsedError;
  ContactInfo? get contactInfo => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;
  bool get demo => throw _privateConstructorUsedError;

  /// Serializes this ApplicationDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {String? id,
      String? name,
      String? iosPlatformId,
      String? androidPlatformId,
      String? termsConditionsUrl,
      BuildVersionDTO? appVersion,
      BuildVersionDTO? androidVersion,
      BuildVersionDTO? iosVersion,
      String? coreUrl,
      ContactInfo? contactInfo,
      String? theme,
      bool demo});

  $BuildVersionDTOCopyWith<$Res>? get appVersion;
  $BuildVersionDTOCopyWith<$Res>? get androidVersion;
  $BuildVersionDTOCopyWith<$Res>? get iosVersion;
  $ContactInfoCopyWith<$Res>? get contactInfo;
}

/// @nodoc
class _$ApplicationDTOCopyWithImpl<$Res, $Val extends ApplicationDTO>
    implements $ApplicationDTOCopyWith<$Res> {
  _$ApplicationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iosPlatformId = freezed,
    Object? androidPlatformId = freezed,
    Object? termsConditionsUrl = freezed,
    Object? appVersion = freezed,
    Object? androidVersion = freezed,
    Object? iosVersion = freezed,
    Object? coreUrl = freezed,
    Object? contactInfo = freezed,
    Object? theme = freezed,
    Object? demo = null,
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
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionDTO?,
      androidVersion: freezed == androidVersion
          ? _value.androidVersion
          : androidVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionDTO?,
      iosVersion: freezed == iosVersion
          ? _value.iosVersion
          : iosVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionDTO?,
      coreUrl: freezed == coreUrl
          ? _value.coreUrl
          : coreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contactInfo: freezed == contactInfo
          ? _value.contactInfo
          : contactInfo // ignore: cast_nullable_to_non_nullable
              as ContactInfo?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      demo: null == demo
          ? _value.demo
          : demo // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ApplicationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuildVersionDTOCopyWith<$Res>? get appVersion {
    if (_value.appVersion == null) {
      return null;
    }

    return $BuildVersionDTOCopyWith<$Res>(_value.appVersion!, (value) {
      return _then(_value.copyWith(appVersion: value) as $Val);
    });
  }

  /// Create a copy of ApplicationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuildVersionDTOCopyWith<$Res>? get androidVersion {
    if (_value.androidVersion == null) {
      return null;
    }

    return $BuildVersionDTOCopyWith<$Res>(_value.androidVersion!, (value) {
      return _then(_value.copyWith(androidVersion: value) as $Val);
    });
  }

  /// Create a copy of ApplicationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuildVersionDTOCopyWith<$Res>? get iosVersion {
    if (_value.iosVersion == null) {
      return null;
    }

    return $BuildVersionDTOCopyWith<$Res>(_value.iosVersion!, (value) {
      return _then(_value.copyWith(iosVersion: value) as $Val);
    });
  }

  /// Create a copy of ApplicationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactInfoCopyWith<$Res>? get contactInfo {
    if (_value.contactInfo == null) {
      return null;
    }

    return $ContactInfoCopyWith<$Res>(_value.contactInfo!, (value) {
      return _then(_value.copyWith(contactInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApplicationDTOImplCopyWith<$Res>
    implements $ApplicationDTOCopyWith<$Res> {
  factory _$$ApplicationDTOImplCopyWith(_$ApplicationDTOImpl value,
          $Res Function(_$ApplicationDTOImpl) then) =
      __$$ApplicationDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? iosPlatformId,
      String? androidPlatformId,
      String? termsConditionsUrl,
      BuildVersionDTO? appVersion,
      BuildVersionDTO? androidVersion,
      BuildVersionDTO? iosVersion,
      String? coreUrl,
      ContactInfo? contactInfo,
      String? theme,
      bool demo});

  @override
  $BuildVersionDTOCopyWith<$Res>? get appVersion;
  @override
  $BuildVersionDTOCopyWith<$Res>? get androidVersion;
  @override
  $BuildVersionDTOCopyWith<$Res>? get iosVersion;
  @override
  $ContactInfoCopyWith<$Res>? get contactInfo;
}

/// @nodoc
class __$$ApplicationDTOImplCopyWithImpl<$Res>
    extends _$ApplicationDTOCopyWithImpl<$Res, _$ApplicationDTOImpl>
    implements _$$ApplicationDTOImplCopyWith<$Res> {
  __$$ApplicationDTOImplCopyWithImpl(
      _$ApplicationDTOImpl _value, $Res Function(_$ApplicationDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicationDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iosPlatformId = freezed,
    Object? androidPlatformId = freezed,
    Object? termsConditionsUrl = freezed,
    Object? appVersion = freezed,
    Object? androidVersion = freezed,
    Object? iosVersion = freezed,
    Object? coreUrl = freezed,
    Object? contactInfo = freezed,
    Object? theme = freezed,
    Object? demo = null,
  }) {
    return _then(_$ApplicationDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionDTO?,
      androidVersion: freezed == androidVersion
          ? _value.androidVersion
          : androidVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionDTO?,
      iosVersion: freezed == iosVersion
          ? _value.iosVersion
          : iosVersion // ignore: cast_nullable_to_non_nullable
              as BuildVersionDTO?,
      coreUrl: freezed == coreUrl
          ? _value.coreUrl
          : coreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contactInfo: freezed == contactInfo
          ? _value.contactInfo
          : contactInfo // ignore: cast_nullable_to_non_nullable
              as ContactInfo?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      demo: null == demo
          ? _value.demo
          : demo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ApplicationDTOImpl implements _ApplicationDTO {
  const _$ApplicationDTOImpl(
      {this.id,
      this.name,
      this.iosPlatformId,
      this.androidPlatformId,
      this.termsConditionsUrl,
      this.appVersion,
      this.androidVersion,
      this.iosVersion,
      this.coreUrl,
      this.contactInfo,
      this.theme,
      this.demo = false});

  factory _$ApplicationDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplicationDTOImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? iosPlatformId;
  @override
  final String? androidPlatformId;
  @override
  final String? termsConditionsUrl;
  @override
  final BuildVersionDTO? appVersion;
  @override
  final BuildVersionDTO? androidVersion;
  @override
  final BuildVersionDTO? iosVersion;
  @override
  final String? coreUrl;
  @override
  final ContactInfo? contactInfo;
  @override
  final String? theme;
  @override
  @JsonKey()
  final bool demo;

  @override
  String toString() {
    return 'ApplicationDTO(id: $id, name: $name, iosPlatformId: $iosPlatformId, androidPlatformId: $androidPlatformId, termsConditionsUrl: $termsConditionsUrl, appVersion: $appVersion, androidVersion: $androidVersion, iosVersion: $iosVersion, coreUrl: $coreUrl, contactInfo: $contactInfo, theme: $theme, demo: $demo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iosPlatformId, iosPlatformId) ||
                other.iosPlatformId == iosPlatformId) &&
            (identical(other.androidPlatformId, androidPlatformId) ||
                other.androidPlatformId == androidPlatformId) &&
            (identical(other.termsConditionsUrl, termsConditionsUrl) ||
                other.termsConditionsUrl == termsConditionsUrl) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.androidVersion, androidVersion) ||
                other.androidVersion == androidVersion) &&
            (identical(other.iosVersion, iosVersion) ||
                other.iosVersion == iosVersion) &&
            (identical(other.coreUrl, coreUrl) || other.coreUrl == coreUrl) &&
            (identical(other.contactInfo, contactInfo) ||
                other.contactInfo == contactInfo) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.demo, demo) || other.demo == demo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      iosPlatformId,
      androidPlatformId,
      termsConditionsUrl,
      appVersion,
      androidVersion,
      iosVersion,
      coreUrl,
      contactInfo,
      theme,
      demo);

  /// Create a copy of ApplicationDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationDTOImplCopyWith<_$ApplicationDTOImpl> get copyWith =>
      __$$ApplicationDTOImplCopyWithImpl<_$ApplicationDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplicationDTOImplToJson(
      this,
    );
  }
}

abstract class _ApplicationDTO implements ApplicationDTO {
  const factory _ApplicationDTO(
      {final String? id,
      final String? name,
      final String? iosPlatformId,
      final String? androidPlatformId,
      final String? termsConditionsUrl,
      final BuildVersionDTO? appVersion,
      final BuildVersionDTO? androidVersion,
      final BuildVersionDTO? iosVersion,
      final String? coreUrl,
      final ContactInfo? contactInfo,
      final String? theme,
      final bool demo}) = _$ApplicationDTOImpl;

  factory _ApplicationDTO.fromJson(Map<String, dynamic> json) =
      _$ApplicationDTOImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get iosPlatformId;
  @override
  String? get androidPlatformId;
  @override
  String? get termsConditionsUrl;
  @override
  BuildVersionDTO? get appVersion;
  @override
  BuildVersionDTO? get androidVersion;
  @override
  BuildVersionDTO? get iosVersion;
  @override
  String? get coreUrl;
  @override
  ContactInfo? get contactInfo;
  @override
  String? get theme;
  @override
  bool get demo;

  /// Create a copy of ApplicationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationDTOImplCopyWith<_$ApplicationDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) {
  return _ContactInfo.fromJson(json);
}

/// @nodoc
mixin _$ContactInfo {
  String? get appSalesEmail => throw _privateConstructorUsedError;

  /// Serializes this ContactInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactInfoCopyWith<ContactInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactInfoCopyWith<$Res> {
  factory $ContactInfoCopyWith(
          ContactInfo value, $Res Function(ContactInfo) then) =
      _$ContactInfoCopyWithImpl<$Res, ContactInfo>;
  @useResult
  $Res call({String? appSalesEmail});
}

/// @nodoc
class _$ContactInfoCopyWithImpl<$Res, $Val extends ContactInfo>
    implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appSalesEmail = freezed,
  }) {
    return _then(_value.copyWith(
      appSalesEmail: freezed == appSalesEmail
          ? _value.appSalesEmail
          : appSalesEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactInfoImplCopyWith<$Res>
    implements $ContactInfoCopyWith<$Res> {
  factory _$$ContactInfoImplCopyWith(
          _$ContactInfoImpl value, $Res Function(_$ContactInfoImpl) then) =
      __$$ContactInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? appSalesEmail});
}

/// @nodoc
class __$$ContactInfoImplCopyWithImpl<$Res>
    extends _$ContactInfoCopyWithImpl<$Res, _$ContactInfoImpl>
    implements _$$ContactInfoImplCopyWith<$Res> {
  __$$ContactInfoImplCopyWithImpl(
      _$ContactInfoImpl _value, $Res Function(_$ContactInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appSalesEmail = freezed,
  }) {
    return _then(_$ContactInfoImpl(
      appSalesEmail: freezed == appSalesEmail
          ? _value.appSalesEmail
          : appSalesEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ContactInfoImpl implements _ContactInfo {
  const _$ContactInfoImpl({this.appSalesEmail});

  factory _$ContactInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactInfoImplFromJson(json);

  @override
  final String? appSalesEmail;

  @override
  String toString() {
    return 'ContactInfo(appSalesEmail: $appSalesEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactInfoImpl &&
            (identical(other.appSalesEmail, appSalesEmail) ||
                other.appSalesEmail == appSalesEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appSalesEmail);

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      __$$ContactInfoImplCopyWithImpl<_$ContactInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactInfoImplToJson(
      this,
    );
  }
}

abstract class _ContactInfo implements ContactInfo {
  const factory _ContactInfo({final String? appSalesEmail}) = _$ContactInfoImpl;

  factory _ContactInfo.fromJson(Map<String, dynamic> json) =
      _$ContactInfoImpl.fromJson;

  @override
  String? get appSalesEmail;

  /// Create a copy of ContactInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactInfoImplCopyWith<_$ContactInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
