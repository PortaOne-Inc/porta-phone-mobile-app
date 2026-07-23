// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApplicationDTO {

 String? get id; String? get name; Map<String, dynamic>? get environment; String? get iosPlatformId; String? get androidPlatformId; String? get termsConditionsUrl; BuildVersionDTO? get appVersion; BuildVersionDTO? get androidVersion; BuildVersionDTO? get iosVersion; String? get coreUrl; ContactInfo? get contactInfo; String? get theme; bool get demo;
/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationDTOCopyWith<ApplicationDTO> get copyWith => _$ApplicationDTOCopyWithImpl<ApplicationDTO>(this as ApplicationDTO, _$identity);

  /// Serializes this ApplicationDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.environment, environment)&&(identical(other.iosPlatformId, iosPlatformId) || other.iosPlatformId == iosPlatformId)&&(identical(other.androidPlatformId, androidPlatformId) || other.androidPlatformId == androidPlatformId)&&(identical(other.termsConditionsUrl, termsConditionsUrl) || other.termsConditionsUrl == termsConditionsUrl)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.androidVersion, androidVersion) || other.androidVersion == androidVersion)&&(identical(other.iosVersion, iosVersion) || other.iosVersion == iosVersion)&&(identical(other.coreUrl, coreUrl) || other.coreUrl == coreUrl)&&(identical(other.contactInfo, contactInfo) || other.contactInfo == contactInfo)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.demo, demo) || other.demo == demo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(environment),iosPlatformId,androidPlatformId,termsConditionsUrl,appVersion,androidVersion,iosVersion,coreUrl,contactInfo,theme,demo);

@override
String toString() {
  return 'ApplicationDTO(id: $id, name: $name, environment: $environment, iosPlatformId: $iosPlatformId, androidPlatformId: $androidPlatformId, termsConditionsUrl: $termsConditionsUrl, appVersion: $appVersion, androidVersion: $androidVersion, iosVersion: $iosVersion, coreUrl: $coreUrl, contactInfo: $contactInfo, theme: $theme, demo: $demo)';
}


}

/// @nodoc
abstract mixin class $ApplicationDTOCopyWith<$Res>  {
  factory $ApplicationDTOCopyWith(ApplicationDTO value, $Res Function(ApplicationDTO) _then) = _$ApplicationDTOCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, Map<String, dynamic>? environment, String? iosPlatformId, String? androidPlatformId, String? termsConditionsUrl, BuildVersionDTO? appVersion, BuildVersionDTO? androidVersion, BuildVersionDTO? iosVersion, String? coreUrl, ContactInfo? contactInfo, String? theme, bool demo
});


$BuildVersionDTOCopyWith<$Res>? get appVersion;$BuildVersionDTOCopyWith<$Res>? get androidVersion;$BuildVersionDTOCopyWith<$Res>? get iosVersion;$ContactInfoCopyWith<$Res>? get contactInfo;

}
/// @nodoc
class _$ApplicationDTOCopyWithImpl<$Res>
    implements $ApplicationDTOCopyWith<$Res> {
  _$ApplicationDTOCopyWithImpl(this._self, this._then);

  final ApplicationDTO _self;
  final $Res Function(ApplicationDTO) _then;

/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? environment = freezed,Object? iosPlatformId = freezed,Object? androidPlatformId = freezed,Object? termsConditionsUrl = freezed,Object? appVersion = freezed,Object? androidVersion = freezed,Object? iosVersion = freezed,Object? coreUrl = freezed,Object? contactInfo = freezed,Object? theme = freezed,Object? demo = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,environment: freezed == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,iosPlatformId: freezed == iosPlatformId ? _self.iosPlatformId : iosPlatformId // ignore: cast_nullable_to_non_nullable
as String?,androidPlatformId: freezed == androidPlatformId ? _self.androidPlatformId : androidPlatformId // ignore: cast_nullable_to_non_nullable
as String?,termsConditionsUrl: freezed == termsConditionsUrl ? _self.termsConditionsUrl : termsConditionsUrl // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionDTO?,androidVersion: freezed == androidVersion ? _self.androidVersion : androidVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionDTO?,iosVersion: freezed == iosVersion ? _self.iosVersion : iosVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionDTO?,coreUrl: freezed == coreUrl ? _self.coreUrl : coreUrl // ignore: cast_nullable_to_non_nullable
as String?,contactInfo: freezed == contactInfo ? _self.contactInfo : contactInfo // ignore: cast_nullable_to_non_nullable
as ContactInfo?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,demo: null == demo ? _self.demo : demo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionDTOCopyWith<$Res>? get appVersion {
    if (_self.appVersion == null) {
    return null;
  }

  return $BuildVersionDTOCopyWith<$Res>(_self.appVersion!, (value) {
    return _then(_self.copyWith(appVersion: value));
  });
}/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionDTOCopyWith<$Res>? get androidVersion {
    if (_self.androidVersion == null) {
    return null;
  }

  return $BuildVersionDTOCopyWith<$Res>(_self.androidVersion!, (value) {
    return _then(_self.copyWith(androidVersion: value));
  });
}/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionDTOCopyWith<$Res>? get iosVersion {
    if (_self.iosVersion == null) {
    return null;
  }

  return $BuildVersionDTOCopyWith<$Res>(_self.iosVersion!, (value) {
    return _then(_self.copyWith(iosVersion: value));
  });
}/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactInfoCopyWith<$Res>? get contactInfo {
    if (_self.contactInfo == null) {
    return null;
  }

  return $ContactInfoCopyWith<$Res>(_self.contactInfo!, (value) {
    return _then(_self.copyWith(contactInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplicationDTO].
extension ApplicationDTOPatterns on ApplicationDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationDTO value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationDTO():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  Map<String, dynamic>? environment,  String? iosPlatformId,  String? androidPlatformId,  String? termsConditionsUrl,  BuildVersionDTO? appVersion,  BuildVersionDTO? androidVersion,  BuildVersionDTO? iosVersion,  String? coreUrl,  ContactInfo? contactInfo,  String? theme,  bool demo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationDTO() when $default != null:
return $default(_that.id,_that.name,_that.environment,_that.iosPlatformId,_that.androidPlatformId,_that.termsConditionsUrl,_that.appVersion,_that.androidVersion,_that.iosVersion,_that.coreUrl,_that.contactInfo,_that.theme,_that.demo);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  Map<String, dynamic>? environment,  String? iosPlatformId,  String? androidPlatformId,  String? termsConditionsUrl,  BuildVersionDTO? appVersion,  BuildVersionDTO? androidVersion,  BuildVersionDTO? iosVersion,  String? coreUrl,  ContactInfo? contactInfo,  String? theme,  bool demo)  $default,) {final _that = this;
switch (_that) {
case _ApplicationDTO():
return $default(_that.id,_that.name,_that.environment,_that.iosPlatformId,_that.androidPlatformId,_that.termsConditionsUrl,_that.appVersion,_that.androidVersion,_that.iosVersion,_that.coreUrl,_that.contactInfo,_that.theme,_that.demo);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  Map<String, dynamic>? environment,  String? iosPlatformId,  String? androidPlatformId,  String? termsConditionsUrl,  BuildVersionDTO? appVersion,  BuildVersionDTO? androidVersion,  BuildVersionDTO? iosVersion,  String? coreUrl,  ContactInfo? contactInfo,  String? theme,  bool demo)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationDTO() when $default != null:
return $default(_that.id,_that.name,_that.environment,_that.iosPlatformId,_that.androidPlatformId,_that.termsConditionsUrl,_that.appVersion,_that.androidVersion,_that.iosVersion,_that.coreUrl,_that.contactInfo,_that.theme,_that.demo);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _ApplicationDTO implements ApplicationDTO {
  const _ApplicationDTO({this.id, this.name, final  Map<String, dynamic>? environment, this.iosPlatformId, this.androidPlatformId, this.termsConditionsUrl, this.appVersion, this.androidVersion, this.iosVersion, this.coreUrl, this.contactInfo, this.theme, this.demo = false}): _environment = environment;
  factory _ApplicationDTO.fromJson(Map<String, dynamic> json) => _$ApplicationDTOFromJson(json);

@override final  String? id;
@override final  String? name;
 final  Map<String, dynamic>? _environment;
@override Map<String, dynamic>? get environment {
  final value = _environment;
  if (value == null) return null;
  if (_environment is EqualUnmodifiableMapView) return _environment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? iosPlatformId;
@override final  String? androidPlatformId;
@override final  String? termsConditionsUrl;
@override final  BuildVersionDTO? appVersion;
@override final  BuildVersionDTO? androidVersion;
@override final  BuildVersionDTO? iosVersion;
@override final  String? coreUrl;
@override final  ContactInfo? contactInfo;
@override final  String? theme;
@override@JsonKey() final  bool demo;

/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationDTOCopyWith<_ApplicationDTO> get copyWith => __$ApplicationDTOCopyWithImpl<_ApplicationDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicationDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._environment, _environment)&&(identical(other.iosPlatformId, iosPlatformId) || other.iosPlatformId == iosPlatformId)&&(identical(other.androidPlatformId, androidPlatformId) || other.androidPlatformId == androidPlatformId)&&(identical(other.termsConditionsUrl, termsConditionsUrl) || other.termsConditionsUrl == termsConditionsUrl)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.androidVersion, androidVersion) || other.androidVersion == androidVersion)&&(identical(other.iosVersion, iosVersion) || other.iosVersion == iosVersion)&&(identical(other.coreUrl, coreUrl) || other.coreUrl == coreUrl)&&(identical(other.contactInfo, contactInfo) || other.contactInfo == contactInfo)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.demo, demo) || other.demo == demo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_environment),iosPlatformId,androidPlatformId,termsConditionsUrl,appVersion,androidVersion,iosVersion,coreUrl,contactInfo,theme,demo);

@override
String toString() {
  return 'ApplicationDTO(id: $id, name: $name, environment: $environment, iosPlatformId: $iosPlatformId, androidPlatformId: $androidPlatformId, termsConditionsUrl: $termsConditionsUrl, appVersion: $appVersion, androidVersion: $androidVersion, iosVersion: $iosVersion, coreUrl: $coreUrl, contactInfo: $contactInfo, theme: $theme, demo: $demo)';
}


}

/// @nodoc
abstract mixin class _$ApplicationDTOCopyWith<$Res> implements $ApplicationDTOCopyWith<$Res> {
  factory _$ApplicationDTOCopyWith(_ApplicationDTO value, $Res Function(_ApplicationDTO) _then) = __$ApplicationDTOCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, Map<String, dynamic>? environment, String? iosPlatformId, String? androidPlatformId, String? termsConditionsUrl, BuildVersionDTO? appVersion, BuildVersionDTO? androidVersion, BuildVersionDTO? iosVersion, String? coreUrl, ContactInfo? contactInfo, String? theme, bool demo
});


@override $BuildVersionDTOCopyWith<$Res>? get appVersion;@override $BuildVersionDTOCopyWith<$Res>? get androidVersion;@override $BuildVersionDTOCopyWith<$Res>? get iosVersion;@override $ContactInfoCopyWith<$Res>? get contactInfo;

}
/// @nodoc
class __$ApplicationDTOCopyWithImpl<$Res>
    implements _$ApplicationDTOCopyWith<$Res> {
  __$ApplicationDTOCopyWithImpl(this._self, this._then);

  final _ApplicationDTO _self;
  final $Res Function(_ApplicationDTO) _then;

/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? environment = freezed,Object? iosPlatformId = freezed,Object? androidPlatformId = freezed,Object? termsConditionsUrl = freezed,Object? appVersion = freezed,Object? androidVersion = freezed,Object? iosVersion = freezed,Object? coreUrl = freezed,Object? contactInfo = freezed,Object? theme = freezed,Object? demo = null,}) {
  return _then(_ApplicationDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,environment: freezed == environment ? _self._environment : environment // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,iosPlatformId: freezed == iosPlatformId ? _self.iosPlatformId : iosPlatformId // ignore: cast_nullable_to_non_nullable
as String?,androidPlatformId: freezed == androidPlatformId ? _self.androidPlatformId : androidPlatformId // ignore: cast_nullable_to_non_nullable
as String?,termsConditionsUrl: freezed == termsConditionsUrl ? _self.termsConditionsUrl : termsConditionsUrl // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionDTO?,androidVersion: freezed == androidVersion ? _self.androidVersion : androidVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionDTO?,iosVersion: freezed == iosVersion ? _self.iosVersion : iosVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionDTO?,coreUrl: freezed == coreUrl ? _self.coreUrl : coreUrl // ignore: cast_nullable_to_non_nullable
as String?,contactInfo: freezed == contactInfo ? _self.contactInfo : contactInfo // ignore: cast_nullable_to_non_nullable
as ContactInfo?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,demo: null == demo ? _self.demo : demo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionDTOCopyWith<$Res>? get appVersion {
    if (_self.appVersion == null) {
    return null;
  }

  return $BuildVersionDTOCopyWith<$Res>(_self.appVersion!, (value) {
    return _then(_self.copyWith(appVersion: value));
  });
}/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionDTOCopyWith<$Res>? get androidVersion {
    if (_self.androidVersion == null) {
    return null;
  }

  return $BuildVersionDTOCopyWith<$Res>(_self.androidVersion!, (value) {
    return _then(_self.copyWith(androidVersion: value));
  });
}/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionDTOCopyWith<$Res>? get iosVersion {
    if (_self.iosVersion == null) {
    return null;
  }

  return $BuildVersionDTOCopyWith<$Res>(_self.iosVersion!, (value) {
    return _then(_self.copyWith(iosVersion: value));
  });
}/// Create a copy of ApplicationDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactInfoCopyWith<$Res>? get contactInfo {
    if (_self.contactInfo == null) {
    return null;
  }

  return $ContactInfoCopyWith<$Res>(_self.contactInfo!, (value) {
    return _then(_self.copyWith(contactInfo: value));
  });
}
}


/// @nodoc
mixin _$ContactInfo {

 String? get appSalesEmail;
/// Create a copy of ContactInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactInfoCopyWith<ContactInfo> get copyWith => _$ContactInfoCopyWithImpl<ContactInfo>(this as ContactInfo, _$identity);

  /// Serializes this ContactInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactInfo&&(identical(other.appSalesEmail, appSalesEmail) || other.appSalesEmail == appSalesEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appSalesEmail);

@override
String toString() {
  return 'ContactInfo(appSalesEmail: $appSalesEmail)';
}


}

/// @nodoc
abstract mixin class $ContactInfoCopyWith<$Res>  {
  factory $ContactInfoCopyWith(ContactInfo value, $Res Function(ContactInfo) _then) = _$ContactInfoCopyWithImpl;
@useResult
$Res call({
 String? appSalesEmail
});




}
/// @nodoc
class _$ContactInfoCopyWithImpl<$Res>
    implements $ContactInfoCopyWith<$Res> {
  _$ContactInfoCopyWithImpl(this._self, this._then);

  final ContactInfo _self;
  final $Res Function(ContactInfo) _then;

/// Create a copy of ContactInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appSalesEmail = freezed,}) {
  return _then(_self.copyWith(
appSalesEmail: freezed == appSalesEmail ? _self.appSalesEmail : appSalesEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactInfo].
extension ContactInfoPatterns on ContactInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactInfo value)  $default,){
final _that = this;
switch (_that) {
case _ContactInfo():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ContactInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? appSalesEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactInfo() when $default != null:
return $default(_that.appSalesEmail);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? appSalesEmail)  $default,) {final _that = this;
switch (_that) {
case _ContactInfo():
return $default(_that.appSalesEmail);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? appSalesEmail)?  $default,) {final _that = this;
switch (_that) {
case _ContactInfo() when $default != null:
return $default(_that.appSalesEmail);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _ContactInfo implements ContactInfo {
  const _ContactInfo({this.appSalesEmail});
  factory _ContactInfo.fromJson(Map<String, dynamic> json) => _$ContactInfoFromJson(json);

@override final  String? appSalesEmail;

/// Create a copy of ContactInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactInfoCopyWith<_ContactInfo> get copyWith => __$ContactInfoCopyWithImpl<_ContactInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactInfo&&(identical(other.appSalesEmail, appSalesEmail) || other.appSalesEmail == appSalesEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appSalesEmail);

@override
String toString() {
  return 'ContactInfo(appSalesEmail: $appSalesEmail)';
}


}

/// @nodoc
abstract mixin class _$ContactInfoCopyWith<$Res> implements $ContactInfoCopyWith<$Res> {
  factory _$ContactInfoCopyWith(_ContactInfo value, $Res Function(_ContactInfo) _then) = __$ContactInfoCopyWithImpl;
@override @useResult
$Res call({
 String? appSalesEmail
});




}
/// @nodoc
class __$ContactInfoCopyWithImpl<$Res>
    implements _$ContactInfoCopyWith<$Res> {
  __$ContactInfoCopyWithImpl(this._self, this._then);

  final _ContactInfo _self;
  final $Res Function(_ContactInfo) _then;

/// Create a copy of ContactInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appSalesEmail = freezed,}) {
  return _then(_ContactInfo(
appSalesEmail: freezed == appSalesEmail ? _self.appSalesEmail : appSalesEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
