// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationModel {

 String? get id; String? get name; Map<String, dynamic>? get environment; String? get iosPlatformId; String? get androidPlatformId; String? get termsConditionsUrl; BuildVersionModel? get appVersion; BuildVersionModel? get androidVersion; BuildVersionModel? get iosVersion; String? get theme;
/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<ApplicationModel> get copyWith => _$ApplicationModelCopyWithImpl<ApplicationModel>(this as ApplicationModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.environment, environment)&&(identical(other.iosPlatformId, iosPlatformId) || other.iosPlatformId == iosPlatformId)&&(identical(other.androidPlatformId, androidPlatformId) || other.androidPlatformId == androidPlatformId)&&(identical(other.termsConditionsUrl, termsConditionsUrl) || other.termsConditionsUrl == termsConditionsUrl)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.androidVersion, androidVersion) || other.androidVersion == androidVersion)&&(identical(other.iosVersion, iosVersion) || other.iosVersion == iosVersion)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(environment),iosPlatformId,androidPlatformId,termsConditionsUrl,appVersion,androidVersion,iosVersion,theme);

@override
String toString() {
  return 'ApplicationModel(id: $id, name: $name, environment: $environment, iosPlatformId: $iosPlatformId, androidPlatformId: $androidPlatformId, termsConditionsUrl: $termsConditionsUrl, appVersion: $appVersion, androidVersion: $androidVersion, iosVersion: $iosVersion, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $ApplicationModelCopyWith<$Res>  {
  factory $ApplicationModelCopyWith(ApplicationModel value, $Res Function(ApplicationModel) _then) = _$ApplicationModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, Map<String, dynamic>? environment, String? iosPlatformId, String? androidPlatformId, String? termsConditionsUrl, BuildVersionModel? appVersion, BuildVersionModel? androidVersion, BuildVersionModel? iosVersion, String? theme
});


$BuildVersionModelCopyWith<$Res>? get appVersion;$BuildVersionModelCopyWith<$Res>? get androidVersion;$BuildVersionModelCopyWith<$Res>? get iosVersion;

}
/// @nodoc
class _$ApplicationModelCopyWithImpl<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  _$ApplicationModelCopyWithImpl(this._self, this._then);

  final ApplicationModel _self;
  final $Res Function(ApplicationModel) _then;

/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? environment = freezed,Object? iosPlatformId = freezed,Object? androidPlatformId = freezed,Object? termsConditionsUrl = freezed,Object? appVersion = freezed,Object? androidVersion = freezed,Object? iosVersion = freezed,Object? theme = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,environment: freezed == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,iosPlatformId: freezed == iosPlatformId ? _self.iosPlatformId : iosPlatformId // ignore: cast_nullable_to_non_nullable
as String?,androidPlatformId: freezed == androidPlatformId ? _self.androidPlatformId : androidPlatformId // ignore: cast_nullable_to_non_nullable
as String?,termsConditionsUrl: freezed == termsConditionsUrl ? _self.termsConditionsUrl : termsConditionsUrl // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionModel?,androidVersion: freezed == androidVersion ? _self.androidVersion : androidVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionModel?,iosVersion: freezed == iosVersion ? _self.iosVersion : iosVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionModel?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionModelCopyWith<$Res>? get appVersion {
    if (_self.appVersion == null) {
    return null;
  }

  return $BuildVersionModelCopyWith<$Res>(_self.appVersion!, (value) {
    return _then(_self.copyWith(appVersion: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionModelCopyWith<$Res>? get androidVersion {
    if (_self.androidVersion == null) {
    return null;
  }

  return $BuildVersionModelCopyWith<$Res>(_self.androidVersion!, (value) {
    return _then(_self.copyWith(androidVersion: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionModelCopyWith<$Res>? get iosVersion {
    if (_self.iosVersion == null) {
    return null;
  }

  return $BuildVersionModelCopyWith<$Res>(_self.iosVersion!, (value) {
    return _then(_self.copyWith(iosVersion: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplicationModel].
extension ApplicationModelPatterns on ApplicationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationModel value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  Map<String, dynamic>? environment,  String? iosPlatformId,  String? androidPlatformId,  String? termsConditionsUrl,  BuildVersionModel? appVersion,  BuildVersionModel? androidVersion,  BuildVersionModel? iosVersion,  String? theme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
return $default(_that.id,_that.name,_that.environment,_that.iosPlatformId,_that.androidPlatformId,_that.termsConditionsUrl,_that.appVersion,_that.androidVersion,_that.iosVersion,_that.theme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  Map<String, dynamic>? environment,  String? iosPlatformId,  String? androidPlatformId,  String? termsConditionsUrl,  BuildVersionModel? appVersion,  BuildVersionModel? androidVersion,  BuildVersionModel? iosVersion,  String? theme)  $default,) {final _that = this;
switch (_that) {
case _ApplicationModel():
return $default(_that.id,_that.name,_that.environment,_that.iosPlatformId,_that.androidPlatformId,_that.termsConditionsUrl,_that.appVersion,_that.androidVersion,_that.iosVersion,_that.theme);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  Map<String, dynamic>? environment,  String? iosPlatformId,  String? androidPlatformId,  String? termsConditionsUrl,  BuildVersionModel? appVersion,  BuildVersionModel? androidVersion,  BuildVersionModel? iosVersion,  String? theme)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
return $default(_that.id,_that.name,_that.environment,_that.iosPlatformId,_that.androidPlatformId,_that.termsConditionsUrl,_that.appVersion,_that.androidVersion,_that.iosVersion,_that.theme);case _:
  return null;

}
}

}

/// @nodoc


class _ApplicationModel extends ApplicationModel {
  const _ApplicationModel({this.id, this.name, final  Map<String, dynamic>? environment, this.iosPlatformId, this.androidPlatformId, this.termsConditionsUrl, this.appVersion, this.androidVersion, this.iosVersion, this.theme}): _environment = environment,super._();
  

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
@override final  BuildVersionModel? appVersion;
@override final  BuildVersionModel? androidVersion;
@override final  BuildVersionModel? iosVersion;
@override final  String? theme;

/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationModelCopyWith<_ApplicationModel> get copyWith => __$ApplicationModelCopyWithImpl<_ApplicationModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._environment, _environment)&&(identical(other.iosPlatformId, iosPlatformId) || other.iosPlatformId == iosPlatformId)&&(identical(other.androidPlatformId, androidPlatformId) || other.androidPlatformId == androidPlatformId)&&(identical(other.termsConditionsUrl, termsConditionsUrl) || other.termsConditionsUrl == termsConditionsUrl)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.androidVersion, androidVersion) || other.androidVersion == androidVersion)&&(identical(other.iosVersion, iosVersion) || other.iosVersion == iosVersion)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_environment),iosPlatformId,androidPlatformId,termsConditionsUrl,appVersion,androidVersion,iosVersion,theme);

@override
String toString() {
  return 'ApplicationModel(id: $id, name: $name, environment: $environment, iosPlatformId: $iosPlatformId, androidPlatformId: $androidPlatformId, termsConditionsUrl: $termsConditionsUrl, appVersion: $appVersion, androidVersion: $androidVersion, iosVersion: $iosVersion, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$ApplicationModelCopyWith<$Res> implements $ApplicationModelCopyWith<$Res> {
  factory _$ApplicationModelCopyWith(_ApplicationModel value, $Res Function(_ApplicationModel) _then) = __$ApplicationModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, Map<String, dynamic>? environment, String? iosPlatformId, String? androidPlatformId, String? termsConditionsUrl, BuildVersionModel? appVersion, BuildVersionModel? androidVersion, BuildVersionModel? iosVersion, String? theme
});


@override $BuildVersionModelCopyWith<$Res>? get appVersion;@override $BuildVersionModelCopyWith<$Res>? get androidVersion;@override $BuildVersionModelCopyWith<$Res>? get iosVersion;

}
/// @nodoc
class __$ApplicationModelCopyWithImpl<$Res>
    implements _$ApplicationModelCopyWith<$Res> {
  __$ApplicationModelCopyWithImpl(this._self, this._then);

  final _ApplicationModel _self;
  final $Res Function(_ApplicationModel) _then;

/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? environment = freezed,Object? iosPlatformId = freezed,Object? androidPlatformId = freezed,Object? termsConditionsUrl = freezed,Object? appVersion = freezed,Object? androidVersion = freezed,Object? iosVersion = freezed,Object? theme = freezed,}) {
  return _then(_ApplicationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,environment: freezed == environment ? _self._environment : environment // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,iosPlatformId: freezed == iosPlatformId ? _self.iosPlatformId : iosPlatformId // ignore: cast_nullable_to_non_nullable
as String?,androidPlatformId: freezed == androidPlatformId ? _self.androidPlatformId : androidPlatformId // ignore: cast_nullable_to_non_nullable
as String?,termsConditionsUrl: freezed == termsConditionsUrl ? _self.termsConditionsUrl : termsConditionsUrl // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionModel?,androidVersion: freezed == androidVersion ? _self.androidVersion : androidVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionModel?,iosVersion: freezed == iosVersion ? _self.iosVersion : iosVersion // ignore: cast_nullable_to_non_nullable
as BuildVersionModel?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionModelCopyWith<$Res>? get appVersion {
    if (_self.appVersion == null) {
    return null;
  }

  return $BuildVersionModelCopyWith<$Res>(_self.appVersion!, (value) {
    return _then(_self.copyWith(appVersion: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionModelCopyWith<$Res>? get androidVersion {
    if (_self.androidVersion == null) {
    return null;
  }

  return $BuildVersionModelCopyWith<$Res>(_self.androidVersion!, (value) {
    return _then(_self.copyWith(androidVersion: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildVersionModelCopyWith<$Res>? get iosVersion {
    if (_self.iosVersion == null) {
    return null;
  }

  return $BuildVersionModelCopyWith<$Res>(_self.iosVersion!, (value) {
    return _then(_self.copyWith(iosVersion: value));
  });
}
}

// dart format on
