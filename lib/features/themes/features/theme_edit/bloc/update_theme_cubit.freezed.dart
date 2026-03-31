// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SyncDetail {

 ConfigSyncResult get featureAccess; ConfigSyncResult get colorScheme; ConfigSyncResult get pageConfig; ConfigSyncResult get widgetConfig;
/// Create a copy of SyncDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncDetailCopyWith<SyncDetail> get copyWith => _$SyncDetailCopyWithImpl<SyncDetail>(this as SyncDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncDetail&&(identical(other.featureAccess, featureAccess) || other.featureAccess == featureAccess)&&(identical(other.colorScheme, colorScheme) || other.colorScheme == colorScheme)&&(identical(other.pageConfig, pageConfig) || other.pageConfig == pageConfig)&&(identical(other.widgetConfig, widgetConfig) || other.widgetConfig == widgetConfig));
}


@override
int get hashCode => Object.hash(runtimeType,featureAccess,colorScheme,pageConfig,widgetConfig);

@override
String toString() {
  return 'SyncDetail(featureAccess: $featureAccess, colorScheme: $colorScheme, pageConfig: $pageConfig, widgetConfig: $widgetConfig)';
}


}

/// @nodoc
abstract mixin class $SyncDetailCopyWith<$Res>  {
  factory $SyncDetailCopyWith(SyncDetail value, $Res Function(SyncDetail) _then) = _$SyncDetailCopyWithImpl;
@useResult
$Res call({
 ConfigSyncResult featureAccess, ConfigSyncResult colorScheme, ConfigSyncResult pageConfig, ConfigSyncResult widgetConfig
});




}
/// @nodoc
class _$SyncDetailCopyWithImpl<$Res>
    implements $SyncDetailCopyWith<$Res> {
  _$SyncDetailCopyWithImpl(this._self, this._then);

  final SyncDetail _self;
  final $Res Function(SyncDetail) _then;

/// Create a copy of SyncDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? featureAccess = null,Object? colorScheme = null,Object? pageConfig = null,Object? widgetConfig = null,}) {
  return _then(_self.copyWith(
featureAccess: null == featureAccess ? _self.featureAccess : featureAccess // ignore: cast_nullable_to_non_nullable
as ConfigSyncResult,colorScheme: null == colorScheme ? _self.colorScheme : colorScheme // ignore: cast_nullable_to_non_nullable
as ConfigSyncResult,pageConfig: null == pageConfig ? _self.pageConfig : pageConfig // ignore: cast_nullable_to_non_nullable
as ConfigSyncResult,widgetConfig: null == widgetConfig ? _self.widgetConfig : widgetConfig // ignore: cast_nullable_to_non_nullable
as ConfigSyncResult,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncDetail].
extension SyncDetailPatterns on SyncDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncDetail value)  $default,){
final _that = this;
switch (_that) {
case _SyncDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncDetail value)?  $default,){
final _that = this;
switch (_that) {
case _SyncDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConfigSyncResult featureAccess,  ConfigSyncResult colorScheme,  ConfigSyncResult pageConfig,  ConfigSyncResult widgetConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncDetail() when $default != null:
return $default(_that.featureAccess,_that.colorScheme,_that.pageConfig,_that.widgetConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConfigSyncResult featureAccess,  ConfigSyncResult colorScheme,  ConfigSyncResult pageConfig,  ConfigSyncResult widgetConfig)  $default,) {final _that = this;
switch (_that) {
case _SyncDetail():
return $default(_that.featureAccess,_that.colorScheme,_that.pageConfig,_that.widgetConfig);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConfigSyncResult featureAccess,  ConfigSyncResult colorScheme,  ConfigSyncResult pageConfig,  ConfigSyncResult widgetConfig)?  $default,) {final _that = this;
switch (_that) {
case _SyncDetail() when $default != null:
return $default(_that.featureAccess,_that.colorScheme,_that.pageConfig,_that.widgetConfig);case _:
  return null;

}
}

}

/// @nodoc


class _SyncDetail extends SyncDetail {
  const _SyncDetail({this.featureAccess = ConfigSyncResult.pending, this.colorScheme = ConfigSyncResult.pending, this.pageConfig = ConfigSyncResult.pending, this.widgetConfig = ConfigSyncResult.pending}): super._();
  

@override@JsonKey() final  ConfigSyncResult featureAccess;
@override@JsonKey() final  ConfigSyncResult colorScheme;
@override@JsonKey() final  ConfigSyncResult pageConfig;
@override@JsonKey() final  ConfigSyncResult widgetConfig;

/// Create a copy of SyncDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncDetailCopyWith<_SyncDetail> get copyWith => __$SyncDetailCopyWithImpl<_SyncDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncDetail&&(identical(other.featureAccess, featureAccess) || other.featureAccess == featureAccess)&&(identical(other.colorScheme, colorScheme) || other.colorScheme == colorScheme)&&(identical(other.pageConfig, pageConfig) || other.pageConfig == pageConfig)&&(identical(other.widgetConfig, widgetConfig) || other.widgetConfig == widgetConfig));
}


@override
int get hashCode => Object.hash(runtimeType,featureAccess,colorScheme,pageConfig,widgetConfig);

@override
String toString() {
  return 'SyncDetail(featureAccess: $featureAccess, colorScheme: $colorScheme, pageConfig: $pageConfig, widgetConfig: $widgetConfig)';
}


}

/// @nodoc
abstract mixin class _$SyncDetailCopyWith<$Res> implements $SyncDetailCopyWith<$Res> {
  factory _$SyncDetailCopyWith(_SyncDetail value, $Res Function(_SyncDetail) _then) = __$SyncDetailCopyWithImpl;
@override @useResult
$Res call({
 ConfigSyncResult featureAccess, ConfigSyncResult colorScheme, ConfigSyncResult pageConfig, ConfigSyncResult widgetConfig
});




}
/// @nodoc
class __$SyncDetailCopyWithImpl<$Res>
    implements _$SyncDetailCopyWith<$Res> {
  __$SyncDetailCopyWithImpl(this._self, this._then);

  final _SyncDetail _self;
  final $Res Function(_SyncDetail) _then;

/// Create a copy of SyncDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? featureAccess = null,Object? colorScheme = null,Object? pageConfig = null,Object? widgetConfig = null,}) {
  return _then(_SyncDetail(
featureAccess: null == featureAccess ? _self.featureAccess : featureAccess // ignore: cast_nullable_to_non_nullable
as ConfigSyncResult,colorScheme: null == colorScheme ? _self.colorScheme : colorScheme // ignore: cast_nullable_to_non_nullable
as ConfigSyncResult,pageConfig: null == pageConfig ? _self.pageConfig : pageConfig // ignore: cast_nullable_to_non_nullable
as ConfigSyncResult,widgetConfig: null == widgetConfig ? _self.widgetConfig : widgetConfig // ignore: cast_nullable_to_non_nullable
as ConfigSyncResult,
  ));
}


}

/// @nodoc
mixin _$UpdateThemeState {

 AppConfig get appConfig; ColorSchemeConfig get colorSchemeConfig; ThemeWidgetConfig get themeWidgetConfig; ThemePageConfig get themePageConfig; BrightnessVariant get selectedVariant; List<AssetModel> get assets; List<EmbeddedResourceModel> get embeddedResources; List<ThemeComponents> get loadedComponents; ApplicationModel? get applicationModel; ThemeModel? get theme; FeatureAccessModel? get featureAccessModel; ThemePropertyStatus? get status; SyncStatus get syncStatus; SyncDetail get syncDetail; ColorSchemeModel? get colorSchemeModel; Exception? get error; String? get errorSource;
/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateThemeStateCopyWith<UpdateThemeState> get copyWith => _$UpdateThemeStateCopyWithImpl<UpdateThemeState>(this as UpdateThemeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateThemeState&&(identical(other.appConfig, appConfig) || other.appConfig == appConfig)&&(identical(other.colorSchemeConfig, colorSchemeConfig) || other.colorSchemeConfig == colorSchemeConfig)&&(identical(other.themeWidgetConfig, themeWidgetConfig) || other.themeWidgetConfig == themeWidgetConfig)&&(identical(other.themePageConfig, themePageConfig) || other.themePageConfig == themePageConfig)&&(identical(other.selectedVariant, selectedVariant) || other.selectedVariant == selectedVariant)&&const DeepCollectionEquality().equals(other.assets, assets)&&const DeepCollectionEquality().equals(other.embeddedResources, embeddedResources)&&const DeepCollectionEquality().equals(other.loadedComponents, loadedComponents)&&(identical(other.applicationModel, applicationModel) || other.applicationModel == applicationModel)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.featureAccessModel, featureAccessModel) || other.featureAccessModel == featureAccessModel)&&(identical(other.status, status) || other.status == status)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.syncDetail, syncDetail) || other.syncDetail == syncDetail)&&(identical(other.colorSchemeModel, colorSchemeModel) || other.colorSchemeModel == colorSchemeModel)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorSource, errorSource) || other.errorSource == errorSource));
}


@override
int get hashCode => Object.hash(runtimeType,appConfig,colorSchemeConfig,themeWidgetConfig,themePageConfig,selectedVariant,const DeepCollectionEquality().hash(assets),const DeepCollectionEquality().hash(embeddedResources),const DeepCollectionEquality().hash(loadedComponents),applicationModel,theme,featureAccessModel,status,syncStatus,syncDetail,colorSchemeModel,error,errorSource);

@override
String toString() {
  return 'UpdateThemeState(appConfig: $appConfig, colorSchemeConfig: $colorSchemeConfig, themeWidgetConfig: $themeWidgetConfig, themePageConfig: $themePageConfig, selectedVariant: $selectedVariant, assets: $assets, embeddedResources: $embeddedResources, loadedComponents: $loadedComponents, applicationModel: $applicationModel, theme: $theme, featureAccessModel: $featureAccessModel, status: $status, syncStatus: $syncStatus, syncDetail: $syncDetail, colorSchemeModel: $colorSchemeModel, error: $error, errorSource: $errorSource)';
}


}

/// @nodoc
abstract mixin class $UpdateThemeStateCopyWith<$Res>  {
  factory $UpdateThemeStateCopyWith(UpdateThemeState value, $Res Function(UpdateThemeState) _then) = _$UpdateThemeStateCopyWithImpl;
@useResult
$Res call({
 AppConfig appConfig, ColorSchemeConfig colorSchemeConfig, ThemeWidgetConfig themeWidgetConfig, ThemePageConfig themePageConfig, BrightnessVariant selectedVariant, List<AssetModel> assets, List<EmbeddedResourceModel> embeddedResources, List<ThemeComponents> loadedComponents, ApplicationModel? applicationModel, ThemeModel? theme, FeatureAccessModel? featureAccessModel, ThemePropertyStatus? status, SyncStatus syncStatus, SyncDetail syncDetail, ColorSchemeModel? colorSchemeModel, Exception? error, String? errorSource
});


$AppConfigCopyWith<$Res> get appConfig;$ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig;$ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig;$ThemePageConfigCopyWith<$Res> get themePageConfig;$ApplicationModelCopyWith<$Res>? get applicationModel;$ThemeModelCopyWith<$Res>? get theme;$FeatureAccessModelCopyWith<$Res>? get featureAccessModel;$SyncDetailCopyWith<$Res> get syncDetail;$ColorSchemeModelCopyWith<$Res>? get colorSchemeModel;

}
/// @nodoc
class _$UpdateThemeStateCopyWithImpl<$Res>
    implements $UpdateThemeStateCopyWith<$Res> {
  _$UpdateThemeStateCopyWithImpl(this._self, this._then);

  final UpdateThemeState _self;
  final $Res Function(UpdateThemeState) _then;

/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appConfig = null,Object? colorSchemeConfig = null,Object? themeWidgetConfig = null,Object? themePageConfig = null,Object? selectedVariant = null,Object? assets = null,Object? embeddedResources = null,Object? loadedComponents = null,Object? applicationModel = freezed,Object? theme = freezed,Object? featureAccessModel = freezed,Object? status = freezed,Object? syncStatus = null,Object? syncDetail = null,Object? colorSchemeModel = freezed,Object? error = freezed,Object? errorSource = freezed,}) {
  return _then(_self.copyWith(
appConfig: null == appConfig ? _self.appConfig : appConfig // ignore: cast_nullable_to_non_nullable
as AppConfig,colorSchemeConfig: null == colorSchemeConfig ? _self.colorSchemeConfig : colorSchemeConfig // ignore: cast_nullable_to_non_nullable
as ColorSchemeConfig,themeWidgetConfig: null == themeWidgetConfig ? _self.themeWidgetConfig : themeWidgetConfig // ignore: cast_nullable_to_non_nullable
as ThemeWidgetConfig,themePageConfig: null == themePageConfig ? _self.themePageConfig : themePageConfig // ignore: cast_nullable_to_non_nullable
as ThemePageConfig,selectedVariant: null == selectedVariant ? _self.selectedVariant : selectedVariant // ignore: cast_nullable_to_non_nullable
as BrightnessVariant,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as List<AssetModel>,embeddedResources: null == embeddedResources ? _self.embeddedResources : embeddedResources // ignore: cast_nullable_to_non_nullable
as List<EmbeddedResourceModel>,loadedComponents: null == loadedComponents ? _self.loadedComponents : loadedComponents // ignore: cast_nullable_to_non_nullable
as List<ThemeComponents>,applicationModel: freezed == applicationModel ? _self.applicationModel : applicationModel // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as ThemeModel?,featureAccessModel: freezed == featureAccessModel ? _self.featureAccessModel : featureAccessModel // ignore: cast_nullable_to_non_nullable
as FeatureAccessModel?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemePropertyStatus?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,syncDetail: null == syncDetail ? _self.syncDetail : syncDetail // ignore: cast_nullable_to_non_nullable
as SyncDetail,colorSchemeModel: freezed == colorSchemeModel ? _self.colorSchemeModel : colorSchemeModel // ignore: cast_nullable_to_non_nullable
as ColorSchemeModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Exception?,errorSource: freezed == errorSource ? _self.errorSource : errorSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigCopyWith<$Res> get appConfig {
  
  return $AppConfigCopyWith<$Res>(_self.appConfig, (value) {
    return _then(_self.copyWith(appConfig: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig {
  
  return $ColorSchemeConfigCopyWith<$Res>(_self.colorSchemeConfig, (value) {
    return _then(_self.copyWith(colorSchemeConfig: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig {
  
  return $ThemeWidgetConfigCopyWith<$Res>(_self.themeWidgetConfig, (value) {
    return _then(_self.copyWith(themeWidgetConfig: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemePageConfigCopyWith<$Res> get themePageConfig {
  
  return $ThemePageConfigCopyWith<$Res>(_self.themePageConfig, (value) {
    return _then(_self.copyWith(themePageConfig: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<$Res>? get applicationModel {
    if (_self.applicationModel == null) {
    return null;
  }

  return $ApplicationModelCopyWith<$Res>(_self.applicationModel!, (value) {
    return _then(_self.copyWith(applicationModel: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeModelCopyWith<$Res>? get theme {
    if (_self.theme == null) {
    return null;
  }

  return $ThemeModelCopyWith<$Res>(_self.theme!, (value) {
    return _then(_self.copyWith(theme: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeatureAccessModelCopyWith<$Res>? get featureAccessModel {
    if (_self.featureAccessModel == null) {
    return null;
  }

  return $FeatureAccessModelCopyWith<$Res>(_self.featureAccessModel!, (value) {
    return _then(_self.copyWith(featureAccessModel: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncDetailCopyWith<$Res> get syncDetail {
  
  return $SyncDetailCopyWith<$Res>(_self.syncDetail, (value) {
    return _then(_self.copyWith(syncDetail: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorSchemeModelCopyWith<$Res>? get colorSchemeModel {
    if (_self.colorSchemeModel == null) {
    return null;
  }

  return $ColorSchemeModelCopyWith<$Res>(_self.colorSchemeModel!, (value) {
    return _then(_self.copyWith(colorSchemeModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateThemeState].
extension UpdateThemeStatePatterns on UpdateThemeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateThemeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateThemeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateThemeState value)  $default,){
final _that = this;
switch (_that) {
case _UpdateThemeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateThemeState value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateThemeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppConfig appConfig,  ColorSchemeConfig colorSchemeConfig,  ThemeWidgetConfig themeWidgetConfig,  ThemePageConfig themePageConfig,  BrightnessVariant selectedVariant,  List<AssetModel> assets,  List<EmbeddedResourceModel> embeddedResources,  List<ThemeComponents> loadedComponents,  ApplicationModel? applicationModel,  ThemeModel? theme,  FeatureAccessModel? featureAccessModel,  ThemePropertyStatus? status,  SyncStatus syncStatus,  SyncDetail syncDetail,  ColorSchemeModel? colorSchemeModel,  Exception? error,  String? errorSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateThemeState() when $default != null:
return $default(_that.appConfig,_that.colorSchemeConfig,_that.themeWidgetConfig,_that.themePageConfig,_that.selectedVariant,_that.assets,_that.embeddedResources,_that.loadedComponents,_that.applicationModel,_that.theme,_that.featureAccessModel,_that.status,_that.syncStatus,_that.syncDetail,_that.colorSchemeModel,_that.error,_that.errorSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppConfig appConfig,  ColorSchemeConfig colorSchemeConfig,  ThemeWidgetConfig themeWidgetConfig,  ThemePageConfig themePageConfig,  BrightnessVariant selectedVariant,  List<AssetModel> assets,  List<EmbeddedResourceModel> embeddedResources,  List<ThemeComponents> loadedComponents,  ApplicationModel? applicationModel,  ThemeModel? theme,  FeatureAccessModel? featureAccessModel,  ThemePropertyStatus? status,  SyncStatus syncStatus,  SyncDetail syncDetail,  ColorSchemeModel? colorSchemeModel,  Exception? error,  String? errorSource)  $default,) {final _that = this;
switch (_that) {
case _UpdateThemeState():
return $default(_that.appConfig,_that.colorSchemeConfig,_that.themeWidgetConfig,_that.themePageConfig,_that.selectedVariant,_that.assets,_that.embeddedResources,_that.loadedComponents,_that.applicationModel,_that.theme,_that.featureAccessModel,_that.status,_that.syncStatus,_that.syncDetail,_that.colorSchemeModel,_that.error,_that.errorSource);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppConfig appConfig,  ColorSchemeConfig colorSchemeConfig,  ThemeWidgetConfig themeWidgetConfig,  ThemePageConfig themePageConfig,  BrightnessVariant selectedVariant,  List<AssetModel> assets,  List<EmbeddedResourceModel> embeddedResources,  List<ThemeComponents> loadedComponents,  ApplicationModel? applicationModel,  ThemeModel? theme,  FeatureAccessModel? featureAccessModel,  ThemePropertyStatus? status,  SyncStatus syncStatus,  SyncDetail syncDetail,  ColorSchemeModel? colorSchemeModel,  Exception? error,  String? errorSource)?  $default,) {final _that = this;
switch (_that) {
case _UpdateThemeState() when $default != null:
return $default(_that.appConfig,_that.colorSchemeConfig,_that.themeWidgetConfig,_that.themePageConfig,_that.selectedVariant,_that.assets,_that.embeddedResources,_that.loadedComponents,_that.applicationModel,_that.theme,_that.featureAccessModel,_that.status,_that.syncStatus,_that.syncDetail,_that.colorSchemeModel,_that.error,_that.errorSource);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateThemeState extends UpdateThemeState {
   _UpdateThemeState({required this.appConfig, required this.colorSchemeConfig, required this.themeWidgetConfig, required this.themePageConfig, this.selectedVariant = BrightnessVariant.light, final  List<AssetModel> assets = const <AssetModel>[], final  List<EmbeddedResourceModel> embeddedResources = const <EmbeddedResourceModel>[], final  List<ThemeComponents> loadedComponents = const <ThemeComponents>[], this.applicationModel, this.theme, this.featureAccessModel, this.status, this.syncStatus = SyncStatus.idle, this.syncDetail = const SyncDetail(), this.colorSchemeModel, this.error, this.errorSource}): _assets = assets,_embeddedResources = embeddedResources,_loadedComponents = loadedComponents,super._();
  

@override final  AppConfig appConfig;
@override final  ColorSchemeConfig colorSchemeConfig;
@override final  ThemeWidgetConfig themeWidgetConfig;
@override final  ThemePageConfig themePageConfig;
@override@JsonKey() final  BrightnessVariant selectedVariant;
 final  List<AssetModel> _assets;
@override@JsonKey() List<AssetModel> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}

 final  List<EmbeddedResourceModel> _embeddedResources;
@override@JsonKey() List<EmbeddedResourceModel> get embeddedResources {
  if (_embeddedResources is EqualUnmodifiableListView) return _embeddedResources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_embeddedResources);
}

 final  List<ThemeComponents> _loadedComponents;
@override@JsonKey() List<ThemeComponents> get loadedComponents {
  if (_loadedComponents is EqualUnmodifiableListView) return _loadedComponents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_loadedComponents);
}

@override final  ApplicationModel? applicationModel;
@override final  ThemeModel? theme;
@override final  FeatureAccessModel? featureAccessModel;
@override final  ThemePropertyStatus? status;
@override@JsonKey() final  SyncStatus syncStatus;
@override@JsonKey() final  SyncDetail syncDetail;
@override final  ColorSchemeModel? colorSchemeModel;
@override final  Exception? error;
@override final  String? errorSource;

/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateThemeStateCopyWith<_UpdateThemeState> get copyWith => __$UpdateThemeStateCopyWithImpl<_UpdateThemeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateThemeState&&(identical(other.appConfig, appConfig) || other.appConfig == appConfig)&&(identical(other.colorSchemeConfig, colorSchemeConfig) || other.colorSchemeConfig == colorSchemeConfig)&&(identical(other.themeWidgetConfig, themeWidgetConfig) || other.themeWidgetConfig == themeWidgetConfig)&&(identical(other.themePageConfig, themePageConfig) || other.themePageConfig == themePageConfig)&&(identical(other.selectedVariant, selectedVariant) || other.selectedVariant == selectedVariant)&&const DeepCollectionEquality().equals(other._assets, _assets)&&const DeepCollectionEquality().equals(other._embeddedResources, _embeddedResources)&&const DeepCollectionEquality().equals(other._loadedComponents, _loadedComponents)&&(identical(other.applicationModel, applicationModel) || other.applicationModel == applicationModel)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.featureAccessModel, featureAccessModel) || other.featureAccessModel == featureAccessModel)&&(identical(other.status, status) || other.status == status)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.syncDetail, syncDetail) || other.syncDetail == syncDetail)&&(identical(other.colorSchemeModel, colorSchemeModel) || other.colorSchemeModel == colorSchemeModel)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorSource, errorSource) || other.errorSource == errorSource));
}


@override
int get hashCode => Object.hash(runtimeType,appConfig,colorSchemeConfig,themeWidgetConfig,themePageConfig,selectedVariant,const DeepCollectionEquality().hash(_assets),const DeepCollectionEquality().hash(_embeddedResources),const DeepCollectionEquality().hash(_loadedComponents),applicationModel,theme,featureAccessModel,status,syncStatus,syncDetail,colorSchemeModel,error,errorSource);

@override
String toString() {
  return 'UpdateThemeState(appConfig: $appConfig, colorSchemeConfig: $colorSchemeConfig, themeWidgetConfig: $themeWidgetConfig, themePageConfig: $themePageConfig, selectedVariant: $selectedVariant, assets: $assets, embeddedResources: $embeddedResources, loadedComponents: $loadedComponents, applicationModel: $applicationModel, theme: $theme, featureAccessModel: $featureAccessModel, status: $status, syncStatus: $syncStatus, syncDetail: $syncDetail, colorSchemeModel: $colorSchemeModel, error: $error, errorSource: $errorSource)';
}


}

/// @nodoc
abstract mixin class _$UpdateThemeStateCopyWith<$Res> implements $UpdateThemeStateCopyWith<$Res> {
  factory _$UpdateThemeStateCopyWith(_UpdateThemeState value, $Res Function(_UpdateThemeState) _then) = __$UpdateThemeStateCopyWithImpl;
@override @useResult
$Res call({
 AppConfig appConfig, ColorSchemeConfig colorSchemeConfig, ThemeWidgetConfig themeWidgetConfig, ThemePageConfig themePageConfig, BrightnessVariant selectedVariant, List<AssetModel> assets, List<EmbeddedResourceModel> embeddedResources, List<ThemeComponents> loadedComponents, ApplicationModel? applicationModel, ThemeModel? theme, FeatureAccessModel? featureAccessModel, ThemePropertyStatus? status, SyncStatus syncStatus, SyncDetail syncDetail, ColorSchemeModel? colorSchemeModel, Exception? error, String? errorSource
});


@override $AppConfigCopyWith<$Res> get appConfig;@override $ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig;@override $ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig;@override $ThemePageConfigCopyWith<$Res> get themePageConfig;@override $ApplicationModelCopyWith<$Res>? get applicationModel;@override $ThemeModelCopyWith<$Res>? get theme;@override $FeatureAccessModelCopyWith<$Res>? get featureAccessModel;@override $SyncDetailCopyWith<$Res> get syncDetail;@override $ColorSchemeModelCopyWith<$Res>? get colorSchemeModel;

}
/// @nodoc
class __$UpdateThemeStateCopyWithImpl<$Res>
    implements _$UpdateThemeStateCopyWith<$Res> {
  __$UpdateThemeStateCopyWithImpl(this._self, this._then);

  final _UpdateThemeState _self;
  final $Res Function(_UpdateThemeState) _then;

/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appConfig = null,Object? colorSchemeConfig = null,Object? themeWidgetConfig = null,Object? themePageConfig = null,Object? selectedVariant = null,Object? assets = null,Object? embeddedResources = null,Object? loadedComponents = null,Object? applicationModel = freezed,Object? theme = freezed,Object? featureAccessModel = freezed,Object? status = freezed,Object? syncStatus = null,Object? syncDetail = null,Object? colorSchemeModel = freezed,Object? error = freezed,Object? errorSource = freezed,}) {
  return _then(_UpdateThemeState(
appConfig: null == appConfig ? _self.appConfig : appConfig // ignore: cast_nullable_to_non_nullable
as AppConfig,colorSchemeConfig: null == colorSchemeConfig ? _self.colorSchemeConfig : colorSchemeConfig // ignore: cast_nullable_to_non_nullable
as ColorSchemeConfig,themeWidgetConfig: null == themeWidgetConfig ? _self.themeWidgetConfig : themeWidgetConfig // ignore: cast_nullable_to_non_nullable
as ThemeWidgetConfig,themePageConfig: null == themePageConfig ? _self.themePageConfig : themePageConfig // ignore: cast_nullable_to_non_nullable
as ThemePageConfig,selectedVariant: null == selectedVariant ? _self.selectedVariant : selectedVariant // ignore: cast_nullable_to_non_nullable
as BrightnessVariant,assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as List<AssetModel>,embeddedResources: null == embeddedResources ? _self._embeddedResources : embeddedResources // ignore: cast_nullable_to_non_nullable
as List<EmbeddedResourceModel>,loadedComponents: null == loadedComponents ? _self._loadedComponents : loadedComponents // ignore: cast_nullable_to_non_nullable
as List<ThemeComponents>,applicationModel: freezed == applicationModel ? _self.applicationModel : applicationModel // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as ThemeModel?,featureAccessModel: freezed == featureAccessModel ? _self.featureAccessModel : featureAccessModel // ignore: cast_nullable_to_non_nullable
as FeatureAccessModel?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemePropertyStatus?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,syncDetail: null == syncDetail ? _self.syncDetail : syncDetail // ignore: cast_nullable_to_non_nullable
as SyncDetail,colorSchemeModel: freezed == colorSchemeModel ? _self.colorSchemeModel : colorSchemeModel // ignore: cast_nullable_to_non_nullable
as ColorSchemeModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Exception?,errorSource: freezed == errorSource ? _self.errorSource : errorSource // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigCopyWith<$Res> get appConfig {
  
  return $AppConfigCopyWith<$Res>(_self.appConfig, (value) {
    return _then(_self.copyWith(appConfig: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorSchemeConfigCopyWith<$Res> get colorSchemeConfig {
  
  return $ColorSchemeConfigCopyWith<$Res>(_self.colorSchemeConfig, (value) {
    return _then(_self.copyWith(colorSchemeConfig: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeWidgetConfigCopyWith<$Res> get themeWidgetConfig {
  
  return $ThemeWidgetConfigCopyWith<$Res>(_self.themeWidgetConfig, (value) {
    return _then(_self.copyWith(themeWidgetConfig: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemePageConfigCopyWith<$Res> get themePageConfig {
  
  return $ThemePageConfigCopyWith<$Res>(_self.themePageConfig, (value) {
    return _then(_self.copyWith(themePageConfig: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<$Res>? get applicationModel {
    if (_self.applicationModel == null) {
    return null;
  }

  return $ApplicationModelCopyWith<$Res>(_self.applicationModel!, (value) {
    return _then(_self.copyWith(applicationModel: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeModelCopyWith<$Res>? get theme {
    if (_self.theme == null) {
    return null;
  }

  return $ThemeModelCopyWith<$Res>(_self.theme!, (value) {
    return _then(_self.copyWith(theme: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeatureAccessModelCopyWith<$Res>? get featureAccessModel {
    if (_self.featureAccessModel == null) {
    return null;
  }

  return $FeatureAccessModelCopyWith<$Res>(_self.featureAccessModel!, (value) {
    return _then(_self.copyWith(featureAccessModel: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncDetailCopyWith<$Res> get syncDetail {
  
  return $SyncDetailCopyWith<$Res>(_self.syncDetail, (value) {
    return _then(_self.copyWith(syncDetail: value));
  });
}/// Create a copy of UpdateThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorSchemeModelCopyWith<$Res>? get colorSchemeModel {
    if (_self.colorSchemeModel == null) {
    return null;
  }

  return $ColorSchemeModelCopyWith<$Res>(_self.colorSchemeModel!, (value) {
    return _then(_self.copyWith(colorSchemeModel: value));
  });
}
}

/// @nodoc
mixin _$InitializeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InitializeEvent()';
}


}




/// Adds pattern-matching-related methods to [InitializeEvent].
extension InitializeEventPatterns on InitializeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InitializeEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitializeEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InitializeEvent value)  $default,){
final _that = this;
switch (_that) {
case _InitializeEvent():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InitializeEvent value)?  $default,){
final _that = this;
switch (_that) {
case _InitializeEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function()?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitializeEvent() when $default != null:
return $default();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function()  $default,) {final _that = this;
switch (_that) {
case _InitializeEvent():
return $default();case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function()?  $default,) {final _that = this;
switch (_that) {
case _InitializeEvent() when $default != null:
return $default();case _:
  return null;

}
}

}

/// @nodoc


class _InitializeEvent implements InitializeEvent {
  const _InitializeEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitializeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InitializeEvent()';
}


}




/// @nodoc
mixin _$SyncConfigEvent {

 Set<String>? get retryOnly;
/// Create a copy of SyncConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncConfigEventCopyWith<SyncConfigEvent> get copyWith => _$SyncConfigEventCopyWithImpl<SyncConfigEvent>(this as SyncConfigEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncConfigEvent&&const DeepCollectionEquality().equals(other.retryOnly, retryOnly));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(retryOnly));

@override
String toString() {
  return 'SyncConfigEvent(retryOnly: $retryOnly)';
}


}

/// @nodoc
abstract mixin class $SyncConfigEventCopyWith<$Res>  {
  factory $SyncConfigEventCopyWith(SyncConfigEvent value, $Res Function(SyncConfigEvent) _then) = _$SyncConfigEventCopyWithImpl;
@useResult
$Res call({
 Set<String>? retryOnly
});




}
/// @nodoc
class _$SyncConfigEventCopyWithImpl<$Res>
    implements $SyncConfigEventCopyWith<$Res> {
  _$SyncConfigEventCopyWithImpl(this._self, this._then);

  final SyncConfigEvent _self;
  final $Res Function(SyncConfigEvent) _then;

/// Create a copy of SyncConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? retryOnly = freezed,}) {
  return _then(_self.copyWith(
retryOnly: freezed == retryOnly ? _self.retryOnly : retryOnly // ignore: cast_nullable_to_non_nullable
as Set<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncConfigEvent].
extension SyncConfigEventPatterns on SyncConfigEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncConfigEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncConfigEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncConfigEvent value)  $default,){
final _that = this;
switch (_that) {
case _SyncConfigEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncConfigEvent value)?  $default,){
final _that = this;
switch (_that) {
case _SyncConfigEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<String>? retryOnly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncConfigEvent() when $default != null:
return $default(_that.retryOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<String>? retryOnly)  $default,) {final _that = this;
switch (_that) {
case _SyncConfigEvent():
return $default(_that.retryOnly);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<String>? retryOnly)?  $default,) {final _that = this;
switch (_that) {
case _SyncConfigEvent() when $default != null:
return $default(_that.retryOnly);case _:
  return null;

}
}

}

/// @nodoc


class _SyncConfigEvent implements SyncConfigEvent {
  const _SyncConfigEvent({final  Set<String>? retryOnly}): _retryOnly = retryOnly;
  

 final  Set<String>? _retryOnly;
@override Set<String>? get retryOnly {
  final value = _retryOnly;
  if (value == null) return null;
  if (_retryOnly is EqualUnmodifiableSetView) return _retryOnly;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(value);
}


/// Create a copy of SyncConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncConfigEventCopyWith<_SyncConfigEvent> get copyWith => __$SyncConfigEventCopyWithImpl<_SyncConfigEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncConfigEvent&&const DeepCollectionEquality().equals(other._retryOnly, _retryOnly));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_retryOnly));

@override
String toString() {
  return 'SyncConfigEvent(retryOnly: $retryOnly)';
}


}

/// @nodoc
abstract mixin class _$SyncConfigEventCopyWith<$Res> implements $SyncConfigEventCopyWith<$Res> {
  factory _$SyncConfigEventCopyWith(_SyncConfigEvent value, $Res Function(_SyncConfigEvent) _then) = __$SyncConfigEventCopyWithImpl;
@override @useResult
$Res call({
 Set<String>? retryOnly
});




}
/// @nodoc
class __$SyncConfigEventCopyWithImpl<$Res>
    implements _$SyncConfigEventCopyWith<$Res> {
  __$SyncConfigEventCopyWithImpl(this._self, this._then);

  final _SyncConfigEvent _self;
  final $Res Function(_SyncConfigEvent) _then;

/// Create a copy of SyncConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? retryOnly = freezed,}) {
  return _then(_SyncConfigEvent(
retryOnly: freezed == retryOnly ? _self._retryOnly : retryOnly // ignore: cast_nullable_to_non_nullable
as Set<String>?,
  ));
}


}

/// @nodoc
mixin _$UpdateLocalConfigEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLocalConfigEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateLocalConfigEvent()';
}


}




/// Adds pattern-matching-related methods to [UpdateLocalConfigEvent].
extension UpdateLocalConfigEventPatterns on UpdateLocalConfigEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UpdateThemeSchemeColorEvent value)?  colorScheme,TResult Function( _UpdateThemePageEvent value)?  page,TResult Function( _UpdateThemeWidgetEvent value)?  widget,TResult Function( _UpdateAppConfigEvent value)?  featureAccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateThemeSchemeColorEvent() when colorScheme != null:
return colorScheme(_that);case _UpdateThemePageEvent() when page != null:
return page(_that);case _UpdateThemeWidgetEvent() when widget != null:
return widget(_that);case _UpdateAppConfigEvent() when featureAccess != null:
return featureAccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UpdateThemeSchemeColorEvent value)  colorScheme,required TResult Function( _UpdateThemePageEvent value)  page,required TResult Function( _UpdateThemeWidgetEvent value)  widget,required TResult Function( _UpdateAppConfigEvent value)  featureAccess,}){
final _that = this;
switch (_that) {
case _UpdateThemeSchemeColorEvent():
return colorScheme(_that);case _UpdateThemePageEvent():
return page(_that);case _UpdateThemeWidgetEvent():
return widget(_that);case _UpdateAppConfigEvent():
return featureAccess(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UpdateThemeSchemeColorEvent value)?  colorScheme,TResult? Function( _UpdateThemePageEvent value)?  page,TResult? Function( _UpdateThemeWidgetEvent value)?  widget,TResult? Function( _UpdateAppConfigEvent value)?  featureAccess,}){
final _that = this;
switch (_that) {
case _UpdateThemeSchemeColorEvent() when colorScheme != null:
return colorScheme(_that);case _UpdateThemePageEvent() when page != null:
return page(_that);case _UpdateThemeWidgetEvent() when widget != null:
return widget(_that);case _UpdateAppConfigEvent() when featureAccess != null:
return featureAccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ColorSchemeConfig scheme)?  colorScheme,TResult Function( ThemePageConfig page)?  page,TResult Function( ThemeWidgetConfig widget)?  widget,TResult Function( AppConfig config)?  featureAccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateThemeSchemeColorEvent() when colorScheme != null:
return colorScheme(_that.scheme);case _UpdateThemePageEvent() when page != null:
return page(_that.page);case _UpdateThemeWidgetEvent() when widget != null:
return widget(_that.widget);case _UpdateAppConfigEvent() when featureAccess != null:
return featureAccess(_that.config);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ColorSchemeConfig scheme)  colorScheme,required TResult Function( ThemePageConfig page)  page,required TResult Function( ThemeWidgetConfig widget)  widget,required TResult Function( AppConfig config)  featureAccess,}) {final _that = this;
switch (_that) {
case _UpdateThemeSchemeColorEvent():
return colorScheme(_that.scheme);case _UpdateThemePageEvent():
return page(_that.page);case _UpdateThemeWidgetEvent():
return widget(_that.widget);case _UpdateAppConfigEvent():
return featureAccess(_that.config);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ColorSchemeConfig scheme)?  colorScheme,TResult? Function( ThemePageConfig page)?  page,TResult? Function( ThemeWidgetConfig widget)?  widget,TResult? Function( AppConfig config)?  featureAccess,}) {final _that = this;
switch (_that) {
case _UpdateThemeSchemeColorEvent() when colorScheme != null:
return colorScheme(_that.scheme);case _UpdateThemePageEvent() when page != null:
return page(_that.page);case _UpdateThemeWidgetEvent() when widget != null:
return widget(_that.widget);case _UpdateAppConfigEvent() when featureAccess != null:
return featureAccess(_that.config);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateThemeSchemeColorEvent implements UpdateLocalConfigEvent {
  const _UpdateThemeSchemeColorEvent(this.scheme);
  

 final  ColorSchemeConfig scheme;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateThemeSchemeColorEvent&&(identical(other.scheme, scheme) || other.scheme == scheme));
}


@override
int get hashCode => Object.hash(runtimeType,scheme);

@override
String toString() {
  return 'UpdateLocalConfigEvent.colorScheme(scheme: $scheme)';
}


}




/// @nodoc


class _UpdateThemePageEvent implements UpdateLocalConfigEvent {
  const _UpdateThemePageEvent(this.page);
  

 final  ThemePageConfig page;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateThemePageEvent&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'UpdateLocalConfigEvent.page(page: $page)';
}


}




/// @nodoc


class _UpdateThemeWidgetEvent implements UpdateLocalConfigEvent {
  const _UpdateThemeWidgetEvent(this.widget);
  

 final  ThemeWidgetConfig widget;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateThemeWidgetEvent&&(identical(other.widget, widget) || other.widget == widget));
}


@override
int get hashCode => Object.hash(runtimeType,widget);

@override
String toString() {
  return 'UpdateLocalConfigEvent.widget(widget: $widget)';
}


}




/// @nodoc


class _UpdateAppConfigEvent implements UpdateLocalConfigEvent {
  const _UpdateAppConfigEvent(this.config);
  

 final  AppConfig config;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAppConfigEvent&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'UpdateLocalConfigEvent.featureAccess(config: $config)';
}


}




/// @nodoc
mixin _$UpdateColorSchemeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateColorSchemeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateColorSchemeEvent()';
}


}




/// Adds pattern-matching-related methods to [UpdateColorSchemeEvent].
extension UpdateColorSchemeEventPatterns on UpdateColorSchemeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UpdateColorSchemeEvent value)?  change,TResult Function( _ImportJsonColorSchemeEvent value)?  importJson,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateColorSchemeEvent() when change != null:
return change(_that);case _ImportJsonColorSchemeEvent() when importJson != null:
return importJson(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UpdateColorSchemeEvent value)  change,required TResult Function( _ImportJsonColorSchemeEvent value)  importJson,}){
final _that = this;
switch (_that) {
case _UpdateColorSchemeEvent():
return change(_that);case _ImportJsonColorSchemeEvent():
return importJson(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UpdateColorSchemeEvent value)?  change,TResult? Function( _ImportJsonColorSchemeEvent value)?  importJson,}){
final _that = this;
switch (_that) {
case _UpdateColorSchemeEvent() when change != null:
return change(_that);case _ImportJsonColorSchemeEvent() when importJson != null:
return importJson(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String key,  Color? color)?  change,TResult Function( Map<String, dynamic> jsonMap)?  importJson,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateColorSchemeEvent() when change != null:
return change(_that.key,_that.color);case _ImportJsonColorSchemeEvent() when importJson != null:
return importJson(_that.jsonMap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String key,  Color? color)  change,required TResult Function( Map<String, dynamic> jsonMap)  importJson,}) {final _that = this;
switch (_that) {
case _UpdateColorSchemeEvent():
return change(_that.key,_that.color);case _ImportJsonColorSchemeEvent():
return importJson(_that.jsonMap);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String key,  Color? color)?  change,TResult? Function( Map<String, dynamic> jsonMap)?  importJson,}) {final _that = this;
switch (_that) {
case _UpdateColorSchemeEvent() when change != null:
return change(_that.key,_that.color);case _ImportJsonColorSchemeEvent() when importJson != null:
return importJson(_that.jsonMap);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateColorSchemeEvent implements UpdateColorSchemeEvent {
  const _UpdateColorSchemeEvent(this.key, this.color);
  

 final  String key;
 final  Color? color;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateColorSchemeEvent&&(identical(other.key, key) || other.key == key)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,key,color);

@override
String toString() {
  return 'UpdateColorSchemeEvent.change(key: $key, color: $color)';
}


}




/// @nodoc


class _ImportJsonColorSchemeEvent implements UpdateColorSchemeEvent {
  const _ImportJsonColorSchemeEvent(final  Map<String, dynamic> jsonMap): _jsonMap = jsonMap;
  

 final  Map<String, dynamic> _jsonMap;
 Map<String, dynamic> get jsonMap {
  if (_jsonMap is EqualUnmodifiableMapView) return _jsonMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_jsonMap);
}





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportJsonColorSchemeEvent&&const DeepCollectionEquality().equals(other._jsonMap, _jsonMap));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_jsonMap));

@override
String toString() {
  return 'UpdateColorSchemeEvent.importJson(jsonMap: $jsonMap)';
}


}




/// @nodoc
mixin _$AppConfigEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfigEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppConfigEvent()';
}


}

/// @nodoc
class $AppConfigEventCopyWith<$Res>  {
$AppConfigEventCopyWith(AppConfigEvent _, $Res Function(AppConfigEvent) __);
}


/// Adds pattern-matching-related methods to [AppConfigEvent].
extension AppConfigEventPatterns on AppConfigEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SetLoginConfig value)?  setLoginConfig,TResult Function( _SetMainConfig value)?  setMainConfig,TResult Function( _SetMainSystemNotificationsEnabled value)?  setMainSystemNotificationsEnabled,TResult Function( _SetBottomMenu value)?  setBottomMenu,TResult Function( _SetBottomMenuCacheSelectedTab value)?  setBottomMenuCacheSelectedTab,TResult Function( _SetBottomMenuTabs value)?  setBottomMenuTabs,TResult Function( _UpdateBottomMenuTab value)?  updateBottomMenuTab,TResult Function( _InsertBottomMenuTab value)?  insertBottomMenuTab,TResult Function( _RemoveBottomMenuTabAt value)?  removeBottomMenuTabAt,TResult Function( _SetSettingsConfig value)?  setSettingsConfig,TResult Function( _SetSettingsSections value)?  setSettingsSections,TResult Function( _SetCallConfig value)?  setCallConfig,TResult Function( _SetCallVideoEnabled value)?  setCallVideoEnabled,TResult Function( _SetCallTransfer value)?  setCallTransfer,TResult Function( _SetCallEncoding value)?  setCallEncoding,TResult Function( _SetCallPeerConnection value)?  setCallPeerConnection,TResult Function( _SetNegotiationOverride value)?  setNegotiationOverride,TResult Function( _SetSupportedFeatures value)?  setSupportedFeatures,TResult Function( _SetContactsConfig value)?  setContactsConfig,TResult Function( _SetMessagingConfig value)?  setMessagingConfig,TResult Function( _ImportJsonAppConfigEvent value)?  importJson,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetLoginConfig() when setLoginConfig != null:
return setLoginConfig(_that);case _SetMainConfig() when setMainConfig != null:
return setMainConfig(_that);case _SetMainSystemNotificationsEnabled() when setMainSystemNotificationsEnabled != null:
return setMainSystemNotificationsEnabled(_that);case _SetBottomMenu() when setBottomMenu != null:
return setBottomMenu(_that);case _SetBottomMenuCacheSelectedTab() when setBottomMenuCacheSelectedTab != null:
return setBottomMenuCacheSelectedTab(_that);case _SetBottomMenuTabs() when setBottomMenuTabs != null:
return setBottomMenuTabs(_that);case _UpdateBottomMenuTab() when updateBottomMenuTab != null:
return updateBottomMenuTab(_that);case _InsertBottomMenuTab() when insertBottomMenuTab != null:
return insertBottomMenuTab(_that);case _RemoveBottomMenuTabAt() when removeBottomMenuTabAt != null:
return removeBottomMenuTabAt(_that);case _SetSettingsConfig() when setSettingsConfig != null:
return setSettingsConfig(_that);case _SetSettingsSections() when setSettingsSections != null:
return setSettingsSections(_that);case _SetCallConfig() when setCallConfig != null:
return setCallConfig(_that);case _SetCallVideoEnabled() when setCallVideoEnabled != null:
return setCallVideoEnabled(_that);case _SetCallTransfer() when setCallTransfer != null:
return setCallTransfer(_that);case _SetCallEncoding() when setCallEncoding != null:
return setCallEncoding(_that);case _SetCallPeerConnection() when setCallPeerConnection != null:
return setCallPeerConnection(_that);case _SetNegotiationOverride() when setNegotiationOverride != null:
return setNegotiationOverride(_that);case _SetSupportedFeatures() when setSupportedFeatures != null:
return setSupportedFeatures(_that);case _SetContactsConfig() when setContactsConfig != null:
return setContactsConfig(_that);case _SetMessagingConfig() when setMessagingConfig != null:
return setMessagingConfig(_that);case _ImportJsonAppConfigEvent() when importJson != null:
return importJson(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SetLoginConfig value)  setLoginConfig,required TResult Function( _SetMainConfig value)  setMainConfig,required TResult Function( _SetMainSystemNotificationsEnabled value)  setMainSystemNotificationsEnabled,required TResult Function( _SetBottomMenu value)  setBottomMenu,required TResult Function( _SetBottomMenuCacheSelectedTab value)  setBottomMenuCacheSelectedTab,required TResult Function( _SetBottomMenuTabs value)  setBottomMenuTabs,required TResult Function( _UpdateBottomMenuTab value)  updateBottomMenuTab,required TResult Function( _InsertBottomMenuTab value)  insertBottomMenuTab,required TResult Function( _RemoveBottomMenuTabAt value)  removeBottomMenuTabAt,required TResult Function( _SetSettingsConfig value)  setSettingsConfig,required TResult Function( _SetSettingsSections value)  setSettingsSections,required TResult Function( _SetCallConfig value)  setCallConfig,required TResult Function( _SetCallVideoEnabled value)  setCallVideoEnabled,required TResult Function( _SetCallTransfer value)  setCallTransfer,required TResult Function( _SetCallEncoding value)  setCallEncoding,required TResult Function( _SetCallPeerConnection value)  setCallPeerConnection,required TResult Function( _SetNegotiationOverride value)  setNegotiationOverride,required TResult Function( _SetSupportedFeatures value)  setSupportedFeatures,required TResult Function( _SetContactsConfig value)  setContactsConfig,required TResult Function( _SetMessagingConfig value)  setMessagingConfig,required TResult Function( _ImportJsonAppConfigEvent value)  importJson,}){
final _that = this;
switch (_that) {
case _SetLoginConfig():
return setLoginConfig(_that);case _SetMainConfig():
return setMainConfig(_that);case _SetMainSystemNotificationsEnabled():
return setMainSystemNotificationsEnabled(_that);case _SetBottomMenu():
return setBottomMenu(_that);case _SetBottomMenuCacheSelectedTab():
return setBottomMenuCacheSelectedTab(_that);case _SetBottomMenuTabs():
return setBottomMenuTabs(_that);case _UpdateBottomMenuTab():
return updateBottomMenuTab(_that);case _InsertBottomMenuTab():
return insertBottomMenuTab(_that);case _RemoveBottomMenuTabAt():
return removeBottomMenuTabAt(_that);case _SetSettingsConfig():
return setSettingsConfig(_that);case _SetSettingsSections():
return setSettingsSections(_that);case _SetCallConfig():
return setCallConfig(_that);case _SetCallVideoEnabled():
return setCallVideoEnabled(_that);case _SetCallTransfer():
return setCallTransfer(_that);case _SetCallEncoding():
return setCallEncoding(_that);case _SetCallPeerConnection():
return setCallPeerConnection(_that);case _SetNegotiationOverride():
return setNegotiationOverride(_that);case _SetSupportedFeatures():
return setSupportedFeatures(_that);case _SetContactsConfig():
return setContactsConfig(_that);case _SetMessagingConfig():
return setMessagingConfig(_that);case _ImportJsonAppConfigEvent():
return importJson(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SetLoginConfig value)?  setLoginConfig,TResult? Function( _SetMainConfig value)?  setMainConfig,TResult? Function( _SetMainSystemNotificationsEnabled value)?  setMainSystemNotificationsEnabled,TResult? Function( _SetBottomMenu value)?  setBottomMenu,TResult? Function( _SetBottomMenuCacheSelectedTab value)?  setBottomMenuCacheSelectedTab,TResult? Function( _SetBottomMenuTabs value)?  setBottomMenuTabs,TResult? Function( _UpdateBottomMenuTab value)?  updateBottomMenuTab,TResult? Function( _InsertBottomMenuTab value)?  insertBottomMenuTab,TResult? Function( _RemoveBottomMenuTabAt value)?  removeBottomMenuTabAt,TResult? Function( _SetSettingsConfig value)?  setSettingsConfig,TResult? Function( _SetSettingsSections value)?  setSettingsSections,TResult? Function( _SetCallConfig value)?  setCallConfig,TResult? Function( _SetCallVideoEnabled value)?  setCallVideoEnabled,TResult? Function( _SetCallTransfer value)?  setCallTransfer,TResult? Function( _SetCallEncoding value)?  setCallEncoding,TResult? Function( _SetCallPeerConnection value)?  setCallPeerConnection,TResult? Function( _SetNegotiationOverride value)?  setNegotiationOverride,TResult? Function( _SetSupportedFeatures value)?  setSupportedFeatures,TResult? Function( _SetContactsConfig value)?  setContactsConfig,TResult? Function( _SetMessagingConfig value)?  setMessagingConfig,TResult? Function( _ImportJsonAppConfigEvent value)?  importJson,}){
final _that = this;
switch (_that) {
case _SetLoginConfig() when setLoginConfig != null:
return setLoginConfig(_that);case _SetMainConfig() when setMainConfig != null:
return setMainConfig(_that);case _SetMainSystemNotificationsEnabled() when setMainSystemNotificationsEnabled != null:
return setMainSystemNotificationsEnabled(_that);case _SetBottomMenu() when setBottomMenu != null:
return setBottomMenu(_that);case _SetBottomMenuCacheSelectedTab() when setBottomMenuCacheSelectedTab != null:
return setBottomMenuCacheSelectedTab(_that);case _SetBottomMenuTabs() when setBottomMenuTabs != null:
return setBottomMenuTabs(_that);case _UpdateBottomMenuTab() when updateBottomMenuTab != null:
return updateBottomMenuTab(_that);case _InsertBottomMenuTab() when insertBottomMenuTab != null:
return insertBottomMenuTab(_that);case _RemoveBottomMenuTabAt() when removeBottomMenuTabAt != null:
return removeBottomMenuTabAt(_that);case _SetSettingsConfig() when setSettingsConfig != null:
return setSettingsConfig(_that);case _SetSettingsSections() when setSettingsSections != null:
return setSettingsSections(_that);case _SetCallConfig() when setCallConfig != null:
return setCallConfig(_that);case _SetCallVideoEnabled() when setCallVideoEnabled != null:
return setCallVideoEnabled(_that);case _SetCallTransfer() when setCallTransfer != null:
return setCallTransfer(_that);case _SetCallEncoding() when setCallEncoding != null:
return setCallEncoding(_that);case _SetCallPeerConnection() when setCallPeerConnection != null:
return setCallPeerConnection(_that);case _SetNegotiationOverride() when setNegotiationOverride != null:
return setNegotiationOverride(_that);case _SetSupportedFeatures() when setSupportedFeatures != null:
return setSupportedFeatures(_that);case _SetContactsConfig() when setContactsConfig != null:
return setContactsConfig(_that);case _SetMessagingConfig() when setMessagingConfig != null:
return setMessagingConfig(_that);case _ImportJsonAppConfigEvent() when importJson != null:
return importJson(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppConfigLogin login)?  setLoginConfig,TResult Function( AppConfigMain main)?  setMainConfig,TResult Function( bool enabled)?  setMainSystemNotificationsEnabled,TResult Function( AppConfigBottomMenu bottomMenu)?  setBottomMenu,TResult Function( bool cache)?  setBottomMenuCacheSelectedTab,TResult Function( List<BottomMenuTabScheme> tabs)?  setBottomMenuTabs,TResult Function( int index,  BottomMenuTabScheme tab)?  updateBottomMenuTab,TResult Function( int index,  BottomMenuTabScheme tab)?  insertBottomMenuTab,TResult Function( int index)?  removeBottomMenuTabAt,TResult Function( AppConfigSettings settings)?  setSettingsConfig,TResult Function( List<AppConfigSettingsSection> sections)?  setSettingsSections,TResult Function( AppConfigCall callConfig)?  setCallConfig,TResult Function( bool enabled)?  setCallVideoEnabled,TResult Function( AppConfigTransfer transfer)?  setCallTransfer,TResult Function( AppConfigEncoding encoding)?  setCallEncoding,TResult Function( AppConfigPeerConnection pc)?  setCallPeerConnection,TResult Function( AppConfigNegotiationSettingsOverride negotiation)?  setNegotiationOverride,TResult Function( List<SupportedFeature> features)?  setSupportedFeatures,TResult Function( AppConfigContacts contacts)?  setContactsConfig,TResult Function( AppConfigMessaging messaging)?  setMessagingConfig,TResult Function( Map<String, dynamic> json)?  importJson,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetLoginConfig() when setLoginConfig != null:
return setLoginConfig(_that.login);case _SetMainConfig() when setMainConfig != null:
return setMainConfig(_that.main);case _SetMainSystemNotificationsEnabled() when setMainSystemNotificationsEnabled != null:
return setMainSystemNotificationsEnabled(_that.enabled);case _SetBottomMenu() when setBottomMenu != null:
return setBottomMenu(_that.bottomMenu);case _SetBottomMenuCacheSelectedTab() when setBottomMenuCacheSelectedTab != null:
return setBottomMenuCacheSelectedTab(_that.cache);case _SetBottomMenuTabs() when setBottomMenuTabs != null:
return setBottomMenuTabs(_that.tabs);case _UpdateBottomMenuTab() when updateBottomMenuTab != null:
return updateBottomMenuTab(_that.index,_that.tab);case _InsertBottomMenuTab() when insertBottomMenuTab != null:
return insertBottomMenuTab(_that.index,_that.tab);case _RemoveBottomMenuTabAt() when removeBottomMenuTabAt != null:
return removeBottomMenuTabAt(_that.index);case _SetSettingsConfig() when setSettingsConfig != null:
return setSettingsConfig(_that.settings);case _SetSettingsSections() when setSettingsSections != null:
return setSettingsSections(_that.sections);case _SetCallConfig() when setCallConfig != null:
return setCallConfig(_that.callConfig);case _SetCallVideoEnabled() when setCallVideoEnabled != null:
return setCallVideoEnabled(_that.enabled);case _SetCallTransfer() when setCallTransfer != null:
return setCallTransfer(_that.transfer);case _SetCallEncoding() when setCallEncoding != null:
return setCallEncoding(_that.encoding);case _SetCallPeerConnection() when setCallPeerConnection != null:
return setCallPeerConnection(_that.pc);case _SetNegotiationOverride() when setNegotiationOverride != null:
return setNegotiationOverride(_that.negotiation);case _SetSupportedFeatures() when setSupportedFeatures != null:
return setSupportedFeatures(_that.features);case _SetContactsConfig() when setContactsConfig != null:
return setContactsConfig(_that.contacts);case _SetMessagingConfig() when setMessagingConfig != null:
return setMessagingConfig(_that.messaging);case _ImportJsonAppConfigEvent() when importJson != null:
return importJson(_that.json);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppConfigLogin login)  setLoginConfig,required TResult Function( AppConfigMain main)  setMainConfig,required TResult Function( bool enabled)  setMainSystemNotificationsEnabled,required TResult Function( AppConfigBottomMenu bottomMenu)  setBottomMenu,required TResult Function( bool cache)  setBottomMenuCacheSelectedTab,required TResult Function( List<BottomMenuTabScheme> tabs)  setBottomMenuTabs,required TResult Function( int index,  BottomMenuTabScheme tab)  updateBottomMenuTab,required TResult Function( int index,  BottomMenuTabScheme tab)  insertBottomMenuTab,required TResult Function( int index)  removeBottomMenuTabAt,required TResult Function( AppConfigSettings settings)  setSettingsConfig,required TResult Function( List<AppConfigSettingsSection> sections)  setSettingsSections,required TResult Function( AppConfigCall callConfig)  setCallConfig,required TResult Function( bool enabled)  setCallVideoEnabled,required TResult Function( AppConfigTransfer transfer)  setCallTransfer,required TResult Function( AppConfigEncoding encoding)  setCallEncoding,required TResult Function( AppConfigPeerConnection pc)  setCallPeerConnection,required TResult Function( AppConfigNegotiationSettingsOverride negotiation)  setNegotiationOverride,required TResult Function( List<SupportedFeature> features)  setSupportedFeatures,required TResult Function( AppConfigContacts contacts)  setContactsConfig,required TResult Function( AppConfigMessaging messaging)  setMessagingConfig,required TResult Function( Map<String, dynamic> json)  importJson,}) {final _that = this;
switch (_that) {
case _SetLoginConfig():
return setLoginConfig(_that.login);case _SetMainConfig():
return setMainConfig(_that.main);case _SetMainSystemNotificationsEnabled():
return setMainSystemNotificationsEnabled(_that.enabled);case _SetBottomMenu():
return setBottomMenu(_that.bottomMenu);case _SetBottomMenuCacheSelectedTab():
return setBottomMenuCacheSelectedTab(_that.cache);case _SetBottomMenuTabs():
return setBottomMenuTabs(_that.tabs);case _UpdateBottomMenuTab():
return updateBottomMenuTab(_that.index,_that.tab);case _InsertBottomMenuTab():
return insertBottomMenuTab(_that.index,_that.tab);case _RemoveBottomMenuTabAt():
return removeBottomMenuTabAt(_that.index);case _SetSettingsConfig():
return setSettingsConfig(_that.settings);case _SetSettingsSections():
return setSettingsSections(_that.sections);case _SetCallConfig():
return setCallConfig(_that.callConfig);case _SetCallVideoEnabled():
return setCallVideoEnabled(_that.enabled);case _SetCallTransfer():
return setCallTransfer(_that.transfer);case _SetCallEncoding():
return setCallEncoding(_that.encoding);case _SetCallPeerConnection():
return setCallPeerConnection(_that.pc);case _SetNegotiationOverride():
return setNegotiationOverride(_that.negotiation);case _SetSupportedFeatures():
return setSupportedFeatures(_that.features);case _SetContactsConfig():
return setContactsConfig(_that.contacts);case _SetMessagingConfig():
return setMessagingConfig(_that.messaging);case _ImportJsonAppConfigEvent():
return importJson(_that.json);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppConfigLogin login)?  setLoginConfig,TResult? Function( AppConfigMain main)?  setMainConfig,TResult? Function( bool enabled)?  setMainSystemNotificationsEnabled,TResult? Function( AppConfigBottomMenu bottomMenu)?  setBottomMenu,TResult? Function( bool cache)?  setBottomMenuCacheSelectedTab,TResult? Function( List<BottomMenuTabScheme> tabs)?  setBottomMenuTabs,TResult? Function( int index,  BottomMenuTabScheme tab)?  updateBottomMenuTab,TResult? Function( int index,  BottomMenuTabScheme tab)?  insertBottomMenuTab,TResult? Function( int index)?  removeBottomMenuTabAt,TResult? Function( AppConfigSettings settings)?  setSettingsConfig,TResult? Function( List<AppConfigSettingsSection> sections)?  setSettingsSections,TResult? Function( AppConfigCall callConfig)?  setCallConfig,TResult? Function( bool enabled)?  setCallVideoEnabled,TResult? Function( AppConfigTransfer transfer)?  setCallTransfer,TResult? Function( AppConfigEncoding encoding)?  setCallEncoding,TResult? Function( AppConfigPeerConnection pc)?  setCallPeerConnection,TResult? Function( AppConfigNegotiationSettingsOverride negotiation)?  setNegotiationOverride,TResult? Function( List<SupportedFeature> features)?  setSupportedFeatures,TResult? Function( AppConfigContacts contacts)?  setContactsConfig,TResult? Function( AppConfigMessaging messaging)?  setMessagingConfig,TResult? Function( Map<String, dynamic> json)?  importJson,}) {final _that = this;
switch (_that) {
case _SetLoginConfig() when setLoginConfig != null:
return setLoginConfig(_that.login);case _SetMainConfig() when setMainConfig != null:
return setMainConfig(_that.main);case _SetMainSystemNotificationsEnabled() when setMainSystemNotificationsEnabled != null:
return setMainSystemNotificationsEnabled(_that.enabled);case _SetBottomMenu() when setBottomMenu != null:
return setBottomMenu(_that.bottomMenu);case _SetBottomMenuCacheSelectedTab() when setBottomMenuCacheSelectedTab != null:
return setBottomMenuCacheSelectedTab(_that.cache);case _SetBottomMenuTabs() when setBottomMenuTabs != null:
return setBottomMenuTabs(_that.tabs);case _UpdateBottomMenuTab() when updateBottomMenuTab != null:
return updateBottomMenuTab(_that.index,_that.tab);case _InsertBottomMenuTab() when insertBottomMenuTab != null:
return insertBottomMenuTab(_that.index,_that.tab);case _RemoveBottomMenuTabAt() when removeBottomMenuTabAt != null:
return removeBottomMenuTabAt(_that.index);case _SetSettingsConfig() when setSettingsConfig != null:
return setSettingsConfig(_that.settings);case _SetSettingsSections() when setSettingsSections != null:
return setSettingsSections(_that.sections);case _SetCallConfig() when setCallConfig != null:
return setCallConfig(_that.callConfig);case _SetCallVideoEnabled() when setCallVideoEnabled != null:
return setCallVideoEnabled(_that.enabled);case _SetCallTransfer() when setCallTransfer != null:
return setCallTransfer(_that.transfer);case _SetCallEncoding() when setCallEncoding != null:
return setCallEncoding(_that.encoding);case _SetCallPeerConnection() when setCallPeerConnection != null:
return setCallPeerConnection(_that.pc);case _SetNegotiationOverride() when setNegotiationOverride != null:
return setNegotiationOverride(_that.negotiation);case _SetSupportedFeatures() when setSupportedFeatures != null:
return setSupportedFeatures(_that.features);case _SetContactsConfig() when setContactsConfig != null:
return setContactsConfig(_that.contacts);case _SetMessagingConfig() when setMessagingConfig != null:
return setMessagingConfig(_that.messaging);case _ImportJsonAppConfigEvent() when importJson != null:
return importJson(_that.json);case _:
  return null;

}
}

}

/// @nodoc


class _SetLoginConfig implements AppConfigEvent {
  const _SetLoginConfig(this.login);
  

 final  AppConfigLogin login;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginConfigCopyWith<_SetLoginConfig> get copyWith => __$SetLoginConfigCopyWithImpl<_SetLoginConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginConfig&&(identical(other.login, login) || other.login == login));
}


@override
int get hashCode => Object.hash(runtimeType,login);

@override
String toString() {
  return 'AppConfigEvent.setLoginConfig(login: $login)';
}


}

/// @nodoc
abstract mixin class _$SetLoginConfigCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetLoginConfigCopyWith(_SetLoginConfig value, $Res Function(_SetLoginConfig) _then) = __$SetLoginConfigCopyWithImpl;
@useResult
$Res call({
 AppConfigLogin login
});


$AppConfigLoginCopyWith<$Res> get login;

}
/// @nodoc
class __$SetLoginConfigCopyWithImpl<$Res>
    implements _$SetLoginConfigCopyWith<$Res> {
  __$SetLoginConfigCopyWithImpl(this._self, this._then);

  final _SetLoginConfig _self;
  final $Res Function(_SetLoginConfig) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? login = null,}) {
  return _then(_SetLoginConfig(
null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as AppConfigLogin,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigLoginCopyWith<$Res> get login {
  
  return $AppConfigLoginCopyWith<$Res>(_self.login, (value) {
    return _then(_self.copyWith(login: value));
  });
}
}

/// @nodoc


class _SetMainConfig implements AppConfigEvent {
  const _SetMainConfig(this.main);
  

 final  AppConfigMain main;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetMainConfigCopyWith<_SetMainConfig> get copyWith => __$SetMainConfigCopyWithImpl<_SetMainConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetMainConfig&&(identical(other.main, main) || other.main == main));
}


@override
int get hashCode => Object.hash(runtimeType,main);

@override
String toString() {
  return 'AppConfigEvent.setMainConfig(main: $main)';
}


}

/// @nodoc
abstract mixin class _$SetMainConfigCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetMainConfigCopyWith(_SetMainConfig value, $Res Function(_SetMainConfig) _then) = __$SetMainConfigCopyWithImpl;
@useResult
$Res call({
 AppConfigMain main
});


$AppConfigMainCopyWith<$Res> get main;

}
/// @nodoc
class __$SetMainConfigCopyWithImpl<$Res>
    implements _$SetMainConfigCopyWith<$Res> {
  __$SetMainConfigCopyWithImpl(this._self, this._then);

  final _SetMainConfig _self;
  final $Res Function(_SetMainConfig) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? main = null,}) {
  return _then(_SetMainConfig(
null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as AppConfigMain,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigMainCopyWith<$Res> get main {
  
  return $AppConfigMainCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}
}

/// @nodoc


class _SetMainSystemNotificationsEnabled implements AppConfigEvent {
  const _SetMainSystemNotificationsEnabled(this.enabled);
  

 final  bool enabled;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetMainSystemNotificationsEnabledCopyWith<_SetMainSystemNotificationsEnabled> get copyWith => __$SetMainSystemNotificationsEnabledCopyWithImpl<_SetMainSystemNotificationsEnabled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetMainSystemNotificationsEnabled&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString() {
  return 'AppConfigEvent.setMainSystemNotificationsEnabled(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$SetMainSystemNotificationsEnabledCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetMainSystemNotificationsEnabledCopyWith(_SetMainSystemNotificationsEnabled value, $Res Function(_SetMainSystemNotificationsEnabled) _then) = __$SetMainSystemNotificationsEnabledCopyWithImpl;
@useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class __$SetMainSystemNotificationsEnabledCopyWithImpl<$Res>
    implements _$SetMainSystemNotificationsEnabledCopyWith<$Res> {
  __$SetMainSystemNotificationsEnabledCopyWithImpl(this._self, this._then);

  final _SetMainSystemNotificationsEnabled _self;
  final $Res Function(_SetMainSystemNotificationsEnabled) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? enabled = null,}) {
  return _then(_SetMainSystemNotificationsEnabled(
null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SetBottomMenu implements AppConfigEvent {
  const _SetBottomMenu(this.bottomMenu);
  

 final  AppConfigBottomMenu bottomMenu;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetBottomMenuCopyWith<_SetBottomMenu> get copyWith => __$SetBottomMenuCopyWithImpl<_SetBottomMenu>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetBottomMenu&&(identical(other.bottomMenu, bottomMenu) || other.bottomMenu == bottomMenu));
}


@override
int get hashCode => Object.hash(runtimeType,bottomMenu);

@override
String toString() {
  return 'AppConfigEvent.setBottomMenu(bottomMenu: $bottomMenu)';
}


}

/// @nodoc
abstract mixin class _$SetBottomMenuCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetBottomMenuCopyWith(_SetBottomMenu value, $Res Function(_SetBottomMenu) _then) = __$SetBottomMenuCopyWithImpl;
@useResult
$Res call({
 AppConfigBottomMenu bottomMenu
});


$AppConfigBottomMenuCopyWith<$Res> get bottomMenu;

}
/// @nodoc
class __$SetBottomMenuCopyWithImpl<$Res>
    implements _$SetBottomMenuCopyWith<$Res> {
  __$SetBottomMenuCopyWithImpl(this._self, this._then);

  final _SetBottomMenu _self;
  final $Res Function(_SetBottomMenu) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bottomMenu = null,}) {
  return _then(_SetBottomMenu(
null == bottomMenu ? _self.bottomMenu : bottomMenu // ignore: cast_nullable_to_non_nullable
as AppConfigBottomMenu,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigBottomMenuCopyWith<$Res> get bottomMenu {
  
  return $AppConfigBottomMenuCopyWith<$Res>(_self.bottomMenu, (value) {
    return _then(_self.copyWith(bottomMenu: value));
  });
}
}

/// @nodoc


class _SetBottomMenuCacheSelectedTab implements AppConfigEvent {
  const _SetBottomMenuCacheSelectedTab(this.cache);
  

 final  bool cache;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetBottomMenuCacheSelectedTabCopyWith<_SetBottomMenuCacheSelectedTab> get copyWith => __$SetBottomMenuCacheSelectedTabCopyWithImpl<_SetBottomMenuCacheSelectedTab>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetBottomMenuCacheSelectedTab&&(identical(other.cache, cache) || other.cache == cache));
}


@override
int get hashCode => Object.hash(runtimeType,cache);

@override
String toString() {
  return 'AppConfigEvent.setBottomMenuCacheSelectedTab(cache: $cache)';
}


}

/// @nodoc
abstract mixin class _$SetBottomMenuCacheSelectedTabCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetBottomMenuCacheSelectedTabCopyWith(_SetBottomMenuCacheSelectedTab value, $Res Function(_SetBottomMenuCacheSelectedTab) _then) = __$SetBottomMenuCacheSelectedTabCopyWithImpl;
@useResult
$Res call({
 bool cache
});




}
/// @nodoc
class __$SetBottomMenuCacheSelectedTabCopyWithImpl<$Res>
    implements _$SetBottomMenuCacheSelectedTabCopyWith<$Res> {
  __$SetBottomMenuCacheSelectedTabCopyWithImpl(this._self, this._then);

  final _SetBottomMenuCacheSelectedTab _self;
  final $Res Function(_SetBottomMenuCacheSelectedTab) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cache = null,}) {
  return _then(_SetBottomMenuCacheSelectedTab(
null == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SetBottomMenuTabs implements AppConfigEvent {
  const _SetBottomMenuTabs(final  List<BottomMenuTabScheme> tabs): _tabs = tabs;
  

 final  List<BottomMenuTabScheme> _tabs;
 List<BottomMenuTabScheme> get tabs {
  if (_tabs is EqualUnmodifiableListView) return _tabs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tabs);
}


/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetBottomMenuTabsCopyWith<_SetBottomMenuTabs> get copyWith => __$SetBottomMenuTabsCopyWithImpl<_SetBottomMenuTabs>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetBottomMenuTabs&&const DeepCollectionEquality().equals(other._tabs, _tabs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tabs));

@override
String toString() {
  return 'AppConfigEvent.setBottomMenuTabs(tabs: $tabs)';
}


}

/// @nodoc
abstract mixin class _$SetBottomMenuTabsCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetBottomMenuTabsCopyWith(_SetBottomMenuTabs value, $Res Function(_SetBottomMenuTabs) _then) = __$SetBottomMenuTabsCopyWithImpl;
@useResult
$Res call({
 List<BottomMenuTabScheme> tabs
});




}
/// @nodoc
class __$SetBottomMenuTabsCopyWithImpl<$Res>
    implements _$SetBottomMenuTabsCopyWith<$Res> {
  __$SetBottomMenuTabsCopyWithImpl(this._self, this._then);

  final _SetBottomMenuTabs _self;
  final $Res Function(_SetBottomMenuTabs) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tabs = null,}) {
  return _then(_SetBottomMenuTabs(
null == tabs ? _self._tabs : tabs // ignore: cast_nullable_to_non_nullable
as List<BottomMenuTabScheme>,
  ));
}


}

/// @nodoc


class _UpdateBottomMenuTab implements AppConfigEvent {
  const _UpdateBottomMenuTab({required this.index, required this.tab});
  

 final  int index;
 final  BottomMenuTabScheme tab;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateBottomMenuTabCopyWith<_UpdateBottomMenuTab> get copyWith => __$UpdateBottomMenuTabCopyWithImpl<_UpdateBottomMenuTab>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateBottomMenuTab&&(identical(other.index, index) || other.index == index)&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,index,tab);

@override
String toString() {
  return 'AppConfigEvent.updateBottomMenuTab(index: $index, tab: $tab)';
}


}

/// @nodoc
abstract mixin class _$UpdateBottomMenuTabCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$UpdateBottomMenuTabCopyWith(_UpdateBottomMenuTab value, $Res Function(_UpdateBottomMenuTab) _then) = __$UpdateBottomMenuTabCopyWithImpl;
@useResult
$Res call({
 int index, BottomMenuTabScheme tab
});


$BottomMenuTabSchemeCopyWith<$Res> get tab;

}
/// @nodoc
class __$UpdateBottomMenuTabCopyWithImpl<$Res>
    implements _$UpdateBottomMenuTabCopyWith<$Res> {
  __$UpdateBottomMenuTabCopyWithImpl(this._self, this._then);

  final _UpdateBottomMenuTab _self;
  final $Res Function(_UpdateBottomMenuTab) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,Object? tab = null,}) {
  return _then(_UpdateBottomMenuTab(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as BottomMenuTabScheme,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BottomMenuTabSchemeCopyWith<$Res> get tab {
  
  return $BottomMenuTabSchemeCopyWith<$Res>(_self.tab, (value) {
    return _then(_self.copyWith(tab: value));
  });
}
}

/// @nodoc


class _InsertBottomMenuTab implements AppConfigEvent {
  const _InsertBottomMenuTab({required this.index, required this.tab});
  

 final  int index;
 final  BottomMenuTabScheme tab;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsertBottomMenuTabCopyWith<_InsertBottomMenuTab> get copyWith => __$InsertBottomMenuTabCopyWithImpl<_InsertBottomMenuTab>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsertBottomMenuTab&&(identical(other.index, index) || other.index == index)&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,index,tab);

@override
String toString() {
  return 'AppConfigEvent.insertBottomMenuTab(index: $index, tab: $tab)';
}


}

/// @nodoc
abstract mixin class _$InsertBottomMenuTabCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$InsertBottomMenuTabCopyWith(_InsertBottomMenuTab value, $Res Function(_InsertBottomMenuTab) _then) = __$InsertBottomMenuTabCopyWithImpl;
@useResult
$Res call({
 int index, BottomMenuTabScheme tab
});


$BottomMenuTabSchemeCopyWith<$Res> get tab;

}
/// @nodoc
class __$InsertBottomMenuTabCopyWithImpl<$Res>
    implements _$InsertBottomMenuTabCopyWith<$Res> {
  __$InsertBottomMenuTabCopyWithImpl(this._self, this._then);

  final _InsertBottomMenuTab _self;
  final $Res Function(_InsertBottomMenuTab) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,Object? tab = null,}) {
  return _then(_InsertBottomMenuTab(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as BottomMenuTabScheme,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BottomMenuTabSchemeCopyWith<$Res> get tab {
  
  return $BottomMenuTabSchemeCopyWith<$Res>(_self.tab, (value) {
    return _then(_self.copyWith(tab: value));
  });
}
}

/// @nodoc


class _RemoveBottomMenuTabAt implements AppConfigEvent {
  const _RemoveBottomMenuTabAt(this.index);
  

 final  int index;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveBottomMenuTabAtCopyWith<_RemoveBottomMenuTabAt> get copyWith => __$RemoveBottomMenuTabAtCopyWithImpl<_RemoveBottomMenuTabAt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveBottomMenuTabAt&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'AppConfigEvent.removeBottomMenuTabAt(index: $index)';
}


}

/// @nodoc
abstract mixin class _$RemoveBottomMenuTabAtCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$RemoveBottomMenuTabAtCopyWith(_RemoveBottomMenuTabAt value, $Res Function(_RemoveBottomMenuTabAt) _then) = __$RemoveBottomMenuTabAtCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$RemoveBottomMenuTabAtCopyWithImpl<$Res>
    implements _$RemoveBottomMenuTabAtCopyWith<$Res> {
  __$RemoveBottomMenuTabAtCopyWithImpl(this._self, this._then);

  final _RemoveBottomMenuTabAt _self;
  final $Res Function(_RemoveBottomMenuTabAt) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_RemoveBottomMenuTabAt(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetSettingsConfig implements AppConfigEvent {
  const _SetSettingsConfig(this.settings);
  

 final  AppConfigSettings settings;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetSettingsConfigCopyWith<_SetSettingsConfig> get copyWith => __$SetSettingsConfigCopyWithImpl<_SetSettingsConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetSettingsConfig&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'AppConfigEvent.setSettingsConfig(settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$SetSettingsConfigCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetSettingsConfigCopyWith(_SetSettingsConfig value, $Res Function(_SetSettingsConfig) _then) = __$SetSettingsConfigCopyWithImpl;
@useResult
$Res call({
 AppConfigSettings settings
});


$AppConfigSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$SetSettingsConfigCopyWithImpl<$Res>
    implements _$SetSettingsConfigCopyWith<$Res> {
  __$SetSettingsConfigCopyWithImpl(this._self, this._then);

  final _SetSettingsConfig _self;
  final $Res Function(_SetSettingsConfig) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? settings = null,}) {
  return _then(_SetSettingsConfig(
null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppConfigSettings,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigSettingsCopyWith<$Res> get settings {
  
  return $AppConfigSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

/// @nodoc


class _SetSettingsSections implements AppConfigEvent {
  const _SetSettingsSections(final  List<AppConfigSettingsSection> sections): _sections = sections;
  

 final  List<AppConfigSettingsSection> _sections;
 List<AppConfigSettingsSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetSettingsSectionsCopyWith<_SetSettingsSections> get copyWith => __$SetSettingsSectionsCopyWithImpl<_SetSettingsSections>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetSettingsSections&&const DeepCollectionEquality().equals(other._sections, _sections));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'AppConfigEvent.setSettingsSections(sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$SetSettingsSectionsCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetSettingsSectionsCopyWith(_SetSettingsSections value, $Res Function(_SetSettingsSections) _then) = __$SetSettingsSectionsCopyWithImpl;
@useResult
$Res call({
 List<AppConfigSettingsSection> sections
});




}
/// @nodoc
class __$SetSettingsSectionsCopyWithImpl<$Res>
    implements _$SetSettingsSectionsCopyWith<$Res> {
  __$SetSettingsSectionsCopyWithImpl(this._self, this._then);

  final _SetSettingsSections _self;
  final $Res Function(_SetSettingsSections) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sections = null,}) {
  return _then(_SetSettingsSections(
null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<AppConfigSettingsSection>,
  ));
}


}

/// @nodoc


class _SetCallConfig implements AppConfigEvent {
  const _SetCallConfig(this.callConfig);
  

 final  AppConfigCall callConfig;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallConfigCopyWith<_SetCallConfig> get copyWith => __$SetCallConfigCopyWithImpl<_SetCallConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallConfig&&(identical(other.callConfig, callConfig) || other.callConfig == callConfig));
}


@override
int get hashCode => Object.hash(runtimeType,callConfig);

@override
String toString() {
  return 'AppConfigEvent.setCallConfig(callConfig: $callConfig)';
}


}

/// @nodoc
abstract mixin class _$SetCallConfigCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetCallConfigCopyWith(_SetCallConfig value, $Res Function(_SetCallConfig) _then) = __$SetCallConfigCopyWithImpl;
@useResult
$Res call({
 AppConfigCall callConfig
});


$AppConfigCallCopyWith<$Res> get callConfig;

}
/// @nodoc
class __$SetCallConfigCopyWithImpl<$Res>
    implements _$SetCallConfigCopyWith<$Res> {
  __$SetCallConfigCopyWithImpl(this._self, this._then);

  final _SetCallConfig _self;
  final $Res Function(_SetCallConfig) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? callConfig = null,}) {
  return _then(_SetCallConfig(
null == callConfig ? _self.callConfig : callConfig // ignore: cast_nullable_to_non_nullable
as AppConfigCall,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigCallCopyWith<$Res> get callConfig {
  
  return $AppConfigCallCopyWith<$Res>(_self.callConfig, (value) {
    return _then(_self.copyWith(callConfig: value));
  });
}
}

/// @nodoc


class _SetCallVideoEnabled implements AppConfigEvent {
  const _SetCallVideoEnabled(this.enabled);
  

 final  bool enabled;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallVideoEnabledCopyWith<_SetCallVideoEnabled> get copyWith => __$SetCallVideoEnabledCopyWithImpl<_SetCallVideoEnabled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallVideoEnabled&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString() {
  return 'AppConfigEvent.setCallVideoEnabled(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$SetCallVideoEnabledCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetCallVideoEnabledCopyWith(_SetCallVideoEnabled value, $Res Function(_SetCallVideoEnabled) _then) = __$SetCallVideoEnabledCopyWithImpl;
@useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class __$SetCallVideoEnabledCopyWithImpl<$Res>
    implements _$SetCallVideoEnabledCopyWith<$Res> {
  __$SetCallVideoEnabledCopyWithImpl(this._self, this._then);

  final _SetCallVideoEnabled _self;
  final $Res Function(_SetCallVideoEnabled) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? enabled = null,}) {
  return _then(_SetCallVideoEnabled(
null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SetCallTransfer implements AppConfigEvent {
  const _SetCallTransfer(this.transfer);
  

 final  AppConfigTransfer transfer;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallTransferCopyWith<_SetCallTransfer> get copyWith => __$SetCallTransferCopyWithImpl<_SetCallTransfer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallTransfer&&(identical(other.transfer, transfer) || other.transfer == transfer));
}


@override
int get hashCode => Object.hash(runtimeType,transfer);

@override
String toString() {
  return 'AppConfigEvent.setCallTransfer(transfer: $transfer)';
}


}

/// @nodoc
abstract mixin class _$SetCallTransferCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetCallTransferCopyWith(_SetCallTransfer value, $Res Function(_SetCallTransfer) _then) = __$SetCallTransferCopyWithImpl;
@useResult
$Res call({
 AppConfigTransfer transfer
});


$AppConfigTransferCopyWith<$Res> get transfer;

}
/// @nodoc
class __$SetCallTransferCopyWithImpl<$Res>
    implements _$SetCallTransferCopyWith<$Res> {
  __$SetCallTransferCopyWithImpl(this._self, this._then);

  final _SetCallTransfer _self;
  final $Res Function(_SetCallTransfer) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transfer = null,}) {
  return _then(_SetCallTransfer(
null == transfer ? _self.transfer : transfer // ignore: cast_nullable_to_non_nullable
as AppConfigTransfer,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigTransferCopyWith<$Res> get transfer {
  
  return $AppConfigTransferCopyWith<$Res>(_self.transfer, (value) {
    return _then(_self.copyWith(transfer: value));
  });
}
}

/// @nodoc


class _SetCallEncoding implements AppConfigEvent {
  const _SetCallEncoding(this.encoding);
  

 final  AppConfigEncoding encoding;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallEncodingCopyWith<_SetCallEncoding> get copyWith => __$SetCallEncodingCopyWithImpl<_SetCallEncoding>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallEncoding&&(identical(other.encoding, encoding) || other.encoding == encoding));
}


@override
int get hashCode => Object.hash(runtimeType,encoding);

@override
String toString() {
  return 'AppConfigEvent.setCallEncoding(encoding: $encoding)';
}


}

/// @nodoc
abstract mixin class _$SetCallEncodingCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetCallEncodingCopyWith(_SetCallEncoding value, $Res Function(_SetCallEncoding) _then) = __$SetCallEncodingCopyWithImpl;
@useResult
$Res call({
 AppConfigEncoding encoding
});


$AppConfigEncodingCopyWith<$Res> get encoding;

}
/// @nodoc
class __$SetCallEncodingCopyWithImpl<$Res>
    implements _$SetCallEncodingCopyWith<$Res> {
  __$SetCallEncodingCopyWithImpl(this._self, this._then);

  final _SetCallEncoding _self;
  final $Res Function(_SetCallEncoding) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? encoding = null,}) {
  return _then(_SetCallEncoding(
null == encoding ? _self.encoding : encoding // ignore: cast_nullable_to_non_nullable
as AppConfigEncoding,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigEncodingCopyWith<$Res> get encoding {
  
  return $AppConfigEncodingCopyWith<$Res>(_self.encoding, (value) {
    return _then(_self.copyWith(encoding: value));
  });
}
}

/// @nodoc


class _SetCallPeerConnection implements AppConfigEvent {
  const _SetCallPeerConnection(this.pc);
  

 final  AppConfigPeerConnection pc;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallPeerConnectionCopyWith<_SetCallPeerConnection> get copyWith => __$SetCallPeerConnectionCopyWithImpl<_SetCallPeerConnection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallPeerConnection&&(identical(other.pc, pc) || other.pc == pc));
}


@override
int get hashCode => Object.hash(runtimeType,pc);

@override
String toString() {
  return 'AppConfigEvent.setCallPeerConnection(pc: $pc)';
}


}

/// @nodoc
abstract mixin class _$SetCallPeerConnectionCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetCallPeerConnectionCopyWith(_SetCallPeerConnection value, $Res Function(_SetCallPeerConnection) _then) = __$SetCallPeerConnectionCopyWithImpl;
@useResult
$Res call({
 AppConfigPeerConnection pc
});


$AppConfigPeerConnectionCopyWith<$Res> get pc;

}
/// @nodoc
class __$SetCallPeerConnectionCopyWithImpl<$Res>
    implements _$SetCallPeerConnectionCopyWith<$Res> {
  __$SetCallPeerConnectionCopyWithImpl(this._self, this._then);

  final _SetCallPeerConnection _self;
  final $Res Function(_SetCallPeerConnection) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pc = null,}) {
  return _then(_SetCallPeerConnection(
null == pc ? _self.pc : pc // ignore: cast_nullable_to_non_nullable
as AppConfigPeerConnection,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigPeerConnectionCopyWith<$Res> get pc {
  
  return $AppConfigPeerConnectionCopyWith<$Res>(_self.pc, (value) {
    return _then(_self.copyWith(pc: value));
  });
}
}

/// @nodoc


class _SetNegotiationOverride implements AppConfigEvent {
  const _SetNegotiationOverride(this.negotiation);
  

 final  AppConfigNegotiationSettingsOverride negotiation;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetNegotiationOverrideCopyWith<_SetNegotiationOverride> get copyWith => __$SetNegotiationOverrideCopyWithImpl<_SetNegotiationOverride>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetNegotiationOverride&&(identical(other.negotiation, negotiation) || other.negotiation == negotiation));
}


@override
int get hashCode => Object.hash(runtimeType,negotiation);

@override
String toString() {
  return 'AppConfigEvent.setNegotiationOverride(negotiation: $negotiation)';
}


}

/// @nodoc
abstract mixin class _$SetNegotiationOverrideCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetNegotiationOverrideCopyWith(_SetNegotiationOverride value, $Res Function(_SetNegotiationOverride) _then) = __$SetNegotiationOverrideCopyWithImpl;
@useResult
$Res call({
 AppConfigNegotiationSettingsOverride negotiation
});


$AppConfigNegotiationSettingsOverrideCopyWith<$Res> get negotiation;

}
/// @nodoc
class __$SetNegotiationOverrideCopyWithImpl<$Res>
    implements _$SetNegotiationOverrideCopyWith<$Res> {
  __$SetNegotiationOverrideCopyWithImpl(this._self, this._then);

  final _SetNegotiationOverride _self;
  final $Res Function(_SetNegotiationOverride) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? negotiation = null,}) {
  return _then(_SetNegotiationOverride(
null == negotiation ? _self.negotiation : negotiation // ignore: cast_nullable_to_non_nullable
as AppConfigNegotiationSettingsOverride,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigNegotiationSettingsOverrideCopyWith<$Res> get negotiation {
  
  return $AppConfigNegotiationSettingsOverrideCopyWith<$Res>(_self.negotiation, (value) {
    return _then(_self.copyWith(negotiation: value));
  });
}
}

/// @nodoc


class _SetSupportedFeatures implements AppConfigEvent {
  const _SetSupportedFeatures(final  List<SupportedFeature> features): _features = features;
  

 final  List<SupportedFeature> _features;
 List<SupportedFeature> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}


/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetSupportedFeaturesCopyWith<_SetSupportedFeatures> get copyWith => __$SetSupportedFeaturesCopyWithImpl<_SetSupportedFeatures>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetSupportedFeatures&&const DeepCollectionEquality().equals(other._features, _features));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_features));

@override
String toString() {
  return 'AppConfigEvent.setSupportedFeatures(features: $features)';
}


}

/// @nodoc
abstract mixin class _$SetSupportedFeaturesCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetSupportedFeaturesCopyWith(_SetSupportedFeatures value, $Res Function(_SetSupportedFeatures) _then) = __$SetSupportedFeaturesCopyWithImpl;
@useResult
$Res call({
 List<SupportedFeature> features
});




}
/// @nodoc
class __$SetSupportedFeaturesCopyWithImpl<$Res>
    implements _$SetSupportedFeaturesCopyWith<$Res> {
  __$SetSupportedFeaturesCopyWithImpl(this._self, this._then);

  final _SetSupportedFeatures _self;
  final $Res Function(_SetSupportedFeatures) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? features = null,}) {
  return _then(_SetSupportedFeatures(
null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<SupportedFeature>,
  ));
}


}

/// @nodoc


class _SetContactsConfig implements AppConfigEvent {
  const _SetContactsConfig(this.contacts);
  

 final  AppConfigContacts contacts;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetContactsConfigCopyWith<_SetContactsConfig> get copyWith => __$SetContactsConfigCopyWithImpl<_SetContactsConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetContactsConfig&&(identical(other.contacts, contacts) || other.contacts == contacts));
}


@override
int get hashCode => Object.hash(runtimeType,contacts);

@override
String toString() {
  return 'AppConfigEvent.setContactsConfig(contacts: $contacts)';
}


}

/// @nodoc
abstract mixin class _$SetContactsConfigCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetContactsConfigCopyWith(_SetContactsConfig value, $Res Function(_SetContactsConfig) _then) = __$SetContactsConfigCopyWithImpl;
@useResult
$Res call({
 AppConfigContacts contacts
});


$AppConfigContactsCopyWith<$Res> get contacts;

}
/// @nodoc
class __$SetContactsConfigCopyWithImpl<$Res>
    implements _$SetContactsConfigCopyWith<$Res> {
  __$SetContactsConfigCopyWithImpl(this._self, this._then);

  final _SetContactsConfig _self;
  final $Res Function(_SetContactsConfig) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contacts = null,}) {
  return _then(_SetContactsConfig(
null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as AppConfigContacts,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigContactsCopyWith<$Res> get contacts {
  
  return $AppConfigContactsCopyWith<$Res>(_self.contacts, (value) {
    return _then(_self.copyWith(contacts: value));
  });
}
}

/// @nodoc


class _SetMessagingConfig implements AppConfigEvent {
  const _SetMessagingConfig(this.messaging);
  

 final  AppConfigMessaging messaging;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetMessagingConfigCopyWith<_SetMessagingConfig> get copyWith => __$SetMessagingConfigCopyWithImpl<_SetMessagingConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetMessagingConfig&&(identical(other.messaging, messaging) || other.messaging == messaging));
}


@override
int get hashCode => Object.hash(runtimeType,messaging);

@override
String toString() {
  return 'AppConfigEvent.setMessagingConfig(messaging: $messaging)';
}


}

/// @nodoc
abstract mixin class _$SetMessagingConfigCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$SetMessagingConfigCopyWith(_SetMessagingConfig value, $Res Function(_SetMessagingConfig) _then) = __$SetMessagingConfigCopyWithImpl;
@useResult
$Res call({
 AppConfigMessaging messaging
});


$AppConfigMessagingCopyWith<$Res> get messaging;

}
/// @nodoc
class __$SetMessagingConfigCopyWithImpl<$Res>
    implements _$SetMessagingConfigCopyWith<$Res> {
  __$SetMessagingConfigCopyWithImpl(this._self, this._then);

  final _SetMessagingConfig _self;
  final $Res Function(_SetMessagingConfig) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messaging = null,}) {
  return _then(_SetMessagingConfig(
null == messaging ? _self.messaging : messaging // ignore: cast_nullable_to_non_nullable
as AppConfigMessaging,
  ));
}

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigMessagingCopyWith<$Res> get messaging {
  
  return $AppConfigMessagingCopyWith<$Res>(_self.messaging, (value) {
    return _then(_self.copyWith(messaging: value));
  });
}
}

/// @nodoc


class _ImportJsonAppConfigEvent implements AppConfigEvent {
  const _ImportJsonAppConfigEvent(final  Map<String, dynamic> json): _json = json;
  

 final  Map<String, dynamic> _json;
 Map<String, dynamic> get json {
  if (_json is EqualUnmodifiableMapView) return _json;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_json);
}


/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportJsonAppConfigEventCopyWith<_ImportJsonAppConfigEvent> get copyWith => __$ImportJsonAppConfigEventCopyWithImpl<_ImportJsonAppConfigEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportJsonAppConfigEvent&&const DeepCollectionEquality().equals(other._json, _json));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_json));

@override
String toString() {
  return 'AppConfigEvent.importJson(json: $json)';
}


}

/// @nodoc
abstract mixin class _$ImportJsonAppConfigEventCopyWith<$Res> implements $AppConfigEventCopyWith<$Res> {
  factory _$ImportJsonAppConfigEventCopyWith(_ImportJsonAppConfigEvent value, $Res Function(_ImportJsonAppConfigEvent) _then) = __$ImportJsonAppConfigEventCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> json
});




}
/// @nodoc
class __$ImportJsonAppConfigEventCopyWithImpl<$Res>
    implements _$ImportJsonAppConfigEventCopyWith<$Res> {
  __$ImportJsonAppConfigEventCopyWithImpl(this._self, this._then);

  final _ImportJsonAppConfigEvent _self;
  final $Res Function(_ImportJsonAppConfigEvent) _then;

/// Create a copy of AppConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? json = null,}) {
  return _then(_ImportJsonAppConfigEvent(
null == json ? _self._json : json // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$ThemePageEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemePageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemePageEvent()';
}


}

/// @nodoc
class $ThemePageEventCopyWith<$Res>  {
$ThemePageEventCopyWith(ThemePageEvent _, $Res Function(ThemePageEvent) __);
}


/// Adds pattern-matching-related methods to [ThemePageEvent].
extension ThemePageEventPatterns on ThemePageEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SetLoginPage value)?  setLoginPage,TResult Function( _UpdateSwitchPage value)?  updateSwitchPage,TResult Function( _SetLoginPicture value)?  setLoginPicture,TResult Function( _SetLoginModeSelect value)?  setLoginModeSelect,TResult Function( _SetLoginModeSelectButtonLoginStyle value)?  setLoginModeSelectButtonLoginStyle,TResult Function( _SetLoginModeSelectButtonSignupStyle value)?  setLoginModeSelectButtonSignupStyle,TResult Function( _SetAboutPage value)?  setAboutPage,TResult Function( _SetAboutPicture value)?  setAboutPicture,TResult Function( _SetAboutMetadata value)?  setAboutMetadata,TResult Function( _SetDialingPage value)?  setDialingPage,TResult Function( _SetDialingSystemUiOverlay value)?  setDialingSystemUiOverlay,TResult Function( _SetDialingAppBarStyle value)?  setDialingAppBarStyle,TResult Function( _SetDialingInfo value)?  setDialingInfo,TResult Function( _SetSettingsPage value)?  setSettingsPage,TResult Function( _SetDialingInfoUsernameStyle value)?  setDialingInfoUsernameStyle,TResult Function( _SetDialingInfoNumberStyle value)?  setDialingInfoNumberStyle,TResult Function( _SetDialingInfoCallStatusStyle value)?  setDialingInfoCallStatusStyle,TResult Function( _SetDialingInfoProcessingStatusStyle value)?  setDialingInfoProcessingStatusStyle,TResult Function( _SetKeypadPage value)?  setKeypadPage,TResult Function( _SetLoginOtpSignin value)?  setLoginOtpSignin,TResult Function( _SetLoginPasswordSignin value)?  setLoginPasswordSignin,TResult Function( _SetLoginOtpSigninVerifyCountdown value)?  setLoginOtpSigninVerifyCountdown,TResult Function( _SetLoginSignupVerifyCountdown value)?  setLoginSignupVerifyCountdown,TResult Function( _SetContactsPage value)?  setContactsPage,TResult Function( _SetRecentsPage value)?  setRecentsPage,TResult Function( _SetFavoritesPage value)?  setFavoritesPage,TResult Function( _SetConversationsPage value)?  setConversationsPage,TResult Function( _SetEmbeddedPage value)?  setEmbeddedPage,TResult Function( _ImportJsonPageEvent value)?  importJson,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetLoginPage() when setLoginPage != null:
return setLoginPage(_that);case _UpdateSwitchPage() when updateSwitchPage != null:
return updateSwitchPage(_that);case _SetLoginPicture() when setLoginPicture != null:
return setLoginPicture(_that);case _SetLoginModeSelect() when setLoginModeSelect != null:
return setLoginModeSelect(_that);case _SetLoginModeSelectButtonLoginStyle() when setLoginModeSelectButtonLoginStyle != null:
return setLoginModeSelectButtonLoginStyle(_that);case _SetLoginModeSelectButtonSignupStyle() when setLoginModeSelectButtonSignupStyle != null:
return setLoginModeSelectButtonSignupStyle(_that);case _SetAboutPage() when setAboutPage != null:
return setAboutPage(_that);case _SetAboutPicture() when setAboutPicture != null:
return setAboutPicture(_that);case _SetAboutMetadata() when setAboutMetadata != null:
return setAboutMetadata(_that);case _SetDialingPage() when setDialingPage != null:
return setDialingPage(_that);case _SetDialingSystemUiOverlay() when setDialingSystemUiOverlay != null:
return setDialingSystemUiOverlay(_that);case _SetDialingAppBarStyle() when setDialingAppBarStyle != null:
return setDialingAppBarStyle(_that);case _SetDialingInfo() when setDialingInfo != null:
return setDialingInfo(_that);case _SetSettingsPage() when setSettingsPage != null:
return setSettingsPage(_that);case _SetDialingInfoUsernameStyle() when setDialingInfoUsernameStyle != null:
return setDialingInfoUsernameStyle(_that);case _SetDialingInfoNumberStyle() when setDialingInfoNumberStyle != null:
return setDialingInfoNumberStyle(_that);case _SetDialingInfoCallStatusStyle() when setDialingInfoCallStatusStyle != null:
return setDialingInfoCallStatusStyle(_that);case _SetDialingInfoProcessingStatusStyle() when setDialingInfoProcessingStatusStyle != null:
return setDialingInfoProcessingStatusStyle(_that);case _SetKeypadPage() when setKeypadPage != null:
return setKeypadPage(_that);case _SetLoginOtpSignin() when setLoginOtpSignin != null:
return setLoginOtpSignin(_that);case _SetLoginPasswordSignin() when setLoginPasswordSignin != null:
return setLoginPasswordSignin(_that);case _SetLoginOtpSigninVerifyCountdown() when setLoginOtpSigninVerifyCountdown != null:
return setLoginOtpSigninVerifyCountdown(_that);case _SetLoginSignupVerifyCountdown() when setLoginSignupVerifyCountdown != null:
return setLoginSignupVerifyCountdown(_that);case _SetContactsPage() when setContactsPage != null:
return setContactsPage(_that);case _SetRecentsPage() when setRecentsPage != null:
return setRecentsPage(_that);case _SetFavoritesPage() when setFavoritesPage != null:
return setFavoritesPage(_that);case _SetConversationsPage() when setConversationsPage != null:
return setConversationsPage(_that);case _SetEmbeddedPage() when setEmbeddedPage != null:
return setEmbeddedPage(_that);case _ImportJsonPageEvent() when importJson != null:
return importJson(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SetLoginPage value)  setLoginPage,required TResult Function( _UpdateSwitchPage value)  updateSwitchPage,required TResult Function( _SetLoginPicture value)  setLoginPicture,required TResult Function( _SetLoginModeSelect value)  setLoginModeSelect,required TResult Function( _SetLoginModeSelectButtonLoginStyle value)  setLoginModeSelectButtonLoginStyle,required TResult Function( _SetLoginModeSelectButtonSignupStyle value)  setLoginModeSelectButtonSignupStyle,required TResult Function( _SetAboutPage value)  setAboutPage,required TResult Function( _SetAboutPicture value)  setAboutPicture,required TResult Function( _SetAboutMetadata value)  setAboutMetadata,required TResult Function( _SetDialingPage value)  setDialingPage,required TResult Function( _SetDialingSystemUiOverlay value)  setDialingSystemUiOverlay,required TResult Function( _SetDialingAppBarStyle value)  setDialingAppBarStyle,required TResult Function( _SetDialingInfo value)  setDialingInfo,required TResult Function( _SetSettingsPage value)  setSettingsPage,required TResult Function( _SetDialingInfoUsernameStyle value)  setDialingInfoUsernameStyle,required TResult Function( _SetDialingInfoNumberStyle value)  setDialingInfoNumberStyle,required TResult Function( _SetDialingInfoCallStatusStyle value)  setDialingInfoCallStatusStyle,required TResult Function( _SetDialingInfoProcessingStatusStyle value)  setDialingInfoProcessingStatusStyle,required TResult Function( _SetKeypadPage value)  setKeypadPage,required TResult Function( _SetLoginOtpSignin value)  setLoginOtpSignin,required TResult Function( _SetLoginPasswordSignin value)  setLoginPasswordSignin,required TResult Function( _SetLoginOtpSigninVerifyCountdown value)  setLoginOtpSigninVerifyCountdown,required TResult Function( _SetLoginSignupVerifyCountdown value)  setLoginSignupVerifyCountdown,required TResult Function( _SetContactsPage value)  setContactsPage,required TResult Function( _SetRecentsPage value)  setRecentsPage,required TResult Function( _SetFavoritesPage value)  setFavoritesPage,required TResult Function( _SetConversationsPage value)  setConversationsPage,required TResult Function( _SetEmbeddedPage value)  setEmbeddedPage,required TResult Function( _ImportJsonPageEvent value)  importJson,}){
final _that = this;
switch (_that) {
case _SetLoginPage():
return setLoginPage(_that);case _UpdateSwitchPage():
return updateSwitchPage(_that);case _SetLoginPicture():
return setLoginPicture(_that);case _SetLoginModeSelect():
return setLoginModeSelect(_that);case _SetLoginModeSelectButtonLoginStyle():
return setLoginModeSelectButtonLoginStyle(_that);case _SetLoginModeSelectButtonSignupStyle():
return setLoginModeSelectButtonSignupStyle(_that);case _SetAboutPage():
return setAboutPage(_that);case _SetAboutPicture():
return setAboutPicture(_that);case _SetAboutMetadata():
return setAboutMetadata(_that);case _SetDialingPage():
return setDialingPage(_that);case _SetDialingSystemUiOverlay():
return setDialingSystemUiOverlay(_that);case _SetDialingAppBarStyle():
return setDialingAppBarStyle(_that);case _SetDialingInfo():
return setDialingInfo(_that);case _SetSettingsPage():
return setSettingsPage(_that);case _SetDialingInfoUsernameStyle():
return setDialingInfoUsernameStyle(_that);case _SetDialingInfoNumberStyle():
return setDialingInfoNumberStyle(_that);case _SetDialingInfoCallStatusStyle():
return setDialingInfoCallStatusStyle(_that);case _SetDialingInfoProcessingStatusStyle():
return setDialingInfoProcessingStatusStyle(_that);case _SetKeypadPage():
return setKeypadPage(_that);case _SetLoginOtpSignin():
return setLoginOtpSignin(_that);case _SetLoginPasswordSignin():
return setLoginPasswordSignin(_that);case _SetLoginOtpSigninVerifyCountdown():
return setLoginOtpSigninVerifyCountdown(_that);case _SetLoginSignupVerifyCountdown():
return setLoginSignupVerifyCountdown(_that);case _SetContactsPage():
return setContactsPage(_that);case _SetRecentsPage():
return setRecentsPage(_that);case _SetFavoritesPage():
return setFavoritesPage(_that);case _SetConversationsPage():
return setConversationsPage(_that);case _SetEmbeddedPage():
return setEmbeddedPage(_that);case _ImportJsonPageEvent():
return importJson(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SetLoginPage value)?  setLoginPage,TResult? Function( _UpdateSwitchPage value)?  updateSwitchPage,TResult? Function( _SetLoginPicture value)?  setLoginPicture,TResult? Function( _SetLoginModeSelect value)?  setLoginModeSelect,TResult? Function( _SetLoginModeSelectButtonLoginStyle value)?  setLoginModeSelectButtonLoginStyle,TResult? Function( _SetLoginModeSelectButtonSignupStyle value)?  setLoginModeSelectButtonSignupStyle,TResult? Function( _SetAboutPage value)?  setAboutPage,TResult? Function( _SetAboutPicture value)?  setAboutPicture,TResult? Function( _SetAboutMetadata value)?  setAboutMetadata,TResult? Function( _SetDialingPage value)?  setDialingPage,TResult? Function( _SetDialingSystemUiOverlay value)?  setDialingSystemUiOverlay,TResult? Function( _SetDialingAppBarStyle value)?  setDialingAppBarStyle,TResult? Function( _SetDialingInfo value)?  setDialingInfo,TResult? Function( _SetSettingsPage value)?  setSettingsPage,TResult? Function( _SetDialingInfoUsernameStyle value)?  setDialingInfoUsernameStyle,TResult? Function( _SetDialingInfoNumberStyle value)?  setDialingInfoNumberStyle,TResult? Function( _SetDialingInfoCallStatusStyle value)?  setDialingInfoCallStatusStyle,TResult? Function( _SetDialingInfoProcessingStatusStyle value)?  setDialingInfoProcessingStatusStyle,TResult? Function( _SetKeypadPage value)?  setKeypadPage,TResult? Function( _SetLoginOtpSignin value)?  setLoginOtpSignin,TResult? Function( _SetLoginPasswordSignin value)?  setLoginPasswordSignin,TResult? Function( _SetLoginOtpSigninVerifyCountdown value)?  setLoginOtpSigninVerifyCountdown,TResult? Function( _SetLoginSignupVerifyCountdown value)?  setLoginSignupVerifyCountdown,TResult? Function( _SetContactsPage value)?  setContactsPage,TResult? Function( _SetRecentsPage value)?  setRecentsPage,TResult? Function( _SetFavoritesPage value)?  setFavoritesPage,TResult? Function( _SetConversationsPage value)?  setConversationsPage,TResult? Function( _SetEmbeddedPage value)?  setEmbeddedPage,TResult? Function( _ImportJsonPageEvent value)?  importJson,}){
final _that = this;
switch (_that) {
case _SetLoginPage() when setLoginPage != null:
return setLoginPage(_that);case _UpdateSwitchPage() when updateSwitchPage != null:
return updateSwitchPage(_that);case _SetLoginPicture() when setLoginPicture != null:
return setLoginPicture(_that);case _SetLoginModeSelect() when setLoginModeSelect != null:
return setLoginModeSelect(_that);case _SetLoginModeSelectButtonLoginStyle() when setLoginModeSelectButtonLoginStyle != null:
return setLoginModeSelectButtonLoginStyle(_that);case _SetLoginModeSelectButtonSignupStyle() when setLoginModeSelectButtonSignupStyle != null:
return setLoginModeSelectButtonSignupStyle(_that);case _SetAboutPage() when setAboutPage != null:
return setAboutPage(_that);case _SetAboutPicture() when setAboutPicture != null:
return setAboutPicture(_that);case _SetAboutMetadata() when setAboutMetadata != null:
return setAboutMetadata(_that);case _SetDialingPage() when setDialingPage != null:
return setDialingPage(_that);case _SetDialingSystemUiOverlay() when setDialingSystemUiOverlay != null:
return setDialingSystemUiOverlay(_that);case _SetDialingAppBarStyle() when setDialingAppBarStyle != null:
return setDialingAppBarStyle(_that);case _SetDialingInfo() when setDialingInfo != null:
return setDialingInfo(_that);case _SetSettingsPage() when setSettingsPage != null:
return setSettingsPage(_that);case _SetDialingInfoUsernameStyle() when setDialingInfoUsernameStyle != null:
return setDialingInfoUsernameStyle(_that);case _SetDialingInfoNumberStyle() when setDialingInfoNumberStyle != null:
return setDialingInfoNumberStyle(_that);case _SetDialingInfoCallStatusStyle() when setDialingInfoCallStatusStyle != null:
return setDialingInfoCallStatusStyle(_that);case _SetDialingInfoProcessingStatusStyle() when setDialingInfoProcessingStatusStyle != null:
return setDialingInfoProcessingStatusStyle(_that);case _SetKeypadPage() when setKeypadPage != null:
return setKeypadPage(_that);case _SetLoginOtpSignin() when setLoginOtpSignin != null:
return setLoginOtpSignin(_that);case _SetLoginPasswordSignin() when setLoginPasswordSignin != null:
return setLoginPasswordSignin(_that);case _SetLoginOtpSigninVerifyCountdown() when setLoginOtpSigninVerifyCountdown != null:
return setLoginOtpSigninVerifyCountdown(_that);case _SetLoginSignupVerifyCountdown() when setLoginSignupVerifyCountdown != null:
return setLoginSignupVerifyCountdown(_that);case _SetContactsPage() when setContactsPage != null:
return setContactsPage(_that);case _SetRecentsPage() when setRecentsPage != null:
return setRecentsPage(_that);case _SetFavoritesPage() when setFavoritesPage != null:
return setFavoritesPage(_that);case _SetConversationsPage() when setConversationsPage != null:
return setConversationsPage(_that);case _SetEmbeddedPage() when setEmbeddedPage != null:
return setEmbeddedPage(_that);case _ImportJsonPageEvent() when importJson != null:
return importJson(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LoginPageConfig login)?  setLoginPage,TResult Function( LoginSwitchPageConfig login)?  updateSwitchPage,TResult Function( ImageSource imageSource)?  setLoginPicture,TResult Function( LoginModeSelectPageConfig modeSelect)?  setLoginModeSelect,TResult Function( ElevatedButtonStyleType type)?  setLoginModeSelectButtonLoginStyle,TResult Function( ElevatedButtonStyleType type)?  setLoginModeSelectButtonSignupStyle,TResult Function( AboutPageConfig about)?  setAboutPage,TResult Function( AssetModel asset)?  setAboutPicture,TResult Function( Metadata metadata)?  setAboutMetadata,TResult Function( CallPageConfig dialingPage)?  setDialingPage,TResult Function( OverlayStyleModel? style)?  setDialingSystemUiOverlay,TResult Function( AppBarConfig? appBarStyle)?  setDialingAppBarStyle,TResult Function( CallPageInfoConfig? info)?  setDialingInfo,TResult Function( SettingsPageConfig info)?  setSettingsPage,TResult Function( TextStyleConfig? style)?  setDialingInfoUsernameStyle,TResult Function( TextStyleConfig? style)?  setDialingInfoNumberStyle,TResult Function( TextStyleConfig? style)?  setDialingInfoCallStatusStyle,TResult Function( TextStyleConfig? style)?  setDialingInfoProcessingStatusStyle,TResult Function( KeypadPageConfig keypad)?  setKeypadPage,TResult Function( LoginOtpSigninPageConfig config)?  setLoginOtpSignin,TResult Function( LoginPasswordSigninPageConfig config)?  setLoginPasswordSignin,TResult Function( int seconds)?  setLoginOtpSigninVerifyCountdown,TResult Function( int seconds)?  setLoginSignupVerifyCountdown,TResult Function( ContactsPageConfig config)?  setContactsPage,TResult Function( RecentsPageConfig config)?  setRecentsPage,TResult Function( FavoritesPageConfig config)?  setFavoritesPage,TResult Function( ConversationsPageConfig config)?  setConversationsPage,TResult Function( EmbeddedPageConfig config)?  setEmbeddedPage,TResult Function( Map<String, dynamic> json)?  importJson,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetLoginPage() when setLoginPage != null:
return setLoginPage(_that.login);case _UpdateSwitchPage() when updateSwitchPage != null:
return updateSwitchPage(_that.login);case _SetLoginPicture() when setLoginPicture != null:
return setLoginPicture(_that.imageSource);case _SetLoginModeSelect() when setLoginModeSelect != null:
return setLoginModeSelect(_that.modeSelect);case _SetLoginModeSelectButtonLoginStyle() when setLoginModeSelectButtonLoginStyle != null:
return setLoginModeSelectButtonLoginStyle(_that.type);case _SetLoginModeSelectButtonSignupStyle() when setLoginModeSelectButtonSignupStyle != null:
return setLoginModeSelectButtonSignupStyle(_that.type);case _SetAboutPage() when setAboutPage != null:
return setAboutPage(_that.about);case _SetAboutPicture() when setAboutPicture != null:
return setAboutPicture(_that.asset);case _SetAboutMetadata() when setAboutMetadata != null:
return setAboutMetadata(_that.metadata);case _SetDialingPage() when setDialingPage != null:
return setDialingPage(_that.dialingPage);case _SetDialingSystemUiOverlay() when setDialingSystemUiOverlay != null:
return setDialingSystemUiOverlay(_that.style);case _SetDialingAppBarStyle() when setDialingAppBarStyle != null:
return setDialingAppBarStyle(_that.appBarStyle);case _SetDialingInfo() when setDialingInfo != null:
return setDialingInfo(_that.info);case _SetSettingsPage() when setSettingsPage != null:
return setSettingsPage(_that.info);case _SetDialingInfoUsernameStyle() when setDialingInfoUsernameStyle != null:
return setDialingInfoUsernameStyle(_that.style);case _SetDialingInfoNumberStyle() when setDialingInfoNumberStyle != null:
return setDialingInfoNumberStyle(_that.style);case _SetDialingInfoCallStatusStyle() when setDialingInfoCallStatusStyle != null:
return setDialingInfoCallStatusStyle(_that.style);case _SetDialingInfoProcessingStatusStyle() when setDialingInfoProcessingStatusStyle != null:
return setDialingInfoProcessingStatusStyle(_that.style);case _SetKeypadPage() when setKeypadPage != null:
return setKeypadPage(_that.keypad);case _SetLoginOtpSignin() when setLoginOtpSignin != null:
return setLoginOtpSignin(_that.config);case _SetLoginPasswordSignin() when setLoginPasswordSignin != null:
return setLoginPasswordSignin(_that.config);case _SetLoginOtpSigninVerifyCountdown() when setLoginOtpSigninVerifyCountdown != null:
return setLoginOtpSigninVerifyCountdown(_that.seconds);case _SetLoginSignupVerifyCountdown() when setLoginSignupVerifyCountdown != null:
return setLoginSignupVerifyCountdown(_that.seconds);case _SetContactsPage() when setContactsPage != null:
return setContactsPage(_that.config);case _SetRecentsPage() when setRecentsPage != null:
return setRecentsPage(_that.config);case _SetFavoritesPage() when setFavoritesPage != null:
return setFavoritesPage(_that.config);case _SetConversationsPage() when setConversationsPage != null:
return setConversationsPage(_that.config);case _SetEmbeddedPage() when setEmbeddedPage != null:
return setEmbeddedPage(_that.config);case _ImportJsonPageEvent() when importJson != null:
return importJson(_that.json);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LoginPageConfig login)  setLoginPage,required TResult Function( LoginSwitchPageConfig login)  updateSwitchPage,required TResult Function( ImageSource imageSource)  setLoginPicture,required TResult Function( LoginModeSelectPageConfig modeSelect)  setLoginModeSelect,required TResult Function( ElevatedButtonStyleType type)  setLoginModeSelectButtonLoginStyle,required TResult Function( ElevatedButtonStyleType type)  setLoginModeSelectButtonSignupStyle,required TResult Function( AboutPageConfig about)  setAboutPage,required TResult Function( AssetModel asset)  setAboutPicture,required TResult Function( Metadata metadata)  setAboutMetadata,required TResult Function( CallPageConfig dialingPage)  setDialingPage,required TResult Function( OverlayStyleModel? style)  setDialingSystemUiOverlay,required TResult Function( AppBarConfig? appBarStyle)  setDialingAppBarStyle,required TResult Function( CallPageInfoConfig? info)  setDialingInfo,required TResult Function( SettingsPageConfig info)  setSettingsPage,required TResult Function( TextStyleConfig? style)  setDialingInfoUsernameStyle,required TResult Function( TextStyleConfig? style)  setDialingInfoNumberStyle,required TResult Function( TextStyleConfig? style)  setDialingInfoCallStatusStyle,required TResult Function( TextStyleConfig? style)  setDialingInfoProcessingStatusStyle,required TResult Function( KeypadPageConfig keypad)  setKeypadPage,required TResult Function( LoginOtpSigninPageConfig config)  setLoginOtpSignin,required TResult Function( LoginPasswordSigninPageConfig config)  setLoginPasswordSignin,required TResult Function( int seconds)  setLoginOtpSigninVerifyCountdown,required TResult Function( int seconds)  setLoginSignupVerifyCountdown,required TResult Function( ContactsPageConfig config)  setContactsPage,required TResult Function( RecentsPageConfig config)  setRecentsPage,required TResult Function( FavoritesPageConfig config)  setFavoritesPage,required TResult Function( ConversationsPageConfig config)  setConversationsPage,required TResult Function( EmbeddedPageConfig config)  setEmbeddedPage,required TResult Function( Map<String, dynamic> json)  importJson,}) {final _that = this;
switch (_that) {
case _SetLoginPage():
return setLoginPage(_that.login);case _UpdateSwitchPage():
return updateSwitchPage(_that.login);case _SetLoginPicture():
return setLoginPicture(_that.imageSource);case _SetLoginModeSelect():
return setLoginModeSelect(_that.modeSelect);case _SetLoginModeSelectButtonLoginStyle():
return setLoginModeSelectButtonLoginStyle(_that.type);case _SetLoginModeSelectButtonSignupStyle():
return setLoginModeSelectButtonSignupStyle(_that.type);case _SetAboutPage():
return setAboutPage(_that.about);case _SetAboutPicture():
return setAboutPicture(_that.asset);case _SetAboutMetadata():
return setAboutMetadata(_that.metadata);case _SetDialingPage():
return setDialingPage(_that.dialingPage);case _SetDialingSystemUiOverlay():
return setDialingSystemUiOverlay(_that.style);case _SetDialingAppBarStyle():
return setDialingAppBarStyle(_that.appBarStyle);case _SetDialingInfo():
return setDialingInfo(_that.info);case _SetSettingsPage():
return setSettingsPage(_that.info);case _SetDialingInfoUsernameStyle():
return setDialingInfoUsernameStyle(_that.style);case _SetDialingInfoNumberStyle():
return setDialingInfoNumberStyle(_that.style);case _SetDialingInfoCallStatusStyle():
return setDialingInfoCallStatusStyle(_that.style);case _SetDialingInfoProcessingStatusStyle():
return setDialingInfoProcessingStatusStyle(_that.style);case _SetKeypadPage():
return setKeypadPage(_that.keypad);case _SetLoginOtpSignin():
return setLoginOtpSignin(_that.config);case _SetLoginPasswordSignin():
return setLoginPasswordSignin(_that.config);case _SetLoginOtpSigninVerifyCountdown():
return setLoginOtpSigninVerifyCountdown(_that.seconds);case _SetLoginSignupVerifyCountdown():
return setLoginSignupVerifyCountdown(_that.seconds);case _SetContactsPage():
return setContactsPage(_that.config);case _SetRecentsPage():
return setRecentsPage(_that.config);case _SetFavoritesPage():
return setFavoritesPage(_that.config);case _SetConversationsPage():
return setConversationsPage(_that.config);case _SetEmbeddedPage():
return setEmbeddedPage(_that.config);case _ImportJsonPageEvent():
return importJson(_that.json);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LoginPageConfig login)?  setLoginPage,TResult? Function( LoginSwitchPageConfig login)?  updateSwitchPage,TResult? Function( ImageSource imageSource)?  setLoginPicture,TResult? Function( LoginModeSelectPageConfig modeSelect)?  setLoginModeSelect,TResult? Function( ElevatedButtonStyleType type)?  setLoginModeSelectButtonLoginStyle,TResult? Function( ElevatedButtonStyleType type)?  setLoginModeSelectButtonSignupStyle,TResult? Function( AboutPageConfig about)?  setAboutPage,TResult? Function( AssetModel asset)?  setAboutPicture,TResult? Function( Metadata metadata)?  setAboutMetadata,TResult? Function( CallPageConfig dialingPage)?  setDialingPage,TResult? Function( OverlayStyleModel? style)?  setDialingSystemUiOverlay,TResult? Function( AppBarConfig? appBarStyle)?  setDialingAppBarStyle,TResult? Function( CallPageInfoConfig? info)?  setDialingInfo,TResult? Function( SettingsPageConfig info)?  setSettingsPage,TResult? Function( TextStyleConfig? style)?  setDialingInfoUsernameStyle,TResult? Function( TextStyleConfig? style)?  setDialingInfoNumberStyle,TResult? Function( TextStyleConfig? style)?  setDialingInfoCallStatusStyle,TResult? Function( TextStyleConfig? style)?  setDialingInfoProcessingStatusStyle,TResult? Function( KeypadPageConfig keypad)?  setKeypadPage,TResult? Function( LoginOtpSigninPageConfig config)?  setLoginOtpSignin,TResult? Function( LoginPasswordSigninPageConfig config)?  setLoginPasswordSignin,TResult? Function( int seconds)?  setLoginOtpSigninVerifyCountdown,TResult? Function( int seconds)?  setLoginSignupVerifyCountdown,TResult? Function( ContactsPageConfig config)?  setContactsPage,TResult? Function( RecentsPageConfig config)?  setRecentsPage,TResult? Function( FavoritesPageConfig config)?  setFavoritesPage,TResult? Function( ConversationsPageConfig config)?  setConversationsPage,TResult? Function( EmbeddedPageConfig config)?  setEmbeddedPage,TResult? Function( Map<String, dynamic> json)?  importJson,}) {final _that = this;
switch (_that) {
case _SetLoginPage() when setLoginPage != null:
return setLoginPage(_that.login);case _UpdateSwitchPage() when updateSwitchPage != null:
return updateSwitchPage(_that.login);case _SetLoginPicture() when setLoginPicture != null:
return setLoginPicture(_that.imageSource);case _SetLoginModeSelect() when setLoginModeSelect != null:
return setLoginModeSelect(_that.modeSelect);case _SetLoginModeSelectButtonLoginStyle() when setLoginModeSelectButtonLoginStyle != null:
return setLoginModeSelectButtonLoginStyle(_that.type);case _SetLoginModeSelectButtonSignupStyle() when setLoginModeSelectButtonSignupStyle != null:
return setLoginModeSelectButtonSignupStyle(_that.type);case _SetAboutPage() when setAboutPage != null:
return setAboutPage(_that.about);case _SetAboutPicture() when setAboutPicture != null:
return setAboutPicture(_that.asset);case _SetAboutMetadata() when setAboutMetadata != null:
return setAboutMetadata(_that.metadata);case _SetDialingPage() when setDialingPage != null:
return setDialingPage(_that.dialingPage);case _SetDialingSystemUiOverlay() when setDialingSystemUiOverlay != null:
return setDialingSystemUiOverlay(_that.style);case _SetDialingAppBarStyle() when setDialingAppBarStyle != null:
return setDialingAppBarStyle(_that.appBarStyle);case _SetDialingInfo() when setDialingInfo != null:
return setDialingInfo(_that.info);case _SetSettingsPage() when setSettingsPage != null:
return setSettingsPage(_that.info);case _SetDialingInfoUsernameStyle() when setDialingInfoUsernameStyle != null:
return setDialingInfoUsernameStyle(_that.style);case _SetDialingInfoNumberStyle() when setDialingInfoNumberStyle != null:
return setDialingInfoNumberStyle(_that.style);case _SetDialingInfoCallStatusStyle() when setDialingInfoCallStatusStyle != null:
return setDialingInfoCallStatusStyle(_that.style);case _SetDialingInfoProcessingStatusStyle() when setDialingInfoProcessingStatusStyle != null:
return setDialingInfoProcessingStatusStyle(_that.style);case _SetKeypadPage() when setKeypadPage != null:
return setKeypadPage(_that.keypad);case _SetLoginOtpSignin() when setLoginOtpSignin != null:
return setLoginOtpSignin(_that.config);case _SetLoginPasswordSignin() when setLoginPasswordSignin != null:
return setLoginPasswordSignin(_that.config);case _SetLoginOtpSigninVerifyCountdown() when setLoginOtpSigninVerifyCountdown != null:
return setLoginOtpSigninVerifyCountdown(_that.seconds);case _SetLoginSignupVerifyCountdown() when setLoginSignupVerifyCountdown != null:
return setLoginSignupVerifyCountdown(_that.seconds);case _SetContactsPage() when setContactsPage != null:
return setContactsPage(_that.config);case _SetRecentsPage() when setRecentsPage != null:
return setRecentsPage(_that.config);case _SetFavoritesPage() when setFavoritesPage != null:
return setFavoritesPage(_that.config);case _SetConversationsPage() when setConversationsPage != null:
return setConversationsPage(_that.config);case _SetEmbeddedPage() when setEmbeddedPage != null:
return setEmbeddedPage(_that.config);case _ImportJsonPageEvent() when importJson != null:
return importJson(_that.json);case _:
  return null;

}
}

}

/// @nodoc


class _SetLoginPage implements ThemePageEvent {
  const _SetLoginPage(this.login);
  

 final  LoginPageConfig login;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginPageCopyWith<_SetLoginPage> get copyWith => __$SetLoginPageCopyWithImpl<_SetLoginPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginPage&&(identical(other.login, login) || other.login == login));
}


@override
int get hashCode => Object.hash(runtimeType,login);

@override
String toString() {
  return 'ThemePageEvent.setLoginPage(login: $login)';
}


}

/// @nodoc
abstract mixin class _$SetLoginPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetLoginPageCopyWith(_SetLoginPage value, $Res Function(_SetLoginPage) _then) = __$SetLoginPageCopyWithImpl;
@useResult
$Res call({
 LoginPageConfig login
});


$LoginPageConfigCopyWith<$Res> get login;

}
/// @nodoc
class __$SetLoginPageCopyWithImpl<$Res>
    implements _$SetLoginPageCopyWith<$Res> {
  __$SetLoginPageCopyWithImpl(this._self, this._then);

  final _SetLoginPage _self;
  final $Res Function(_SetLoginPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? login = null,}) {
  return _then(_SetLoginPage(
null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as LoginPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginPageConfigCopyWith<$Res> get login {
  
  return $LoginPageConfigCopyWith<$Res>(_self.login, (value) {
    return _then(_self.copyWith(login: value));
  });
}
}

/// @nodoc


class _UpdateSwitchPage implements ThemePageEvent {
  const _UpdateSwitchPage(this.login);
  

 final  LoginSwitchPageConfig login;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSwitchPageCopyWith<_UpdateSwitchPage> get copyWith => __$UpdateSwitchPageCopyWithImpl<_UpdateSwitchPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSwitchPage&&(identical(other.login, login) || other.login == login));
}


@override
int get hashCode => Object.hash(runtimeType,login);

@override
String toString() {
  return 'ThemePageEvent.updateSwitchPage(login: $login)';
}


}

/// @nodoc
abstract mixin class _$UpdateSwitchPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$UpdateSwitchPageCopyWith(_UpdateSwitchPage value, $Res Function(_UpdateSwitchPage) _then) = __$UpdateSwitchPageCopyWithImpl;
@useResult
$Res call({
 LoginSwitchPageConfig login
});


$LoginSwitchPageConfigCopyWith<$Res> get login;

}
/// @nodoc
class __$UpdateSwitchPageCopyWithImpl<$Res>
    implements _$UpdateSwitchPageCopyWith<$Res> {
  __$UpdateSwitchPageCopyWithImpl(this._self, this._then);

  final _UpdateSwitchPage _self;
  final $Res Function(_UpdateSwitchPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? login = null,}) {
  return _then(_UpdateSwitchPage(
null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as LoginSwitchPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginSwitchPageConfigCopyWith<$Res> get login {
  
  return $LoginSwitchPageConfigCopyWith<$Res>(_self.login, (value) {
    return _then(_self.copyWith(login: value));
  });
}
}

/// @nodoc


class _SetLoginPicture implements ThemePageEvent {
  const _SetLoginPicture(this.imageSource);
  

 final  ImageSource imageSource;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginPictureCopyWith<_SetLoginPicture> get copyWith => __$SetLoginPictureCopyWithImpl<_SetLoginPicture>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginPicture&&(identical(other.imageSource, imageSource) || other.imageSource == imageSource));
}


@override
int get hashCode => Object.hash(runtimeType,imageSource);

@override
String toString() {
  return 'ThemePageEvent.setLoginPicture(imageSource: $imageSource)';
}


}

/// @nodoc
abstract mixin class _$SetLoginPictureCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetLoginPictureCopyWith(_SetLoginPicture value, $Res Function(_SetLoginPicture) _then) = __$SetLoginPictureCopyWithImpl;
@useResult
$Res call({
 ImageSource imageSource
});


$ImageSourceCopyWith<$Res> get imageSource;

}
/// @nodoc
class __$SetLoginPictureCopyWithImpl<$Res>
    implements _$SetLoginPictureCopyWith<$Res> {
  __$SetLoginPictureCopyWithImpl(this._self, this._then);

  final _SetLoginPicture _self;
  final $Res Function(_SetLoginPicture) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageSource = null,}) {
  return _then(_SetLoginPicture(
null == imageSource ? _self.imageSource : imageSource // ignore: cast_nullable_to_non_nullable
as ImageSource,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageSourceCopyWith<$Res> get imageSource {
  
  return $ImageSourceCopyWith<$Res>(_self.imageSource, (value) {
    return _then(_self.copyWith(imageSource: value));
  });
}
}

/// @nodoc


class _SetLoginModeSelect implements ThemePageEvent {
  const _SetLoginModeSelect(this.modeSelect);
  

 final  LoginModeSelectPageConfig modeSelect;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginModeSelectCopyWith<_SetLoginModeSelect> get copyWith => __$SetLoginModeSelectCopyWithImpl<_SetLoginModeSelect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginModeSelect&&(identical(other.modeSelect, modeSelect) || other.modeSelect == modeSelect));
}


@override
int get hashCode => Object.hash(runtimeType,modeSelect);

@override
String toString() {
  return 'ThemePageEvent.setLoginModeSelect(modeSelect: $modeSelect)';
}


}

/// @nodoc
abstract mixin class _$SetLoginModeSelectCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetLoginModeSelectCopyWith(_SetLoginModeSelect value, $Res Function(_SetLoginModeSelect) _then) = __$SetLoginModeSelectCopyWithImpl;
@useResult
$Res call({
 LoginModeSelectPageConfig modeSelect
});


$LoginModeSelectPageConfigCopyWith<$Res> get modeSelect;

}
/// @nodoc
class __$SetLoginModeSelectCopyWithImpl<$Res>
    implements _$SetLoginModeSelectCopyWith<$Res> {
  __$SetLoginModeSelectCopyWithImpl(this._self, this._then);

  final _SetLoginModeSelect _self;
  final $Res Function(_SetLoginModeSelect) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? modeSelect = null,}) {
  return _then(_SetLoginModeSelect(
null == modeSelect ? _self.modeSelect : modeSelect // ignore: cast_nullable_to_non_nullable
as LoginModeSelectPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginModeSelectPageConfigCopyWith<$Res> get modeSelect {
  
  return $LoginModeSelectPageConfigCopyWith<$Res>(_self.modeSelect, (value) {
    return _then(_self.copyWith(modeSelect: value));
  });
}
}

/// @nodoc


class _SetLoginModeSelectButtonLoginStyle implements ThemePageEvent {
  const _SetLoginModeSelectButtonLoginStyle(this.type);
  

 final  ElevatedButtonStyleType type;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginModeSelectButtonLoginStyleCopyWith<_SetLoginModeSelectButtonLoginStyle> get copyWith => __$SetLoginModeSelectButtonLoginStyleCopyWithImpl<_SetLoginModeSelectButtonLoginStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginModeSelectButtonLoginStyle&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'ThemePageEvent.setLoginModeSelectButtonLoginStyle(type: $type)';
}


}

/// @nodoc
abstract mixin class _$SetLoginModeSelectButtonLoginStyleCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetLoginModeSelectButtonLoginStyleCopyWith(_SetLoginModeSelectButtonLoginStyle value, $Res Function(_SetLoginModeSelectButtonLoginStyle) _then) = __$SetLoginModeSelectButtonLoginStyleCopyWithImpl;
@useResult
$Res call({
 ElevatedButtonStyleType type
});




}
/// @nodoc
class __$SetLoginModeSelectButtonLoginStyleCopyWithImpl<$Res>
    implements _$SetLoginModeSelectButtonLoginStyleCopyWith<$Res> {
  __$SetLoginModeSelectButtonLoginStyleCopyWithImpl(this._self, this._then);

  final _SetLoginModeSelectButtonLoginStyle _self;
  final $Res Function(_SetLoginModeSelectButtonLoginStyle) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_SetLoginModeSelectButtonLoginStyle(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ElevatedButtonStyleType,
  ));
}


}

/// @nodoc


class _SetLoginModeSelectButtonSignupStyle implements ThemePageEvent {
  const _SetLoginModeSelectButtonSignupStyle(this.type);
  

 final  ElevatedButtonStyleType type;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginModeSelectButtonSignupStyleCopyWith<_SetLoginModeSelectButtonSignupStyle> get copyWith => __$SetLoginModeSelectButtonSignupStyleCopyWithImpl<_SetLoginModeSelectButtonSignupStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginModeSelectButtonSignupStyle&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'ThemePageEvent.setLoginModeSelectButtonSignupStyle(type: $type)';
}


}

/// @nodoc
abstract mixin class _$SetLoginModeSelectButtonSignupStyleCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetLoginModeSelectButtonSignupStyleCopyWith(_SetLoginModeSelectButtonSignupStyle value, $Res Function(_SetLoginModeSelectButtonSignupStyle) _then) = __$SetLoginModeSelectButtonSignupStyleCopyWithImpl;
@useResult
$Res call({
 ElevatedButtonStyleType type
});




}
/// @nodoc
class __$SetLoginModeSelectButtonSignupStyleCopyWithImpl<$Res>
    implements _$SetLoginModeSelectButtonSignupStyleCopyWith<$Res> {
  __$SetLoginModeSelectButtonSignupStyleCopyWithImpl(this._self, this._then);

  final _SetLoginModeSelectButtonSignupStyle _self;
  final $Res Function(_SetLoginModeSelectButtonSignupStyle) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_SetLoginModeSelectButtonSignupStyle(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ElevatedButtonStyleType,
  ));
}


}

/// @nodoc


class _SetAboutPage implements ThemePageEvent {
  const _SetAboutPage(this.about);
  

 final  AboutPageConfig about;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetAboutPageCopyWith<_SetAboutPage> get copyWith => __$SetAboutPageCopyWithImpl<_SetAboutPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetAboutPage&&(identical(other.about, about) || other.about == about));
}


@override
int get hashCode => Object.hash(runtimeType,about);

@override
String toString() {
  return 'ThemePageEvent.setAboutPage(about: $about)';
}


}

/// @nodoc
abstract mixin class _$SetAboutPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetAboutPageCopyWith(_SetAboutPage value, $Res Function(_SetAboutPage) _then) = __$SetAboutPageCopyWithImpl;
@useResult
$Res call({
 AboutPageConfig about
});


$AboutPageConfigCopyWith<$Res> get about;

}
/// @nodoc
class __$SetAboutPageCopyWithImpl<$Res>
    implements _$SetAboutPageCopyWith<$Res> {
  __$SetAboutPageCopyWithImpl(this._self, this._then);

  final _SetAboutPage _self;
  final $Res Function(_SetAboutPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? about = null,}) {
  return _then(_SetAboutPage(
null == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as AboutPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AboutPageConfigCopyWith<$Res> get about {
  
  return $AboutPageConfigCopyWith<$Res>(_self.about, (value) {
    return _then(_self.copyWith(about: value));
  });
}
}

/// @nodoc


class _SetAboutPicture implements ThemePageEvent {
  const _SetAboutPicture(this.asset);
  

 final  AssetModel asset;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetAboutPictureCopyWith<_SetAboutPicture> get copyWith => __$SetAboutPictureCopyWithImpl<_SetAboutPicture>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetAboutPicture&&(identical(other.asset, asset) || other.asset == asset));
}


@override
int get hashCode => Object.hash(runtimeType,asset);

@override
String toString() {
  return 'ThemePageEvent.setAboutPicture(asset: $asset)';
}


}

/// @nodoc
abstract mixin class _$SetAboutPictureCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetAboutPictureCopyWith(_SetAboutPicture value, $Res Function(_SetAboutPicture) _then) = __$SetAboutPictureCopyWithImpl;
@useResult
$Res call({
 AssetModel asset
});


$AssetModelCopyWith<$Res> get asset;

}
/// @nodoc
class __$SetAboutPictureCopyWithImpl<$Res>
    implements _$SetAboutPictureCopyWith<$Res> {
  __$SetAboutPictureCopyWithImpl(this._self, this._then);

  final _SetAboutPicture _self;
  final $Res Function(_SetAboutPicture) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? asset = null,}) {
  return _then(_SetAboutPicture(
null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as AssetModel,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res> get asset {
  
  return $AssetModelCopyWith<$Res>(_self.asset, (value) {
    return _then(_self.copyWith(asset: value));
  });
}
}

/// @nodoc


class _SetAboutMetadata implements ThemePageEvent {
  const _SetAboutMetadata(this.metadata);
  

 final  Metadata metadata;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetAboutMetadataCopyWith<_SetAboutMetadata> get copyWith => __$SetAboutMetadataCopyWithImpl<_SetAboutMetadata>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetAboutMetadata&&(identical(other.metadata, metadata) || other.metadata == metadata));
}


@override
int get hashCode => Object.hash(runtimeType,metadata);

@override
String toString() {
  return 'ThemePageEvent.setAboutMetadata(metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$SetAboutMetadataCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetAboutMetadataCopyWith(_SetAboutMetadata value, $Res Function(_SetAboutMetadata) _then) = __$SetAboutMetadataCopyWithImpl;
@useResult
$Res call({
 Metadata metadata
});


$MetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$SetAboutMetadataCopyWithImpl<$Res>
    implements _$SetAboutMetadataCopyWith<$Res> {
  __$SetAboutMetadataCopyWithImpl(this._self, this._then);

  final _SetAboutMetadata _self;
  final $Res Function(_SetAboutMetadata) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? metadata = null,}) {
  return _then(_SetAboutMetadata(
null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

/// @nodoc


class _SetDialingPage implements ThemePageEvent {
  const _SetDialingPage(this.dialingPage);
  

 final  CallPageConfig dialingPage;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDialingPageCopyWith<_SetDialingPage> get copyWith => __$SetDialingPageCopyWithImpl<_SetDialingPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDialingPage&&(identical(other.dialingPage, dialingPage) || other.dialingPage == dialingPage));
}


@override
int get hashCode => Object.hash(runtimeType,dialingPage);

@override
String toString() {
  return 'ThemePageEvent.setDialingPage(dialingPage: $dialingPage)';
}


}

/// @nodoc
abstract mixin class _$SetDialingPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetDialingPageCopyWith(_SetDialingPage value, $Res Function(_SetDialingPage) _then) = __$SetDialingPageCopyWithImpl;
@useResult
$Res call({
 CallPageConfig dialingPage
});


$CallPageConfigCopyWith<$Res> get dialingPage;

}
/// @nodoc
class __$SetDialingPageCopyWithImpl<$Res>
    implements _$SetDialingPageCopyWith<$Res> {
  __$SetDialingPageCopyWithImpl(this._self, this._then);

  final _SetDialingPage _self;
  final $Res Function(_SetDialingPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dialingPage = null,}) {
  return _then(_SetDialingPage(
null == dialingPage ? _self.dialingPage : dialingPage // ignore: cast_nullable_to_non_nullable
as CallPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CallPageConfigCopyWith<$Res> get dialingPage {
  
  return $CallPageConfigCopyWith<$Res>(_self.dialingPage, (value) {
    return _then(_self.copyWith(dialingPage: value));
  });
}
}

/// @nodoc


class _SetDialingSystemUiOverlay implements ThemePageEvent {
  const _SetDialingSystemUiOverlay(this.style);
  

 final  OverlayStyleModel? style;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDialingSystemUiOverlayCopyWith<_SetDialingSystemUiOverlay> get copyWith => __$SetDialingSystemUiOverlayCopyWithImpl<_SetDialingSystemUiOverlay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDialingSystemUiOverlay&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,style);

@override
String toString() {
  return 'ThemePageEvent.setDialingSystemUiOverlay(style: $style)';
}


}

/// @nodoc
abstract mixin class _$SetDialingSystemUiOverlayCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetDialingSystemUiOverlayCopyWith(_SetDialingSystemUiOverlay value, $Res Function(_SetDialingSystemUiOverlay) _then) = __$SetDialingSystemUiOverlayCopyWithImpl;
@useResult
$Res call({
 OverlayStyleModel? style
});


$OverlayStyleModelCopyWith<$Res>? get style;

}
/// @nodoc
class __$SetDialingSystemUiOverlayCopyWithImpl<$Res>
    implements _$SetDialingSystemUiOverlayCopyWith<$Res> {
  __$SetDialingSystemUiOverlayCopyWithImpl(this._self, this._then);

  final _SetDialingSystemUiOverlay _self;
  final $Res Function(_SetDialingSystemUiOverlay) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? style = freezed,}) {
  return _then(_SetDialingSystemUiOverlay(
freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as OverlayStyleModel?,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OverlayStyleModelCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $OverlayStyleModelCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

/// @nodoc


class _SetDialingAppBarStyle implements ThemePageEvent {
  const _SetDialingAppBarStyle(this.appBarStyle);
  

 final  AppBarConfig? appBarStyle;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDialingAppBarStyleCopyWith<_SetDialingAppBarStyle> get copyWith => __$SetDialingAppBarStyleCopyWithImpl<_SetDialingAppBarStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDialingAppBarStyle&&(identical(other.appBarStyle, appBarStyle) || other.appBarStyle == appBarStyle));
}


@override
int get hashCode => Object.hash(runtimeType,appBarStyle);

@override
String toString() {
  return 'ThemePageEvent.setDialingAppBarStyle(appBarStyle: $appBarStyle)';
}


}

/// @nodoc
abstract mixin class _$SetDialingAppBarStyleCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetDialingAppBarStyleCopyWith(_SetDialingAppBarStyle value, $Res Function(_SetDialingAppBarStyle) _then) = __$SetDialingAppBarStyleCopyWithImpl;
@useResult
$Res call({
 AppBarConfig? appBarStyle
});


$AppBarConfigCopyWith<$Res>? get appBarStyle;

}
/// @nodoc
class __$SetDialingAppBarStyleCopyWithImpl<$Res>
    implements _$SetDialingAppBarStyleCopyWith<$Res> {
  __$SetDialingAppBarStyleCopyWithImpl(this._self, this._then);

  final _SetDialingAppBarStyle _self;
  final $Res Function(_SetDialingAppBarStyle) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appBarStyle = freezed,}) {
  return _then(_SetDialingAppBarStyle(
freezed == appBarStyle ? _self.appBarStyle : appBarStyle // ignore: cast_nullable_to_non_nullable
as AppBarConfig?,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppBarConfigCopyWith<$Res>? get appBarStyle {
    if (_self.appBarStyle == null) {
    return null;
  }

  return $AppBarConfigCopyWith<$Res>(_self.appBarStyle!, (value) {
    return _then(_self.copyWith(appBarStyle: value));
  });
}
}

/// @nodoc


class _SetDialingInfo implements ThemePageEvent {
  const _SetDialingInfo(this.info);
  

 final  CallPageInfoConfig? info;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDialingInfoCopyWith<_SetDialingInfo> get copyWith => __$SetDialingInfoCopyWithImpl<_SetDialingInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDialingInfo&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'ThemePageEvent.setDialingInfo(info: $info)';
}


}

/// @nodoc
abstract mixin class _$SetDialingInfoCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetDialingInfoCopyWith(_SetDialingInfo value, $Res Function(_SetDialingInfo) _then) = __$SetDialingInfoCopyWithImpl;
@useResult
$Res call({
 CallPageInfoConfig? info
});


$CallPageInfoConfigCopyWith<$Res>? get info;

}
/// @nodoc
class __$SetDialingInfoCopyWithImpl<$Res>
    implements _$SetDialingInfoCopyWith<$Res> {
  __$SetDialingInfoCopyWithImpl(this._self, this._then);

  final _SetDialingInfo _self;
  final $Res Function(_SetDialingInfo) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = freezed,}) {
  return _then(_SetDialingInfo(
freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as CallPageInfoConfig?,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CallPageInfoConfigCopyWith<$Res>? get info {
    if (_self.info == null) {
    return null;
  }

  return $CallPageInfoConfigCopyWith<$Res>(_self.info!, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

/// @nodoc


class _SetSettingsPage implements ThemePageEvent {
  const _SetSettingsPage(this.info);
  

 final  SettingsPageConfig info;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetSettingsPageCopyWith<_SetSettingsPage> get copyWith => __$SetSettingsPageCopyWithImpl<_SetSettingsPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetSettingsPage&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'ThemePageEvent.setSettingsPage(info: $info)';
}


}

/// @nodoc
abstract mixin class _$SetSettingsPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetSettingsPageCopyWith(_SetSettingsPage value, $Res Function(_SetSettingsPage) _then) = __$SetSettingsPageCopyWithImpl;
@useResult
$Res call({
 SettingsPageConfig info
});


$SettingsPageConfigCopyWith<$Res> get info;

}
/// @nodoc
class __$SetSettingsPageCopyWithImpl<$Res>
    implements _$SetSettingsPageCopyWith<$Res> {
  __$SetSettingsPageCopyWithImpl(this._self, this._then);

  final _SetSettingsPage _self;
  final $Res Function(_SetSettingsPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(_SetSettingsPage(
null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as SettingsPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsPageConfigCopyWith<$Res> get info {
  
  return $SettingsPageConfigCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}

/// @nodoc


class _SetDialingInfoUsernameStyle implements ThemePageEvent {
  const _SetDialingInfoUsernameStyle(this.style);
  

 final  TextStyleConfig? style;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDialingInfoUsernameStyleCopyWith<_SetDialingInfoUsernameStyle> get copyWith => __$SetDialingInfoUsernameStyleCopyWithImpl<_SetDialingInfoUsernameStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDialingInfoUsernameStyle&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,style);

@override
String toString() {
  return 'ThemePageEvent.setDialingInfoUsernameStyle(style: $style)';
}


}

/// @nodoc
abstract mixin class _$SetDialingInfoUsernameStyleCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetDialingInfoUsernameStyleCopyWith(_SetDialingInfoUsernameStyle value, $Res Function(_SetDialingInfoUsernameStyle) _then) = __$SetDialingInfoUsernameStyleCopyWithImpl;
@useResult
$Res call({
 TextStyleConfig? style
});


$TextStyleConfigCopyWith<$Res>? get style;

}
/// @nodoc
class __$SetDialingInfoUsernameStyleCopyWithImpl<$Res>
    implements _$SetDialingInfoUsernameStyleCopyWith<$Res> {
  __$SetDialingInfoUsernameStyleCopyWithImpl(this._self, this._then);

  final _SetDialingInfoUsernameStyle _self;
  final $Res Function(_SetDialingInfoUsernameStyle) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? style = freezed,}) {
  return _then(_SetDialingInfoUsernameStyle(
freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TextStyleConfig?,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextStyleConfigCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $TextStyleConfigCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

/// @nodoc


class _SetDialingInfoNumberStyle implements ThemePageEvent {
  const _SetDialingInfoNumberStyle(this.style);
  

 final  TextStyleConfig? style;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDialingInfoNumberStyleCopyWith<_SetDialingInfoNumberStyle> get copyWith => __$SetDialingInfoNumberStyleCopyWithImpl<_SetDialingInfoNumberStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDialingInfoNumberStyle&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,style);

@override
String toString() {
  return 'ThemePageEvent.setDialingInfoNumberStyle(style: $style)';
}


}

/// @nodoc
abstract mixin class _$SetDialingInfoNumberStyleCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetDialingInfoNumberStyleCopyWith(_SetDialingInfoNumberStyle value, $Res Function(_SetDialingInfoNumberStyle) _then) = __$SetDialingInfoNumberStyleCopyWithImpl;
@useResult
$Res call({
 TextStyleConfig? style
});


$TextStyleConfigCopyWith<$Res>? get style;

}
/// @nodoc
class __$SetDialingInfoNumberStyleCopyWithImpl<$Res>
    implements _$SetDialingInfoNumberStyleCopyWith<$Res> {
  __$SetDialingInfoNumberStyleCopyWithImpl(this._self, this._then);

  final _SetDialingInfoNumberStyle _self;
  final $Res Function(_SetDialingInfoNumberStyle) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? style = freezed,}) {
  return _then(_SetDialingInfoNumberStyle(
freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TextStyleConfig?,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextStyleConfigCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $TextStyleConfigCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

/// @nodoc


class _SetDialingInfoCallStatusStyle implements ThemePageEvent {
  const _SetDialingInfoCallStatusStyle(this.style);
  

 final  TextStyleConfig? style;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDialingInfoCallStatusStyleCopyWith<_SetDialingInfoCallStatusStyle> get copyWith => __$SetDialingInfoCallStatusStyleCopyWithImpl<_SetDialingInfoCallStatusStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDialingInfoCallStatusStyle&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,style);

@override
String toString() {
  return 'ThemePageEvent.setDialingInfoCallStatusStyle(style: $style)';
}


}

/// @nodoc
abstract mixin class _$SetDialingInfoCallStatusStyleCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetDialingInfoCallStatusStyleCopyWith(_SetDialingInfoCallStatusStyle value, $Res Function(_SetDialingInfoCallStatusStyle) _then) = __$SetDialingInfoCallStatusStyleCopyWithImpl;
@useResult
$Res call({
 TextStyleConfig? style
});


$TextStyleConfigCopyWith<$Res>? get style;

}
/// @nodoc
class __$SetDialingInfoCallStatusStyleCopyWithImpl<$Res>
    implements _$SetDialingInfoCallStatusStyleCopyWith<$Res> {
  __$SetDialingInfoCallStatusStyleCopyWithImpl(this._self, this._then);

  final _SetDialingInfoCallStatusStyle _self;
  final $Res Function(_SetDialingInfoCallStatusStyle) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? style = freezed,}) {
  return _then(_SetDialingInfoCallStatusStyle(
freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TextStyleConfig?,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextStyleConfigCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $TextStyleConfigCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

/// @nodoc


class _SetDialingInfoProcessingStatusStyle implements ThemePageEvent {
  const _SetDialingInfoProcessingStatusStyle(this.style);
  

 final  TextStyleConfig? style;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDialingInfoProcessingStatusStyleCopyWith<_SetDialingInfoProcessingStatusStyle> get copyWith => __$SetDialingInfoProcessingStatusStyleCopyWithImpl<_SetDialingInfoProcessingStatusStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDialingInfoProcessingStatusStyle&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,style);

@override
String toString() {
  return 'ThemePageEvent.setDialingInfoProcessingStatusStyle(style: $style)';
}


}

/// @nodoc
abstract mixin class _$SetDialingInfoProcessingStatusStyleCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetDialingInfoProcessingStatusStyleCopyWith(_SetDialingInfoProcessingStatusStyle value, $Res Function(_SetDialingInfoProcessingStatusStyle) _then) = __$SetDialingInfoProcessingStatusStyleCopyWithImpl;
@useResult
$Res call({
 TextStyleConfig? style
});


$TextStyleConfigCopyWith<$Res>? get style;

}
/// @nodoc
class __$SetDialingInfoProcessingStatusStyleCopyWithImpl<$Res>
    implements _$SetDialingInfoProcessingStatusStyleCopyWith<$Res> {
  __$SetDialingInfoProcessingStatusStyleCopyWithImpl(this._self, this._then);

  final _SetDialingInfoProcessingStatusStyle _self;
  final $Res Function(_SetDialingInfoProcessingStatusStyle) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? style = freezed,}) {
  return _then(_SetDialingInfoProcessingStatusStyle(
freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as TextStyleConfig?,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextStyleConfigCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $TextStyleConfigCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

/// @nodoc


class _SetKeypadPage implements ThemePageEvent {
  const _SetKeypadPage(this.keypad);
  

 final  KeypadPageConfig keypad;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetKeypadPageCopyWith<_SetKeypadPage> get copyWith => __$SetKeypadPageCopyWithImpl<_SetKeypadPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetKeypadPage&&(identical(other.keypad, keypad) || other.keypad == keypad));
}


@override
int get hashCode => Object.hash(runtimeType,keypad);

@override
String toString() {
  return 'ThemePageEvent.setKeypadPage(keypad: $keypad)';
}


}

/// @nodoc
abstract mixin class _$SetKeypadPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetKeypadPageCopyWith(_SetKeypadPage value, $Res Function(_SetKeypadPage) _then) = __$SetKeypadPageCopyWithImpl;
@useResult
$Res call({
 KeypadPageConfig keypad
});


$KeypadPageConfigCopyWith<$Res> get keypad;

}
/// @nodoc
class __$SetKeypadPageCopyWithImpl<$Res>
    implements _$SetKeypadPageCopyWith<$Res> {
  __$SetKeypadPageCopyWithImpl(this._self, this._then);

  final _SetKeypadPage _self;
  final $Res Function(_SetKeypadPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? keypad = null,}) {
  return _then(_SetKeypadPage(
null == keypad ? _self.keypad : keypad // ignore: cast_nullable_to_non_nullable
as KeypadPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeypadPageConfigCopyWith<$Res> get keypad {
  
  return $KeypadPageConfigCopyWith<$Res>(_self.keypad, (value) {
    return _then(_self.copyWith(keypad: value));
  });
}
}

/// @nodoc


class _SetLoginOtpSignin implements ThemePageEvent {
  const _SetLoginOtpSignin(this.config);
  

 final  LoginOtpSigninPageConfig config;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginOtpSigninCopyWith<_SetLoginOtpSignin> get copyWith => __$SetLoginOtpSigninCopyWithImpl<_SetLoginOtpSignin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginOtpSignin&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'ThemePageEvent.setLoginOtpSignin(config: $config)';
}


}

/// @nodoc
abstract mixin class _$SetLoginOtpSigninCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetLoginOtpSigninCopyWith(_SetLoginOtpSignin value, $Res Function(_SetLoginOtpSignin) _then) = __$SetLoginOtpSigninCopyWithImpl;
@useResult
$Res call({
 LoginOtpSigninPageConfig config
});


$LoginOtpSigninPageConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$SetLoginOtpSigninCopyWithImpl<$Res>
    implements _$SetLoginOtpSigninCopyWith<$Res> {
  __$SetLoginOtpSigninCopyWithImpl(this._self, this._then);

  final _SetLoginOtpSignin _self;
  final $Res Function(_SetLoginOtpSignin) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(_SetLoginOtpSignin(
null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as LoginOtpSigninPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginOtpSigninPageConfigCopyWith<$Res> get config {
  
  return $LoginOtpSigninPageConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class _SetLoginPasswordSignin implements ThemePageEvent {
  const _SetLoginPasswordSignin(this.config);
  

 final  LoginPasswordSigninPageConfig config;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginPasswordSigninCopyWith<_SetLoginPasswordSignin> get copyWith => __$SetLoginPasswordSigninCopyWithImpl<_SetLoginPasswordSignin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginPasswordSignin&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'ThemePageEvent.setLoginPasswordSignin(config: $config)';
}


}

/// @nodoc
abstract mixin class _$SetLoginPasswordSigninCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetLoginPasswordSigninCopyWith(_SetLoginPasswordSignin value, $Res Function(_SetLoginPasswordSignin) _then) = __$SetLoginPasswordSigninCopyWithImpl;
@useResult
$Res call({
 LoginPasswordSigninPageConfig config
});


$LoginPasswordSigninPageConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$SetLoginPasswordSigninCopyWithImpl<$Res>
    implements _$SetLoginPasswordSigninCopyWith<$Res> {
  __$SetLoginPasswordSigninCopyWithImpl(this._self, this._then);

  final _SetLoginPasswordSignin _self;
  final $Res Function(_SetLoginPasswordSignin) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(_SetLoginPasswordSignin(
null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as LoginPasswordSigninPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginPasswordSigninPageConfigCopyWith<$Res> get config {
  
  return $LoginPasswordSigninPageConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class _SetLoginOtpSigninVerifyCountdown implements ThemePageEvent {
  const _SetLoginOtpSigninVerifyCountdown(this.seconds);
  

 final  int seconds;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginOtpSigninVerifyCountdownCopyWith<_SetLoginOtpSigninVerifyCountdown> get copyWith => __$SetLoginOtpSigninVerifyCountdownCopyWithImpl<_SetLoginOtpSigninVerifyCountdown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginOtpSigninVerifyCountdown&&(identical(other.seconds, seconds) || other.seconds == seconds));
}


@override
int get hashCode => Object.hash(runtimeType,seconds);

@override
String toString() {
  return 'ThemePageEvent.setLoginOtpSigninVerifyCountdown(seconds: $seconds)';
}


}

/// @nodoc
abstract mixin class _$SetLoginOtpSigninVerifyCountdownCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetLoginOtpSigninVerifyCountdownCopyWith(_SetLoginOtpSigninVerifyCountdown value, $Res Function(_SetLoginOtpSigninVerifyCountdown) _then) = __$SetLoginOtpSigninVerifyCountdownCopyWithImpl;
@useResult
$Res call({
 int seconds
});




}
/// @nodoc
class __$SetLoginOtpSigninVerifyCountdownCopyWithImpl<$Res>
    implements _$SetLoginOtpSigninVerifyCountdownCopyWith<$Res> {
  __$SetLoginOtpSigninVerifyCountdownCopyWithImpl(this._self, this._then);

  final _SetLoginOtpSigninVerifyCountdown _self;
  final $Res Function(_SetLoginOtpSigninVerifyCountdown) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seconds = null,}) {
  return _then(_SetLoginOtpSigninVerifyCountdown(
null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetLoginSignupVerifyCountdown implements ThemePageEvent {
  const _SetLoginSignupVerifyCountdown(this.seconds);
  

 final  int seconds;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLoginSignupVerifyCountdownCopyWith<_SetLoginSignupVerifyCountdown> get copyWith => __$SetLoginSignupVerifyCountdownCopyWithImpl<_SetLoginSignupVerifyCountdown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLoginSignupVerifyCountdown&&(identical(other.seconds, seconds) || other.seconds == seconds));
}


@override
int get hashCode => Object.hash(runtimeType,seconds);

@override
String toString() {
  return 'ThemePageEvent.setLoginSignupVerifyCountdown(seconds: $seconds)';
}


}

/// @nodoc
abstract mixin class _$SetLoginSignupVerifyCountdownCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetLoginSignupVerifyCountdownCopyWith(_SetLoginSignupVerifyCountdown value, $Res Function(_SetLoginSignupVerifyCountdown) _then) = __$SetLoginSignupVerifyCountdownCopyWithImpl;
@useResult
$Res call({
 int seconds
});




}
/// @nodoc
class __$SetLoginSignupVerifyCountdownCopyWithImpl<$Res>
    implements _$SetLoginSignupVerifyCountdownCopyWith<$Res> {
  __$SetLoginSignupVerifyCountdownCopyWithImpl(this._self, this._then);

  final _SetLoginSignupVerifyCountdown _self;
  final $Res Function(_SetLoginSignupVerifyCountdown) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seconds = null,}) {
  return _then(_SetLoginSignupVerifyCountdown(
null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetContactsPage implements ThemePageEvent {
  const _SetContactsPage(this.config);
  

 final  ContactsPageConfig config;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetContactsPageCopyWith<_SetContactsPage> get copyWith => __$SetContactsPageCopyWithImpl<_SetContactsPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetContactsPage&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'ThemePageEvent.setContactsPage(config: $config)';
}


}

/// @nodoc
abstract mixin class _$SetContactsPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetContactsPageCopyWith(_SetContactsPage value, $Res Function(_SetContactsPage) _then) = __$SetContactsPageCopyWithImpl;
@useResult
$Res call({
 ContactsPageConfig config
});


$ContactsPageConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$SetContactsPageCopyWithImpl<$Res>
    implements _$SetContactsPageCopyWith<$Res> {
  __$SetContactsPageCopyWithImpl(this._self, this._then);

  final _SetContactsPage _self;
  final $Res Function(_SetContactsPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(_SetContactsPage(
null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ContactsPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactsPageConfigCopyWith<$Res> get config {
  
  return $ContactsPageConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class _SetRecentsPage implements ThemePageEvent {
  const _SetRecentsPage(this.config);
  

 final  RecentsPageConfig config;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetRecentsPageCopyWith<_SetRecentsPage> get copyWith => __$SetRecentsPageCopyWithImpl<_SetRecentsPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetRecentsPage&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'ThemePageEvent.setRecentsPage(config: $config)';
}


}

/// @nodoc
abstract mixin class _$SetRecentsPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetRecentsPageCopyWith(_SetRecentsPage value, $Res Function(_SetRecentsPage) _then) = __$SetRecentsPageCopyWithImpl;
@useResult
$Res call({
 RecentsPageConfig config
});


$RecentsPageConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$SetRecentsPageCopyWithImpl<$Res>
    implements _$SetRecentsPageCopyWith<$Res> {
  __$SetRecentsPageCopyWithImpl(this._self, this._then);

  final _SetRecentsPage _self;
  final $Res Function(_SetRecentsPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(_SetRecentsPage(
null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as RecentsPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecentsPageConfigCopyWith<$Res> get config {
  
  return $RecentsPageConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class _SetFavoritesPage implements ThemePageEvent {
  const _SetFavoritesPage(this.config);
  

 final  FavoritesPageConfig config;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetFavoritesPageCopyWith<_SetFavoritesPage> get copyWith => __$SetFavoritesPageCopyWithImpl<_SetFavoritesPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetFavoritesPage&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'ThemePageEvent.setFavoritesPage(config: $config)';
}


}

/// @nodoc
abstract mixin class _$SetFavoritesPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetFavoritesPageCopyWith(_SetFavoritesPage value, $Res Function(_SetFavoritesPage) _then) = __$SetFavoritesPageCopyWithImpl;
@useResult
$Res call({
 FavoritesPageConfig config
});


$FavoritesPageConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$SetFavoritesPageCopyWithImpl<$Res>
    implements _$SetFavoritesPageCopyWith<$Res> {
  __$SetFavoritesPageCopyWithImpl(this._self, this._then);

  final _SetFavoritesPage _self;
  final $Res Function(_SetFavoritesPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(_SetFavoritesPage(
null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as FavoritesPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FavoritesPageConfigCopyWith<$Res> get config {
  
  return $FavoritesPageConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class _SetConversationsPage implements ThemePageEvent {
  const _SetConversationsPage(this.config);
  

 final  ConversationsPageConfig config;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetConversationsPageCopyWith<_SetConversationsPage> get copyWith => __$SetConversationsPageCopyWithImpl<_SetConversationsPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetConversationsPage&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'ThemePageEvent.setConversationsPage(config: $config)';
}


}

/// @nodoc
abstract mixin class _$SetConversationsPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetConversationsPageCopyWith(_SetConversationsPage value, $Res Function(_SetConversationsPage) _then) = __$SetConversationsPageCopyWithImpl;
@useResult
$Res call({
 ConversationsPageConfig config
});


$ConversationsPageConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$SetConversationsPageCopyWithImpl<$Res>
    implements _$SetConversationsPageCopyWith<$Res> {
  __$SetConversationsPageCopyWithImpl(this._self, this._then);

  final _SetConversationsPage _self;
  final $Res Function(_SetConversationsPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(_SetConversationsPage(
null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ConversationsPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConversationsPageConfigCopyWith<$Res> get config {
  
  return $ConversationsPageConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class _SetEmbeddedPage implements ThemePageEvent {
  const _SetEmbeddedPage(this.config);
  

 final  EmbeddedPageConfig config;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetEmbeddedPageCopyWith<_SetEmbeddedPage> get copyWith => __$SetEmbeddedPageCopyWithImpl<_SetEmbeddedPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetEmbeddedPage&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'ThemePageEvent.setEmbeddedPage(config: $config)';
}


}

/// @nodoc
abstract mixin class _$SetEmbeddedPageCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$SetEmbeddedPageCopyWith(_SetEmbeddedPage value, $Res Function(_SetEmbeddedPage) _then) = __$SetEmbeddedPageCopyWithImpl;
@useResult
$Res call({
 EmbeddedPageConfig config
});


$EmbeddedPageConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$SetEmbeddedPageCopyWithImpl<$Res>
    implements _$SetEmbeddedPageCopyWith<$Res> {
  __$SetEmbeddedPageCopyWithImpl(this._self, this._then);

  final _SetEmbeddedPage _self;
  final $Res Function(_SetEmbeddedPage) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(_SetEmbeddedPage(
null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as EmbeddedPageConfig,
  ));
}

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmbeddedPageConfigCopyWith<$Res> get config {
  
  return $EmbeddedPageConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class _ImportJsonPageEvent implements ThemePageEvent {
  const _ImportJsonPageEvent(final  Map<String, dynamic> json): _json = json;
  

 final  Map<String, dynamic> _json;
 Map<String, dynamic> get json {
  if (_json is EqualUnmodifiableMapView) return _json;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_json);
}


/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportJsonPageEventCopyWith<_ImportJsonPageEvent> get copyWith => __$ImportJsonPageEventCopyWithImpl<_ImportJsonPageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportJsonPageEvent&&const DeepCollectionEquality().equals(other._json, _json));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_json));

@override
String toString() {
  return 'ThemePageEvent.importJson(json: $json)';
}


}

/// @nodoc
abstract mixin class _$ImportJsonPageEventCopyWith<$Res> implements $ThemePageEventCopyWith<$Res> {
  factory _$ImportJsonPageEventCopyWith(_ImportJsonPageEvent value, $Res Function(_ImportJsonPageEvent) _then) = __$ImportJsonPageEventCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> json
});




}
/// @nodoc
class __$ImportJsonPageEventCopyWithImpl<$Res>
    implements _$ImportJsonPageEventCopyWith<$Res> {
  __$ImportJsonPageEventCopyWithImpl(this._self, this._then);

  final _ImportJsonPageEvent _self;
  final $Res Function(_ImportJsonPageEvent) _then;

/// Create a copy of ThemePageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? json = null,}) {
  return _then(_ImportJsonPageEvent(
null == json ? _self._json : json // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$ThemeWidgetEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeWidgetEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeWidgetEvent()';
}


}

/// @nodoc
class $ThemeWidgetEventCopyWith<$Res>  {
$ThemeWidgetEventCopyWith(ThemeWidgetEvent _, $Res Function(ThemeWidgetEvent) __);
}


/// Adds pattern-matching-related methods to [ThemeWidgetEvent].
extension ThemeWidgetEventPatterns on ThemeWidgetEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SetFonts value)?  setFonts,TResult Function( _SetGlobalFontFamily value)?  setGlobalFontFamily,TResult Function( _SetButton value)?  setButton,TResult Function( _SetPrimaryElevatedButton value)?  setPEButton,TResult Function( _SetGroup value)?  setGroup,TResult Function( _SetGroupTitleListTile value)?  setGroupTitleListTile,TResult Function( _SetGroupTitleListTileBackground value)?  setGroupTitleListTileBackground,TResult Function( _SetBar value)?  setBar,TResult Function( _SetBottomNavBar value)?  setBottomNavigationBar,TResult Function( _SetBottomNavBarBackground value)?  setBottomNavBarBackground,TResult Function( _SetBottomNavBarSelected value)?  setBottomNavBarSelected,TResult Function( _SetBottomNavBarUnselected value)?  setBottomNavBarUnselected,TResult Function( _SetExtTabBar value)?  setExtTabBar,TResult Function( _SetTabBarConfig value)?  setTabBarConfig,TResult Function( _SetDefaultPlaceholderImage value)?  setDefaultPlaceholderImage,TResult Function( _SetImageAssets value)?  setImageAssets,TResult Function( _SetAppIcon value)?  setAppIcon,TResult Function( _SetLeadingAvatarStyle value)?  setLeadingAvatarStyle,TResult Function( _SetInput value)?  setInput,TResult Function( _SetTextFormField value)?  setTextFormField,TResult Function( _SetInputLabelColor value)?  setInputLabelColor,TResult Function( _SetInputBorder value)?  setInputBorder,TResult Function( _SetInputBorderDisabled value)?  setInputBorderDisabled,TResult Function( _SetInputBorderFocused value)?  setInputBorderFocused,TResult Function( _SetInputBorderAny value)?  setInputBorderAny,TResult Function( _SetText value)?  setText,TResult Function( _SetTextSelection value)?  setTextSelection,TResult Function( _SetTextCursorColor value)?  setTextCursorColor,TResult Function( _SetTextSelectionColor value)?  setTextSelectionColor,TResult Function( _SetTextSelectionHandleColor value)?  setTextSelectionHandleColor,TResult Function( _SetLinkify value)?  setLinkify,TResult Function( _SetLinkifyStyleColor value)?  setLinkifyStyleColor,TResult Function( _SetLinkifyLinkColor value)?  setLinkifyLinkColor,TResult Function( _SetDialog value)?  setDialog,TResult Function( _SetConfirmDialog value)?  setConfirmDialog,TResult Function( _SetConfirmDialogActive1 value)?  setConfirmDialogActive1,TResult Function( _SetConfirmDialogActive2 value)?  setConfirmDialogActive2,TResult Function( _SetConfirmDialogDefault value)?  setConfirmDialogDefault,TResult Function( _SetSnackBar value)?  setSnackBar,TResult Function( _SetStatuses value)?  setStatuses,TResult Function( _SetRegistrationStatuses value)?  setRegistrationStatuses,TResult Function( _SetRegistrationOnline value)?  setRegistrationOnline,TResult Function( _SetRegistrationOffline value)?  setRegistrationOffline,TResult Function( _SetCallStatuses value)?  setCallStatuses,TResult Function( _SetCallStatusesConnectivityNone value)?  setCallStatusesConnectivityNone,TResult Function( _SetCallStatusesConnectError value)?  setCallStatusesConnectError,TResult Function( _SetCallStatusesAppUnregistered value)?  setCallStatusesAppUnregistered,TResult Function( _SetCallStatusesConnectIssue value)?  setCallStatusesConnectIssue,TResult Function( _SetCallStatusesInProgress value)?  setCallStatusesInProgress,TResult Function( _SetCallStatusesReady value)?  setCallStatusesReady,TResult Function( _ImportJsonWidgetEvent value)?  importJson,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetFonts() when setFonts != null:
return setFonts(_that);case _SetGlobalFontFamily() when setGlobalFontFamily != null:
return setGlobalFontFamily(_that);case _SetButton() when setButton != null:
return setButton(_that);case _SetPrimaryElevatedButton() when setPEButton != null:
return setPEButton(_that);case _SetGroup() when setGroup != null:
return setGroup(_that);case _SetGroupTitleListTile() when setGroupTitleListTile != null:
return setGroupTitleListTile(_that);case _SetGroupTitleListTileBackground() when setGroupTitleListTileBackground != null:
return setGroupTitleListTileBackground(_that);case _SetBar() when setBar != null:
return setBar(_that);case _SetBottomNavBar() when setBottomNavigationBar != null:
return setBottomNavigationBar(_that);case _SetBottomNavBarBackground() when setBottomNavBarBackground != null:
return setBottomNavBarBackground(_that);case _SetBottomNavBarSelected() when setBottomNavBarSelected != null:
return setBottomNavBarSelected(_that);case _SetBottomNavBarUnselected() when setBottomNavBarUnselected != null:
return setBottomNavBarUnselected(_that);case _SetExtTabBar() when setExtTabBar != null:
return setExtTabBar(_that);case _SetTabBarConfig() when setTabBarConfig != null:
return setTabBarConfig(_that);case _SetDefaultPlaceholderImage() when setDefaultPlaceholderImage != null:
return setDefaultPlaceholderImage(_that);case _SetImageAssets() when setImageAssets != null:
return setImageAssets(_that);case _SetAppIcon() when setAppIcon != null:
return setAppIcon(_that);case _SetLeadingAvatarStyle() when setLeadingAvatarStyle != null:
return setLeadingAvatarStyle(_that);case _SetInput() when setInput != null:
return setInput(_that);case _SetTextFormField() when setTextFormField != null:
return setTextFormField(_that);case _SetInputLabelColor() when setInputLabelColor != null:
return setInputLabelColor(_that);case _SetInputBorder() when setInputBorder != null:
return setInputBorder(_that);case _SetInputBorderDisabled() when setInputBorderDisabled != null:
return setInputBorderDisabled(_that);case _SetInputBorderFocused() when setInputBorderFocused != null:
return setInputBorderFocused(_that);case _SetInputBorderAny() when setInputBorderAny != null:
return setInputBorderAny(_that);case _SetText() when setText != null:
return setText(_that);case _SetTextSelection() when setTextSelection != null:
return setTextSelection(_that);case _SetTextCursorColor() when setTextCursorColor != null:
return setTextCursorColor(_that);case _SetTextSelectionColor() when setTextSelectionColor != null:
return setTextSelectionColor(_that);case _SetTextSelectionHandleColor() when setTextSelectionHandleColor != null:
return setTextSelectionHandleColor(_that);case _SetLinkify() when setLinkify != null:
return setLinkify(_that);case _SetLinkifyStyleColor() when setLinkifyStyleColor != null:
return setLinkifyStyleColor(_that);case _SetLinkifyLinkColor() when setLinkifyLinkColor != null:
return setLinkifyLinkColor(_that);case _SetDialog() when setDialog != null:
return setDialog(_that);case _SetConfirmDialog() when setConfirmDialog != null:
return setConfirmDialog(_that);case _SetConfirmDialogActive1() when setConfirmDialogActive1 != null:
return setConfirmDialogActive1(_that);case _SetConfirmDialogActive2() when setConfirmDialogActive2 != null:
return setConfirmDialogActive2(_that);case _SetConfirmDialogDefault() when setConfirmDialogDefault != null:
return setConfirmDialogDefault(_that);case _SetSnackBar() when setSnackBar != null:
return setSnackBar(_that);case _SetStatuses() when setStatuses != null:
return setStatuses(_that);case _SetRegistrationStatuses() when setRegistrationStatuses != null:
return setRegistrationStatuses(_that);case _SetRegistrationOnline() when setRegistrationOnline != null:
return setRegistrationOnline(_that);case _SetRegistrationOffline() when setRegistrationOffline != null:
return setRegistrationOffline(_that);case _SetCallStatuses() when setCallStatuses != null:
return setCallStatuses(_that);case _SetCallStatusesConnectivityNone() when setCallStatusesConnectivityNone != null:
return setCallStatusesConnectivityNone(_that);case _SetCallStatusesConnectError() when setCallStatusesConnectError != null:
return setCallStatusesConnectError(_that);case _SetCallStatusesAppUnregistered() when setCallStatusesAppUnregistered != null:
return setCallStatusesAppUnregistered(_that);case _SetCallStatusesConnectIssue() when setCallStatusesConnectIssue != null:
return setCallStatusesConnectIssue(_that);case _SetCallStatusesInProgress() when setCallStatusesInProgress != null:
return setCallStatusesInProgress(_that);case _SetCallStatusesReady() when setCallStatusesReady != null:
return setCallStatusesReady(_that);case _ImportJsonWidgetEvent() when importJson != null:
return importJson(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SetFonts value)  setFonts,required TResult Function( _SetGlobalFontFamily value)  setGlobalFontFamily,required TResult Function( _SetButton value)  setButton,required TResult Function( _SetPrimaryElevatedButton value)  setPEButton,required TResult Function( _SetGroup value)  setGroup,required TResult Function( _SetGroupTitleListTile value)  setGroupTitleListTile,required TResult Function( _SetGroupTitleListTileBackground value)  setGroupTitleListTileBackground,required TResult Function( _SetBar value)  setBar,required TResult Function( _SetBottomNavBar value)  setBottomNavigationBar,required TResult Function( _SetBottomNavBarBackground value)  setBottomNavBarBackground,required TResult Function( _SetBottomNavBarSelected value)  setBottomNavBarSelected,required TResult Function( _SetBottomNavBarUnselected value)  setBottomNavBarUnselected,required TResult Function( _SetExtTabBar value)  setExtTabBar,required TResult Function( _SetTabBarConfig value)  setTabBarConfig,required TResult Function( _SetDefaultPlaceholderImage value)  setDefaultPlaceholderImage,required TResult Function( _SetImageAssets value)  setImageAssets,required TResult Function( _SetAppIcon value)  setAppIcon,required TResult Function( _SetLeadingAvatarStyle value)  setLeadingAvatarStyle,required TResult Function( _SetInput value)  setInput,required TResult Function( _SetTextFormField value)  setTextFormField,required TResult Function( _SetInputLabelColor value)  setInputLabelColor,required TResult Function( _SetInputBorder value)  setInputBorder,required TResult Function( _SetInputBorderDisabled value)  setInputBorderDisabled,required TResult Function( _SetInputBorderFocused value)  setInputBorderFocused,required TResult Function( _SetInputBorderAny value)  setInputBorderAny,required TResult Function( _SetText value)  setText,required TResult Function( _SetTextSelection value)  setTextSelection,required TResult Function( _SetTextCursorColor value)  setTextCursorColor,required TResult Function( _SetTextSelectionColor value)  setTextSelectionColor,required TResult Function( _SetTextSelectionHandleColor value)  setTextSelectionHandleColor,required TResult Function( _SetLinkify value)  setLinkify,required TResult Function( _SetLinkifyStyleColor value)  setLinkifyStyleColor,required TResult Function( _SetLinkifyLinkColor value)  setLinkifyLinkColor,required TResult Function( _SetDialog value)  setDialog,required TResult Function( _SetConfirmDialog value)  setConfirmDialog,required TResult Function( _SetConfirmDialogActive1 value)  setConfirmDialogActive1,required TResult Function( _SetConfirmDialogActive2 value)  setConfirmDialogActive2,required TResult Function( _SetConfirmDialogDefault value)  setConfirmDialogDefault,required TResult Function( _SetSnackBar value)  setSnackBar,required TResult Function( _SetStatuses value)  setStatuses,required TResult Function( _SetRegistrationStatuses value)  setRegistrationStatuses,required TResult Function( _SetRegistrationOnline value)  setRegistrationOnline,required TResult Function( _SetRegistrationOffline value)  setRegistrationOffline,required TResult Function( _SetCallStatuses value)  setCallStatuses,required TResult Function( _SetCallStatusesConnectivityNone value)  setCallStatusesConnectivityNone,required TResult Function( _SetCallStatusesConnectError value)  setCallStatusesConnectError,required TResult Function( _SetCallStatusesAppUnregistered value)  setCallStatusesAppUnregistered,required TResult Function( _SetCallStatusesConnectIssue value)  setCallStatusesConnectIssue,required TResult Function( _SetCallStatusesInProgress value)  setCallStatusesInProgress,required TResult Function( _SetCallStatusesReady value)  setCallStatusesReady,required TResult Function( _ImportJsonWidgetEvent value)  importJson,}){
final _that = this;
switch (_that) {
case _SetFonts():
return setFonts(_that);case _SetGlobalFontFamily():
return setGlobalFontFamily(_that);case _SetButton():
return setButton(_that);case _SetPrimaryElevatedButton():
return setPEButton(_that);case _SetGroup():
return setGroup(_that);case _SetGroupTitleListTile():
return setGroupTitleListTile(_that);case _SetGroupTitleListTileBackground():
return setGroupTitleListTileBackground(_that);case _SetBar():
return setBar(_that);case _SetBottomNavBar():
return setBottomNavigationBar(_that);case _SetBottomNavBarBackground():
return setBottomNavBarBackground(_that);case _SetBottomNavBarSelected():
return setBottomNavBarSelected(_that);case _SetBottomNavBarUnselected():
return setBottomNavBarUnselected(_that);case _SetExtTabBar():
return setExtTabBar(_that);case _SetTabBarConfig():
return setTabBarConfig(_that);case _SetDefaultPlaceholderImage():
return setDefaultPlaceholderImage(_that);case _SetImageAssets():
return setImageAssets(_that);case _SetAppIcon():
return setAppIcon(_that);case _SetLeadingAvatarStyle():
return setLeadingAvatarStyle(_that);case _SetInput():
return setInput(_that);case _SetTextFormField():
return setTextFormField(_that);case _SetInputLabelColor():
return setInputLabelColor(_that);case _SetInputBorder():
return setInputBorder(_that);case _SetInputBorderDisabled():
return setInputBorderDisabled(_that);case _SetInputBorderFocused():
return setInputBorderFocused(_that);case _SetInputBorderAny():
return setInputBorderAny(_that);case _SetText():
return setText(_that);case _SetTextSelection():
return setTextSelection(_that);case _SetTextCursorColor():
return setTextCursorColor(_that);case _SetTextSelectionColor():
return setTextSelectionColor(_that);case _SetTextSelectionHandleColor():
return setTextSelectionHandleColor(_that);case _SetLinkify():
return setLinkify(_that);case _SetLinkifyStyleColor():
return setLinkifyStyleColor(_that);case _SetLinkifyLinkColor():
return setLinkifyLinkColor(_that);case _SetDialog():
return setDialog(_that);case _SetConfirmDialog():
return setConfirmDialog(_that);case _SetConfirmDialogActive1():
return setConfirmDialogActive1(_that);case _SetConfirmDialogActive2():
return setConfirmDialogActive2(_that);case _SetConfirmDialogDefault():
return setConfirmDialogDefault(_that);case _SetSnackBar():
return setSnackBar(_that);case _SetStatuses():
return setStatuses(_that);case _SetRegistrationStatuses():
return setRegistrationStatuses(_that);case _SetRegistrationOnline():
return setRegistrationOnline(_that);case _SetRegistrationOffline():
return setRegistrationOffline(_that);case _SetCallStatuses():
return setCallStatuses(_that);case _SetCallStatusesConnectivityNone():
return setCallStatusesConnectivityNone(_that);case _SetCallStatusesConnectError():
return setCallStatusesConnectError(_that);case _SetCallStatusesAppUnregistered():
return setCallStatusesAppUnregistered(_that);case _SetCallStatusesConnectIssue():
return setCallStatusesConnectIssue(_that);case _SetCallStatusesInProgress():
return setCallStatusesInProgress(_that);case _SetCallStatusesReady():
return setCallStatusesReady(_that);case _ImportJsonWidgetEvent():
return importJson(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SetFonts value)?  setFonts,TResult? Function( _SetGlobalFontFamily value)?  setGlobalFontFamily,TResult? Function( _SetButton value)?  setButton,TResult? Function( _SetPrimaryElevatedButton value)?  setPEButton,TResult? Function( _SetGroup value)?  setGroup,TResult? Function( _SetGroupTitleListTile value)?  setGroupTitleListTile,TResult? Function( _SetGroupTitleListTileBackground value)?  setGroupTitleListTileBackground,TResult? Function( _SetBar value)?  setBar,TResult? Function( _SetBottomNavBar value)?  setBottomNavigationBar,TResult? Function( _SetBottomNavBarBackground value)?  setBottomNavBarBackground,TResult? Function( _SetBottomNavBarSelected value)?  setBottomNavBarSelected,TResult? Function( _SetBottomNavBarUnselected value)?  setBottomNavBarUnselected,TResult? Function( _SetExtTabBar value)?  setExtTabBar,TResult? Function( _SetTabBarConfig value)?  setTabBarConfig,TResult? Function( _SetDefaultPlaceholderImage value)?  setDefaultPlaceholderImage,TResult? Function( _SetImageAssets value)?  setImageAssets,TResult? Function( _SetAppIcon value)?  setAppIcon,TResult? Function( _SetLeadingAvatarStyle value)?  setLeadingAvatarStyle,TResult? Function( _SetInput value)?  setInput,TResult? Function( _SetTextFormField value)?  setTextFormField,TResult? Function( _SetInputLabelColor value)?  setInputLabelColor,TResult? Function( _SetInputBorder value)?  setInputBorder,TResult? Function( _SetInputBorderDisabled value)?  setInputBorderDisabled,TResult? Function( _SetInputBorderFocused value)?  setInputBorderFocused,TResult? Function( _SetInputBorderAny value)?  setInputBorderAny,TResult? Function( _SetText value)?  setText,TResult? Function( _SetTextSelection value)?  setTextSelection,TResult? Function( _SetTextCursorColor value)?  setTextCursorColor,TResult? Function( _SetTextSelectionColor value)?  setTextSelectionColor,TResult? Function( _SetTextSelectionHandleColor value)?  setTextSelectionHandleColor,TResult? Function( _SetLinkify value)?  setLinkify,TResult? Function( _SetLinkifyStyleColor value)?  setLinkifyStyleColor,TResult? Function( _SetLinkifyLinkColor value)?  setLinkifyLinkColor,TResult? Function( _SetDialog value)?  setDialog,TResult? Function( _SetConfirmDialog value)?  setConfirmDialog,TResult? Function( _SetConfirmDialogActive1 value)?  setConfirmDialogActive1,TResult? Function( _SetConfirmDialogActive2 value)?  setConfirmDialogActive2,TResult? Function( _SetConfirmDialogDefault value)?  setConfirmDialogDefault,TResult? Function( _SetSnackBar value)?  setSnackBar,TResult? Function( _SetStatuses value)?  setStatuses,TResult? Function( _SetRegistrationStatuses value)?  setRegistrationStatuses,TResult? Function( _SetRegistrationOnline value)?  setRegistrationOnline,TResult? Function( _SetRegistrationOffline value)?  setRegistrationOffline,TResult? Function( _SetCallStatuses value)?  setCallStatuses,TResult? Function( _SetCallStatusesConnectivityNone value)?  setCallStatusesConnectivityNone,TResult? Function( _SetCallStatusesConnectError value)?  setCallStatusesConnectError,TResult? Function( _SetCallStatusesAppUnregistered value)?  setCallStatusesAppUnregistered,TResult? Function( _SetCallStatusesConnectIssue value)?  setCallStatusesConnectIssue,TResult? Function( _SetCallStatusesInProgress value)?  setCallStatusesInProgress,TResult? Function( _SetCallStatusesReady value)?  setCallStatusesReady,TResult? Function( _ImportJsonWidgetEvent value)?  importJson,}){
final _that = this;
switch (_that) {
case _SetFonts() when setFonts != null:
return setFonts(_that);case _SetGlobalFontFamily() when setGlobalFontFamily != null:
return setGlobalFontFamily(_that);case _SetButton() when setButton != null:
return setButton(_that);case _SetPrimaryElevatedButton() when setPEButton != null:
return setPEButton(_that);case _SetGroup() when setGroup != null:
return setGroup(_that);case _SetGroupTitleListTile() when setGroupTitleListTile != null:
return setGroupTitleListTile(_that);case _SetGroupTitleListTileBackground() when setGroupTitleListTileBackground != null:
return setGroupTitleListTileBackground(_that);case _SetBar() when setBar != null:
return setBar(_that);case _SetBottomNavBar() when setBottomNavigationBar != null:
return setBottomNavigationBar(_that);case _SetBottomNavBarBackground() when setBottomNavBarBackground != null:
return setBottomNavBarBackground(_that);case _SetBottomNavBarSelected() when setBottomNavBarSelected != null:
return setBottomNavBarSelected(_that);case _SetBottomNavBarUnselected() when setBottomNavBarUnselected != null:
return setBottomNavBarUnselected(_that);case _SetExtTabBar() when setExtTabBar != null:
return setExtTabBar(_that);case _SetTabBarConfig() when setTabBarConfig != null:
return setTabBarConfig(_that);case _SetDefaultPlaceholderImage() when setDefaultPlaceholderImage != null:
return setDefaultPlaceholderImage(_that);case _SetImageAssets() when setImageAssets != null:
return setImageAssets(_that);case _SetAppIcon() when setAppIcon != null:
return setAppIcon(_that);case _SetLeadingAvatarStyle() when setLeadingAvatarStyle != null:
return setLeadingAvatarStyle(_that);case _SetInput() when setInput != null:
return setInput(_that);case _SetTextFormField() when setTextFormField != null:
return setTextFormField(_that);case _SetInputLabelColor() when setInputLabelColor != null:
return setInputLabelColor(_that);case _SetInputBorder() when setInputBorder != null:
return setInputBorder(_that);case _SetInputBorderDisabled() when setInputBorderDisabled != null:
return setInputBorderDisabled(_that);case _SetInputBorderFocused() when setInputBorderFocused != null:
return setInputBorderFocused(_that);case _SetInputBorderAny() when setInputBorderAny != null:
return setInputBorderAny(_that);case _SetText() when setText != null:
return setText(_that);case _SetTextSelection() when setTextSelection != null:
return setTextSelection(_that);case _SetTextCursorColor() when setTextCursorColor != null:
return setTextCursorColor(_that);case _SetTextSelectionColor() when setTextSelectionColor != null:
return setTextSelectionColor(_that);case _SetTextSelectionHandleColor() when setTextSelectionHandleColor != null:
return setTextSelectionHandleColor(_that);case _SetLinkify() when setLinkify != null:
return setLinkify(_that);case _SetLinkifyStyleColor() when setLinkifyStyleColor != null:
return setLinkifyStyleColor(_that);case _SetLinkifyLinkColor() when setLinkifyLinkColor != null:
return setLinkifyLinkColor(_that);case _SetDialog() when setDialog != null:
return setDialog(_that);case _SetConfirmDialog() when setConfirmDialog != null:
return setConfirmDialog(_that);case _SetConfirmDialogActive1() when setConfirmDialogActive1 != null:
return setConfirmDialogActive1(_that);case _SetConfirmDialogActive2() when setConfirmDialogActive2 != null:
return setConfirmDialogActive2(_that);case _SetConfirmDialogDefault() when setConfirmDialogDefault != null:
return setConfirmDialogDefault(_that);case _SetSnackBar() when setSnackBar != null:
return setSnackBar(_that);case _SetStatuses() when setStatuses != null:
return setStatuses(_that);case _SetRegistrationStatuses() when setRegistrationStatuses != null:
return setRegistrationStatuses(_that);case _SetRegistrationOnline() when setRegistrationOnline != null:
return setRegistrationOnline(_that);case _SetRegistrationOffline() when setRegistrationOffline != null:
return setRegistrationOffline(_that);case _SetCallStatuses() when setCallStatuses != null:
return setCallStatuses(_that);case _SetCallStatusesConnectivityNone() when setCallStatusesConnectivityNone != null:
return setCallStatusesConnectivityNone(_that);case _SetCallStatusesConnectError() when setCallStatusesConnectError != null:
return setCallStatusesConnectError(_that);case _SetCallStatusesAppUnregistered() when setCallStatusesAppUnregistered != null:
return setCallStatusesAppUnregistered(_that);case _SetCallStatusesConnectIssue() when setCallStatusesConnectIssue != null:
return setCallStatusesConnectIssue(_that);case _SetCallStatusesInProgress() when setCallStatusesInProgress != null:
return setCallStatusesInProgress(_that);case _SetCallStatusesReady() when setCallStatusesReady != null:
return setCallStatusesReady(_that);case _ImportJsonWidgetEvent() when importJson != null:
return importJson(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( FontsConfig fonts)?  setFonts,TResult Function( String? fontFamily)?  setGlobalFontFamily,TResult Function( ButtonWidgetConfig button)?  setButton,TResult Function( ButtonStyleConfig? cfg)?  setPEButton,TResult Function( GroupWidgetConfig group)?  setGroup,TResult Function( GroupTitleListTileWidgetConfig cfg)?  setGroupTitleListTile,TResult Function( String? color)?  setGroupTitleListTileBackground,TResult Function( BarWidgetConfig bar)?  setBar,TResult Function( BottomNavigationBarWidgetConfig cfg)?  setBottomNavigationBar,TResult Function( String? color)?  setBottomNavBarBackground,TResult Function( String? color)?  setBottomNavBarSelected,TResult Function( String? color)?  setBottomNavBarUnselected,TResult Function( AppBarConfig cfg)?  setExtTabBar,TResult Function( TabBarConfig cfg)?  setTabBarConfig,TResult Function( ImageSource imageSource)?  setDefaultPlaceholderImage,TResult Function( ImageAssetsConfig cfg)?  setImageAssets,TResult Function( AppIconWidgetConfig cfg)?  setAppIcon,TResult Function( LeadingAvatarStyleConfig cfg)?  setLeadingAvatarStyle,TResult Function( InputWidgetConfig cfg)?  setInput,TResult Function( TextFormFieldWidgetConfig cfg)?  setTextFormField,TResult Function( String? color)?  setInputLabelColor,TResult Function( InputBorderWidgetConfig cfg)?  setInputBorder,TResult Function( BorderWidgetConfig cfg)?  setInputBorderDisabled,TResult Function( BorderWidgetConfig cfg)?  setInputBorderFocused,TResult Function( BorderWidgetConfig cfg)?  setInputBorderAny,TResult Function( TextWidgetConfig cfg)?  setText,TResult Function( TextSelectionWidgetConfig cfg)?  setTextSelection,TResult Function( String? color)?  setTextCursorColor,TResult Function( String? color)?  setTextSelectionColor,TResult Function( String? color)?  setTextSelectionHandleColor,TResult Function( LinkifyWidgetConfig cfg)?  setLinkify,TResult Function( String? color)?  setLinkifyStyleColor,TResult Function( String? color)?  setLinkifyLinkColor,TResult Function( DialogWidgetConfig cfg)?  setDialog,TResult Function( ConfirmDialogWidgetConfig cfg)?  setConfirmDialog,TResult Function( String? color)?  setConfirmDialogActive1,TResult Function( String? color)?  setConfirmDialogActive2,TResult Function( String? color)?  setConfirmDialogDefault,TResult Function( SnackBarWidgetConfig cfg)?  setSnackBar,TResult Function( StatusesWidgetConfig cfg)?  setStatuses,TResult Function( RegistrationStatusesWidgetConfig cfg)?  setRegistrationStatuses,TResult Function( String color)?  setRegistrationOnline,TResult Function( String color)?  setRegistrationOffline,TResult Function( CallStatusesWidgetConfig cfg)?  setCallStatuses,TResult Function( String color)?  setCallStatusesConnectivityNone,TResult Function( String color)?  setCallStatusesConnectError,TResult Function( String color)?  setCallStatusesAppUnregistered,TResult Function( String color)?  setCallStatusesConnectIssue,TResult Function( String color)?  setCallStatusesInProgress,TResult Function( String color)?  setCallStatusesReady,TResult Function( Map<String, dynamic> json)?  importJson,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetFonts() when setFonts != null:
return setFonts(_that.fonts);case _SetGlobalFontFamily() when setGlobalFontFamily != null:
return setGlobalFontFamily(_that.fontFamily);case _SetButton() when setButton != null:
return setButton(_that.button);case _SetPrimaryElevatedButton() when setPEButton != null:
return setPEButton(_that.cfg);case _SetGroup() when setGroup != null:
return setGroup(_that.group);case _SetGroupTitleListTile() when setGroupTitleListTile != null:
return setGroupTitleListTile(_that.cfg);case _SetGroupTitleListTileBackground() when setGroupTitleListTileBackground != null:
return setGroupTitleListTileBackground(_that.color);case _SetBar() when setBar != null:
return setBar(_that.bar);case _SetBottomNavBar() when setBottomNavigationBar != null:
return setBottomNavigationBar(_that.cfg);case _SetBottomNavBarBackground() when setBottomNavBarBackground != null:
return setBottomNavBarBackground(_that.color);case _SetBottomNavBarSelected() when setBottomNavBarSelected != null:
return setBottomNavBarSelected(_that.color);case _SetBottomNavBarUnselected() when setBottomNavBarUnselected != null:
return setBottomNavBarUnselected(_that.color);case _SetExtTabBar() when setExtTabBar != null:
return setExtTabBar(_that.cfg);case _SetTabBarConfig() when setTabBarConfig != null:
return setTabBarConfig(_that.cfg);case _SetDefaultPlaceholderImage() when setDefaultPlaceholderImage != null:
return setDefaultPlaceholderImage(_that.imageSource);case _SetImageAssets() when setImageAssets != null:
return setImageAssets(_that.cfg);case _SetAppIcon() when setAppIcon != null:
return setAppIcon(_that.cfg);case _SetLeadingAvatarStyle() when setLeadingAvatarStyle != null:
return setLeadingAvatarStyle(_that.cfg);case _SetInput() when setInput != null:
return setInput(_that.cfg);case _SetTextFormField() when setTextFormField != null:
return setTextFormField(_that.cfg);case _SetInputLabelColor() when setInputLabelColor != null:
return setInputLabelColor(_that.color);case _SetInputBorder() when setInputBorder != null:
return setInputBorder(_that.cfg);case _SetInputBorderDisabled() when setInputBorderDisabled != null:
return setInputBorderDisabled(_that.cfg);case _SetInputBorderFocused() when setInputBorderFocused != null:
return setInputBorderFocused(_that.cfg);case _SetInputBorderAny() when setInputBorderAny != null:
return setInputBorderAny(_that.cfg);case _SetText() when setText != null:
return setText(_that.cfg);case _SetTextSelection() when setTextSelection != null:
return setTextSelection(_that.cfg);case _SetTextCursorColor() when setTextCursorColor != null:
return setTextCursorColor(_that.color);case _SetTextSelectionColor() when setTextSelectionColor != null:
return setTextSelectionColor(_that.color);case _SetTextSelectionHandleColor() when setTextSelectionHandleColor != null:
return setTextSelectionHandleColor(_that.color);case _SetLinkify() when setLinkify != null:
return setLinkify(_that.cfg);case _SetLinkifyStyleColor() when setLinkifyStyleColor != null:
return setLinkifyStyleColor(_that.color);case _SetLinkifyLinkColor() when setLinkifyLinkColor != null:
return setLinkifyLinkColor(_that.color);case _SetDialog() when setDialog != null:
return setDialog(_that.cfg);case _SetConfirmDialog() when setConfirmDialog != null:
return setConfirmDialog(_that.cfg);case _SetConfirmDialogActive1() when setConfirmDialogActive1 != null:
return setConfirmDialogActive1(_that.color);case _SetConfirmDialogActive2() when setConfirmDialogActive2 != null:
return setConfirmDialogActive2(_that.color);case _SetConfirmDialogDefault() when setConfirmDialogDefault != null:
return setConfirmDialogDefault(_that.color);case _SetSnackBar() when setSnackBar != null:
return setSnackBar(_that.cfg);case _SetStatuses() when setStatuses != null:
return setStatuses(_that.cfg);case _SetRegistrationStatuses() when setRegistrationStatuses != null:
return setRegistrationStatuses(_that.cfg);case _SetRegistrationOnline() when setRegistrationOnline != null:
return setRegistrationOnline(_that.color);case _SetRegistrationOffline() when setRegistrationOffline != null:
return setRegistrationOffline(_that.color);case _SetCallStatuses() when setCallStatuses != null:
return setCallStatuses(_that.cfg);case _SetCallStatusesConnectivityNone() when setCallStatusesConnectivityNone != null:
return setCallStatusesConnectivityNone(_that.color);case _SetCallStatusesConnectError() when setCallStatusesConnectError != null:
return setCallStatusesConnectError(_that.color);case _SetCallStatusesAppUnregistered() when setCallStatusesAppUnregistered != null:
return setCallStatusesAppUnregistered(_that.color);case _SetCallStatusesConnectIssue() when setCallStatusesConnectIssue != null:
return setCallStatusesConnectIssue(_that.color);case _SetCallStatusesInProgress() when setCallStatusesInProgress != null:
return setCallStatusesInProgress(_that.color);case _SetCallStatusesReady() when setCallStatusesReady != null:
return setCallStatusesReady(_that.color);case _ImportJsonWidgetEvent() when importJson != null:
return importJson(_that.json);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( FontsConfig fonts)  setFonts,required TResult Function( String? fontFamily)  setGlobalFontFamily,required TResult Function( ButtonWidgetConfig button)  setButton,required TResult Function( ButtonStyleConfig? cfg)  setPEButton,required TResult Function( GroupWidgetConfig group)  setGroup,required TResult Function( GroupTitleListTileWidgetConfig cfg)  setGroupTitleListTile,required TResult Function( String? color)  setGroupTitleListTileBackground,required TResult Function( BarWidgetConfig bar)  setBar,required TResult Function( BottomNavigationBarWidgetConfig cfg)  setBottomNavigationBar,required TResult Function( String? color)  setBottomNavBarBackground,required TResult Function( String? color)  setBottomNavBarSelected,required TResult Function( String? color)  setBottomNavBarUnselected,required TResult Function( AppBarConfig cfg)  setExtTabBar,required TResult Function( TabBarConfig cfg)  setTabBarConfig,required TResult Function( ImageSource imageSource)  setDefaultPlaceholderImage,required TResult Function( ImageAssetsConfig cfg)  setImageAssets,required TResult Function( AppIconWidgetConfig cfg)  setAppIcon,required TResult Function( LeadingAvatarStyleConfig cfg)  setLeadingAvatarStyle,required TResult Function( InputWidgetConfig cfg)  setInput,required TResult Function( TextFormFieldWidgetConfig cfg)  setTextFormField,required TResult Function( String? color)  setInputLabelColor,required TResult Function( InputBorderWidgetConfig cfg)  setInputBorder,required TResult Function( BorderWidgetConfig cfg)  setInputBorderDisabled,required TResult Function( BorderWidgetConfig cfg)  setInputBorderFocused,required TResult Function( BorderWidgetConfig cfg)  setInputBorderAny,required TResult Function( TextWidgetConfig cfg)  setText,required TResult Function( TextSelectionWidgetConfig cfg)  setTextSelection,required TResult Function( String? color)  setTextCursorColor,required TResult Function( String? color)  setTextSelectionColor,required TResult Function( String? color)  setTextSelectionHandleColor,required TResult Function( LinkifyWidgetConfig cfg)  setLinkify,required TResult Function( String? color)  setLinkifyStyleColor,required TResult Function( String? color)  setLinkifyLinkColor,required TResult Function( DialogWidgetConfig cfg)  setDialog,required TResult Function( ConfirmDialogWidgetConfig cfg)  setConfirmDialog,required TResult Function( String? color)  setConfirmDialogActive1,required TResult Function( String? color)  setConfirmDialogActive2,required TResult Function( String? color)  setConfirmDialogDefault,required TResult Function( SnackBarWidgetConfig cfg)  setSnackBar,required TResult Function( StatusesWidgetConfig cfg)  setStatuses,required TResult Function( RegistrationStatusesWidgetConfig cfg)  setRegistrationStatuses,required TResult Function( String color)  setRegistrationOnline,required TResult Function( String color)  setRegistrationOffline,required TResult Function( CallStatusesWidgetConfig cfg)  setCallStatuses,required TResult Function( String color)  setCallStatusesConnectivityNone,required TResult Function( String color)  setCallStatusesConnectError,required TResult Function( String color)  setCallStatusesAppUnregistered,required TResult Function( String color)  setCallStatusesConnectIssue,required TResult Function( String color)  setCallStatusesInProgress,required TResult Function( String color)  setCallStatusesReady,required TResult Function( Map<String, dynamic> json)  importJson,}) {final _that = this;
switch (_that) {
case _SetFonts():
return setFonts(_that.fonts);case _SetGlobalFontFamily():
return setGlobalFontFamily(_that.fontFamily);case _SetButton():
return setButton(_that.button);case _SetPrimaryElevatedButton():
return setPEButton(_that.cfg);case _SetGroup():
return setGroup(_that.group);case _SetGroupTitleListTile():
return setGroupTitleListTile(_that.cfg);case _SetGroupTitleListTileBackground():
return setGroupTitleListTileBackground(_that.color);case _SetBar():
return setBar(_that.bar);case _SetBottomNavBar():
return setBottomNavigationBar(_that.cfg);case _SetBottomNavBarBackground():
return setBottomNavBarBackground(_that.color);case _SetBottomNavBarSelected():
return setBottomNavBarSelected(_that.color);case _SetBottomNavBarUnselected():
return setBottomNavBarUnselected(_that.color);case _SetExtTabBar():
return setExtTabBar(_that.cfg);case _SetTabBarConfig():
return setTabBarConfig(_that.cfg);case _SetDefaultPlaceholderImage():
return setDefaultPlaceholderImage(_that.imageSource);case _SetImageAssets():
return setImageAssets(_that.cfg);case _SetAppIcon():
return setAppIcon(_that.cfg);case _SetLeadingAvatarStyle():
return setLeadingAvatarStyle(_that.cfg);case _SetInput():
return setInput(_that.cfg);case _SetTextFormField():
return setTextFormField(_that.cfg);case _SetInputLabelColor():
return setInputLabelColor(_that.color);case _SetInputBorder():
return setInputBorder(_that.cfg);case _SetInputBorderDisabled():
return setInputBorderDisabled(_that.cfg);case _SetInputBorderFocused():
return setInputBorderFocused(_that.cfg);case _SetInputBorderAny():
return setInputBorderAny(_that.cfg);case _SetText():
return setText(_that.cfg);case _SetTextSelection():
return setTextSelection(_that.cfg);case _SetTextCursorColor():
return setTextCursorColor(_that.color);case _SetTextSelectionColor():
return setTextSelectionColor(_that.color);case _SetTextSelectionHandleColor():
return setTextSelectionHandleColor(_that.color);case _SetLinkify():
return setLinkify(_that.cfg);case _SetLinkifyStyleColor():
return setLinkifyStyleColor(_that.color);case _SetLinkifyLinkColor():
return setLinkifyLinkColor(_that.color);case _SetDialog():
return setDialog(_that.cfg);case _SetConfirmDialog():
return setConfirmDialog(_that.cfg);case _SetConfirmDialogActive1():
return setConfirmDialogActive1(_that.color);case _SetConfirmDialogActive2():
return setConfirmDialogActive2(_that.color);case _SetConfirmDialogDefault():
return setConfirmDialogDefault(_that.color);case _SetSnackBar():
return setSnackBar(_that.cfg);case _SetStatuses():
return setStatuses(_that.cfg);case _SetRegistrationStatuses():
return setRegistrationStatuses(_that.cfg);case _SetRegistrationOnline():
return setRegistrationOnline(_that.color);case _SetRegistrationOffline():
return setRegistrationOffline(_that.color);case _SetCallStatuses():
return setCallStatuses(_that.cfg);case _SetCallStatusesConnectivityNone():
return setCallStatusesConnectivityNone(_that.color);case _SetCallStatusesConnectError():
return setCallStatusesConnectError(_that.color);case _SetCallStatusesAppUnregistered():
return setCallStatusesAppUnregistered(_that.color);case _SetCallStatusesConnectIssue():
return setCallStatusesConnectIssue(_that.color);case _SetCallStatusesInProgress():
return setCallStatusesInProgress(_that.color);case _SetCallStatusesReady():
return setCallStatusesReady(_that.color);case _ImportJsonWidgetEvent():
return importJson(_that.json);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( FontsConfig fonts)?  setFonts,TResult? Function( String? fontFamily)?  setGlobalFontFamily,TResult? Function( ButtonWidgetConfig button)?  setButton,TResult? Function( ButtonStyleConfig? cfg)?  setPEButton,TResult? Function( GroupWidgetConfig group)?  setGroup,TResult? Function( GroupTitleListTileWidgetConfig cfg)?  setGroupTitleListTile,TResult? Function( String? color)?  setGroupTitleListTileBackground,TResult? Function( BarWidgetConfig bar)?  setBar,TResult? Function( BottomNavigationBarWidgetConfig cfg)?  setBottomNavigationBar,TResult? Function( String? color)?  setBottomNavBarBackground,TResult? Function( String? color)?  setBottomNavBarSelected,TResult? Function( String? color)?  setBottomNavBarUnselected,TResult? Function( AppBarConfig cfg)?  setExtTabBar,TResult? Function( TabBarConfig cfg)?  setTabBarConfig,TResult? Function( ImageSource imageSource)?  setDefaultPlaceholderImage,TResult? Function( ImageAssetsConfig cfg)?  setImageAssets,TResult? Function( AppIconWidgetConfig cfg)?  setAppIcon,TResult? Function( LeadingAvatarStyleConfig cfg)?  setLeadingAvatarStyle,TResult? Function( InputWidgetConfig cfg)?  setInput,TResult? Function( TextFormFieldWidgetConfig cfg)?  setTextFormField,TResult? Function( String? color)?  setInputLabelColor,TResult? Function( InputBorderWidgetConfig cfg)?  setInputBorder,TResult? Function( BorderWidgetConfig cfg)?  setInputBorderDisabled,TResult? Function( BorderWidgetConfig cfg)?  setInputBorderFocused,TResult? Function( BorderWidgetConfig cfg)?  setInputBorderAny,TResult? Function( TextWidgetConfig cfg)?  setText,TResult? Function( TextSelectionWidgetConfig cfg)?  setTextSelection,TResult? Function( String? color)?  setTextCursorColor,TResult? Function( String? color)?  setTextSelectionColor,TResult? Function( String? color)?  setTextSelectionHandleColor,TResult? Function( LinkifyWidgetConfig cfg)?  setLinkify,TResult? Function( String? color)?  setLinkifyStyleColor,TResult? Function( String? color)?  setLinkifyLinkColor,TResult? Function( DialogWidgetConfig cfg)?  setDialog,TResult? Function( ConfirmDialogWidgetConfig cfg)?  setConfirmDialog,TResult? Function( String? color)?  setConfirmDialogActive1,TResult? Function( String? color)?  setConfirmDialogActive2,TResult? Function( String? color)?  setConfirmDialogDefault,TResult? Function( SnackBarWidgetConfig cfg)?  setSnackBar,TResult? Function( StatusesWidgetConfig cfg)?  setStatuses,TResult? Function( RegistrationStatusesWidgetConfig cfg)?  setRegistrationStatuses,TResult? Function( String color)?  setRegistrationOnline,TResult? Function( String color)?  setRegistrationOffline,TResult? Function( CallStatusesWidgetConfig cfg)?  setCallStatuses,TResult? Function( String color)?  setCallStatusesConnectivityNone,TResult? Function( String color)?  setCallStatusesConnectError,TResult? Function( String color)?  setCallStatusesAppUnregistered,TResult? Function( String color)?  setCallStatusesConnectIssue,TResult? Function( String color)?  setCallStatusesInProgress,TResult? Function( String color)?  setCallStatusesReady,TResult? Function( Map<String, dynamic> json)?  importJson,}) {final _that = this;
switch (_that) {
case _SetFonts() when setFonts != null:
return setFonts(_that.fonts);case _SetGlobalFontFamily() when setGlobalFontFamily != null:
return setGlobalFontFamily(_that.fontFamily);case _SetButton() when setButton != null:
return setButton(_that.button);case _SetPrimaryElevatedButton() when setPEButton != null:
return setPEButton(_that.cfg);case _SetGroup() when setGroup != null:
return setGroup(_that.group);case _SetGroupTitleListTile() when setGroupTitleListTile != null:
return setGroupTitleListTile(_that.cfg);case _SetGroupTitleListTileBackground() when setGroupTitleListTileBackground != null:
return setGroupTitleListTileBackground(_that.color);case _SetBar() when setBar != null:
return setBar(_that.bar);case _SetBottomNavBar() when setBottomNavigationBar != null:
return setBottomNavigationBar(_that.cfg);case _SetBottomNavBarBackground() when setBottomNavBarBackground != null:
return setBottomNavBarBackground(_that.color);case _SetBottomNavBarSelected() when setBottomNavBarSelected != null:
return setBottomNavBarSelected(_that.color);case _SetBottomNavBarUnselected() when setBottomNavBarUnselected != null:
return setBottomNavBarUnselected(_that.color);case _SetExtTabBar() when setExtTabBar != null:
return setExtTabBar(_that.cfg);case _SetTabBarConfig() when setTabBarConfig != null:
return setTabBarConfig(_that.cfg);case _SetDefaultPlaceholderImage() when setDefaultPlaceholderImage != null:
return setDefaultPlaceholderImage(_that.imageSource);case _SetImageAssets() when setImageAssets != null:
return setImageAssets(_that.cfg);case _SetAppIcon() when setAppIcon != null:
return setAppIcon(_that.cfg);case _SetLeadingAvatarStyle() when setLeadingAvatarStyle != null:
return setLeadingAvatarStyle(_that.cfg);case _SetInput() when setInput != null:
return setInput(_that.cfg);case _SetTextFormField() when setTextFormField != null:
return setTextFormField(_that.cfg);case _SetInputLabelColor() when setInputLabelColor != null:
return setInputLabelColor(_that.color);case _SetInputBorder() when setInputBorder != null:
return setInputBorder(_that.cfg);case _SetInputBorderDisabled() when setInputBorderDisabled != null:
return setInputBorderDisabled(_that.cfg);case _SetInputBorderFocused() when setInputBorderFocused != null:
return setInputBorderFocused(_that.cfg);case _SetInputBorderAny() when setInputBorderAny != null:
return setInputBorderAny(_that.cfg);case _SetText() when setText != null:
return setText(_that.cfg);case _SetTextSelection() when setTextSelection != null:
return setTextSelection(_that.cfg);case _SetTextCursorColor() when setTextCursorColor != null:
return setTextCursorColor(_that.color);case _SetTextSelectionColor() when setTextSelectionColor != null:
return setTextSelectionColor(_that.color);case _SetTextSelectionHandleColor() when setTextSelectionHandleColor != null:
return setTextSelectionHandleColor(_that.color);case _SetLinkify() when setLinkify != null:
return setLinkify(_that.cfg);case _SetLinkifyStyleColor() when setLinkifyStyleColor != null:
return setLinkifyStyleColor(_that.color);case _SetLinkifyLinkColor() when setLinkifyLinkColor != null:
return setLinkifyLinkColor(_that.color);case _SetDialog() when setDialog != null:
return setDialog(_that.cfg);case _SetConfirmDialog() when setConfirmDialog != null:
return setConfirmDialog(_that.cfg);case _SetConfirmDialogActive1() when setConfirmDialogActive1 != null:
return setConfirmDialogActive1(_that.color);case _SetConfirmDialogActive2() when setConfirmDialogActive2 != null:
return setConfirmDialogActive2(_that.color);case _SetConfirmDialogDefault() when setConfirmDialogDefault != null:
return setConfirmDialogDefault(_that.color);case _SetSnackBar() when setSnackBar != null:
return setSnackBar(_that.cfg);case _SetStatuses() when setStatuses != null:
return setStatuses(_that.cfg);case _SetRegistrationStatuses() when setRegistrationStatuses != null:
return setRegistrationStatuses(_that.cfg);case _SetRegistrationOnline() when setRegistrationOnline != null:
return setRegistrationOnline(_that.color);case _SetRegistrationOffline() when setRegistrationOffline != null:
return setRegistrationOffline(_that.color);case _SetCallStatuses() when setCallStatuses != null:
return setCallStatuses(_that.cfg);case _SetCallStatusesConnectivityNone() when setCallStatusesConnectivityNone != null:
return setCallStatusesConnectivityNone(_that.color);case _SetCallStatusesConnectError() when setCallStatusesConnectError != null:
return setCallStatusesConnectError(_that.color);case _SetCallStatusesAppUnregistered() when setCallStatusesAppUnregistered != null:
return setCallStatusesAppUnregistered(_that.color);case _SetCallStatusesConnectIssue() when setCallStatusesConnectIssue != null:
return setCallStatusesConnectIssue(_that.color);case _SetCallStatusesInProgress() when setCallStatusesInProgress != null:
return setCallStatusesInProgress(_that.color);case _SetCallStatusesReady() when setCallStatusesReady != null:
return setCallStatusesReady(_that.color);case _ImportJsonWidgetEvent() when importJson != null:
return importJson(_that.json);case _:
  return null;

}
}

}

/// @nodoc


class _SetFonts implements ThemeWidgetEvent {
  const _SetFonts(this.fonts);
  

 final  FontsConfig fonts;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetFontsCopyWith<_SetFonts> get copyWith => __$SetFontsCopyWithImpl<_SetFonts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetFonts&&(identical(other.fonts, fonts) || other.fonts == fonts));
}


@override
int get hashCode => Object.hash(runtimeType,fonts);

@override
String toString() {
  return 'ThemeWidgetEvent.setFonts(fonts: $fonts)';
}


}

/// @nodoc
abstract mixin class _$SetFontsCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetFontsCopyWith(_SetFonts value, $Res Function(_SetFonts) _then) = __$SetFontsCopyWithImpl;
@useResult
$Res call({
 FontsConfig fonts
});


$FontsConfigCopyWith<$Res> get fonts;

}
/// @nodoc
class __$SetFontsCopyWithImpl<$Res>
    implements _$SetFontsCopyWith<$Res> {
  __$SetFontsCopyWithImpl(this._self, this._then);

  final _SetFonts _self;
  final $Res Function(_SetFonts) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fonts = null,}) {
  return _then(_SetFonts(
null == fonts ? _self.fonts : fonts // ignore: cast_nullable_to_non_nullable
as FontsConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FontsConfigCopyWith<$Res> get fonts {
  
  return $FontsConfigCopyWith<$Res>(_self.fonts, (value) {
    return _then(_self.copyWith(fonts: value));
  });
}
}

/// @nodoc


class _SetGlobalFontFamily implements ThemeWidgetEvent {
  const _SetGlobalFontFamily(this.fontFamily);
  

 final  String? fontFamily;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetGlobalFontFamilyCopyWith<_SetGlobalFontFamily> get copyWith => __$SetGlobalFontFamilyCopyWithImpl<_SetGlobalFontFamily>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetGlobalFontFamily&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily));
}


@override
int get hashCode => Object.hash(runtimeType,fontFamily);

@override
String toString() {
  return 'ThemeWidgetEvent.setGlobalFontFamily(fontFamily: $fontFamily)';
}


}

/// @nodoc
abstract mixin class _$SetGlobalFontFamilyCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetGlobalFontFamilyCopyWith(_SetGlobalFontFamily value, $Res Function(_SetGlobalFontFamily) _then) = __$SetGlobalFontFamilyCopyWithImpl;
@useResult
$Res call({
 String? fontFamily
});




}
/// @nodoc
class __$SetGlobalFontFamilyCopyWithImpl<$Res>
    implements _$SetGlobalFontFamilyCopyWith<$Res> {
  __$SetGlobalFontFamilyCopyWithImpl(this._self, this._then);

  final _SetGlobalFontFamily _self;
  final $Res Function(_SetGlobalFontFamily) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fontFamily = freezed,}) {
  return _then(_SetGlobalFontFamily(
freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetButton implements ThemeWidgetEvent {
  const _SetButton(this.button);
  

 final  ButtonWidgetConfig button;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetButtonCopyWith<_SetButton> get copyWith => __$SetButtonCopyWithImpl<_SetButton>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetButton&&(identical(other.button, button) || other.button == button));
}


@override
int get hashCode => Object.hash(runtimeType,button);

@override
String toString() {
  return 'ThemeWidgetEvent.setButton(button: $button)';
}


}

/// @nodoc
abstract mixin class _$SetButtonCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetButtonCopyWith(_SetButton value, $Res Function(_SetButton) _then) = __$SetButtonCopyWithImpl;
@useResult
$Res call({
 ButtonWidgetConfig button
});


$ButtonWidgetConfigCopyWith<$Res> get button;

}
/// @nodoc
class __$SetButtonCopyWithImpl<$Res>
    implements _$SetButtonCopyWith<$Res> {
  __$SetButtonCopyWithImpl(this._self, this._then);

  final _SetButton _self;
  final $Res Function(_SetButton) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? button = null,}) {
  return _then(_SetButton(
null == button ? _self.button : button // ignore: cast_nullable_to_non_nullable
as ButtonWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ButtonWidgetConfigCopyWith<$Res> get button {
  
  return $ButtonWidgetConfigCopyWith<$Res>(_self.button, (value) {
    return _then(_self.copyWith(button: value));
  });
}
}

/// @nodoc


class _SetPrimaryElevatedButton implements ThemeWidgetEvent {
  const _SetPrimaryElevatedButton(this.cfg);
  

 final  ButtonStyleConfig? cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetPrimaryElevatedButtonCopyWith<_SetPrimaryElevatedButton> get copyWith => __$SetPrimaryElevatedButtonCopyWithImpl<_SetPrimaryElevatedButton>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetPrimaryElevatedButton&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setPEButton(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetPrimaryElevatedButtonCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetPrimaryElevatedButtonCopyWith(_SetPrimaryElevatedButton value, $Res Function(_SetPrimaryElevatedButton) _then) = __$SetPrimaryElevatedButtonCopyWithImpl;
@useResult
$Res call({
 ButtonStyleConfig? cfg
});


$ButtonStyleConfigCopyWith<$Res>? get cfg;

}
/// @nodoc
class __$SetPrimaryElevatedButtonCopyWithImpl<$Res>
    implements _$SetPrimaryElevatedButtonCopyWith<$Res> {
  __$SetPrimaryElevatedButtonCopyWithImpl(this._self, this._then);

  final _SetPrimaryElevatedButton _self;
  final $Res Function(_SetPrimaryElevatedButton) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = freezed,}) {
  return _then(_SetPrimaryElevatedButton(
freezed == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as ButtonStyleConfig?,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ButtonStyleConfigCopyWith<$Res>? get cfg {
    if (_self.cfg == null) {
    return null;
  }

  return $ButtonStyleConfigCopyWith<$Res>(_self.cfg!, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetGroup implements ThemeWidgetEvent {
  const _SetGroup(this.group);
  

 final  GroupWidgetConfig group;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetGroupCopyWith<_SetGroup> get copyWith => __$SetGroupCopyWithImpl<_SetGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetGroup&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,group);

@override
String toString() {
  return 'ThemeWidgetEvent.setGroup(group: $group)';
}


}

/// @nodoc
abstract mixin class _$SetGroupCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetGroupCopyWith(_SetGroup value, $Res Function(_SetGroup) _then) = __$SetGroupCopyWithImpl;
@useResult
$Res call({
 GroupWidgetConfig group
});


$GroupWidgetConfigCopyWith<$Res> get group;

}
/// @nodoc
class __$SetGroupCopyWithImpl<$Res>
    implements _$SetGroupCopyWith<$Res> {
  __$SetGroupCopyWithImpl(this._self, this._then);

  final _SetGroup _self;
  final $Res Function(_SetGroup) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? group = null,}) {
  return _then(_SetGroup(
null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupWidgetConfigCopyWith<$Res> get group {
  
  return $GroupWidgetConfigCopyWith<$Res>(_self.group, (value) {
    return _then(_self.copyWith(group: value));
  });
}
}

/// @nodoc


class _SetGroupTitleListTile implements ThemeWidgetEvent {
  const _SetGroupTitleListTile(this.cfg);
  

 final  GroupTitleListTileWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetGroupTitleListTileCopyWith<_SetGroupTitleListTile> get copyWith => __$SetGroupTitleListTileCopyWithImpl<_SetGroupTitleListTile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetGroupTitleListTile&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setGroupTitleListTile(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetGroupTitleListTileCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetGroupTitleListTileCopyWith(_SetGroupTitleListTile value, $Res Function(_SetGroupTitleListTile) _then) = __$SetGroupTitleListTileCopyWithImpl;
@useResult
$Res call({
 GroupTitleListTileWidgetConfig cfg
});


$GroupTitleListTileWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetGroupTitleListTileCopyWithImpl<$Res>
    implements _$SetGroupTitleListTileCopyWith<$Res> {
  __$SetGroupTitleListTileCopyWithImpl(this._self, this._then);

  final _SetGroupTitleListTile _self;
  final $Res Function(_SetGroupTitleListTile) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetGroupTitleListTile(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as GroupTitleListTileWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupTitleListTileWidgetConfigCopyWith<$Res> get cfg {
  
  return $GroupTitleListTileWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetGroupTitleListTileBackground implements ThemeWidgetEvent {
  const _SetGroupTitleListTileBackground(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetGroupTitleListTileBackgroundCopyWith<_SetGroupTitleListTileBackground> get copyWith => __$SetGroupTitleListTileBackgroundCopyWithImpl<_SetGroupTitleListTileBackground>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetGroupTitleListTileBackground&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setGroupTitleListTileBackground(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetGroupTitleListTileBackgroundCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetGroupTitleListTileBackgroundCopyWith(_SetGroupTitleListTileBackground value, $Res Function(_SetGroupTitleListTileBackground) _then) = __$SetGroupTitleListTileBackgroundCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetGroupTitleListTileBackgroundCopyWithImpl<$Res>
    implements _$SetGroupTitleListTileBackgroundCopyWith<$Res> {
  __$SetGroupTitleListTileBackgroundCopyWithImpl(this._self, this._then);

  final _SetGroupTitleListTileBackground _self;
  final $Res Function(_SetGroupTitleListTileBackground) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetGroupTitleListTileBackground(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetBar implements ThemeWidgetEvent {
  const _SetBar(this.bar);
  

 final  BarWidgetConfig bar;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetBarCopyWith<_SetBar> get copyWith => __$SetBarCopyWithImpl<_SetBar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetBar&&(identical(other.bar, bar) || other.bar == bar));
}


@override
int get hashCode => Object.hash(runtimeType,bar);

@override
String toString() {
  return 'ThemeWidgetEvent.setBar(bar: $bar)';
}


}

/// @nodoc
abstract mixin class _$SetBarCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetBarCopyWith(_SetBar value, $Res Function(_SetBar) _then) = __$SetBarCopyWithImpl;
@useResult
$Res call({
 BarWidgetConfig bar
});


$BarWidgetConfigCopyWith<$Res> get bar;

}
/// @nodoc
class __$SetBarCopyWithImpl<$Res>
    implements _$SetBarCopyWith<$Res> {
  __$SetBarCopyWithImpl(this._self, this._then);

  final _SetBar _self;
  final $Res Function(_SetBar) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bar = null,}) {
  return _then(_SetBar(
null == bar ? _self.bar : bar // ignore: cast_nullable_to_non_nullable
as BarWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BarWidgetConfigCopyWith<$Res> get bar {
  
  return $BarWidgetConfigCopyWith<$Res>(_self.bar, (value) {
    return _then(_self.copyWith(bar: value));
  });
}
}

/// @nodoc


class _SetBottomNavBar implements ThemeWidgetEvent {
  const _SetBottomNavBar(this.cfg);
  

 final  BottomNavigationBarWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetBottomNavBarCopyWith<_SetBottomNavBar> get copyWith => __$SetBottomNavBarCopyWithImpl<_SetBottomNavBar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetBottomNavBar&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setBottomNavigationBar(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetBottomNavBarCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetBottomNavBarCopyWith(_SetBottomNavBar value, $Res Function(_SetBottomNavBar) _then) = __$SetBottomNavBarCopyWithImpl;
@useResult
$Res call({
 BottomNavigationBarWidgetConfig cfg
});


$BottomNavigationBarWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetBottomNavBarCopyWithImpl<$Res>
    implements _$SetBottomNavBarCopyWith<$Res> {
  __$SetBottomNavBarCopyWithImpl(this._self, this._then);

  final _SetBottomNavBar _self;
  final $Res Function(_SetBottomNavBar) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetBottomNavBar(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as BottomNavigationBarWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BottomNavigationBarWidgetConfigCopyWith<$Res> get cfg {
  
  return $BottomNavigationBarWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetBottomNavBarBackground implements ThemeWidgetEvent {
  const _SetBottomNavBarBackground(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetBottomNavBarBackgroundCopyWith<_SetBottomNavBarBackground> get copyWith => __$SetBottomNavBarBackgroundCopyWithImpl<_SetBottomNavBarBackground>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetBottomNavBarBackground&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setBottomNavBarBackground(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetBottomNavBarBackgroundCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetBottomNavBarBackgroundCopyWith(_SetBottomNavBarBackground value, $Res Function(_SetBottomNavBarBackground) _then) = __$SetBottomNavBarBackgroundCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetBottomNavBarBackgroundCopyWithImpl<$Res>
    implements _$SetBottomNavBarBackgroundCopyWith<$Res> {
  __$SetBottomNavBarBackgroundCopyWithImpl(this._self, this._then);

  final _SetBottomNavBarBackground _self;
  final $Res Function(_SetBottomNavBarBackground) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetBottomNavBarBackground(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetBottomNavBarSelected implements ThemeWidgetEvent {
  const _SetBottomNavBarSelected(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetBottomNavBarSelectedCopyWith<_SetBottomNavBarSelected> get copyWith => __$SetBottomNavBarSelectedCopyWithImpl<_SetBottomNavBarSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetBottomNavBarSelected&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setBottomNavBarSelected(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetBottomNavBarSelectedCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetBottomNavBarSelectedCopyWith(_SetBottomNavBarSelected value, $Res Function(_SetBottomNavBarSelected) _then) = __$SetBottomNavBarSelectedCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetBottomNavBarSelectedCopyWithImpl<$Res>
    implements _$SetBottomNavBarSelectedCopyWith<$Res> {
  __$SetBottomNavBarSelectedCopyWithImpl(this._self, this._then);

  final _SetBottomNavBarSelected _self;
  final $Res Function(_SetBottomNavBarSelected) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetBottomNavBarSelected(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetBottomNavBarUnselected implements ThemeWidgetEvent {
  const _SetBottomNavBarUnselected(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetBottomNavBarUnselectedCopyWith<_SetBottomNavBarUnselected> get copyWith => __$SetBottomNavBarUnselectedCopyWithImpl<_SetBottomNavBarUnselected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetBottomNavBarUnselected&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setBottomNavBarUnselected(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetBottomNavBarUnselectedCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetBottomNavBarUnselectedCopyWith(_SetBottomNavBarUnselected value, $Res Function(_SetBottomNavBarUnselected) _then) = __$SetBottomNavBarUnselectedCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetBottomNavBarUnselectedCopyWithImpl<$Res>
    implements _$SetBottomNavBarUnselectedCopyWith<$Res> {
  __$SetBottomNavBarUnselectedCopyWithImpl(this._self, this._then);

  final _SetBottomNavBarUnselected _self;
  final $Res Function(_SetBottomNavBarUnselected) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetBottomNavBarUnselected(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetExtTabBar implements ThemeWidgetEvent {
  const _SetExtTabBar(this.cfg);
  

 final  AppBarConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetExtTabBarCopyWith<_SetExtTabBar> get copyWith => __$SetExtTabBarCopyWithImpl<_SetExtTabBar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetExtTabBar&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setExtTabBar(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetExtTabBarCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetExtTabBarCopyWith(_SetExtTabBar value, $Res Function(_SetExtTabBar) _then) = __$SetExtTabBarCopyWithImpl;
@useResult
$Res call({
 AppBarConfig cfg
});


$AppBarConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetExtTabBarCopyWithImpl<$Res>
    implements _$SetExtTabBarCopyWith<$Res> {
  __$SetExtTabBarCopyWithImpl(this._self, this._then);

  final _SetExtTabBar _self;
  final $Res Function(_SetExtTabBar) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetExtTabBar(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as AppBarConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppBarConfigCopyWith<$Res> get cfg {
  
  return $AppBarConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetTabBarConfig implements ThemeWidgetEvent {
  const _SetTabBarConfig(this.cfg);
  

 final  TabBarConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetTabBarConfigCopyWith<_SetTabBarConfig> get copyWith => __$SetTabBarConfigCopyWithImpl<_SetTabBarConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetTabBarConfig&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setTabBarConfig(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetTabBarConfigCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetTabBarConfigCopyWith(_SetTabBarConfig value, $Res Function(_SetTabBarConfig) _then) = __$SetTabBarConfigCopyWithImpl;
@useResult
$Res call({
 TabBarConfig cfg
});


$TabBarConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetTabBarConfigCopyWithImpl<$Res>
    implements _$SetTabBarConfigCopyWith<$Res> {
  __$SetTabBarConfigCopyWithImpl(this._self, this._then);

  final _SetTabBarConfig _self;
  final $Res Function(_SetTabBarConfig) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetTabBarConfig(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as TabBarConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TabBarConfigCopyWith<$Res> get cfg {
  
  return $TabBarConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetDefaultPlaceholderImage implements ThemeWidgetEvent {
  const _SetDefaultPlaceholderImage(this.imageSource);
  

 final  ImageSource imageSource;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDefaultPlaceholderImageCopyWith<_SetDefaultPlaceholderImage> get copyWith => __$SetDefaultPlaceholderImageCopyWithImpl<_SetDefaultPlaceholderImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDefaultPlaceholderImage&&(identical(other.imageSource, imageSource) || other.imageSource == imageSource));
}


@override
int get hashCode => Object.hash(runtimeType,imageSource);

@override
String toString() {
  return 'ThemeWidgetEvent.setDefaultPlaceholderImage(imageSource: $imageSource)';
}


}

/// @nodoc
abstract mixin class _$SetDefaultPlaceholderImageCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetDefaultPlaceholderImageCopyWith(_SetDefaultPlaceholderImage value, $Res Function(_SetDefaultPlaceholderImage) _then) = __$SetDefaultPlaceholderImageCopyWithImpl;
@useResult
$Res call({
 ImageSource imageSource
});


$ImageSourceCopyWith<$Res> get imageSource;

}
/// @nodoc
class __$SetDefaultPlaceholderImageCopyWithImpl<$Res>
    implements _$SetDefaultPlaceholderImageCopyWith<$Res> {
  __$SetDefaultPlaceholderImageCopyWithImpl(this._self, this._then);

  final _SetDefaultPlaceholderImage _self;
  final $Res Function(_SetDefaultPlaceholderImage) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageSource = null,}) {
  return _then(_SetDefaultPlaceholderImage(
null == imageSource ? _self.imageSource : imageSource // ignore: cast_nullable_to_non_nullable
as ImageSource,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageSourceCopyWith<$Res> get imageSource {
  
  return $ImageSourceCopyWith<$Res>(_self.imageSource, (value) {
    return _then(_self.copyWith(imageSource: value));
  });
}
}

/// @nodoc


class _SetImageAssets implements ThemeWidgetEvent {
  const _SetImageAssets(this.cfg);
  

 final  ImageAssetsConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetImageAssetsCopyWith<_SetImageAssets> get copyWith => __$SetImageAssetsCopyWithImpl<_SetImageAssets>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetImageAssets&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setImageAssets(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetImageAssetsCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetImageAssetsCopyWith(_SetImageAssets value, $Res Function(_SetImageAssets) _then) = __$SetImageAssetsCopyWithImpl;
@useResult
$Res call({
 ImageAssetsConfig cfg
});


$ImageAssetsConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetImageAssetsCopyWithImpl<$Res>
    implements _$SetImageAssetsCopyWith<$Res> {
  __$SetImageAssetsCopyWithImpl(this._self, this._then);

  final _SetImageAssets _self;
  final $Res Function(_SetImageAssets) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetImageAssets(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as ImageAssetsConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageAssetsConfigCopyWith<$Res> get cfg {
  
  return $ImageAssetsConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetAppIcon implements ThemeWidgetEvent {
  const _SetAppIcon(this.cfg);
  

 final  AppIconWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetAppIconCopyWith<_SetAppIcon> get copyWith => __$SetAppIconCopyWithImpl<_SetAppIcon>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetAppIcon&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setAppIcon(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetAppIconCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetAppIconCopyWith(_SetAppIcon value, $Res Function(_SetAppIcon) _then) = __$SetAppIconCopyWithImpl;
@useResult
$Res call({
 AppIconWidgetConfig cfg
});


$AppIconWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetAppIconCopyWithImpl<$Res>
    implements _$SetAppIconCopyWith<$Res> {
  __$SetAppIconCopyWithImpl(this._self, this._then);

  final _SetAppIcon _self;
  final $Res Function(_SetAppIcon) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetAppIcon(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as AppIconWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppIconWidgetConfigCopyWith<$Res> get cfg {
  
  return $AppIconWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetLeadingAvatarStyle implements ThemeWidgetEvent {
  const _SetLeadingAvatarStyle(this.cfg);
  

 final  LeadingAvatarStyleConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLeadingAvatarStyleCopyWith<_SetLeadingAvatarStyle> get copyWith => __$SetLeadingAvatarStyleCopyWithImpl<_SetLeadingAvatarStyle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLeadingAvatarStyle&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setLeadingAvatarStyle(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetLeadingAvatarStyleCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetLeadingAvatarStyleCopyWith(_SetLeadingAvatarStyle value, $Res Function(_SetLeadingAvatarStyle) _then) = __$SetLeadingAvatarStyleCopyWithImpl;
@useResult
$Res call({
 LeadingAvatarStyleConfig cfg
});


$LeadingAvatarStyleConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetLeadingAvatarStyleCopyWithImpl<$Res>
    implements _$SetLeadingAvatarStyleCopyWith<$Res> {
  __$SetLeadingAvatarStyleCopyWithImpl(this._self, this._then);

  final _SetLeadingAvatarStyle _self;
  final $Res Function(_SetLeadingAvatarStyle) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetLeadingAvatarStyle(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as LeadingAvatarStyleConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeadingAvatarStyleConfigCopyWith<$Res> get cfg {
  
  return $LeadingAvatarStyleConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetInput implements ThemeWidgetEvent {
  const _SetInput(this.cfg);
  

 final  InputWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetInputCopyWith<_SetInput> get copyWith => __$SetInputCopyWithImpl<_SetInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetInput&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setInput(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetInputCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetInputCopyWith(_SetInput value, $Res Function(_SetInput) _then) = __$SetInputCopyWithImpl;
@useResult
$Res call({
 InputWidgetConfig cfg
});


$InputWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetInputCopyWithImpl<$Res>
    implements _$SetInputCopyWith<$Res> {
  __$SetInputCopyWithImpl(this._self, this._then);

  final _SetInput _self;
  final $Res Function(_SetInput) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetInput(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as InputWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputWidgetConfigCopyWith<$Res> get cfg {
  
  return $InputWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetTextFormField implements ThemeWidgetEvent {
  const _SetTextFormField(this.cfg);
  

 final  TextFormFieldWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetTextFormFieldCopyWith<_SetTextFormField> get copyWith => __$SetTextFormFieldCopyWithImpl<_SetTextFormField>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetTextFormField&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setTextFormField(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetTextFormFieldCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetTextFormFieldCopyWith(_SetTextFormField value, $Res Function(_SetTextFormField) _then) = __$SetTextFormFieldCopyWithImpl;
@useResult
$Res call({
 TextFormFieldWidgetConfig cfg
});


$TextFormFieldWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetTextFormFieldCopyWithImpl<$Res>
    implements _$SetTextFormFieldCopyWith<$Res> {
  __$SetTextFormFieldCopyWithImpl(this._self, this._then);

  final _SetTextFormField _self;
  final $Res Function(_SetTextFormField) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetTextFormField(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as TextFormFieldWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextFormFieldWidgetConfigCopyWith<$Res> get cfg {
  
  return $TextFormFieldWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetInputLabelColor implements ThemeWidgetEvent {
  const _SetInputLabelColor(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetInputLabelColorCopyWith<_SetInputLabelColor> get copyWith => __$SetInputLabelColorCopyWithImpl<_SetInputLabelColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetInputLabelColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setInputLabelColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetInputLabelColorCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetInputLabelColorCopyWith(_SetInputLabelColor value, $Res Function(_SetInputLabelColor) _then) = __$SetInputLabelColorCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetInputLabelColorCopyWithImpl<$Res>
    implements _$SetInputLabelColorCopyWith<$Res> {
  __$SetInputLabelColorCopyWithImpl(this._self, this._then);

  final _SetInputLabelColor _self;
  final $Res Function(_SetInputLabelColor) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetInputLabelColor(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetInputBorder implements ThemeWidgetEvent {
  const _SetInputBorder(this.cfg);
  

 final  InputBorderWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetInputBorderCopyWith<_SetInputBorder> get copyWith => __$SetInputBorderCopyWithImpl<_SetInputBorder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetInputBorder&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setInputBorder(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetInputBorderCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetInputBorderCopyWith(_SetInputBorder value, $Res Function(_SetInputBorder) _then) = __$SetInputBorderCopyWithImpl;
@useResult
$Res call({
 InputBorderWidgetConfig cfg
});


$InputBorderWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetInputBorderCopyWithImpl<$Res>
    implements _$SetInputBorderCopyWith<$Res> {
  __$SetInputBorderCopyWithImpl(this._self, this._then);

  final _SetInputBorder _self;
  final $Res Function(_SetInputBorder) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetInputBorder(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as InputBorderWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InputBorderWidgetConfigCopyWith<$Res> get cfg {
  
  return $InputBorderWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetInputBorderDisabled implements ThemeWidgetEvent {
  const _SetInputBorderDisabled(this.cfg);
  

 final  BorderWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetInputBorderDisabledCopyWith<_SetInputBorderDisabled> get copyWith => __$SetInputBorderDisabledCopyWithImpl<_SetInputBorderDisabled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetInputBorderDisabled&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setInputBorderDisabled(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetInputBorderDisabledCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetInputBorderDisabledCopyWith(_SetInputBorderDisabled value, $Res Function(_SetInputBorderDisabled) _then) = __$SetInputBorderDisabledCopyWithImpl;
@useResult
$Res call({
 BorderWidgetConfig cfg
});


$BorderWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetInputBorderDisabledCopyWithImpl<$Res>
    implements _$SetInputBorderDisabledCopyWith<$Res> {
  __$SetInputBorderDisabledCopyWithImpl(this._self, this._then);

  final _SetInputBorderDisabled _self;
  final $Res Function(_SetInputBorderDisabled) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetInputBorderDisabled(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as BorderWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BorderWidgetConfigCopyWith<$Res> get cfg {
  
  return $BorderWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetInputBorderFocused implements ThemeWidgetEvent {
  const _SetInputBorderFocused(this.cfg);
  

 final  BorderWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetInputBorderFocusedCopyWith<_SetInputBorderFocused> get copyWith => __$SetInputBorderFocusedCopyWithImpl<_SetInputBorderFocused>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetInputBorderFocused&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setInputBorderFocused(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetInputBorderFocusedCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetInputBorderFocusedCopyWith(_SetInputBorderFocused value, $Res Function(_SetInputBorderFocused) _then) = __$SetInputBorderFocusedCopyWithImpl;
@useResult
$Res call({
 BorderWidgetConfig cfg
});


$BorderWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetInputBorderFocusedCopyWithImpl<$Res>
    implements _$SetInputBorderFocusedCopyWith<$Res> {
  __$SetInputBorderFocusedCopyWithImpl(this._self, this._then);

  final _SetInputBorderFocused _self;
  final $Res Function(_SetInputBorderFocused) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetInputBorderFocused(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as BorderWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BorderWidgetConfigCopyWith<$Res> get cfg {
  
  return $BorderWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetInputBorderAny implements ThemeWidgetEvent {
  const _SetInputBorderAny(this.cfg);
  

 final  BorderWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetInputBorderAnyCopyWith<_SetInputBorderAny> get copyWith => __$SetInputBorderAnyCopyWithImpl<_SetInputBorderAny>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetInputBorderAny&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setInputBorderAny(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetInputBorderAnyCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetInputBorderAnyCopyWith(_SetInputBorderAny value, $Res Function(_SetInputBorderAny) _then) = __$SetInputBorderAnyCopyWithImpl;
@useResult
$Res call({
 BorderWidgetConfig cfg
});


$BorderWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetInputBorderAnyCopyWithImpl<$Res>
    implements _$SetInputBorderAnyCopyWith<$Res> {
  __$SetInputBorderAnyCopyWithImpl(this._self, this._then);

  final _SetInputBorderAny _self;
  final $Res Function(_SetInputBorderAny) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetInputBorderAny(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as BorderWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BorderWidgetConfigCopyWith<$Res> get cfg {
  
  return $BorderWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetText implements ThemeWidgetEvent {
  const _SetText(this.cfg);
  

 final  TextWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetTextCopyWith<_SetText> get copyWith => __$SetTextCopyWithImpl<_SetText>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetText&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setText(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetTextCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetTextCopyWith(_SetText value, $Res Function(_SetText) _then) = __$SetTextCopyWithImpl;
@useResult
$Res call({
 TextWidgetConfig cfg
});


$TextWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetTextCopyWithImpl<$Res>
    implements _$SetTextCopyWith<$Res> {
  __$SetTextCopyWithImpl(this._self, this._then);

  final _SetText _self;
  final $Res Function(_SetText) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetText(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as TextWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextWidgetConfigCopyWith<$Res> get cfg {
  
  return $TextWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetTextSelection implements ThemeWidgetEvent {
  const _SetTextSelection(this.cfg);
  

 final  TextSelectionWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetTextSelectionCopyWith<_SetTextSelection> get copyWith => __$SetTextSelectionCopyWithImpl<_SetTextSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetTextSelection&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setTextSelection(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetTextSelectionCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetTextSelectionCopyWith(_SetTextSelection value, $Res Function(_SetTextSelection) _then) = __$SetTextSelectionCopyWithImpl;
@useResult
$Res call({
 TextSelectionWidgetConfig cfg
});


$TextSelectionWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetTextSelectionCopyWithImpl<$Res>
    implements _$SetTextSelectionCopyWith<$Res> {
  __$SetTextSelectionCopyWithImpl(this._self, this._then);

  final _SetTextSelection _self;
  final $Res Function(_SetTextSelection) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetTextSelection(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as TextSelectionWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TextSelectionWidgetConfigCopyWith<$Res> get cfg {
  
  return $TextSelectionWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetTextCursorColor implements ThemeWidgetEvent {
  const _SetTextCursorColor(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetTextCursorColorCopyWith<_SetTextCursorColor> get copyWith => __$SetTextCursorColorCopyWithImpl<_SetTextCursorColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetTextCursorColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setTextCursorColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetTextCursorColorCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetTextCursorColorCopyWith(_SetTextCursorColor value, $Res Function(_SetTextCursorColor) _then) = __$SetTextCursorColorCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetTextCursorColorCopyWithImpl<$Res>
    implements _$SetTextCursorColorCopyWith<$Res> {
  __$SetTextCursorColorCopyWithImpl(this._self, this._then);

  final _SetTextCursorColor _self;
  final $Res Function(_SetTextCursorColor) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetTextCursorColor(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetTextSelectionColor implements ThemeWidgetEvent {
  const _SetTextSelectionColor(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetTextSelectionColorCopyWith<_SetTextSelectionColor> get copyWith => __$SetTextSelectionColorCopyWithImpl<_SetTextSelectionColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetTextSelectionColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setTextSelectionColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetTextSelectionColorCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetTextSelectionColorCopyWith(_SetTextSelectionColor value, $Res Function(_SetTextSelectionColor) _then) = __$SetTextSelectionColorCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetTextSelectionColorCopyWithImpl<$Res>
    implements _$SetTextSelectionColorCopyWith<$Res> {
  __$SetTextSelectionColorCopyWithImpl(this._self, this._then);

  final _SetTextSelectionColor _self;
  final $Res Function(_SetTextSelectionColor) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetTextSelectionColor(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetTextSelectionHandleColor implements ThemeWidgetEvent {
  const _SetTextSelectionHandleColor(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetTextSelectionHandleColorCopyWith<_SetTextSelectionHandleColor> get copyWith => __$SetTextSelectionHandleColorCopyWithImpl<_SetTextSelectionHandleColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetTextSelectionHandleColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setTextSelectionHandleColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetTextSelectionHandleColorCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetTextSelectionHandleColorCopyWith(_SetTextSelectionHandleColor value, $Res Function(_SetTextSelectionHandleColor) _then) = __$SetTextSelectionHandleColorCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetTextSelectionHandleColorCopyWithImpl<$Res>
    implements _$SetTextSelectionHandleColorCopyWith<$Res> {
  __$SetTextSelectionHandleColorCopyWithImpl(this._self, this._then);

  final _SetTextSelectionHandleColor _self;
  final $Res Function(_SetTextSelectionHandleColor) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetTextSelectionHandleColor(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetLinkify implements ThemeWidgetEvent {
  const _SetLinkify(this.cfg);
  

 final  LinkifyWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLinkifyCopyWith<_SetLinkify> get copyWith => __$SetLinkifyCopyWithImpl<_SetLinkify>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLinkify&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setLinkify(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetLinkifyCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetLinkifyCopyWith(_SetLinkify value, $Res Function(_SetLinkify) _then) = __$SetLinkifyCopyWithImpl;
@useResult
$Res call({
 LinkifyWidgetConfig cfg
});


$LinkifyWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetLinkifyCopyWithImpl<$Res>
    implements _$SetLinkifyCopyWith<$Res> {
  __$SetLinkifyCopyWithImpl(this._self, this._then);

  final _SetLinkify _self;
  final $Res Function(_SetLinkify) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetLinkify(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as LinkifyWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LinkifyWidgetConfigCopyWith<$Res> get cfg {
  
  return $LinkifyWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetLinkifyStyleColor implements ThemeWidgetEvent {
  const _SetLinkifyStyleColor(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLinkifyStyleColorCopyWith<_SetLinkifyStyleColor> get copyWith => __$SetLinkifyStyleColorCopyWithImpl<_SetLinkifyStyleColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLinkifyStyleColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setLinkifyStyleColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetLinkifyStyleColorCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetLinkifyStyleColorCopyWith(_SetLinkifyStyleColor value, $Res Function(_SetLinkifyStyleColor) _then) = __$SetLinkifyStyleColorCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetLinkifyStyleColorCopyWithImpl<$Res>
    implements _$SetLinkifyStyleColorCopyWith<$Res> {
  __$SetLinkifyStyleColorCopyWithImpl(this._self, this._then);

  final _SetLinkifyStyleColor _self;
  final $Res Function(_SetLinkifyStyleColor) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetLinkifyStyleColor(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetLinkifyLinkColor implements ThemeWidgetEvent {
  const _SetLinkifyLinkColor(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLinkifyLinkColorCopyWith<_SetLinkifyLinkColor> get copyWith => __$SetLinkifyLinkColorCopyWithImpl<_SetLinkifyLinkColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLinkifyLinkColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setLinkifyLinkColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetLinkifyLinkColorCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetLinkifyLinkColorCopyWith(_SetLinkifyLinkColor value, $Res Function(_SetLinkifyLinkColor) _then) = __$SetLinkifyLinkColorCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetLinkifyLinkColorCopyWithImpl<$Res>
    implements _$SetLinkifyLinkColorCopyWith<$Res> {
  __$SetLinkifyLinkColorCopyWithImpl(this._self, this._then);

  final _SetLinkifyLinkColor _self;
  final $Res Function(_SetLinkifyLinkColor) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetLinkifyLinkColor(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetDialog implements ThemeWidgetEvent {
  const _SetDialog(this.cfg);
  

 final  DialogWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDialogCopyWith<_SetDialog> get copyWith => __$SetDialogCopyWithImpl<_SetDialog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDialog&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setDialog(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetDialogCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetDialogCopyWith(_SetDialog value, $Res Function(_SetDialog) _then) = __$SetDialogCopyWithImpl;
@useResult
$Res call({
 DialogWidgetConfig cfg
});


$DialogWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetDialogCopyWithImpl<$Res>
    implements _$SetDialogCopyWith<$Res> {
  __$SetDialogCopyWithImpl(this._self, this._then);

  final _SetDialog _self;
  final $Res Function(_SetDialog) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetDialog(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as DialogWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DialogWidgetConfigCopyWith<$Res> get cfg {
  
  return $DialogWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetConfirmDialog implements ThemeWidgetEvent {
  const _SetConfirmDialog(this.cfg);
  

 final  ConfirmDialogWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetConfirmDialogCopyWith<_SetConfirmDialog> get copyWith => __$SetConfirmDialogCopyWithImpl<_SetConfirmDialog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetConfirmDialog&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setConfirmDialog(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetConfirmDialogCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetConfirmDialogCopyWith(_SetConfirmDialog value, $Res Function(_SetConfirmDialog) _then) = __$SetConfirmDialogCopyWithImpl;
@useResult
$Res call({
 ConfirmDialogWidgetConfig cfg
});


$ConfirmDialogWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetConfirmDialogCopyWithImpl<$Res>
    implements _$SetConfirmDialogCopyWith<$Res> {
  __$SetConfirmDialogCopyWithImpl(this._self, this._then);

  final _SetConfirmDialog _self;
  final $Res Function(_SetConfirmDialog) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetConfirmDialog(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as ConfirmDialogWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfirmDialogWidgetConfigCopyWith<$Res> get cfg {
  
  return $ConfirmDialogWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetConfirmDialogActive1 implements ThemeWidgetEvent {
  const _SetConfirmDialogActive1(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetConfirmDialogActive1CopyWith<_SetConfirmDialogActive1> get copyWith => __$SetConfirmDialogActive1CopyWithImpl<_SetConfirmDialogActive1>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetConfirmDialogActive1&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setConfirmDialogActive1(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetConfirmDialogActive1CopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetConfirmDialogActive1CopyWith(_SetConfirmDialogActive1 value, $Res Function(_SetConfirmDialogActive1) _then) = __$SetConfirmDialogActive1CopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetConfirmDialogActive1CopyWithImpl<$Res>
    implements _$SetConfirmDialogActive1CopyWith<$Res> {
  __$SetConfirmDialogActive1CopyWithImpl(this._self, this._then);

  final _SetConfirmDialogActive1 _self;
  final $Res Function(_SetConfirmDialogActive1) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetConfirmDialogActive1(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetConfirmDialogActive2 implements ThemeWidgetEvent {
  const _SetConfirmDialogActive2(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetConfirmDialogActive2CopyWith<_SetConfirmDialogActive2> get copyWith => __$SetConfirmDialogActive2CopyWithImpl<_SetConfirmDialogActive2>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetConfirmDialogActive2&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setConfirmDialogActive2(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetConfirmDialogActive2CopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetConfirmDialogActive2CopyWith(_SetConfirmDialogActive2 value, $Res Function(_SetConfirmDialogActive2) _then) = __$SetConfirmDialogActive2CopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetConfirmDialogActive2CopyWithImpl<$Res>
    implements _$SetConfirmDialogActive2CopyWith<$Res> {
  __$SetConfirmDialogActive2CopyWithImpl(this._self, this._then);

  final _SetConfirmDialogActive2 _self;
  final $Res Function(_SetConfirmDialogActive2) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetConfirmDialogActive2(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetConfirmDialogDefault implements ThemeWidgetEvent {
  const _SetConfirmDialogDefault(this.color);
  

 final  String? color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetConfirmDialogDefaultCopyWith<_SetConfirmDialogDefault> get copyWith => __$SetConfirmDialogDefaultCopyWithImpl<_SetConfirmDialogDefault>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetConfirmDialogDefault&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setConfirmDialogDefault(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetConfirmDialogDefaultCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetConfirmDialogDefaultCopyWith(_SetConfirmDialogDefault value, $Res Function(_SetConfirmDialogDefault) _then) = __$SetConfirmDialogDefaultCopyWithImpl;
@useResult
$Res call({
 String? color
});




}
/// @nodoc
class __$SetConfirmDialogDefaultCopyWithImpl<$Res>
    implements _$SetConfirmDialogDefaultCopyWith<$Res> {
  __$SetConfirmDialogDefaultCopyWithImpl(this._self, this._then);

  final _SetConfirmDialogDefault _self;
  final $Res Function(_SetConfirmDialogDefault) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = freezed,}) {
  return _then(_SetConfirmDialogDefault(
freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SetSnackBar implements ThemeWidgetEvent {
  const _SetSnackBar(this.cfg);
  

 final  SnackBarWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetSnackBarCopyWith<_SetSnackBar> get copyWith => __$SetSnackBarCopyWithImpl<_SetSnackBar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetSnackBar&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setSnackBar(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetSnackBarCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetSnackBarCopyWith(_SetSnackBar value, $Res Function(_SetSnackBar) _then) = __$SetSnackBarCopyWithImpl;
@useResult
$Res call({
 SnackBarWidgetConfig cfg
});


$SnackBarWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetSnackBarCopyWithImpl<$Res>
    implements _$SetSnackBarCopyWith<$Res> {
  __$SetSnackBarCopyWithImpl(this._self, this._then);

  final _SetSnackBar _self;
  final $Res Function(_SetSnackBar) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetSnackBar(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as SnackBarWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnackBarWidgetConfigCopyWith<$Res> get cfg {
  
  return $SnackBarWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetStatuses implements ThemeWidgetEvent {
  const _SetStatuses(this.cfg);
  

 final  StatusesWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetStatusesCopyWith<_SetStatuses> get copyWith => __$SetStatusesCopyWithImpl<_SetStatuses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetStatuses&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setStatuses(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetStatusesCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetStatusesCopyWith(_SetStatuses value, $Res Function(_SetStatuses) _then) = __$SetStatusesCopyWithImpl;
@useResult
$Res call({
 StatusesWidgetConfig cfg
});


$StatusesWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetStatusesCopyWithImpl<$Res>
    implements _$SetStatusesCopyWith<$Res> {
  __$SetStatusesCopyWithImpl(this._self, this._then);

  final _SetStatuses _self;
  final $Res Function(_SetStatuses) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetStatuses(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as StatusesWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusesWidgetConfigCopyWith<$Res> get cfg {
  
  return $StatusesWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetRegistrationStatuses implements ThemeWidgetEvent {
  const _SetRegistrationStatuses(this.cfg);
  

 final  RegistrationStatusesWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetRegistrationStatusesCopyWith<_SetRegistrationStatuses> get copyWith => __$SetRegistrationStatusesCopyWithImpl<_SetRegistrationStatuses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetRegistrationStatuses&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setRegistrationStatuses(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetRegistrationStatusesCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetRegistrationStatusesCopyWith(_SetRegistrationStatuses value, $Res Function(_SetRegistrationStatuses) _then) = __$SetRegistrationStatusesCopyWithImpl;
@useResult
$Res call({
 RegistrationStatusesWidgetConfig cfg
});


$RegistrationStatusesWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetRegistrationStatusesCopyWithImpl<$Res>
    implements _$SetRegistrationStatusesCopyWith<$Res> {
  __$SetRegistrationStatusesCopyWithImpl(this._self, this._then);

  final _SetRegistrationStatuses _self;
  final $Res Function(_SetRegistrationStatuses) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetRegistrationStatuses(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as RegistrationStatusesWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationStatusesWidgetConfigCopyWith<$Res> get cfg {
  
  return $RegistrationStatusesWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetRegistrationOnline implements ThemeWidgetEvent {
  const _SetRegistrationOnline(this.color);
  

 final  String color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetRegistrationOnlineCopyWith<_SetRegistrationOnline> get copyWith => __$SetRegistrationOnlineCopyWithImpl<_SetRegistrationOnline>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetRegistrationOnline&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setRegistrationOnline(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetRegistrationOnlineCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetRegistrationOnlineCopyWith(_SetRegistrationOnline value, $Res Function(_SetRegistrationOnline) _then) = __$SetRegistrationOnlineCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class __$SetRegistrationOnlineCopyWithImpl<$Res>
    implements _$SetRegistrationOnlineCopyWith<$Res> {
  __$SetRegistrationOnlineCopyWithImpl(this._self, this._then);

  final _SetRegistrationOnline _self;
  final $Res Function(_SetRegistrationOnline) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetRegistrationOnline(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetRegistrationOffline implements ThemeWidgetEvent {
  const _SetRegistrationOffline(this.color);
  

 final  String color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetRegistrationOfflineCopyWith<_SetRegistrationOffline> get copyWith => __$SetRegistrationOfflineCopyWithImpl<_SetRegistrationOffline>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetRegistrationOffline&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setRegistrationOffline(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetRegistrationOfflineCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetRegistrationOfflineCopyWith(_SetRegistrationOffline value, $Res Function(_SetRegistrationOffline) _then) = __$SetRegistrationOfflineCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class __$SetRegistrationOfflineCopyWithImpl<$Res>
    implements _$SetRegistrationOfflineCopyWith<$Res> {
  __$SetRegistrationOfflineCopyWithImpl(this._self, this._then);

  final _SetRegistrationOffline _self;
  final $Res Function(_SetRegistrationOffline) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetRegistrationOffline(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetCallStatuses implements ThemeWidgetEvent {
  const _SetCallStatuses(this.cfg);
  

 final  CallStatusesWidgetConfig cfg;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallStatusesCopyWith<_SetCallStatuses> get copyWith => __$SetCallStatusesCopyWithImpl<_SetCallStatuses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallStatuses&&(identical(other.cfg, cfg) || other.cfg == cfg));
}


@override
int get hashCode => Object.hash(runtimeType,cfg);

@override
String toString() {
  return 'ThemeWidgetEvent.setCallStatuses(cfg: $cfg)';
}


}

/// @nodoc
abstract mixin class _$SetCallStatusesCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetCallStatusesCopyWith(_SetCallStatuses value, $Res Function(_SetCallStatuses) _then) = __$SetCallStatusesCopyWithImpl;
@useResult
$Res call({
 CallStatusesWidgetConfig cfg
});


$CallStatusesWidgetConfigCopyWith<$Res> get cfg;

}
/// @nodoc
class __$SetCallStatusesCopyWithImpl<$Res>
    implements _$SetCallStatusesCopyWith<$Res> {
  __$SetCallStatusesCopyWithImpl(this._self, this._then);

  final _SetCallStatuses _self;
  final $Res Function(_SetCallStatuses) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cfg = null,}) {
  return _then(_SetCallStatuses(
null == cfg ? _self.cfg : cfg // ignore: cast_nullable_to_non_nullable
as CallStatusesWidgetConfig,
  ));
}

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CallStatusesWidgetConfigCopyWith<$Res> get cfg {
  
  return $CallStatusesWidgetConfigCopyWith<$Res>(_self.cfg, (value) {
    return _then(_self.copyWith(cfg: value));
  });
}
}

/// @nodoc


class _SetCallStatusesConnectivityNone implements ThemeWidgetEvent {
  const _SetCallStatusesConnectivityNone(this.color);
  

 final  String color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallStatusesConnectivityNoneCopyWith<_SetCallStatusesConnectivityNone> get copyWith => __$SetCallStatusesConnectivityNoneCopyWithImpl<_SetCallStatusesConnectivityNone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallStatusesConnectivityNone&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setCallStatusesConnectivityNone(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetCallStatusesConnectivityNoneCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetCallStatusesConnectivityNoneCopyWith(_SetCallStatusesConnectivityNone value, $Res Function(_SetCallStatusesConnectivityNone) _then) = __$SetCallStatusesConnectivityNoneCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class __$SetCallStatusesConnectivityNoneCopyWithImpl<$Res>
    implements _$SetCallStatusesConnectivityNoneCopyWith<$Res> {
  __$SetCallStatusesConnectivityNoneCopyWithImpl(this._self, this._then);

  final _SetCallStatusesConnectivityNone _self;
  final $Res Function(_SetCallStatusesConnectivityNone) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetCallStatusesConnectivityNone(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetCallStatusesConnectError implements ThemeWidgetEvent {
  const _SetCallStatusesConnectError(this.color);
  

 final  String color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallStatusesConnectErrorCopyWith<_SetCallStatusesConnectError> get copyWith => __$SetCallStatusesConnectErrorCopyWithImpl<_SetCallStatusesConnectError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallStatusesConnectError&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setCallStatusesConnectError(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetCallStatusesConnectErrorCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetCallStatusesConnectErrorCopyWith(_SetCallStatusesConnectError value, $Res Function(_SetCallStatusesConnectError) _then) = __$SetCallStatusesConnectErrorCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class __$SetCallStatusesConnectErrorCopyWithImpl<$Res>
    implements _$SetCallStatusesConnectErrorCopyWith<$Res> {
  __$SetCallStatusesConnectErrorCopyWithImpl(this._self, this._then);

  final _SetCallStatusesConnectError _self;
  final $Res Function(_SetCallStatusesConnectError) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetCallStatusesConnectError(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetCallStatusesAppUnregistered implements ThemeWidgetEvent {
  const _SetCallStatusesAppUnregistered(this.color);
  

 final  String color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallStatusesAppUnregisteredCopyWith<_SetCallStatusesAppUnregistered> get copyWith => __$SetCallStatusesAppUnregisteredCopyWithImpl<_SetCallStatusesAppUnregistered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallStatusesAppUnregistered&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setCallStatusesAppUnregistered(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetCallStatusesAppUnregisteredCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetCallStatusesAppUnregisteredCopyWith(_SetCallStatusesAppUnregistered value, $Res Function(_SetCallStatusesAppUnregistered) _then) = __$SetCallStatusesAppUnregisteredCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class __$SetCallStatusesAppUnregisteredCopyWithImpl<$Res>
    implements _$SetCallStatusesAppUnregisteredCopyWith<$Res> {
  __$SetCallStatusesAppUnregisteredCopyWithImpl(this._self, this._then);

  final _SetCallStatusesAppUnregistered _self;
  final $Res Function(_SetCallStatusesAppUnregistered) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetCallStatusesAppUnregistered(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetCallStatusesConnectIssue implements ThemeWidgetEvent {
  const _SetCallStatusesConnectIssue(this.color);
  

 final  String color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallStatusesConnectIssueCopyWith<_SetCallStatusesConnectIssue> get copyWith => __$SetCallStatusesConnectIssueCopyWithImpl<_SetCallStatusesConnectIssue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallStatusesConnectIssue&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setCallStatusesConnectIssue(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetCallStatusesConnectIssueCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetCallStatusesConnectIssueCopyWith(_SetCallStatusesConnectIssue value, $Res Function(_SetCallStatusesConnectIssue) _then) = __$SetCallStatusesConnectIssueCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class __$SetCallStatusesConnectIssueCopyWithImpl<$Res>
    implements _$SetCallStatusesConnectIssueCopyWith<$Res> {
  __$SetCallStatusesConnectIssueCopyWithImpl(this._self, this._then);

  final _SetCallStatusesConnectIssue _self;
  final $Res Function(_SetCallStatusesConnectIssue) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetCallStatusesConnectIssue(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetCallStatusesInProgress implements ThemeWidgetEvent {
  const _SetCallStatusesInProgress(this.color);
  

 final  String color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallStatusesInProgressCopyWith<_SetCallStatusesInProgress> get copyWith => __$SetCallStatusesInProgressCopyWithImpl<_SetCallStatusesInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallStatusesInProgress&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setCallStatusesInProgress(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetCallStatusesInProgressCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetCallStatusesInProgressCopyWith(_SetCallStatusesInProgress value, $Res Function(_SetCallStatusesInProgress) _then) = __$SetCallStatusesInProgressCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class __$SetCallStatusesInProgressCopyWithImpl<$Res>
    implements _$SetCallStatusesInProgressCopyWith<$Res> {
  __$SetCallStatusesInProgressCopyWithImpl(this._self, this._then);

  final _SetCallStatusesInProgress _self;
  final $Res Function(_SetCallStatusesInProgress) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetCallStatusesInProgress(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetCallStatusesReady implements ThemeWidgetEvent {
  const _SetCallStatusesReady(this.color);
  

 final  String color;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCallStatusesReadyCopyWith<_SetCallStatusesReady> get copyWith => __$SetCallStatusesReadyCopyWithImpl<_SetCallStatusesReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCallStatusesReady&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'ThemeWidgetEvent.setCallStatusesReady(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetCallStatusesReadyCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$SetCallStatusesReadyCopyWith(_SetCallStatusesReady value, $Res Function(_SetCallStatusesReady) _then) = __$SetCallStatusesReadyCopyWithImpl;
@useResult
$Res call({
 String color
});




}
/// @nodoc
class __$SetCallStatusesReadyCopyWithImpl<$Res>
    implements _$SetCallStatusesReadyCopyWith<$Res> {
  __$SetCallStatusesReadyCopyWithImpl(this._self, this._then);

  final _SetCallStatusesReady _self;
  final $Res Function(_SetCallStatusesReady) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetCallStatusesReady(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ImportJsonWidgetEvent implements ThemeWidgetEvent {
  const _ImportJsonWidgetEvent(final  Map<String, dynamic> json): _json = json;
  

 final  Map<String, dynamic> _json;
 Map<String, dynamic> get json {
  if (_json is EqualUnmodifiableMapView) return _json;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_json);
}


/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportJsonWidgetEventCopyWith<_ImportJsonWidgetEvent> get copyWith => __$ImportJsonWidgetEventCopyWithImpl<_ImportJsonWidgetEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportJsonWidgetEvent&&const DeepCollectionEquality().equals(other._json, _json));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_json));

@override
String toString() {
  return 'ThemeWidgetEvent.importJson(json: $json)';
}


}

/// @nodoc
abstract mixin class _$ImportJsonWidgetEventCopyWith<$Res> implements $ThemeWidgetEventCopyWith<$Res> {
  factory _$ImportJsonWidgetEventCopyWith(_ImportJsonWidgetEvent value, $Res Function(_ImportJsonWidgetEvent) _then) = __$ImportJsonWidgetEventCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> json
});




}
/// @nodoc
class __$ImportJsonWidgetEventCopyWithImpl<$Res>
    implements _$ImportJsonWidgetEventCopyWith<$Res> {
  __$ImportJsonWidgetEventCopyWithImpl(this._self, this._then);

  final _ImportJsonWidgetEvent _self;
  final $Res Function(_ImportJsonWidgetEvent) _then;

/// Create a copy of ThemeWidgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? json = null,}) {
  return _then(_ImportJsonWidgetEvent(
null == json ? _self._json : json // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$UpdateVariantEvent {

 BrightnessVariant get variant;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateVariantEvent&&(identical(other.variant, variant) || other.variant == variant));
}


@override
int get hashCode => Object.hash(runtimeType,variant);

@override
String toString() {
  return 'UpdateVariantEvent(variant: $variant)';
}


}




/// Adds pattern-matching-related methods to [UpdateVariantEvent].
extension UpdateVariantEventPatterns on UpdateVariantEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateVariantEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateVariantEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateVariantEvent value)  $default,){
final _that = this;
switch (_that) {
case _UpdateVariantEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateVariantEvent value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateVariantEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BrightnessVariant variant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateVariantEvent() when $default != null:
return $default(_that.variant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BrightnessVariant variant)  $default,) {final _that = this;
switch (_that) {
case _UpdateVariantEvent():
return $default(_that.variant);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BrightnessVariant variant)?  $default,) {final _that = this;
switch (_that) {
case _UpdateVariantEvent() when $default != null:
return $default(_that.variant);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateVariantEvent implements UpdateVariantEvent {
  const _UpdateVariantEvent(this.variant);
  

@override final  BrightnessVariant variant;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateVariantEvent&&(identical(other.variant, variant) || other.variant == variant));
}


@override
int get hashCode => Object.hash(runtimeType,variant);

@override
String toString() {
  return 'UpdateVariantEvent(variant: $variant)';
}


}




/// @nodoc
mixin _$ResourcesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourcesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResourcesEvent()';
}


}

/// @nodoc
class $ResourcesEventCopyWith<$Res>  {
$ResourcesEventCopyWith(ResourcesEvent _, $Res Function(ResourcesEvent) __);
}


/// Adds pattern-matching-related methods to [ResourcesEvent].
extension ResourcesEventPatterns on ResourcesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AssetsUpdated value)?  assetsUpdated,TResult Function( _EmbedsUpdated value)?  embedsUpdated,TResult Function( _ResourcesStreamFailed value)?  streamFailed,TResult Function( _RetryStream value)?  retryStream,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetsUpdated() when assetsUpdated != null:
return assetsUpdated(_that);case _EmbedsUpdated() when embedsUpdated != null:
return embedsUpdated(_that);case _ResourcesStreamFailed() when streamFailed != null:
return streamFailed(_that);case _RetryStream() when retryStream != null:
return retryStream(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AssetsUpdated value)  assetsUpdated,required TResult Function( _EmbedsUpdated value)  embedsUpdated,required TResult Function( _ResourcesStreamFailed value)  streamFailed,required TResult Function( _RetryStream value)  retryStream,}){
final _that = this;
switch (_that) {
case _AssetsUpdated():
return assetsUpdated(_that);case _EmbedsUpdated():
return embedsUpdated(_that);case _ResourcesStreamFailed():
return streamFailed(_that);case _RetryStream():
return retryStream(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AssetsUpdated value)?  assetsUpdated,TResult? Function( _EmbedsUpdated value)?  embedsUpdated,TResult? Function( _ResourcesStreamFailed value)?  streamFailed,TResult? Function( _RetryStream value)?  retryStream,}){
final _that = this;
switch (_that) {
case _AssetsUpdated() when assetsUpdated != null:
return assetsUpdated(_that);case _EmbedsUpdated() when embedsUpdated != null:
return embedsUpdated(_that);case _ResourcesStreamFailed() when streamFailed != null:
return streamFailed(_that);case _RetryStream() when retryStream != null:
return retryStream(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<AssetModel> assets)?  assetsUpdated,TResult Function( List<EmbeddedResourceModel> embeds)?  embedsUpdated,TResult Function( String source,  Object error,  StackTrace? stackTrace)?  streamFailed,TResult Function( String source)?  retryStream,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetsUpdated() when assetsUpdated != null:
return assetsUpdated(_that.assets);case _EmbedsUpdated() when embedsUpdated != null:
return embedsUpdated(_that.embeds);case _ResourcesStreamFailed() when streamFailed != null:
return streamFailed(_that.source,_that.error,_that.stackTrace);case _RetryStream() when retryStream != null:
return retryStream(_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<AssetModel> assets)  assetsUpdated,required TResult Function( List<EmbeddedResourceModel> embeds)  embedsUpdated,required TResult Function( String source,  Object error,  StackTrace? stackTrace)  streamFailed,required TResult Function( String source)  retryStream,}) {final _that = this;
switch (_that) {
case _AssetsUpdated():
return assetsUpdated(_that.assets);case _EmbedsUpdated():
return embedsUpdated(_that.embeds);case _ResourcesStreamFailed():
return streamFailed(_that.source,_that.error,_that.stackTrace);case _RetryStream():
return retryStream(_that.source);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<AssetModel> assets)?  assetsUpdated,TResult? Function( List<EmbeddedResourceModel> embeds)?  embedsUpdated,TResult? Function( String source,  Object error,  StackTrace? stackTrace)?  streamFailed,TResult? Function( String source)?  retryStream,}) {final _that = this;
switch (_that) {
case _AssetsUpdated() when assetsUpdated != null:
return assetsUpdated(_that.assets);case _EmbedsUpdated() when embedsUpdated != null:
return embedsUpdated(_that.embeds);case _ResourcesStreamFailed() when streamFailed != null:
return streamFailed(_that.source,_that.error,_that.stackTrace);case _RetryStream() when retryStream != null:
return retryStream(_that.source);case _:
  return null;

}
}

}

/// @nodoc


class _AssetsUpdated implements ResourcesEvent {
  const _AssetsUpdated(final  List<AssetModel> assets): _assets = assets;
  

 final  List<AssetModel> _assets;
 List<AssetModel> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}


/// Create a copy of ResourcesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetsUpdatedCopyWith<_AssetsUpdated> get copyWith => __$AssetsUpdatedCopyWithImpl<_AssetsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetsUpdated&&const DeepCollectionEquality().equals(other._assets, _assets));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_assets));

@override
String toString() {
  return 'ResourcesEvent.assetsUpdated(assets: $assets)';
}


}

/// @nodoc
abstract mixin class _$AssetsUpdatedCopyWith<$Res> implements $ResourcesEventCopyWith<$Res> {
  factory _$AssetsUpdatedCopyWith(_AssetsUpdated value, $Res Function(_AssetsUpdated) _then) = __$AssetsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<AssetModel> assets
});




}
/// @nodoc
class __$AssetsUpdatedCopyWithImpl<$Res>
    implements _$AssetsUpdatedCopyWith<$Res> {
  __$AssetsUpdatedCopyWithImpl(this._self, this._then);

  final _AssetsUpdated _self;
  final $Res Function(_AssetsUpdated) _then;

/// Create a copy of ResourcesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? assets = null,}) {
  return _then(_AssetsUpdated(
null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as List<AssetModel>,
  ));
}


}

/// @nodoc


class _EmbedsUpdated implements ResourcesEvent {
  const _EmbedsUpdated(final  List<EmbeddedResourceModel> embeds): _embeds = embeds;
  

 final  List<EmbeddedResourceModel> _embeds;
 List<EmbeddedResourceModel> get embeds {
  if (_embeds is EqualUnmodifiableListView) return _embeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_embeds);
}


/// Create a copy of ResourcesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmbedsUpdatedCopyWith<_EmbedsUpdated> get copyWith => __$EmbedsUpdatedCopyWithImpl<_EmbedsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmbedsUpdated&&const DeepCollectionEquality().equals(other._embeds, _embeds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_embeds));

@override
String toString() {
  return 'ResourcesEvent.embedsUpdated(embeds: $embeds)';
}


}

/// @nodoc
abstract mixin class _$EmbedsUpdatedCopyWith<$Res> implements $ResourcesEventCopyWith<$Res> {
  factory _$EmbedsUpdatedCopyWith(_EmbedsUpdated value, $Res Function(_EmbedsUpdated) _then) = __$EmbedsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<EmbeddedResourceModel> embeds
});




}
/// @nodoc
class __$EmbedsUpdatedCopyWithImpl<$Res>
    implements _$EmbedsUpdatedCopyWith<$Res> {
  __$EmbedsUpdatedCopyWithImpl(this._self, this._then);

  final _EmbedsUpdated _self;
  final $Res Function(_EmbedsUpdated) _then;

/// Create a copy of ResourcesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? embeds = null,}) {
  return _then(_EmbedsUpdated(
null == embeds ? _self._embeds : embeds // ignore: cast_nullable_to_non_nullable
as List<EmbeddedResourceModel>,
  ));
}


}

/// @nodoc


class _ResourcesStreamFailed implements ResourcesEvent {
  const _ResourcesStreamFailed({required this.source, required this.error, this.stackTrace});
  

 final  String source;
// 'assets' | 'embeds' | etc.
 final  Object error;
 final  StackTrace? stackTrace;

/// Create a copy of ResourcesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourcesStreamFailedCopyWith<_ResourcesStreamFailed> get copyWith => __$ResourcesStreamFailedCopyWithImpl<_ResourcesStreamFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourcesStreamFailed&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,source,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString() {
  return 'ResourcesEvent.streamFailed(source: $source, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class _$ResourcesStreamFailedCopyWith<$Res> implements $ResourcesEventCopyWith<$Res> {
  factory _$ResourcesStreamFailedCopyWith(_ResourcesStreamFailed value, $Res Function(_ResourcesStreamFailed) _then) = __$ResourcesStreamFailedCopyWithImpl;
@useResult
$Res call({
 String source, Object error, StackTrace? stackTrace
});




}
/// @nodoc
class __$ResourcesStreamFailedCopyWithImpl<$Res>
    implements _$ResourcesStreamFailedCopyWith<$Res> {
  __$ResourcesStreamFailedCopyWithImpl(this._self, this._then);

  final _ResourcesStreamFailed _self;
  final $Res Function(_ResourcesStreamFailed) _then;

/// Create a copy of ResourcesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = null,Object? error = null,Object? stackTrace = freezed,}) {
  return _then(_ResourcesStreamFailed(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

/// @nodoc


class _RetryStream implements ResourcesEvent {
  const _RetryStream(this.source);
  

 final  String source;

/// Create a copy of ResourcesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetryStreamCopyWith<_RetryStream> get copyWith => __$RetryStreamCopyWithImpl<_RetryStream>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryStream&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,source);

@override
String toString() {
  return 'ResourcesEvent.retryStream(source: $source)';
}


}

/// @nodoc
abstract mixin class _$RetryStreamCopyWith<$Res> implements $ResourcesEventCopyWith<$Res> {
  factory _$RetryStreamCopyWith(_RetryStream value, $Res Function(_RetryStream) _then) = __$RetryStreamCopyWithImpl;
@useResult
$Res call({
 String source
});




}
/// @nodoc
class __$RetryStreamCopyWithImpl<$Res>
    implements _$RetryStreamCopyWith<$Res> {
  __$RetryStreamCopyWithImpl(this._self, this._then);

  final _RetryStream _self;
  final $Res Function(_RetryStream) _then;

/// Create a copy of ResourcesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? source = null,}) {
  return _then(_RetryStream(
null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LoadingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingEvent()';
}


}

/// @nodoc
class $LoadingEventCopyWith<$Res>  {
$LoadingEventCopyWith(LoadingEvent _, $Res Function(LoadingEvent) __);
}


/// Adds pattern-matching-related methods to [LoadingEvent].
extension LoadingEventPatterns on LoadingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadingSetStatus value)?  setStatus,TResult Function( _LoadingMarkLoaded value)?  markLoaded,TResult Function( _LoadingSetLoaded value)?  setLoaded,TResult Function( _LoadingReset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadingSetStatus() when setStatus != null:
return setStatus(_that);case _LoadingMarkLoaded() when markLoaded != null:
return markLoaded(_that);case _LoadingSetLoaded() when setLoaded != null:
return setLoaded(_that);case _LoadingReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadingSetStatus value)  setStatus,required TResult Function( _LoadingMarkLoaded value)  markLoaded,required TResult Function( _LoadingSetLoaded value)  setLoaded,required TResult Function( _LoadingReset value)  reset,}){
final _that = this;
switch (_that) {
case _LoadingSetStatus():
return setStatus(_that);case _LoadingMarkLoaded():
return markLoaded(_that);case _LoadingSetLoaded():
return setLoaded(_that);case _LoadingReset():
return reset(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadingSetStatus value)?  setStatus,TResult? Function( _LoadingMarkLoaded value)?  markLoaded,TResult? Function( _LoadingSetLoaded value)?  setLoaded,TResult? Function( _LoadingReset value)?  reset,}){
final _that = this;
switch (_that) {
case _LoadingSetStatus() when setStatus != null:
return setStatus(_that);case _LoadingMarkLoaded() when markLoaded != null:
return markLoaded(_that);case _LoadingSetLoaded() when setLoaded != null:
return setLoaded(_that);case _LoadingReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ThemePropertyStatus? status)?  setStatus,TResult Function( ThemeComponents component)?  markLoaded,TResult Function( List<ThemeComponents> components)?  setLoaded,TResult Function( ThemePropertyStatus? status)?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadingSetStatus() when setStatus != null:
return setStatus(_that.status);case _LoadingMarkLoaded() when markLoaded != null:
return markLoaded(_that.component);case _LoadingSetLoaded() when setLoaded != null:
return setLoaded(_that.components);case _LoadingReset() when reset != null:
return reset(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ThemePropertyStatus? status)  setStatus,required TResult Function( ThemeComponents component)  markLoaded,required TResult Function( List<ThemeComponents> components)  setLoaded,required TResult Function( ThemePropertyStatus? status)  reset,}) {final _that = this;
switch (_that) {
case _LoadingSetStatus():
return setStatus(_that.status);case _LoadingMarkLoaded():
return markLoaded(_that.component);case _LoadingSetLoaded():
return setLoaded(_that.components);case _LoadingReset():
return reset(_that.status);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ThemePropertyStatus? status)?  setStatus,TResult? Function( ThemeComponents component)?  markLoaded,TResult? Function( List<ThemeComponents> components)?  setLoaded,TResult? Function( ThemePropertyStatus? status)?  reset,}) {final _that = this;
switch (_that) {
case _LoadingSetStatus() when setStatus != null:
return setStatus(_that.status);case _LoadingMarkLoaded() when markLoaded != null:
return markLoaded(_that.component);case _LoadingSetLoaded() when setLoaded != null:
return setLoaded(_that.components);case _LoadingReset() when reset != null:
return reset(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _LoadingSetStatus implements LoadingEvent {
  const _LoadingSetStatus(this.status);
  

 final  ThemePropertyStatus? status;

/// Create a copy of LoadingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingSetStatusCopyWith<_LoadingSetStatus> get copyWith => __$LoadingSetStatusCopyWithImpl<_LoadingSetStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingSetStatus&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'LoadingEvent.setStatus(status: $status)';
}


}

/// @nodoc
abstract mixin class _$LoadingSetStatusCopyWith<$Res> implements $LoadingEventCopyWith<$Res> {
  factory _$LoadingSetStatusCopyWith(_LoadingSetStatus value, $Res Function(_LoadingSetStatus) _then) = __$LoadingSetStatusCopyWithImpl;
@useResult
$Res call({
 ThemePropertyStatus? status
});




}
/// @nodoc
class __$LoadingSetStatusCopyWithImpl<$Res>
    implements _$LoadingSetStatusCopyWith<$Res> {
  __$LoadingSetStatusCopyWithImpl(this._self, this._then);

  final _LoadingSetStatus _self;
  final $Res Function(_LoadingSetStatus) _then;

/// Create a copy of LoadingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(_LoadingSetStatus(
freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemePropertyStatus?,
  ));
}


}

/// @nodoc


class _LoadingMarkLoaded implements LoadingEvent {
  const _LoadingMarkLoaded(this.component);
  

 final  ThemeComponents component;

/// Create a copy of LoadingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingMarkLoadedCopyWith<_LoadingMarkLoaded> get copyWith => __$LoadingMarkLoadedCopyWithImpl<_LoadingMarkLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingMarkLoaded&&(identical(other.component, component) || other.component == component));
}


@override
int get hashCode => Object.hash(runtimeType,component);

@override
String toString() {
  return 'LoadingEvent.markLoaded(component: $component)';
}


}

/// @nodoc
abstract mixin class _$LoadingMarkLoadedCopyWith<$Res> implements $LoadingEventCopyWith<$Res> {
  factory _$LoadingMarkLoadedCopyWith(_LoadingMarkLoaded value, $Res Function(_LoadingMarkLoaded) _then) = __$LoadingMarkLoadedCopyWithImpl;
@useResult
$Res call({
 ThemeComponents component
});




}
/// @nodoc
class __$LoadingMarkLoadedCopyWithImpl<$Res>
    implements _$LoadingMarkLoadedCopyWith<$Res> {
  __$LoadingMarkLoadedCopyWithImpl(this._self, this._then);

  final _LoadingMarkLoaded _self;
  final $Res Function(_LoadingMarkLoaded) _then;

/// Create a copy of LoadingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? component = null,}) {
  return _then(_LoadingMarkLoaded(
null == component ? _self.component : component // ignore: cast_nullable_to_non_nullable
as ThemeComponents,
  ));
}


}

/// @nodoc


class _LoadingSetLoaded implements LoadingEvent {
  const _LoadingSetLoaded(final  List<ThemeComponents> components): _components = components;
  

 final  List<ThemeComponents> _components;
 List<ThemeComponents> get components {
  if (_components is EqualUnmodifiableListView) return _components;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_components);
}


/// Create a copy of LoadingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingSetLoadedCopyWith<_LoadingSetLoaded> get copyWith => __$LoadingSetLoadedCopyWithImpl<_LoadingSetLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingSetLoaded&&const DeepCollectionEquality().equals(other._components, _components));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_components));

@override
String toString() {
  return 'LoadingEvent.setLoaded(components: $components)';
}


}

/// @nodoc
abstract mixin class _$LoadingSetLoadedCopyWith<$Res> implements $LoadingEventCopyWith<$Res> {
  factory _$LoadingSetLoadedCopyWith(_LoadingSetLoaded value, $Res Function(_LoadingSetLoaded) _then) = __$LoadingSetLoadedCopyWithImpl;
@useResult
$Res call({
 List<ThemeComponents> components
});




}
/// @nodoc
class __$LoadingSetLoadedCopyWithImpl<$Res>
    implements _$LoadingSetLoadedCopyWith<$Res> {
  __$LoadingSetLoadedCopyWithImpl(this._self, this._then);

  final _LoadingSetLoaded _self;
  final $Res Function(_LoadingSetLoaded) _then;

/// Create a copy of LoadingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? components = null,}) {
  return _then(_LoadingSetLoaded(
null == components ? _self._components : components // ignore: cast_nullable_to_non_nullable
as List<ThemeComponents>,
  ));
}


}

/// @nodoc


class _LoadingReset implements LoadingEvent {
  const _LoadingReset({this.status});
  

 final  ThemePropertyStatus? status;

/// Create a copy of LoadingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingResetCopyWith<_LoadingReset> get copyWith => __$LoadingResetCopyWithImpl<_LoadingReset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingReset&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'LoadingEvent.reset(status: $status)';
}


}

/// @nodoc
abstract mixin class _$LoadingResetCopyWith<$Res> implements $LoadingEventCopyWith<$Res> {
  factory _$LoadingResetCopyWith(_LoadingReset value, $Res Function(_LoadingReset) _then) = __$LoadingResetCopyWithImpl;
@useResult
$Res call({
 ThemePropertyStatus? status
});




}
/// @nodoc
class __$LoadingResetCopyWithImpl<$Res>
    implements _$LoadingResetCopyWith<$Res> {
  __$LoadingResetCopyWithImpl(this._self, this._then);

  final _LoadingReset _self;
  final $Res Function(_LoadingReset) _then;

/// Create a copy of LoadingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(_LoadingReset(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemePropertyStatus?,
  ));
}


}

// dart format on
