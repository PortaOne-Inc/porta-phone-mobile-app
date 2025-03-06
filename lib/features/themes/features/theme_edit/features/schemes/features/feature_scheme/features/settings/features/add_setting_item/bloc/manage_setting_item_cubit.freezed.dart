// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_setting_item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManageSettingItemState {
  bool get enable => throw _privateConstructorUsedError;
  String? get titleL10n => throw _privateConstructorUsedError;
  String? get settingItemIcon => throw _privateConstructorUsedError;
  EmbeddedResource? get selectedEmbeddedResource =>
      throw _privateConstructorUsedError;
  SettingsFlavor? get type =>
      throw _privateConstructorUsedError; // Set final values
  AppConfigSettingsItem? get resultSettingItem =>
      throw _privateConstructorUsedError;

  /// Create a copy of ManageSettingItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageSettingItemStateCopyWith<ManageSettingItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageSettingItemStateCopyWith<$Res> {
  factory $ManageSettingItemStateCopyWith(ManageSettingItemState value,
          $Res Function(ManageSettingItemState) then) =
      _$ManageSettingItemStateCopyWithImpl<$Res, ManageSettingItemState>;
  @useResult
  $Res call(
      {bool enable,
      String? titleL10n,
      String? settingItemIcon,
      EmbeddedResource? selectedEmbeddedResource,
      SettingsFlavor? type,
      AppConfigSettingsItem? resultSettingItem});

  $EmbeddedResourceCopyWith<$Res>? get selectedEmbeddedResource;
  $AppConfigSettingsItemCopyWith<$Res>? get resultSettingItem;
}

/// @nodoc
class _$ManageSettingItemStateCopyWithImpl<$Res,
        $Val extends ManageSettingItemState>
    implements $ManageSettingItemStateCopyWith<$Res> {
  _$ManageSettingItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManageSettingItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? titleL10n = freezed,
    Object? settingItemIcon = freezed,
    Object? selectedEmbeddedResource = freezed,
    Object? type = freezed,
    Object? resultSettingItem = freezed,
  }) {
    return _then(_value.copyWith(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      titleL10n: freezed == titleL10n
          ? _value.titleL10n
          : titleL10n // ignore: cast_nullable_to_non_nullable
              as String?,
      settingItemIcon: freezed == settingItemIcon
          ? _value.settingItemIcon
          : settingItemIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedEmbeddedResource: freezed == selectedEmbeddedResource
          ? _value.selectedEmbeddedResource
          : selectedEmbeddedResource // ignore: cast_nullable_to_non_nullable
              as EmbeddedResource?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SettingsFlavor?,
      resultSettingItem: freezed == resultSettingItem
          ? _value.resultSettingItem
          : resultSettingItem // ignore: cast_nullable_to_non_nullable
              as AppConfigSettingsItem?,
    ) as $Val);
  }

  /// Create a copy of ManageSettingItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmbeddedResourceCopyWith<$Res>? get selectedEmbeddedResource {
    if (_value.selectedEmbeddedResource == null) {
      return null;
    }

    return $EmbeddedResourceCopyWith<$Res>(_value.selectedEmbeddedResource!,
        (value) {
      return _then(_value.copyWith(selectedEmbeddedResource: value) as $Val);
    });
  }

  /// Create a copy of ManageSettingItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppConfigSettingsItemCopyWith<$Res>? get resultSettingItem {
    if (_value.resultSettingItem == null) {
      return null;
    }

    return $AppConfigSettingsItemCopyWith<$Res>(_value.resultSettingItem!,
        (value) {
      return _then(_value.copyWith(resultSettingItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ManageSettingItemStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool enable,
      String? titleL10n,
      String? settingItemIcon,
      EmbeddedResource? selectedEmbeddedResource,
      SettingsFlavor? type,
      AppConfigSettingsItem? resultSettingItem});

  @override
  $EmbeddedResourceCopyWith<$Res>? get selectedEmbeddedResource;
  @override
  $AppConfigSettingsItemCopyWith<$Res>? get resultSettingItem;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ManageSettingItemStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManageSettingItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? titleL10n = freezed,
    Object? settingItemIcon = freezed,
    Object? selectedEmbeddedResource = freezed,
    Object? type = freezed,
    Object? resultSettingItem = freezed,
  }) {
    return _then(_$InitialImpl(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      titleL10n: freezed == titleL10n
          ? _value.titleL10n
          : titleL10n // ignore: cast_nullable_to_non_nullable
              as String?,
      settingItemIcon: freezed == settingItemIcon
          ? _value.settingItemIcon
          : settingItemIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedEmbeddedResource: freezed == selectedEmbeddedResource
          ? _value.selectedEmbeddedResource
          : selectedEmbeddedResource // ignore: cast_nullable_to_non_nullable
              as EmbeddedResource?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SettingsFlavor?,
      resultSettingItem: freezed == resultSettingItem
          ? _value.resultSettingItem
          : resultSettingItem // ignore: cast_nullable_to_non_nullable
              as AppConfigSettingsItem?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  _$InitialImpl(
      {this.enable = true,
      this.titleL10n,
      this.settingItemIcon,
      this.selectedEmbeddedResource,
      this.type,
      this.resultSettingItem})
      : super._();

  @override
  @JsonKey()
  final bool enable;
  @override
  final String? titleL10n;
  @override
  final String? settingItemIcon;
  @override
  final EmbeddedResource? selectedEmbeddedResource;
  @override
  final SettingsFlavor? type;
// Set final values
  @override
  final AppConfigSettingsItem? resultSettingItem;

  @override
  String toString() {
    return 'ManageSettingItemState(enable: $enable, titleL10n: $titleL10n, settingItemIcon: $settingItemIcon, selectedEmbeddedResource: $selectedEmbeddedResource, type: $type, resultSettingItem: $resultSettingItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.titleL10n, titleL10n) ||
                other.titleL10n == titleL10n) &&
            (identical(other.settingItemIcon, settingItemIcon) ||
                other.settingItemIcon == settingItemIcon) &&
            (identical(
                    other.selectedEmbeddedResource, selectedEmbeddedResource) ||
                other.selectedEmbeddedResource == selectedEmbeddedResource) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.resultSettingItem, resultSettingItem) ||
                other.resultSettingItem == resultSettingItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enable, titleL10n,
      settingItemIcon, selectedEmbeddedResource, type, resultSettingItem);

  /// Create a copy of ManageSettingItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends ManageSettingItemState {
  factory _Initial(
      {final bool enable,
      final String? titleL10n,
      final String? settingItemIcon,
      final EmbeddedResource? selectedEmbeddedResource,
      final SettingsFlavor? type,
      final AppConfigSettingsItem? resultSettingItem}) = _$InitialImpl;
  _Initial._() : super._();

  @override
  bool get enable;
  @override
  String? get titleL10n;
  @override
  String? get settingItemIcon;
  @override
  EmbeddedResource? get selectedEmbeddedResource;
  @override
  SettingsFlavor? get type; // Set final values
  @override
  AppConfigSettingsItem? get resultSettingItem;

  /// Create a copy of ManageSettingItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
