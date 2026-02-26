// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_theme_preview_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SharedThemePreviewDto {

 Map<String, dynamic> get theme; List<Map<String, dynamic>> get colorSchemes; List<Map<String, dynamic>> get widgetConfigs; List<Map<String, dynamic>> get pageConfigs; Map<String, dynamic>? get splashAsset; Map<String, dynamic>? get launchAsset; Map<String, dynamic>? get featureAccess;
/// Create a copy of SharedThemePreviewDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharedThemePreviewDtoCopyWith<SharedThemePreviewDto> get copyWith => _$SharedThemePreviewDtoCopyWithImpl<SharedThemePreviewDto>(this as SharedThemePreviewDto, _$identity);

  /// Serializes this SharedThemePreviewDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharedThemePreviewDto&&const DeepCollectionEquality().equals(other.theme, theme)&&const DeepCollectionEquality().equals(other.colorSchemes, colorSchemes)&&const DeepCollectionEquality().equals(other.widgetConfigs, widgetConfigs)&&const DeepCollectionEquality().equals(other.pageConfigs, pageConfigs)&&const DeepCollectionEquality().equals(other.splashAsset, splashAsset)&&const DeepCollectionEquality().equals(other.launchAsset, launchAsset)&&const DeepCollectionEquality().equals(other.featureAccess, featureAccess));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(theme),const DeepCollectionEquality().hash(colorSchemes),const DeepCollectionEquality().hash(widgetConfigs),const DeepCollectionEquality().hash(pageConfigs),const DeepCollectionEquality().hash(splashAsset),const DeepCollectionEquality().hash(launchAsset),const DeepCollectionEquality().hash(featureAccess));

@override
String toString() {
  return 'SharedThemePreviewDto(theme: $theme, colorSchemes: $colorSchemes, widgetConfigs: $widgetConfigs, pageConfigs: $pageConfigs, splashAsset: $splashAsset, launchAsset: $launchAsset, featureAccess: $featureAccess)';
}


}

/// @nodoc
abstract mixin class $SharedThemePreviewDtoCopyWith<$Res>  {
  factory $SharedThemePreviewDtoCopyWith(SharedThemePreviewDto value, $Res Function(SharedThemePreviewDto) _then) = _$SharedThemePreviewDtoCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> theme, List<Map<String, dynamic>> colorSchemes, List<Map<String, dynamic>> widgetConfigs, List<Map<String, dynamic>> pageConfigs, Map<String, dynamic>? splashAsset, Map<String, dynamic>? launchAsset, Map<String, dynamic>? featureAccess
});




}
/// @nodoc
class _$SharedThemePreviewDtoCopyWithImpl<$Res>
    implements $SharedThemePreviewDtoCopyWith<$Res> {
  _$SharedThemePreviewDtoCopyWithImpl(this._self, this._then);

  final SharedThemePreviewDto _self;
  final $Res Function(SharedThemePreviewDto) _then;

/// Create a copy of SharedThemePreviewDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theme = null,Object? colorSchemes = null,Object? widgetConfigs = null,Object? pageConfigs = null,Object? splashAsset = freezed,Object? launchAsset = freezed,Object? featureAccess = freezed,}) {
  return _then(_self.copyWith(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,colorSchemes: null == colorSchemes ? _self.colorSchemes : colorSchemes // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,widgetConfigs: null == widgetConfigs ? _self.widgetConfigs : widgetConfigs // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,pageConfigs: null == pageConfigs ? _self.pageConfigs : pageConfigs // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,splashAsset: freezed == splashAsset ? _self.splashAsset : splashAsset // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,launchAsset: freezed == launchAsset ? _self.launchAsset : launchAsset // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,featureAccess: freezed == featureAccess ? _self.featureAccess : featureAccess // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SharedThemePreviewDto].
extension SharedThemePreviewDtoPatterns on SharedThemePreviewDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SharedThemePreviewDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SharedThemePreviewDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SharedThemePreviewDto value)  $default,){
final _that = this;
switch (_that) {
case _SharedThemePreviewDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SharedThemePreviewDto value)?  $default,){
final _that = this;
switch (_that) {
case _SharedThemePreviewDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> theme,  List<Map<String, dynamic>> colorSchemes,  List<Map<String, dynamic>> widgetConfigs,  List<Map<String, dynamic>> pageConfigs,  Map<String, dynamic>? splashAsset,  Map<String, dynamic>? launchAsset,  Map<String, dynamic>? featureAccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SharedThemePreviewDto() when $default != null:
return $default(_that.theme,_that.colorSchemes,_that.widgetConfigs,_that.pageConfigs,_that.splashAsset,_that.launchAsset,_that.featureAccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> theme,  List<Map<String, dynamic>> colorSchemes,  List<Map<String, dynamic>> widgetConfigs,  List<Map<String, dynamic>> pageConfigs,  Map<String, dynamic>? splashAsset,  Map<String, dynamic>? launchAsset,  Map<String, dynamic>? featureAccess)  $default,) {final _that = this;
switch (_that) {
case _SharedThemePreviewDto():
return $default(_that.theme,_that.colorSchemes,_that.widgetConfigs,_that.pageConfigs,_that.splashAsset,_that.launchAsset,_that.featureAccess);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> theme,  List<Map<String, dynamic>> colorSchemes,  List<Map<String, dynamic>> widgetConfigs,  List<Map<String, dynamic>> pageConfigs,  Map<String, dynamic>? splashAsset,  Map<String, dynamic>? launchAsset,  Map<String, dynamic>? featureAccess)?  $default,) {final _that = this;
switch (_that) {
case _SharedThemePreviewDto() when $default != null:
return $default(_that.theme,_that.colorSchemes,_that.widgetConfigs,_that.pageConfigs,_that.splashAsset,_that.launchAsset,_that.featureAccess);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SharedThemePreviewDto implements SharedThemePreviewDto {
  const _SharedThemePreviewDto({required final  Map<String, dynamic> theme, required final  List<Map<String, dynamic>> colorSchemes, required final  List<Map<String, dynamic>> widgetConfigs, required final  List<Map<String, dynamic>> pageConfigs, final  Map<String, dynamic>? splashAsset, final  Map<String, dynamic>? launchAsset, final  Map<String, dynamic>? featureAccess}): _theme = theme,_colorSchemes = colorSchemes,_widgetConfigs = widgetConfigs,_pageConfigs = pageConfigs,_splashAsset = splashAsset,_launchAsset = launchAsset,_featureAccess = featureAccess;
  factory _SharedThemePreviewDto.fromJson(Map<String, dynamic> json) => _$SharedThemePreviewDtoFromJson(json);

 final  Map<String, dynamic> _theme;
@override Map<String, dynamic> get theme {
  if (_theme is EqualUnmodifiableMapView) return _theme;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_theme);
}

 final  List<Map<String, dynamic>> _colorSchemes;
@override List<Map<String, dynamic>> get colorSchemes {
  if (_colorSchemes is EqualUnmodifiableListView) return _colorSchemes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colorSchemes);
}

 final  List<Map<String, dynamic>> _widgetConfigs;
@override List<Map<String, dynamic>> get widgetConfigs {
  if (_widgetConfigs is EqualUnmodifiableListView) return _widgetConfigs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_widgetConfigs);
}

 final  List<Map<String, dynamic>> _pageConfigs;
@override List<Map<String, dynamic>> get pageConfigs {
  if (_pageConfigs is EqualUnmodifiableListView) return _pageConfigs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pageConfigs);
}

 final  Map<String, dynamic>? _splashAsset;
@override Map<String, dynamic>? get splashAsset {
  final value = _splashAsset;
  if (value == null) return null;
  if (_splashAsset is EqualUnmodifiableMapView) return _splashAsset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _launchAsset;
@override Map<String, dynamic>? get launchAsset {
  final value = _launchAsset;
  if (value == null) return null;
  if (_launchAsset is EqualUnmodifiableMapView) return _launchAsset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _featureAccess;
@override Map<String, dynamic>? get featureAccess {
  final value = _featureAccess;
  if (value == null) return null;
  if (_featureAccess is EqualUnmodifiableMapView) return _featureAccess;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SharedThemePreviewDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharedThemePreviewDtoCopyWith<_SharedThemePreviewDto> get copyWith => __$SharedThemePreviewDtoCopyWithImpl<_SharedThemePreviewDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SharedThemePreviewDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SharedThemePreviewDto&&const DeepCollectionEquality().equals(other._theme, _theme)&&const DeepCollectionEquality().equals(other._colorSchemes, _colorSchemes)&&const DeepCollectionEquality().equals(other._widgetConfigs, _widgetConfigs)&&const DeepCollectionEquality().equals(other._pageConfigs, _pageConfigs)&&const DeepCollectionEquality().equals(other._splashAsset, _splashAsset)&&const DeepCollectionEquality().equals(other._launchAsset, _launchAsset)&&const DeepCollectionEquality().equals(other._featureAccess, _featureAccess));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_theme),const DeepCollectionEquality().hash(_colorSchemes),const DeepCollectionEquality().hash(_widgetConfigs),const DeepCollectionEquality().hash(_pageConfigs),const DeepCollectionEquality().hash(_splashAsset),const DeepCollectionEquality().hash(_launchAsset),const DeepCollectionEquality().hash(_featureAccess));

@override
String toString() {
  return 'SharedThemePreviewDto(theme: $theme, colorSchemes: $colorSchemes, widgetConfigs: $widgetConfigs, pageConfigs: $pageConfigs, splashAsset: $splashAsset, launchAsset: $launchAsset, featureAccess: $featureAccess)';
}


}

/// @nodoc
abstract mixin class _$SharedThemePreviewDtoCopyWith<$Res> implements $SharedThemePreviewDtoCopyWith<$Res> {
  factory _$SharedThemePreviewDtoCopyWith(_SharedThemePreviewDto value, $Res Function(_SharedThemePreviewDto) _then) = __$SharedThemePreviewDtoCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> theme, List<Map<String, dynamic>> colorSchemes, List<Map<String, dynamic>> widgetConfigs, List<Map<String, dynamic>> pageConfigs, Map<String, dynamic>? splashAsset, Map<String, dynamic>? launchAsset, Map<String, dynamic>? featureAccess
});




}
/// @nodoc
class __$SharedThemePreviewDtoCopyWithImpl<$Res>
    implements _$SharedThemePreviewDtoCopyWith<$Res> {
  __$SharedThemePreviewDtoCopyWithImpl(this._self, this._then);

  final _SharedThemePreviewDto _self;
  final $Res Function(_SharedThemePreviewDto) _then;

/// Create a copy of SharedThemePreviewDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theme = null,Object? colorSchemes = null,Object? widgetConfigs = null,Object? pageConfigs = null,Object? splashAsset = freezed,Object? launchAsset = freezed,Object? featureAccess = freezed,}) {
  return _then(_SharedThemePreviewDto(
theme: null == theme ? _self._theme : theme // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,colorSchemes: null == colorSchemes ? _self._colorSchemes : colorSchemes // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,widgetConfigs: null == widgetConfigs ? _self._widgetConfigs : widgetConfigs // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,pageConfigs: null == pageConfigs ? _self._pageConfigs : pageConfigs // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,splashAsset: freezed == splashAsset ? _self._splashAsset : splashAsset // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,launchAsset: freezed == launchAsset ? _self._launchAsset : launchAsset // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,featureAccess: freezed == featureAccess ? _self._featureAccess : featureAccess // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
