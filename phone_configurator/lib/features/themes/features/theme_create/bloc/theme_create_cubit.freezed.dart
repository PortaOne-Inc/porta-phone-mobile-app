// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_create_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeCreateState {

 ThemeCreateStateStatus get status; AppConfig get defaultFeatureAccess; ThemeSettings get defaultThemeConfig; ThemeModel? get themeModel; ThemeNameInput? get nameInput; String? get description; bool? get useAi; String? get prompt; Object? get error;
/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeCreateStateCopyWith<ThemeCreateState> get copyWith => _$ThemeCreateStateCopyWithImpl<ThemeCreateState>(this as ThemeCreateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeCreateState&&(identical(other.status, status) || other.status == status)&&(identical(other.defaultFeatureAccess, defaultFeatureAccess) || other.defaultFeatureAccess == defaultFeatureAccess)&&(identical(other.defaultThemeConfig, defaultThemeConfig) || other.defaultThemeConfig == defaultThemeConfig)&&(identical(other.themeModel, themeModel) || other.themeModel == themeModel)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.description, description) || other.description == description)&&(identical(other.useAi, useAi) || other.useAi == useAi)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,defaultFeatureAccess,defaultThemeConfig,themeModel,nameInput,description,useAi,prompt,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ThemeCreateState(status: $status, defaultFeatureAccess: $defaultFeatureAccess, defaultThemeConfig: $defaultThemeConfig, themeModel: $themeModel, nameInput: $nameInput, description: $description, useAi: $useAi, prompt: $prompt, error: $error)';
}


}

/// @nodoc
abstract mixin class $ThemeCreateStateCopyWith<$Res>  {
  factory $ThemeCreateStateCopyWith(ThemeCreateState value, $Res Function(ThemeCreateState) _then) = _$ThemeCreateStateCopyWithImpl;
@useResult
$Res call({
 ThemeCreateStateStatus status, AppConfig defaultFeatureAccess, ThemeSettings defaultThemeConfig, ThemeModel? themeModel, ThemeNameInput? nameInput, String? description, bool? useAi, String? prompt, Object? error
});


$AppConfigCopyWith<$Res> get defaultFeatureAccess;$ThemeSettingsCopyWith<$Res> get defaultThemeConfig;$ThemeModelCopyWith<$Res>? get themeModel;

}
/// @nodoc
class _$ThemeCreateStateCopyWithImpl<$Res>
    implements $ThemeCreateStateCopyWith<$Res> {
  _$ThemeCreateStateCopyWithImpl(this._self, this._then);

  final ThemeCreateState _self;
  final $Res Function(ThemeCreateState) _then;

/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? defaultFeatureAccess = null,Object? defaultThemeConfig = null,Object? themeModel = freezed,Object? nameInput = freezed,Object? description = freezed,Object? useAi = freezed,Object? prompt = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemeCreateStateStatus,defaultFeatureAccess: null == defaultFeatureAccess ? _self.defaultFeatureAccess : defaultFeatureAccess // ignore: cast_nullable_to_non_nullable
as AppConfig,defaultThemeConfig: null == defaultThemeConfig ? _self.defaultThemeConfig : defaultThemeConfig // ignore: cast_nullable_to_non_nullable
as ThemeSettings,themeModel: freezed == themeModel ? _self.themeModel : themeModel // ignore: cast_nullable_to_non_nullable
as ThemeModel?,nameInput: freezed == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as ThemeNameInput?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,useAi: freezed == useAi ? _self.useAi : useAi // ignore: cast_nullable_to_non_nullable
as bool?,prompt: freezed == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error ,
  ));
}
/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigCopyWith<$Res> get defaultFeatureAccess {
  
  return $AppConfigCopyWith<$Res>(_self.defaultFeatureAccess, (value) {
    return _then(_self.copyWith(defaultFeatureAccess: value));
  });
}/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeSettingsCopyWith<$Res> get defaultThemeConfig {
  
  return $ThemeSettingsCopyWith<$Res>(_self.defaultThemeConfig, (value) {
    return _then(_self.copyWith(defaultThemeConfig: value));
  });
}/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeModelCopyWith<$Res>? get themeModel {
    if (_self.themeModel == null) {
    return null;
  }

  return $ThemeModelCopyWith<$Res>(_self.themeModel!, (value) {
    return _then(_self.copyWith(themeModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [ThemeCreateState].
extension ThemeCreateStatePatterns on ThemeCreateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeCreateStateInitial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeCreateStateInitial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeCreateStateInitial value)  $default,){
final _that = this;
switch (_that) {
case _ThemeCreateStateInitial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeCreateStateInitial value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeCreateStateInitial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeCreateStateStatus status,  AppConfig defaultFeatureAccess,  ThemeSettings defaultThemeConfig,  ThemeModel? themeModel,  ThemeNameInput? nameInput,  String? description,  bool? useAi,  String? prompt,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeCreateStateInitial() when $default != null:
return $default(_that.status,_that.defaultFeatureAccess,_that.defaultThemeConfig,_that.themeModel,_that.nameInput,_that.description,_that.useAi,_that.prompt,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeCreateStateStatus status,  AppConfig defaultFeatureAccess,  ThemeSettings defaultThemeConfig,  ThemeModel? themeModel,  ThemeNameInput? nameInput,  String? description,  bool? useAi,  String? prompt,  Object? error)  $default,) {final _that = this;
switch (_that) {
case _ThemeCreateStateInitial():
return $default(_that.status,_that.defaultFeatureAccess,_that.defaultThemeConfig,_that.themeModel,_that.nameInput,_that.description,_that.useAi,_that.prompt,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeCreateStateStatus status,  AppConfig defaultFeatureAccess,  ThemeSettings defaultThemeConfig,  ThemeModel? themeModel,  ThemeNameInput? nameInput,  String? description,  bool? useAi,  String? prompt,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case _ThemeCreateStateInitial() when $default != null:
return $default(_that.status,_that.defaultFeatureAccess,_that.defaultThemeConfig,_that.themeModel,_that.nameInput,_that.description,_that.useAi,_that.prompt,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ThemeCreateStateInitial implements ThemeCreateState {
  const _ThemeCreateStateInitial({required this.status, required this.defaultFeatureAccess, required this.defaultThemeConfig, this.themeModel, this.nameInput, this.description, this.useAi, this.prompt, this.error});
  

@override final  ThemeCreateStateStatus status;
@override final  AppConfig defaultFeatureAccess;
@override final  ThemeSettings defaultThemeConfig;
@override final  ThemeModel? themeModel;
@override final  ThemeNameInput? nameInput;
@override final  String? description;
@override final  bool? useAi;
@override final  String? prompt;
@override final  Object? error;

/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeCreateStateInitialCopyWith<_ThemeCreateStateInitial> get copyWith => __$ThemeCreateStateInitialCopyWithImpl<_ThemeCreateStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeCreateStateInitial&&(identical(other.status, status) || other.status == status)&&(identical(other.defaultFeatureAccess, defaultFeatureAccess) || other.defaultFeatureAccess == defaultFeatureAccess)&&(identical(other.defaultThemeConfig, defaultThemeConfig) || other.defaultThemeConfig == defaultThemeConfig)&&(identical(other.themeModel, themeModel) || other.themeModel == themeModel)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.description, description) || other.description == description)&&(identical(other.useAi, useAi) || other.useAi == useAi)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,defaultFeatureAccess,defaultThemeConfig,themeModel,nameInput,description,useAi,prompt,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ThemeCreateState(status: $status, defaultFeatureAccess: $defaultFeatureAccess, defaultThemeConfig: $defaultThemeConfig, themeModel: $themeModel, nameInput: $nameInput, description: $description, useAi: $useAi, prompt: $prompt, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ThemeCreateStateInitialCopyWith<$Res> implements $ThemeCreateStateCopyWith<$Res> {
  factory _$ThemeCreateStateInitialCopyWith(_ThemeCreateStateInitial value, $Res Function(_ThemeCreateStateInitial) _then) = __$ThemeCreateStateInitialCopyWithImpl;
@override @useResult
$Res call({
 ThemeCreateStateStatus status, AppConfig defaultFeatureAccess, ThemeSettings defaultThemeConfig, ThemeModel? themeModel, ThemeNameInput? nameInput, String? description, bool? useAi, String? prompt, Object? error
});


@override $AppConfigCopyWith<$Res> get defaultFeatureAccess;@override $ThemeSettingsCopyWith<$Res> get defaultThemeConfig;@override $ThemeModelCopyWith<$Res>? get themeModel;

}
/// @nodoc
class __$ThemeCreateStateInitialCopyWithImpl<$Res>
    implements _$ThemeCreateStateInitialCopyWith<$Res> {
  __$ThemeCreateStateInitialCopyWithImpl(this._self, this._then);

  final _ThemeCreateStateInitial _self;
  final $Res Function(_ThemeCreateStateInitial) _then;

/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? defaultFeatureAccess = null,Object? defaultThemeConfig = null,Object? themeModel = freezed,Object? nameInput = freezed,Object? description = freezed,Object? useAi = freezed,Object? prompt = freezed,Object? error = freezed,}) {
  return _then(_ThemeCreateStateInitial(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemeCreateStateStatus,defaultFeatureAccess: null == defaultFeatureAccess ? _self.defaultFeatureAccess : defaultFeatureAccess // ignore: cast_nullable_to_non_nullable
as AppConfig,defaultThemeConfig: null == defaultThemeConfig ? _self.defaultThemeConfig : defaultThemeConfig // ignore: cast_nullable_to_non_nullable
as ThemeSettings,themeModel: freezed == themeModel ? _self.themeModel : themeModel // ignore: cast_nullable_to_non_nullable
as ThemeModel?,nameInput: freezed == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as ThemeNameInput?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,useAi: freezed == useAi ? _self.useAi : useAi // ignore: cast_nullable_to_non_nullable
as bool?,prompt: freezed == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error ,
  ));
}

/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigCopyWith<$Res> get defaultFeatureAccess {
  
  return $AppConfigCopyWith<$Res>(_self.defaultFeatureAccess, (value) {
    return _then(_self.copyWith(defaultFeatureAccess: value));
  });
}/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeSettingsCopyWith<$Res> get defaultThemeConfig {
  
  return $ThemeSettingsCopyWith<$Res>(_self.defaultThemeConfig, (value) {
    return _then(_self.copyWith(defaultThemeConfig: value));
  });
}/// Create a copy of ThemeCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeModelCopyWith<$Res>? get themeModel {
    if (_self.themeModel == null) {
    return null;
  }

  return $ThemeModelCopyWith<$Res>(_self.themeModel!, (value) {
    return _then(_self.copyWith(themeModel: value));
  });
}
}

// dart format on
