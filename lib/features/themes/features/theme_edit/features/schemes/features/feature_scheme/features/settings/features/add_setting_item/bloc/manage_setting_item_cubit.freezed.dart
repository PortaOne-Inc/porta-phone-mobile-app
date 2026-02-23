// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_setting_item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManageSettingItemState {

 bool get enable; String? get titleL10n; String? get settingItemIcon; String? get settingItemColor; EmbeddedResourceModel? get selectedEmbeddedResource; SettingsFlavor? get type; AppConfigSettingsItem? get resultSettingItem;
/// Create a copy of ManageSettingItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageSettingItemStateCopyWith<ManageSettingItemState> get copyWith => _$ManageSettingItemStateCopyWithImpl<ManageSettingItemState>(this as ManageSettingItemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageSettingItemState&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.titleL10n, titleL10n) || other.titleL10n == titleL10n)&&(identical(other.settingItemIcon, settingItemIcon) || other.settingItemIcon == settingItemIcon)&&(identical(other.settingItemColor, settingItemColor) || other.settingItemColor == settingItemColor)&&(identical(other.selectedEmbeddedResource, selectedEmbeddedResource) || other.selectedEmbeddedResource == selectedEmbeddedResource)&&(identical(other.type, type) || other.type == type)&&(identical(other.resultSettingItem, resultSettingItem) || other.resultSettingItem == resultSettingItem));
}


@override
int get hashCode => Object.hash(runtimeType,enable,titleL10n,settingItemIcon,settingItemColor,selectedEmbeddedResource,type,resultSettingItem);

@override
String toString() {
  return 'ManageSettingItemState(enable: $enable, titleL10n: $titleL10n, settingItemIcon: $settingItemIcon, settingItemColor: $settingItemColor, selectedEmbeddedResource: $selectedEmbeddedResource, type: $type, resultSettingItem: $resultSettingItem)';
}


}

/// @nodoc
abstract mixin class $ManageSettingItemStateCopyWith<$Res>  {
  factory $ManageSettingItemStateCopyWith(ManageSettingItemState value, $Res Function(ManageSettingItemState) _then) = _$ManageSettingItemStateCopyWithImpl;
@useResult
$Res call({
 bool enable, String? titleL10n, String? settingItemIcon, String? settingItemColor, EmbeddedResourceModel? selectedEmbeddedResource, SettingsFlavor? type, AppConfigSettingsItem? resultSettingItem
});


$EmbeddedResourceModelCopyWith<$Res>? get selectedEmbeddedResource;$AppConfigSettingsItemCopyWith<$Res>? get resultSettingItem;

}
/// @nodoc
class _$ManageSettingItemStateCopyWithImpl<$Res>
    implements $ManageSettingItemStateCopyWith<$Res> {
  _$ManageSettingItemStateCopyWithImpl(this._self, this._then);

  final ManageSettingItemState _self;
  final $Res Function(ManageSettingItemState) _then;

/// Create a copy of ManageSettingItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enable = null,Object? titleL10n = freezed,Object? settingItemIcon = freezed,Object? settingItemColor = freezed,Object? selectedEmbeddedResource = freezed,Object? type = freezed,Object? resultSettingItem = freezed,}) {
  return _then(_self.copyWith(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,titleL10n: freezed == titleL10n ? _self.titleL10n : titleL10n // ignore: cast_nullable_to_non_nullable
as String?,settingItemIcon: freezed == settingItemIcon ? _self.settingItemIcon : settingItemIcon // ignore: cast_nullable_to_non_nullable
as String?,settingItemColor: freezed == settingItemColor ? _self.settingItemColor : settingItemColor // ignore: cast_nullable_to_non_nullable
as String?,selectedEmbeddedResource: freezed == selectedEmbeddedResource ? _self.selectedEmbeddedResource : selectedEmbeddedResource // ignore: cast_nullable_to_non_nullable
as EmbeddedResourceModel?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SettingsFlavor?,resultSettingItem: freezed == resultSettingItem ? _self.resultSettingItem : resultSettingItem // ignore: cast_nullable_to_non_nullable
as AppConfigSettingsItem?,
  ));
}
/// Create a copy of ManageSettingItemState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmbeddedResourceModelCopyWith<$Res>? get selectedEmbeddedResource {
    if (_self.selectedEmbeddedResource == null) {
    return null;
  }

  return $EmbeddedResourceModelCopyWith<$Res>(_self.selectedEmbeddedResource!, (value) {
    return _then(_self.copyWith(selectedEmbeddedResource: value));
  });
}/// Create a copy of ManageSettingItemState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigSettingsItemCopyWith<$Res>? get resultSettingItem {
    if (_self.resultSettingItem == null) {
    return null;
  }

  return $AppConfigSettingsItemCopyWith<$Res>(_self.resultSettingItem!, (value) {
    return _then(_self.copyWith(resultSettingItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManageSettingItemState].
extension ManageSettingItemStatePatterns on ManageSettingItemState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,){
final _that = this;
switch (_that) {
case _Initial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enable,  String? titleL10n,  String? settingItemIcon,  String? settingItemColor,  EmbeddedResourceModel? selectedEmbeddedResource,  SettingsFlavor? type,  AppConfigSettingsItem? resultSettingItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.enable,_that.titleL10n,_that.settingItemIcon,_that.settingItemColor,_that.selectedEmbeddedResource,_that.type,_that.resultSettingItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enable,  String? titleL10n,  String? settingItemIcon,  String? settingItemColor,  EmbeddedResourceModel? selectedEmbeddedResource,  SettingsFlavor? type,  AppConfigSettingsItem? resultSettingItem)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.enable,_that.titleL10n,_that.settingItemIcon,_that.settingItemColor,_that.selectedEmbeddedResource,_that.type,_that.resultSettingItem);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enable,  String? titleL10n,  String? settingItemIcon,  String? settingItemColor,  EmbeddedResourceModel? selectedEmbeddedResource,  SettingsFlavor? type,  AppConfigSettingsItem? resultSettingItem)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.enable,_that.titleL10n,_that.settingItemIcon,_that.settingItemColor,_that.selectedEmbeddedResource,_that.type,_that.resultSettingItem);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends ManageSettingItemState {
   _Initial({this.enable = true, this.titleL10n, this.settingItemIcon, this.settingItemColor, this.selectedEmbeddedResource, this.type, this.resultSettingItem}): super._();
  

@override@JsonKey() final  bool enable;
@override final  String? titleL10n;
@override final  String? settingItemIcon;
@override final  String? settingItemColor;
@override final  EmbeddedResourceModel? selectedEmbeddedResource;
@override final  SettingsFlavor? type;
@override final  AppConfigSettingsItem? resultSettingItem;

/// Create a copy of ManageSettingItemState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.enable, enable) || other.enable == enable)&&(identical(other.titleL10n, titleL10n) || other.titleL10n == titleL10n)&&(identical(other.settingItemIcon, settingItemIcon) || other.settingItemIcon == settingItemIcon)&&(identical(other.settingItemColor, settingItemColor) || other.settingItemColor == settingItemColor)&&(identical(other.selectedEmbeddedResource, selectedEmbeddedResource) || other.selectedEmbeddedResource == selectedEmbeddedResource)&&(identical(other.type, type) || other.type == type)&&(identical(other.resultSettingItem, resultSettingItem) || other.resultSettingItem == resultSettingItem));
}


@override
int get hashCode => Object.hash(runtimeType,enable,titleL10n,settingItemIcon,settingItemColor,selectedEmbeddedResource,type,resultSettingItem);

@override
String toString() {
  return 'ManageSettingItemState(enable: $enable, titleL10n: $titleL10n, settingItemIcon: $settingItemIcon, settingItemColor: $settingItemColor, selectedEmbeddedResource: $selectedEmbeddedResource, type: $type, resultSettingItem: $resultSettingItem)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ManageSettingItemStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 bool enable, String? titleL10n, String? settingItemIcon, String? settingItemColor, EmbeddedResourceModel? selectedEmbeddedResource, SettingsFlavor? type, AppConfigSettingsItem? resultSettingItem
});


@override $EmbeddedResourceModelCopyWith<$Res>? get selectedEmbeddedResource;@override $AppConfigSettingsItemCopyWith<$Res>? get resultSettingItem;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ManageSettingItemState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enable = null,Object? titleL10n = freezed,Object? settingItemIcon = freezed,Object? settingItemColor = freezed,Object? selectedEmbeddedResource = freezed,Object? type = freezed,Object? resultSettingItem = freezed,}) {
  return _then(_Initial(
enable: null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,titleL10n: freezed == titleL10n ? _self.titleL10n : titleL10n // ignore: cast_nullable_to_non_nullable
as String?,settingItemIcon: freezed == settingItemIcon ? _self.settingItemIcon : settingItemIcon // ignore: cast_nullable_to_non_nullable
as String?,settingItemColor: freezed == settingItemColor ? _self.settingItemColor : settingItemColor // ignore: cast_nullable_to_non_nullable
as String?,selectedEmbeddedResource: freezed == selectedEmbeddedResource ? _self.selectedEmbeddedResource : selectedEmbeddedResource // ignore: cast_nullable_to_non_nullable
as EmbeddedResourceModel?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SettingsFlavor?,resultSettingItem: freezed == resultSettingItem ? _self.resultSettingItem : resultSettingItem // ignore: cast_nullable_to_non_nullable
as AppConfigSettingsItem?,
  ));
}

/// Create a copy of ManageSettingItemState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmbeddedResourceModelCopyWith<$Res>? get selectedEmbeddedResource {
    if (_self.selectedEmbeddedResource == null) {
    return null;
  }

  return $EmbeddedResourceModelCopyWith<$Res>(_self.selectedEmbeddedResource!, (value) {
    return _then(_self.copyWith(selectedEmbeddedResource: value));
  });
}/// Create a copy of ManageSettingItemState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppConfigSettingsItemCopyWith<$Res>? get resultSettingItem {
    if (_self.resultSettingItem == null) {
    return null;
  }

  return $AppConfigSettingsItemCopyWith<$Res>(_self.resultSettingItem!, (value) {
    return _then(_self.copyWith(resultSettingItem: value));
  });
}
}

// dart format on
