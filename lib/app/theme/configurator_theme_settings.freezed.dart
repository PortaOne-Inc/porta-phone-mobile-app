// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configurator_theme_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfiguratorThemeSettings {

 Color get seedColor; ConfiguratorColorSchemeOverride? get lightColorSchemeOverride; ConfiguratorColorSchemeOverride? get darkColorSchemeOverride; String? get fontFamily;
/// Create a copy of ConfiguratorThemeSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfiguratorThemeSettingsCopyWith<ConfiguratorThemeSettings> get copyWith => _$ConfiguratorThemeSettingsCopyWithImpl<ConfiguratorThemeSettings>(this as ConfiguratorThemeSettings, _$identity);

  /// Serializes this ConfiguratorThemeSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfiguratorThemeSettings&&(identical(other.seedColor, seedColor) || other.seedColor == seedColor)&&(identical(other.lightColorSchemeOverride, lightColorSchemeOverride) || other.lightColorSchemeOverride == lightColorSchemeOverride)&&(identical(other.darkColorSchemeOverride, darkColorSchemeOverride) || other.darkColorSchemeOverride == darkColorSchemeOverride)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seedColor,lightColorSchemeOverride,darkColorSchemeOverride,fontFamily);

@override
String toString() {
  return 'ConfiguratorThemeSettings(seedColor: $seedColor, lightColorSchemeOverride: $lightColorSchemeOverride, darkColorSchemeOverride: $darkColorSchemeOverride, fontFamily: $fontFamily)';
}


}

/// @nodoc
abstract mixin class $ConfiguratorThemeSettingsCopyWith<$Res>  {
  factory $ConfiguratorThemeSettingsCopyWith(ConfiguratorThemeSettings value, $Res Function(ConfiguratorThemeSettings) _then) = _$ConfiguratorThemeSettingsCopyWithImpl;
@useResult
$Res call({
 Color seedColor, ConfiguratorColorSchemeOverride? lightColorSchemeOverride, ConfiguratorColorSchemeOverride? darkColorSchemeOverride, String? fontFamily
});


$ConfiguratorColorSchemeOverrideCopyWith<$Res>? get lightColorSchemeOverride;$ConfiguratorColorSchemeOverrideCopyWith<$Res>? get darkColorSchemeOverride;

}
/// @nodoc
class _$ConfiguratorThemeSettingsCopyWithImpl<$Res>
    implements $ConfiguratorThemeSettingsCopyWith<$Res> {
  _$ConfiguratorThemeSettingsCopyWithImpl(this._self, this._then);

  final ConfiguratorThemeSettings _self;
  final $Res Function(ConfiguratorThemeSettings) _then;

/// Create a copy of ConfiguratorThemeSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seedColor = null,Object? lightColorSchemeOverride = freezed,Object? darkColorSchemeOverride = freezed,Object? fontFamily = freezed,}) {
  return _then(_self.copyWith(
seedColor: null == seedColor ? _self.seedColor : seedColor // ignore: cast_nullable_to_non_nullable
as Color,lightColorSchemeOverride: freezed == lightColorSchemeOverride ? _self.lightColorSchemeOverride : lightColorSchemeOverride // ignore: cast_nullable_to_non_nullable
as ConfiguratorColorSchemeOverride?,darkColorSchemeOverride: freezed == darkColorSchemeOverride ? _self.darkColorSchemeOverride : darkColorSchemeOverride // ignore: cast_nullable_to_non_nullable
as ConfiguratorColorSchemeOverride?,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ConfiguratorThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfiguratorColorSchemeOverrideCopyWith<$Res>? get lightColorSchemeOverride {
    if (_self.lightColorSchemeOverride == null) {
    return null;
  }

  return $ConfiguratorColorSchemeOverrideCopyWith<$Res>(_self.lightColorSchemeOverride!, (value) {
    return _then(_self.copyWith(lightColorSchemeOverride: value));
  });
}/// Create a copy of ConfiguratorThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfiguratorColorSchemeOverrideCopyWith<$Res>? get darkColorSchemeOverride {
    if (_self.darkColorSchemeOverride == null) {
    return null;
  }

  return $ConfiguratorColorSchemeOverrideCopyWith<$Res>(_self.darkColorSchemeOverride!, (value) {
    return _then(_self.copyWith(darkColorSchemeOverride: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConfiguratorThemeSettings].
extension ConfiguratorThemeSettingsPatterns on ConfiguratorThemeSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfiguratorThemeSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfiguratorThemeSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfiguratorThemeSettings value)  $default,){
final _that = this;
switch (_that) {
case _ConfiguratorThemeSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfiguratorThemeSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ConfiguratorThemeSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color seedColor,  ConfiguratorColorSchemeOverride? lightColorSchemeOverride,  ConfiguratorColorSchemeOverride? darkColorSchemeOverride,  String? fontFamily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfiguratorThemeSettings() when $default != null:
return $default(_that.seedColor,_that.lightColorSchemeOverride,_that.darkColorSchemeOverride,_that.fontFamily);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color seedColor,  ConfiguratorColorSchemeOverride? lightColorSchemeOverride,  ConfiguratorColorSchemeOverride? darkColorSchemeOverride,  String? fontFamily)  $default,) {final _that = this;
switch (_that) {
case _ConfiguratorThemeSettings():
return $default(_that.seedColor,_that.lightColorSchemeOverride,_that.darkColorSchemeOverride,_that.fontFamily);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color seedColor,  ConfiguratorColorSchemeOverride? lightColorSchemeOverride,  ConfiguratorColorSchemeOverride? darkColorSchemeOverride,  String? fontFamily)?  $default,) {final _that = this;
switch (_that) {
case _ConfiguratorThemeSettings() when $default != null:
return $default(_that.seedColor,_that.lightColorSchemeOverride,_that.darkColorSchemeOverride,_that.fontFamily);case _:
  return null;

}
}

}

/// @nodoc

@themeJsonSerializable
class _ConfiguratorThemeSettings implements ConfiguratorThemeSettings {
  const _ConfiguratorThemeSettings({required this.seedColor, this.lightColorSchemeOverride, this.darkColorSchemeOverride, this.fontFamily});
  factory _ConfiguratorThemeSettings.fromJson(Map<String, dynamic> json) => _$ConfiguratorThemeSettingsFromJson(json);

@override final  Color seedColor;
@override final  ConfiguratorColorSchemeOverride? lightColorSchemeOverride;
@override final  ConfiguratorColorSchemeOverride? darkColorSchemeOverride;
@override final  String? fontFamily;

/// Create a copy of ConfiguratorThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfiguratorThemeSettingsCopyWith<_ConfiguratorThemeSettings> get copyWith => __$ConfiguratorThemeSettingsCopyWithImpl<_ConfiguratorThemeSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfiguratorThemeSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfiguratorThemeSettings&&(identical(other.seedColor, seedColor) || other.seedColor == seedColor)&&(identical(other.lightColorSchemeOverride, lightColorSchemeOverride) || other.lightColorSchemeOverride == lightColorSchemeOverride)&&(identical(other.darkColorSchemeOverride, darkColorSchemeOverride) || other.darkColorSchemeOverride == darkColorSchemeOverride)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seedColor,lightColorSchemeOverride,darkColorSchemeOverride,fontFamily);

@override
String toString() {
  return 'ConfiguratorThemeSettings(seedColor: $seedColor, lightColorSchemeOverride: $lightColorSchemeOverride, darkColorSchemeOverride: $darkColorSchemeOverride, fontFamily: $fontFamily)';
}


}

/// @nodoc
abstract mixin class _$ConfiguratorThemeSettingsCopyWith<$Res> implements $ConfiguratorThemeSettingsCopyWith<$Res> {
  factory _$ConfiguratorThemeSettingsCopyWith(_ConfiguratorThemeSettings value, $Res Function(_ConfiguratorThemeSettings) _then) = __$ConfiguratorThemeSettingsCopyWithImpl;
@override @useResult
$Res call({
 Color seedColor, ConfiguratorColorSchemeOverride? lightColorSchemeOverride, ConfiguratorColorSchemeOverride? darkColorSchemeOverride, String? fontFamily
});


@override $ConfiguratorColorSchemeOverrideCopyWith<$Res>? get lightColorSchemeOverride;@override $ConfiguratorColorSchemeOverrideCopyWith<$Res>? get darkColorSchemeOverride;

}
/// @nodoc
class __$ConfiguratorThemeSettingsCopyWithImpl<$Res>
    implements _$ConfiguratorThemeSettingsCopyWith<$Res> {
  __$ConfiguratorThemeSettingsCopyWithImpl(this._self, this._then);

  final _ConfiguratorThemeSettings _self;
  final $Res Function(_ConfiguratorThemeSettings) _then;

/// Create a copy of ConfiguratorThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seedColor = null,Object? lightColorSchemeOverride = freezed,Object? darkColorSchemeOverride = freezed,Object? fontFamily = freezed,}) {
  return _then(_ConfiguratorThemeSettings(
seedColor: null == seedColor ? _self.seedColor : seedColor // ignore: cast_nullable_to_non_nullable
as Color,lightColorSchemeOverride: freezed == lightColorSchemeOverride ? _self.lightColorSchemeOverride : lightColorSchemeOverride // ignore: cast_nullable_to_non_nullable
as ConfiguratorColorSchemeOverride?,darkColorSchemeOverride: freezed == darkColorSchemeOverride ? _self.darkColorSchemeOverride : darkColorSchemeOverride // ignore: cast_nullable_to_non_nullable
as ConfiguratorColorSchemeOverride?,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ConfiguratorThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfiguratorColorSchemeOverrideCopyWith<$Res>? get lightColorSchemeOverride {
    if (_self.lightColorSchemeOverride == null) {
    return null;
  }

  return $ConfiguratorColorSchemeOverrideCopyWith<$Res>(_self.lightColorSchemeOverride!, (value) {
    return _then(_self.copyWith(lightColorSchemeOverride: value));
  });
}/// Create a copy of ConfiguratorThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfiguratorColorSchemeOverrideCopyWith<$Res>? get darkColorSchemeOverride {
    if (_self.darkColorSchemeOverride == null) {
    return null;
  }

  return $ConfiguratorColorSchemeOverrideCopyWith<$Res>(_self.darkColorSchemeOverride!, (value) {
    return _then(_self.copyWith(darkColorSchemeOverride: value));
  });
}
}


/// @nodoc
mixin _$ConfiguratorColorSchemeOverride {

 Color? get primary; Color? get onPrimary; Color? get primaryContainer; Color? get onPrimaryContainer; Color? get primaryFixed; Color? get primaryFixedDim; Color? get onPrimaryFixed; Color? get onPrimaryFixedVariant; Color? get secondary; Color? get onSecondary; Color? get secondaryContainer; Color? get onSecondaryContainer; Color? get secondaryFixed; Color? get secondaryFixedDim; Color? get onSecondaryFixed; Color? get onSecondaryFixedVariant; Color? get tertiary; Color? get onTertiary; Color? get tertiaryContainer; Color? get onTertiaryContainer; Color? get tertiaryFixed; Color? get tertiaryFixedDim; Color? get onTertiaryFixed; Color? get onTertiaryFixedVariant; Color? get error; Color? get onError; Color? get errorContainer; Color? get onErrorContainer; Color? get outline; Color? get outlineVariant; Color? get surface; Color? get onSurface; Color? get surfaceDim; Color? get surfaceBright; Color? get surfaceContainerLowest; Color? get surfaceContainerLow; Color? get surfaceContainer; Color? get surfaceContainerHigh; Color? get surfaceContainerHighest; Color? get onSurfaceVariant; Color? get inverseSurface; Color? get onInverseSurface; Color? get inversePrimary; Color? get shadow; Color? get scrim; Color? get surfaceTint;
/// Create a copy of ConfiguratorColorSchemeOverride
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfiguratorColorSchemeOverrideCopyWith<ConfiguratorColorSchemeOverride> get copyWith => _$ConfiguratorColorSchemeOverrideCopyWithImpl<ConfiguratorColorSchemeOverride>(this as ConfiguratorColorSchemeOverride, _$identity);

  /// Serializes this ConfiguratorColorSchemeOverride to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfiguratorColorSchemeOverride&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.onPrimary, onPrimary) || other.onPrimary == onPrimary)&&(identical(other.primaryContainer, primaryContainer) || other.primaryContainer == primaryContainer)&&(identical(other.onPrimaryContainer, onPrimaryContainer) || other.onPrimaryContainer == onPrimaryContainer)&&(identical(other.primaryFixed, primaryFixed) || other.primaryFixed == primaryFixed)&&(identical(other.primaryFixedDim, primaryFixedDim) || other.primaryFixedDim == primaryFixedDim)&&(identical(other.onPrimaryFixed, onPrimaryFixed) || other.onPrimaryFixed == onPrimaryFixed)&&(identical(other.onPrimaryFixedVariant, onPrimaryFixedVariant) || other.onPrimaryFixedVariant == onPrimaryFixedVariant)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.onSecondary, onSecondary) || other.onSecondary == onSecondary)&&(identical(other.secondaryContainer, secondaryContainer) || other.secondaryContainer == secondaryContainer)&&(identical(other.onSecondaryContainer, onSecondaryContainer) || other.onSecondaryContainer == onSecondaryContainer)&&(identical(other.secondaryFixed, secondaryFixed) || other.secondaryFixed == secondaryFixed)&&(identical(other.secondaryFixedDim, secondaryFixedDim) || other.secondaryFixedDim == secondaryFixedDim)&&(identical(other.onSecondaryFixed, onSecondaryFixed) || other.onSecondaryFixed == onSecondaryFixed)&&(identical(other.onSecondaryFixedVariant, onSecondaryFixedVariant) || other.onSecondaryFixedVariant == onSecondaryFixedVariant)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.onTertiary, onTertiary) || other.onTertiary == onTertiary)&&(identical(other.tertiaryContainer, tertiaryContainer) || other.tertiaryContainer == tertiaryContainer)&&(identical(other.onTertiaryContainer, onTertiaryContainer) || other.onTertiaryContainer == onTertiaryContainer)&&(identical(other.tertiaryFixed, tertiaryFixed) || other.tertiaryFixed == tertiaryFixed)&&(identical(other.tertiaryFixedDim, tertiaryFixedDim) || other.tertiaryFixedDim == tertiaryFixedDim)&&(identical(other.onTertiaryFixed, onTertiaryFixed) || other.onTertiaryFixed == onTertiaryFixed)&&(identical(other.onTertiaryFixedVariant, onTertiaryFixedVariant) || other.onTertiaryFixedVariant == onTertiaryFixedVariant)&&(identical(other.error, error) || other.error == error)&&(identical(other.onError, onError) || other.onError == onError)&&(identical(other.errorContainer, errorContainer) || other.errorContainer == errorContainer)&&(identical(other.onErrorContainer, onErrorContainer) || other.onErrorContainer == onErrorContainer)&&(identical(other.outline, outline) || other.outline == outline)&&(identical(other.outlineVariant, outlineVariant) || other.outlineVariant == outlineVariant)&&(identical(other.surface, surface) || other.surface == surface)&&(identical(other.onSurface, onSurface) || other.onSurface == onSurface)&&(identical(other.surfaceDim, surfaceDim) || other.surfaceDim == surfaceDim)&&(identical(other.surfaceBright, surfaceBright) || other.surfaceBright == surfaceBright)&&(identical(other.surfaceContainerLowest, surfaceContainerLowest) || other.surfaceContainerLowest == surfaceContainerLowest)&&(identical(other.surfaceContainerLow, surfaceContainerLow) || other.surfaceContainerLow == surfaceContainerLow)&&(identical(other.surfaceContainer, surfaceContainer) || other.surfaceContainer == surfaceContainer)&&(identical(other.surfaceContainerHigh, surfaceContainerHigh) || other.surfaceContainerHigh == surfaceContainerHigh)&&(identical(other.surfaceContainerHighest, surfaceContainerHighest) || other.surfaceContainerHighest == surfaceContainerHighest)&&(identical(other.onSurfaceVariant, onSurfaceVariant) || other.onSurfaceVariant == onSurfaceVariant)&&(identical(other.inverseSurface, inverseSurface) || other.inverseSurface == inverseSurface)&&(identical(other.onInverseSurface, onInverseSurface) || other.onInverseSurface == onInverseSurface)&&(identical(other.inversePrimary, inversePrimary) || other.inversePrimary == inversePrimary)&&(identical(other.shadow, shadow) || other.shadow == shadow)&&(identical(other.scrim, scrim) || other.scrim == scrim)&&(identical(other.surfaceTint, surfaceTint) || other.surfaceTint == surfaceTint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,primary,onPrimary,primaryContainer,onPrimaryContainer,primaryFixed,primaryFixedDim,onPrimaryFixed,onPrimaryFixedVariant,secondary,onSecondary,secondaryContainer,onSecondaryContainer,secondaryFixed,secondaryFixedDim,onSecondaryFixed,onSecondaryFixedVariant,tertiary,onTertiary,tertiaryContainer,onTertiaryContainer,tertiaryFixed,tertiaryFixedDim,onTertiaryFixed,onTertiaryFixedVariant,error,onError,errorContainer,onErrorContainer,outline,outlineVariant,surface,onSurface,surfaceDim,surfaceBright,surfaceContainerLowest,surfaceContainerLow,surfaceContainer,surfaceContainerHigh,surfaceContainerHighest,onSurfaceVariant,inverseSurface,onInverseSurface,inversePrimary,shadow,scrim,surfaceTint]);

@override
String toString() {
  return 'ConfiguratorColorSchemeOverride(primary: $primary, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, primaryFixed: $primaryFixed, primaryFixedDim: $primaryFixedDim, onPrimaryFixed: $onPrimaryFixed, onPrimaryFixedVariant: $onPrimaryFixedVariant, secondary: $secondary, onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer, secondaryFixed: $secondaryFixed, secondaryFixedDim: $secondaryFixedDim, onSecondaryFixed: $onSecondaryFixed, onSecondaryFixedVariant: $onSecondaryFixedVariant, tertiary: $tertiary, onTertiary: $onTertiary, tertiaryContainer: $tertiaryContainer, onTertiaryContainer: $onTertiaryContainer, tertiaryFixed: $tertiaryFixed, tertiaryFixedDim: $tertiaryFixedDim, onTertiaryFixed: $onTertiaryFixed, onTertiaryFixedVariant: $onTertiaryFixedVariant, error: $error, onError: $onError, errorContainer: $errorContainer, onErrorContainer: $onErrorContainer, outline: $outline, outlineVariant: $outlineVariant, surface: $surface, onSurface: $onSurface, surfaceDim: $surfaceDim, surfaceBright: $surfaceBright, surfaceContainerLowest: $surfaceContainerLowest, surfaceContainerLow: $surfaceContainerLow, surfaceContainer: $surfaceContainer, surfaceContainerHigh: $surfaceContainerHigh, surfaceContainerHighest: $surfaceContainerHighest, onSurfaceVariant: $onSurfaceVariant, inverseSurface: $inverseSurface, onInverseSurface: $onInverseSurface, inversePrimary: $inversePrimary, shadow: $shadow, scrim: $scrim, surfaceTint: $surfaceTint)';
}


}

/// @nodoc
abstract mixin class $ConfiguratorColorSchemeOverrideCopyWith<$Res>  {
  factory $ConfiguratorColorSchemeOverrideCopyWith(ConfiguratorColorSchemeOverride value, $Res Function(ConfiguratorColorSchemeOverride) _then) = _$ConfiguratorColorSchemeOverrideCopyWithImpl;
@useResult
$Res call({
 Color? primary, Color? onPrimary, Color? primaryContainer, Color? onPrimaryContainer, Color? primaryFixed, Color? primaryFixedDim, Color? onPrimaryFixed, Color? onPrimaryFixedVariant, Color? secondary, Color? onSecondary, Color? secondaryContainer, Color? onSecondaryContainer, Color? secondaryFixed, Color? secondaryFixedDim, Color? onSecondaryFixed, Color? onSecondaryFixedVariant, Color? tertiary, Color? onTertiary, Color? tertiaryContainer, Color? onTertiaryContainer, Color? tertiaryFixed, Color? tertiaryFixedDim, Color? onTertiaryFixed, Color? onTertiaryFixedVariant, Color? error, Color? onError, Color? errorContainer, Color? onErrorContainer, Color? outline, Color? outlineVariant, Color? surface, Color? onSurface, Color? surfaceDim, Color? surfaceBright, Color? surfaceContainerLowest, Color? surfaceContainerLow, Color? surfaceContainer, Color? surfaceContainerHigh, Color? surfaceContainerHighest, Color? onSurfaceVariant, Color? inverseSurface, Color? onInverseSurface, Color? inversePrimary, Color? shadow, Color? scrim, Color? surfaceTint
});




}
/// @nodoc
class _$ConfiguratorColorSchemeOverrideCopyWithImpl<$Res>
    implements $ConfiguratorColorSchemeOverrideCopyWith<$Res> {
  _$ConfiguratorColorSchemeOverrideCopyWithImpl(this._self, this._then);

  final ConfiguratorColorSchemeOverride _self;
  final $Res Function(ConfiguratorColorSchemeOverride) _then;

/// Create a copy of ConfiguratorColorSchemeOverride
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = freezed,Object? onPrimary = freezed,Object? primaryContainer = freezed,Object? onPrimaryContainer = freezed,Object? primaryFixed = freezed,Object? primaryFixedDim = freezed,Object? onPrimaryFixed = freezed,Object? onPrimaryFixedVariant = freezed,Object? secondary = freezed,Object? onSecondary = freezed,Object? secondaryContainer = freezed,Object? onSecondaryContainer = freezed,Object? secondaryFixed = freezed,Object? secondaryFixedDim = freezed,Object? onSecondaryFixed = freezed,Object? onSecondaryFixedVariant = freezed,Object? tertiary = freezed,Object? onTertiary = freezed,Object? tertiaryContainer = freezed,Object? onTertiaryContainer = freezed,Object? tertiaryFixed = freezed,Object? tertiaryFixedDim = freezed,Object? onTertiaryFixed = freezed,Object? onTertiaryFixedVariant = freezed,Object? error = freezed,Object? onError = freezed,Object? errorContainer = freezed,Object? onErrorContainer = freezed,Object? outline = freezed,Object? outlineVariant = freezed,Object? surface = freezed,Object? onSurface = freezed,Object? surfaceDim = freezed,Object? surfaceBright = freezed,Object? surfaceContainerLowest = freezed,Object? surfaceContainerLow = freezed,Object? surfaceContainer = freezed,Object? surfaceContainerHigh = freezed,Object? surfaceContainerHighest = freezed,Object? onSurfaceVariant = freezed,Object? inverseSurface = freezed,Object? onInverseSurface = freezed,Object? inversePrimary = freezed,Object? shadow = freezed,Object? scrim = freezed,Object? surfaceTint = freezed,}) {
  return _then(_self.copyWith(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color?,onPrimary: freezed == onPrimary ? _self.onPrimary : onPrimary // ignore: cast_nullable_to_non_nullable
as Color?,primaryContainer: freezed == primaryContainer ? _self.primaryContainer : primaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,onPrimaryContainer: freezed == onPrimaryContainer ? _self.onPrimaryContainer : onPrimaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,primaryFixed: freezed == primaryFixed ? _self.primaryFixed : primaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,primaryFixedDim: freezed == primaryFixedDim ? _self.primaryFixedDim : primaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color?,onPrimaryFixed: freezed == onPrimaryFixed ? _self.onPrimaryFixed : onPrimaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,onPrimaryFixedVariant: freezed == onPrimaryFixedVariant ? _self.onPrimaryFixedVariant : onPrimaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color?,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color?,onSecondary: freezed == onSecondary ? _self.onSecondary : onSecondary // ignore: cast_nullable_to_non_nullable
as Color?,secondaryContainer: freezed == secondaryContainer ? _self.secondaryContainer : secondaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,onSecondaryContainer: freezed == onSecondaryContainer ? _self.onSecondaryContainer : onSecondaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,secondaryFixed: freezed == secondaryFixed ? _self.secondaryFixed : secondaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,secondaryFixedDim: freezed == secondaryFixedDim ? _self.secondaryFixedDim : secondaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color?,onSecondaryFixed: freezed == onSecondaryFixed ? _self.onSecondaryFixed : onSecondaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,onSecondaryFixedVariant: freezed == onSecondaryFixedVariant ? _self.onSecondaryFixedVariant : onSecondaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color?,tertiary: freezed == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as Color?,onTertiary: freezed == onTertiary ? _self.onTertiary : onTertiary // ignore: cast_nullable_to_non_nullable
as Color?,tertiaryContainer: freezed == tertiaryContainer ? _self.tertiaryContainer : tertiaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,onTertiaryContainer: freezed == onTertiaryContainer ? _self.onTertiaryContainer : onTertiaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,tertiaryFixed: freezed == tertiaryFixed ? _self.tertiaryFixed : tertiaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,tertiaryFixedDim: freezed == tertiaryFixedDim ? _self.tertiaryFixedDim : tertiaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color?,onTertiaryFixed: freezed == onTertiaryFixed ? _self.onTertiaryFixed : onTertiaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,onTertiaryFixedVariant: freezed == onTertiaryFixedVariant ? _self.onTertiaryFixedVariant : onTertiaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Color?,onError: freezed == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as Color?,errorContainer: freezed == errorContainer ? _self.errorContainer : errorContainer // ignore: cast_nullable_to_non_nullable
as Color?,onErrorContainer: freezed == onErrorContainer ? _self.onErrorContainer : onErrorContainer // ignore: cast_nullable_to_non_nullable
as Color?,outline: freezed == outline ? _self.outline : outline // ignore: cast_nullable_to_non_nullable
as Color?,outlineVariant: freezed == outlineVariant ? _self.outlineVariant : outlineVariant // ignore: cast_nullable_to_non_nullable
as Color?,surface: freezed == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as Color?,onSurface: freezed == onSurface ? _self.onSurface : onSurface // ignore: cast_nullable_to_non_nullable
as Color?,surfaceDim: freezed == surfaceDim ? _self.surfaceDim : surfaceDim // ignore: cast_nullable_to_non_nullable
as Color?,surfaceBright: freezed == surfaceBright ? _self.surfaceBright : surfaceBright // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainerLowest: freezed == surfaceContainerLowest ? _self.surfaceContainerLowest : surfaceContainerLowest // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainerLow: freezed == surfaceContainerLow ? _self.surfaceContainerLow : surfaceContainerLow // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainer: freezed == surfaceContainer ? _self.surfaceContainer : surfaceContainer // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainerHigh: freezed == surfaceContainerHigh ? _self.surfaceContainerHigh : surfaceContainerHigh // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainerHighest: freezed == surfaceContainerHighest ? _self.surfaceContainerHighest : surfaceContainerHighest // ignore: cast_nullable_to_non_nullable
as Color?,onSurfaceVariant: freezed == onSurfaceVariant ? _self.onSurfaceVariant : onSurfaceVariant // ignore: cast_nullable_to_non_nullable
as Color?,inverseSurface: freezed == inverseSurface ? _self.inverseSurface : inverseSurface // ignore: cast_nullable_to_non_nullable
as Color?,onInverseSurface: freezed == onInverseSurface ? _self.onInverseSurface : onInverseSurface // ignore: cast_nullable_to_non_nullable
as Color?,inversePrimary: freezed == inversePrimary ? _self.inversePrimary : inversePrimary // ignore: cast_nullable_to_non_nullable
as Color?,shadow: freezed == shadow ? _self.shadow : shadow // ignore: cast_nullable_to_non_nullable
as Color?,scrim: freezed == scrim ? _self.scrim : scrim // ignore: cast_nullable_to_non_nullable
as Color?,surfaceTint: freezed == surfaceTint ? _self.surfaceTint : surfaceTint // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfiguratorColorSchemeOverride].
extension ConfiguratorColorSchemeOverridePatterns on ConfiguratorColorSchemeOverride {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfiguratorColorSchemeOverride value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfiguratorColorSchemeOverride() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfiguratorColorSchemeOverride value)  $default,){
final _that = this;
switch (_that) {
case _ConfiguratorColorSchemeOverride():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfiguratorColorSchemeOverride value)?  $default,){
final _that = this;
switch (_that) {
case _ConfiguratorColorSchemeOverride() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Color? primary,  Color? onPrimary,  Color? primaryContainer,  Color? onPrimaryContainer,  Color? primaryFixed,  Color? primaryFixedDim,  Color? onPrimaryFixed,  Color? onPrimaryFixedVariant,  Color? secondary,  Color? onSecondary,  Color? secondaryContainer,  Color? onSecondaryContainer,  Color? secondaryFixed,  Color? secondaryFixedDim,  Color? onSecondaryFixed,  Color? onSecondaryFixedVariant,  Color? tertiary,  Color? onTertiary,  Color? tertiaryContainer,  Color? onTertiaryContainer,  Color? tertiaryFixed,  Color? tertiaryFixedDim,  Color? onTertiaryFixed,  Color? onTertiaryFixedVariant,  Color? error,  Color? onError,  Color? errorContainer,  Color? onErrorContainer,  Color? outline,  Color? outlineVariant,  Color? surface,  Color? onSurface,  Color? surfaceDim,  Color? surfaceBright,  Color? surfaceContainerLowest,  Color? surfaceContainerLow,  Color? surfaceContainer,  Color? surfaceContainerHigh,  Color? surfaceContainerHighest,  Color? onSurfaceVariant,  Color? inverseSurface,  Color? onInverseSurface,  Color? inversePrimary,  Color? shadow,  Color? scrim,  Color? surfaceTint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfiguratorColorSchemeOverride() when $default != null:
return $default(_that.primary,_that.onPrimary,_that.primaryContainer,_that.onPrimaryContainer,_that.primaryFixed,_that.primaryFixedDim,_that.onPrimaryFixed,_that.onPrimaryFixedVariant,_that.secondary,_that.onSecondary,_that.secondaryContainer,_that.onSecondaryContainer,_that.secondaryFixed,_that.secondaryFixedDim,_that.onSecondaryFixed,_that.onSecondaryFixedVariant,_that.tertiary,_that.onTertiary,_that.tertiaryContainer,_that.onTertiaryContainer,_that.tertiaryFixed,_that.tertiaryFixedDim,_that.onTertiaryFixed,_that.onTertiaryFixedVariant,_that.error,_that.onError,_that.errorContainer,_that.onErrorContainer,_that.outline,_that.outlineVariant,_that.surface,_that.onSurface,_that.surfaceDim,_that.surfaceBright,_that.surfaceContainerLowest,_that.surfaceContainerLow,_that.surfaceContainer,_that.surfaceContainerHigh,_that.surfaceContainerHighest,_that.onSurfaceVariant,_that.inverseSurface,_that.onInverseSurface,_that.inversePrimary,_that.shadow,_that.scrim,_that.surfaceTint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Color? primary,  Color? onPrimary,  Color? primaryContainer,  Color? onPrimaryContainer,  Color? primaryFixed,  Color? primaryFixedDim,  Color? onPrimaryFixed,  Color? onPrimaryFixedVariant,  Color? secondary,  Color? onSecondary,  Color? secondaryContainer,  Color? onSecondaryContainer,  Color? secondaryFixed,  Color? secondaryFixedDim,  Color? onSecondaryFixed,  Color? onSecondaryFixedVariant,  Color? tertiary,  Color? onTertiary,  Color? tertiaryContainer,  Color? onTertiaryContainer,  Color? tertiaryFixed,  Color? tertiaryFixedDim,  Color? onTertiaryFixed,  Color? onTertiaryFixedVariant,  Color? error,  Color? onError,  Color? errorContainer,  Color? onErrorContainer,  Color? outline,  Color? outlineVariant,  Color? surface,  Color? onSurface,  Color? surfaceDim,  Color? surfaceBright,  Color? surfaceContainerLowest,  Color? surfaceContainerLow,  Color? surfaceContainer,  Color? surfaceContainerHigh,  Color? surfaceContainerHighest,  Color? onSurfaceVariant,  Color? inverseSurface,  Color? onInverseSurface,  Color? inversePrimary,  Color? shadow,  Color? scrim,  Color? surfaceTint)  $default,) {final _that = this;
switch (_that) {
case _ConfiguratorColorSchemeOverride():
return $default(_that.primary,_that.onPrimary,_that.primaryContainer,_that.onPrimaryContainer,_that.primaryFixed,_that.primaryFixedDim,_that.onPrimaryFixed,_that.onPrimaryFixedVariant,_that.secondary,_that.onSecondary,_that.secondaryContainer,_that.onSecondaryContainer,_that.secondaryFixed,_that.secondaryFixedDim,_that.onSecondaryFixed,_that.onSecondaryFixedVariant,_that.tertiary,_that.onTertiary,_that.tertiaryContainer,_that.onTertiaryContainer,_that.tertiaryFixed,_that.tertiaryFixedDim,_that.onTertiaryFixed,_that.onTertiaryFixedVariant,_that.error,_that.onError,_that.errorContainer,_that.onErrorContainer,_that.outline,_that.outlineVariant,_that.surface,_that.onSurface,_that.surfaceDim,_that.surfaceBright,_that.surfaceContainerLowest,_that.surfaceContainerLow,_that.surfaceContainer,_that.surfaceContainerHigh,_that.surfaceContainerHighest,_that.onSurfaceVariant,_that.inverseSurface,_that.onInverseSurface,_that.inversePrimary,_that.shadow,_that.scrim,_that.surfaceTint);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Color? primary,  Color? onPrimary,  Color? primaryContainer,  Color? onPrimaryContainer,  Color? primaryFixed,  Color? primaryFixedDim,  Color? onPrimaryFixed,  Color? onPrimaryFixedVariant,  Color? secondary,  Color? onSecondary,  Color? secondaryContainer,  Color? onSecondaryContainer,  Color? secondaryFixed,  Color? secondaryFixedDim,  Color? onSecondaryFixed,  Color? onSecondaryFixedVariant,  Color? tertiary,  Color? onTertiary,  Color? tertiaryContainer,  Color? onTertiaryContainer,  Color? tertiaryFixed,  Color? tertiaryFixedDim,  Color? onTertiaryFixed,  Color? onTertiaryFixedVariant,  Color? error,  Color? onError,  Color? errorContainer,  Color? onErrorContainer,  Color? outline,  Color? outlineVariant,  Color? surface,  Color? onSurface,  Color? surfaceDim,  Color? surfaceBright,  Color? surfaceContainerLowest,  Color? surfaceContainerLow,  Color? surfaceContainer,  Color? surfaceContainerHigh,  Color? surfaceContainerHighest,  Color? onSurfaceVariant,  Color? inverseSurface,  Color? onInverseSurface,  Color? inversePrimary,  Color? shadow,  Color? scrim,  Color? surfaceTint)?  $default,) {final _that = this;
switch (_that) {
case _ConfiguratorColorSchemeOverride() when $default != null:
return $default(_that.primary,_that.onPrimary,_that.primaryContainer,_that.onPrimaryContainer,_that.primaryFixed,_that.primaryFixedDim,_that.onPrimaryFixed,_that.onPrimaryFixedVariant,_that.secondary,_that.onSecondary,_that.secondaryContainer,_that.onSecondaryContainer,_that.secondaryFixed,_that.secondaryFixedDim,_that.onSecondaryFixed,_that.onSecondaryFixedVariant,_that.tertiary,_that.onTertiary,_that.tertiaryContainer,_that.onTertiaryContainer,_that.tertiaryFixed,_that.tertiaryFixedDim,_that.onTertiaryFixed,_that.onTertiaryFixedVariant,_that.error,_that.onError,_that.errorContainer,_that.onErrorContainer,_that.outline,_that.outlineVariant,_that.surface,_that.onSurface,_that.surfaceDim,_that.surfaceBright,_that.surfaceContainerLowest,_that.surfaceContainerLow,_that.surfaceContainer,_that.surfaceContainerHigh,_that.surfaceContainerHighest,_that.onSurfaceVariant,_that.inverseSurface,_that.onInverseSurface,_that.inversePrimary,_that.shadow,_that.scrim,_that.surfaceTint);case _:
  return null;

}
}

}

/// @nodoc

@themeJsonSerializable
class _ConfiguratorColorSchemeOverride implements ConfiguratorColorSchemeOverride {
  const _ConfiguratorColorSchemeOverride({this.primary, this.onPrimary, this.primaryContainer, this.onPrimaryContainer, this.primaryFixed, this.primaryFixedDim, this.onPrimaryFixed, this.onPrimaryFixedVariant, this.secondary, this.onSecondary, this.secondaryContainer, this.onSecondaryContainer, this.secondaryFixed, this.secondaryFixedDim, this.onSecondaryFixed, this.onSecondaryFixedVariant, this.tertiary, this.onTertiary, this.tertiaryContainer, this.onTertiaryContainer, this.tertiaryFixed, this.tertiaryFixedDim, this.onTertiaryFixed, this.onTertiaryFixedVariant, this.error, this.onError, this.errorContainer, this.onErrorContainer, this.outline, this.outlineVariant, this.surface, this.onSurface, this.surfaceDim, this.surfaceBright, this.surfaceContainerLowest, this.surfaceContainerLow, this.surfaceContainer, this.surfaceContainerHigh, this.surfaceContainerHighest, this.onSurfaceVariant, this.inverseSurface, this.onInverseSurface, this.inversePrimary, this.shadow, this.scrim, this.surfaceTint});
  factory _ConfiguratorColorSchemeOverride.fromJson(Map<String, dynamic> json) => _$ConfiguratorColorSchemeOverrideFromJson(json);

@override final  Color? primary;
@override final  Color? onPrimary;
@override final  Color? primaryContainer;
@override final  Color? onPrimaryContainer;
@override final  Color? primaryFixed;
@override final  Color? primaryFixedDim;
@override final  Color? onPrimaryFixed;
@override final  Color? onPrimaryFixedVariant;
@override final  Color? secondary;
@override final  Color? onSecondary;
@override final  Color? secondaryContainer;
@override final  Color? onSecondaryContainer;
@override final  Color? secondaryFixed;
@override final  Color? secondaryFixedDim;
@override final  Color? onSecondaryFixed;
@override final  Color? onSecondaryFixedVariant;
@override final  Color? tertiary;
@override final  Color? onTertiary;
@override final  Color? tertiaryContainer;
@override final  Color? onTertiaryContainer;
@override final  Color? tertiaryFixed;
@override final  Color? tertiaryFixedDim;
@override final  Color? onTertiaryFixed;
@override final  Color? onTertiaryFixedVariant;
@override final  Color? error;
@override final  Color? onError;
@override final  Color? errorContainer;
@override final  Color? onErrorContainer;
@override final  Color? outline;
@override final  Color? outlineVariant;
@override final  Color? surface;
@override final  Color? onSurface;
@override final  Color? surfaceDim;
@override final  Color? surfaceBright;
@override final  Color? surfaceContainerLowest;
@override final  Color? surfaceContainerLow;
@override final  Color? surfaceContainer;
@override final  Color? surfaceContainerHigh;
@override final  Color? surfaceContainerHighest;
@override final  Color? onSurfaceVariant;
@override final  Color? inverseSurface;
@override final  Color? onInverseSurface;
@override final  Color? inversePrimary;
@override final  Color? shadow;
@override final  Color? scrim;
@override final  Color? surfaceTint;

/// Create a copy of ConfiguratorColorSchemeOverride
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfiguratorColorSchemeOverrideCopyWith<_ConfiguratorColorSchemeOverride> get copyWith => __$ConfiguratorColorSchemeOverrideCopyWithImpl<_ConfiguratorColorSchemeOverride>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfiguratorColorSchemeOverrideToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfiguratorColorSchemeOverride&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.onPrimary, onPrimary) || other.onPrimary == onPrimary)&&(identical(other.primaryContainer, primaryContainer) || other.primaryContainer == primaryContainer)&&(identical(other.onPrimaryContainer, onPrimaryContainer) || other.onPrimaryContainer == onPrimaryContainer)&&(identical(other.primaryFixed, primaryFixed) || other.primaryFixed == primaryFixed)&&(identical(other.primaryFixedDim, primaryFixedDim) || other.primaryFixedDim == primaryFixedDim)&&(identical(other.onPrimaryFixed, onPrimaryFixed) || other.onPrimaryFixed == onPrimaryFixed)&&(identical(other.onPrimaryFixedVariant, onPrimaryFixedVariant) || other.onPrimaryFixedVariant == onPrimaryFixedVariant)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.onSecondary, onSecondary) || other.onSecondary == onSecondary)&&(identical(other.secondaryContainer, secondaryContainer) || other.secondaryContainer == secondaryContainer)&&(identical(other.onSecondaryContainer, onSecondaryContainer) || other.onSecondaryContainer == onSecondaryContainer)&&(identical(other.secondaryFixed, secondaryFixed) || other.secondaryFixed == secondaryFixed)&&(identical(other.secondaryFixedDim, secondaryFixedDim) || other.secondaryFixedDim == secondaryFixedDim)&&(identical(other.onSecondaryFixed, onSecondaryFixed) || other.onSecondaryFixed == onSecondaryFixed)&&(identical(other.onSecondaryFixedVariant, onSecondaryFixedVariant) || other.onSecondaryFixedVariant == onSecondaryFixedVariant)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.onTertiary, onTertiary) || other.onTertiary == onTertiary)&&(identical(other.tertiaryContainer, tertiaryContainer) || other.tertiaryContainer == tertiaryContainer)&&(identical(other.onTertiaryContainer, onTertiaryContainer) || other.onTertiaryContainer == onTertiaryContainer)&&(identical(other.tertiaryFixed, tertiaryFixed) || other.tertiaryFixed == tertiaryFixed)&&(identical(other.tertiaryFixedDim, tertiaryFixedDim) || other.tertiaryFixedDim == tertiaryFixedDim)&&(identical(other.onTertiaryFixed, onTertiaryFixed) || other.onTertiaryFixed == onTertiaryFixed)&&(identical(other.onTertiaryFixedVariant, onTertiaryFixedVariant) || other.onTertiaryFixedVariant == onTertiaryFixedVariant)&&(identical(other.error, error) || other.error == error)&&(identical(other.onError, onError) || other.onError == onError)&&(identical(other.errorContainer, errorContainer) || other.errorContainer == errorContainer)&&(identical(other.onErrorContainer, onErrorContainer) || other.onErrorContainer == onErrorContainer)&&(identical(other.outline, outline) || other.outline == outline)&&(identical(other.outlineVariant, outlineVariant) || other.outlineVariant == outlineVariant)&&(identical(other.surface, surface) || other.surface == surface)&&(identical(other.onSurface, onSurface) || other.onSurface == onSurface)&&(identical(other.surfaceDim, surfaceDim) || other.surfaceDim == surfaceDim)&&(identical(other.surfaceBright, surfaceBright) || other.surfaceBright == surfaceBright)&&(identical(other.surfaceContainerLowest, surfaceContainerLowest) || other.surfaceContainerLowest == surfaceContainerLowest)&&(identical(other.surfaceContainerLow, surfaceContainerLow) || other.surfaceContainerLow == surfaceContainerLow)&&(identical(other.surfaceContainer, surfaceContainer) || other.surfaceContainer == surfaceContainer)&&(identical(other.surfaceContainerHigh, surfaceContainerHigh) || other.surfaceContainerHigh == surfaceContainerHigh)&&(identical(other.surfaceContainerHighest, surfaceContainerHighest) || other.surfaceContainerHighest == surfaceContainerHighest)&&(identical(other.onSurfaceVariant, onSurfaceVariant) || other.onSurfaceVariant == onSurfaceVariant)&&(identical(other.inverseSurface, inverseSurface) || other.inverseSurface == inverseSurface)&&(identical(other.onInverseSurface, onInverseSurface) || other.onInverseSurface == onInverseSurface)&&(identical(other.inversePrimary, inversePrimary) || other.inversePrimary == inversePrimary)&&(identical(other.shadow, shadow) || other.shadow == shadow)&&(identical(other.scrim, scrim) || other.scrim == scrim)&&(identical(other.surfaceTint, surfaceTint) || other.surfaceTint == surfaceTint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,primary,onPrimary,primaryContainer,onPrimaryContainer,primaryFixed,primaryFixedDim,onPrimaryFixed,onPrimaryFixedVariant,secondary,onSecondary,secondaryContainer,onSecondaryContainer,secondaryFixed,secondaryFixedDim,onSecondaryFixed,onSecondaryFixedVariant,tertiary,onTertiary,tertiaryContainer,onTertiaryContainer,tertiaryFixed,tertiaryFixedDim,onTertiaryFixed,onTertiaryFixedVariant,error,onError,errorContainer,onErrorContainer,outline,outlineVariant,surface,onSurface,surfaceDim,surfaceBright,surfaceContainerLowest,surfaceContainerLow,surfaceContainer,surfaceContainerHigh,surfaceContainerHighest,onSurfaceVariant,inverseSurface,onInverseSurface,inversePrimary,shadow,scrim,surfaceTint]);

@override
String toString() {
  return 'ConfiguratorColorSchemeOverride(primary: $primary, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, primaryFixed: $primaryFixed, primaryFixedDim: $primaryFixedDim, onPrimaryFixed: $onPrimaryFixed, onPrimaryFixedVariant: $onPrimaryFixedVariant, secondary: $secondary, onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer, secondaryFixed: $secondaryFixed, secondaryFixedDim: $secondaryFixedDim, onSecondaryFixed: $onSecondaryFixed, onSecondaryFixedVariant: $onSecondaryFixedVariant, tertiary: $tertiary, onTertiary: $onTertiary, tertiaryContainer: $tertiaryContainer, onTertiaryContainer: $onTertiaryContainer, tertiaryFixed: $tertiaryFixed, tertiaryFixedDim: $tertiaryFixedDim, onTertiaryFixed: $onTertiaryFixed, onTertiaryFixedVariant: $onTertiaryFixedVariant, error: $error, onError: $onError, errorContainer: $errorContainer, onErrorContainer: $onErrorContainer, outline: $outline, outlineVariant: $outlineVariant, surface: $surface, onSurface: $onSurface, surfaceDim: $surfaceDim, surfaceBright: $surfaceBright, surfaceContainerLowest: $surfaceContainerLowest, surfaceContainerLow: $surfaceContainerLow, surfaceContainer: $surfaceContainer, surfaceContainerHigh: $surfaceContainerHigh, surfaceContainerHighest: $surfaceContainerHighest, onSurfaceVariant: $onSurfaceVariant, inverseSurface: $inverseSurface, onInverseSurface: $onInverseSurface, inversePrimary: $inversePrimary, shadow: $shadow, scrim: $scrim, surfaceTint: $surfaceTint)';
}


}

/// @nodoc
abstract mixin class _$ConfiguratorColorSchemeOverrideCopyWith<$Res> implements $ConfiguratorColorSchemeOverrideCopyWith<$Res> {
  factory _$ConfiguratorColorSchemeOverrideCopyWith(_ConfiguratorColorSchemeOverride value, $Res Function(_ConfiguratorColorSchemeOverride) _then) = __$ConfiguratorColorSchemeOverrideCopyWithImpl;
@override @useResult
$Res call({
 Color? primary, Color? onPrimary, Color? primaryContainer, Color? onPrimaryContainer, Color? primaryFixed, Color? primaryFixedDim, Color? onPrimaryFixed, Color? onPrimaryFixedVariant, Color? secondary, Color? onSecondary, Color? secondaryContainer, Color? onSecondaryContainer, Color? secondaryFixed, Color? secondaryFixedDim, Color? onSecondaryFixed, Color? onSecondaryFixedVariant, Color? tertiary, Color? onTertiary, Color? tertiaryContainer, Color? onTertiaryContainer, Color? tertiaryFixed, Color? tertiaryFixedDim, Color? onTertiaryFixed, Color? onTertiaryFixedVariant, Color? error, Color? onError, Color? errorContainer, Color? onErrorContainer, Color? outline, Color? outlineVariant, Color? surface, Color? onSurface, Color? surfaceDim, Color? surfaceBright, Color? surfaceContainerLowest, Color? surfaceContainerLow, Color? surfaceContainer, Color? surfaceContainerHigh, Color? surfaceContainerHighest, Color? onSurfaceVariant, Color? inverseSurface, Color? onInverseSurface, Color? inversePrimary, Color? shadow, Color? scrim, Color? surfaceTint
});




}
/// @nodoc
class __$ConfiguratorColorSchemeOverrideCopyWithImpl<$Res>
    implements _$ConfiguratorColorSchemeOverrideCopyWith<$Res> {
  __$ConfiguratorColorSchemeOverrideCopyWithImpl(this._self, this._then);

  final _ConfiguratorColorSchemeOverride _self;
  final $Res Function(_ConfiguratorColorSchemeOverride) _then;

/// Create a copy of ConfiguratorColorSchemeOverride
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = freezed,Object? onPrimary = freezed,Object? primaryContainer = freezed,Object? onPrimaryContainer = freezed,Object? primaryFixed = freezed,Object? primaryFixedDim = freezed,Object? onPrimaryFixed = freezed,Object? onPrimaryFixedVariant = freezed,Object? secondary = freezed,Object? onSecondary = freezed,Object? secondaryContainer = freezed,Object? onSecondaryContainer = freezed,Object? secondaryFixed = freezed,Object? secondaryFixedDim = freezed,Object? onSecondaryFixed = freezed,Object? onSecondaryFixedVariant = freezed,Object? tertiary = freezed,Object? onTertiary = freezed,Object? tertiaryContainer = freezed,Object? onTertiaryContainer = freezed,Object? tertiaryFixed = freezed,Object? tertiaryFixedDim = freezed,Object? onTertiaryFixed = freezed,Object? onTertiaryFixedVariant = freezed,Object? error = freezed,Object? onError = freezed,Object? errorContainer = freezed,Object? onErrorContainer = freezed,Object? outline = freezed,Object? outlineVariant = freezed,Object? surface = freezed,Object? onSurface = freezed,Object? surfaceDim = freezed,Object? surfaceBright = freezed,Object? surfaceContainerLowest = freezed,Object? surfaceContainerLow = freezed,Object? surfaceContainer = freezed,Object? surfaceContainerHigh = freezed,Object? surfaceContainerHighest = freezed,Object? onSurfaceVariant = freezed,Object? inverseSurface = freezed,Object? onInverseSurface = freezed,Object? inversePrimary = freezed,Object? shadow = freezed,Object? scrim = freezed,Object? surfaceTint = freezed,}) {
  return _then(_ConfiguratorColorSchemeOverride(
primary: freezed == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color?,onPrimary: freezed == onPrimary ? _self.onPrimary : onPrimary // ignore: cast_nullable_to_non_nullable
as Color?,primaryContainer: freezed == primaryContainer ? _self.primaryContainer : primaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,onPrimaryContainer: freezed == onPrimaryContainer ? _self.onPrimaryContainer : onPrimaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,primaryFixed: freezed == primaryFixed ? _self.primaryFixed : primaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,primaryFixedDim: freezed == primaryFixedDim ? _self.primaryFixedDim : primaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color?,onPrimaryFixed: freezed == onPrimaryFixed ? _self.onPrimaryFixed : onPrimaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,onPrimaryFixedVariant: freezed == onPrimaryFixedVariant ? _self.onPrimaryFixedVariant : onPrimaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color?,secondary: freezed == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color?,onSecondary: freezed == onSecondary ? _self.onSecondary : onSecondary // ignore: cast_nullable_to_non_nullable
as Color?,secondaryContainer: freezed == secondaryContainer ? _self.secondaryContainer : secondaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,onSecondaryContainer: freezed == onSecondaryContainer ? _self.onSecondaryContainer : onSecondaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,secondaryFixed: freezed == secondaryFixed ? _self.secondaryFixed : secondaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,secondaryFixedDim: freezed == secondaryFixedDim ? _self.secondaryFixedDim : secondaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color?,onSecondaryFixed: freezed == onSecondaryFixed ? _self.onSecondaryFixed : onSecondaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,onSecondaryFixedVariant: freezed == onSecondaryFixedVariant ? _self.onSecondaryFixedVariant : onSecondaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color?,tertiary: freezed == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as Color?,onTertiary: freezed == onTertiary ? _self.onTertiary : onTertiary // ignore: cast_nullable_to_non_nullable
as Color?,tertiaryContainer: freezed == tertiaryContainer ? _self.tertiaryContainer : tertiaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,onTertiaryContainer: freezed == onTertiaryContainer ? _self.onTertiaryContainer : onTertiaryContainer // ignore: cast_nullable_to_non_nullable
as Color?,tertiaryFixed: freezed == tertiaryFixed ? _self.tertiaryFixed : tertiaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,tertiaryFixedDim: freezed == tertiaryFixedDim ? _self.tertiaryFixedDim : tertiaryFixedDim // ignore: cast_nullable_to_non_nullable
as Color?,onTertiaryFixed: freezed == onTertiaryFixed ? _self.onTertiaryFixed : onTertiaryFixed // ignore: cast_nullable_to_non_nullable
as Color?,onTertiaryFixedVariant: freezed == onTertiaryFixedVariant ? _self.onTertiaryFixedVariant : onTertiaryFixedVariant // ignore: cast_nullable_to_non_nullable
as Color?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Color?,onError: freezed == onError ? _self.onError : onError // ignore: cast_nullable_to_non_nullable
as Color?,errorContainer: freezed == errorContainer ? _self.errorContainer : errorContainer // ignore: cast_nullable_to_non_nullable
as Color?,onErrorContainer: freezed == onErrorContainer ? _self.onErrorContainer : onErrorContainer // ignore: cast_nullable_to_non_nullable
as Color?,outline: freezed == outline ? _self.outline : outline // ignore: cast_nullable_to_non_nullable
as Color?,outlineVariant: freezed == outlineVariant ? _self.outlineVariant : outlineVariant // ignore: cast_nullable_to_non_nullable
as Color?,surface: freezed == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as Color?,onSurface: freezed == onSurface ? _self.onSurface : onSurface // ignore: cast_nullable_to_non_nullable
as Color?,surfaceDim: freezed == surfaceDim ? _self.surfaceDim : surfaceDim // ignore: cast_nullable_to_non_nullable
as Color?,surfaceBright: freezed == surfaceBright ? _self.surfaceBright : surfaceBright // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainerLowest: freezed == surfaceContainerLowest ? _self.surfaceContainerLowest : surfaceContainerLowest // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainerLow: freezed == surfaceContainerLow ? _self.surfaceContainerLow : surfaceContainerLow // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainer: freezed == surfaceContainer ? _self.surfaceContainer : surfaceContainer // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainerHigh: freezed == surfaceContainerHigh ? _self.surfaceContainerHigh : surfaceContainerHigh // ignore: cast_nullable_to_non_nullable
as Color?,surfaceContainerHighest: freezed == surfaceContainerHighest ? _self.surfaceContainerHighest : surfaceContainerHighest // ignore: cast_nullable_to_non_nullable
as Color?,onSurfaceVariant: freezed == onSurfaceVariant ? _self.onSurfaceVariant : onSurfaceVariant // ignore: cast_nullable_to_non_nullable
as Color?,inverseSurface: freezed == inverseSurface ? _self.inverseSurface : inverseSurface // ignore: cast_nullable_to_non_nullable
as Color?,onInverseSurface: freezed == onInverseSurface ? _self.onInverseSurface : onInverseSurface // ignore: cast_nullable_to_non_nullable
as Color?,inversePrimary: freezed == inversePrimary ? _self.inversePrimary : inversePrimary // ignore: cast_nullable_to_non_nullable
as Color?,shadow: freezed == shadow ? _self.shadow : shadow // ignore: cast_nullable_to_non_nullable
as Color?,scrim: freezed == scrim ? _self.scrim : scrim // ignore: cast_nullable_to_non_nullable
as Color?,surfaceTint: freezed == surfaceTint ? _self.surfaceTint : surfaceTint // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}


}

// dart format on
