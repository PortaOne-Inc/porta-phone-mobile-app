// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_assets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LaunchAssetsState {
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  LaunchAssetsStateEnum get status => throw _privateConstructorUsedError;
  ThemeAssetModel? get selectedForegroundAsset =>
      throw _privateConstructorUsedError;
  ThemeAssetModel? get selectedBackgroundAsset =>
      throw _privateConstructorUsedError;
  Color? get selectedBackgroundColor => throw _privateConstructorUsedError;

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaunchAssetsStateCopyWith<LaunchAssetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchAssetsStateCopyWith<$Res> {
  factory $LaunchAssetsStateCopyWith(
          LaunchAssetsState value, $Res Function(LaunchAssetsState) then) =
      _$LaunchAssetsStateCopyWithImpl<$Res, LaunchAssetsState>;
  @useResult
  $Res call(
      {String applicationId,
      String themeId,
      LaunchAssetsStateEnum status,
      ThemeAssetModel? selectedForegroundAsset,
      ThemeAssetModel? selectedBackgroundAsset,
      Color? selectedBackgroundColor});

  $ThemeAssetModelCopyWith<$Res>? get selectedForegroundAsset;
  $ThemeAssetModelCopyWith<$Res>? get selectedBackgroundAsset;
}

/// @nodoc
class _$LaunchAssetsStateCopyWithImpl<$Res, $Val extends LaunchAssetsState>
    implements $LaunchAssetsStateCopyWith<$Res> {
  _$LaunchAssetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? themeId = null,
    Object? status = null,
    Object? selectedForegroundAsset = freezed,
    Object? selectedBackgroundAsset = freezed,
    Object? selectedBackgroundColor = freezed,
  }) {
    return _then(_value.copyWith(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsStateEnum,
      selectedForegroundAsset: freezed == selectedForegroundAsset
          ? _value.selectedForegroundAsset
          : selectedForegroundAsset // ignore: cast_nullable_to_non_nullable
              as ThemeAssetModel?,
      selectedBackgroundAsset: freezed == selectedBackgroundAsset
          ? _value.selectedBackgroundAsset
          : selectedBackgroundAsset // ignore: cast_nullable_to_non_nullable
              as ThemeAssetModel?,
      selectedBackgroundColor: freezed == selectedBackgroundColor
          ? _value.selectedBackgroundColor
          : selectedBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThemeAssetModelCopyWith<$Res>? get selectedForegroundAsset {
    if (_value.selectedForegroundAsset == null) {
      return null;
    }

    return $ThemeAssetModelCopyWith<$Res>(_value.selectedForegroundAsset!,
        (value) {
      return _then(_value.copyWith(selectedForegroundAsset: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThemeAssetModelCopyWith<$Res>? get selectedBackgroundAsset {
    if (_value.selectedBackgroundAsset == null) {
      return null;
    }

    return $ThemeAssetModelCopyWith<$Res>(_value.selectedBackgroundAsset!,
        (value) {
      return _then(_value.copyWith(selectedBackgroundAsset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $LaunchAssetsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String themeId,
      LaunchAssetsStateEnum status,
      ThemeAssetModel? selectedForegroundAsset,
      ThemeAssetModel? selectedBackgroundAsset,
      Color? selectedBackgroundColor});

  @override
  $ThemeAssetModelCopyWith<$Res>? get selectedForegroundAsset;
  @override
  $ThemeAssetModelCopyWith<$Res>? get selectedBackgroundAsset;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LaunchAssetsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? themeId = null,
    Object? status = null,
    Object? selectedForegroundAsset = freezed,
    Object? selectedBackgroundAsset = freezed,
    Object? selectedBackgroundColor = freezed,
  }) {
    return _then(_$InitialImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsStateEnum,
      selectedForegroundAsset: freezed == selectedForegroundAsset
          ? _value.selectedForegroundAsset
          : selectedForegroundAsset // ignore: cast_nullable_to_non_nullable
              as ThemeAssetModel?,
      selectedBackgroundAsset: freezed == selectedBackgroundAsset
          ? _value.selectedBackgroundAsset
          : selectedBackgroundAsset // ignore: cast_nullable_to_non_nullable
              as ThemeAssetModel?,
      selectedBackgroundColor: freezed == selectedBackgroundColor
          ? _value.selectedBackgroundColor
          : selectedBackgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  _$InitialImpl(
      {required this.applicationId,
      required this.themeId,
      this.status = LaunchAssetsStateEnum.initial,
      this.selectedForegroundAsset,
      this.selectedBackgroundAsset,
      this.selectedBackgroundColor})
      : super._();

  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  @JsonKey()
  final LaunchAssetsStateEnum status;
  @override
  final ThemeAssetModel? selectedForegroundAsset;
  @override
  final ThemeAssetModel? selectedBackgroundAsset;
  @override
  final Color? selectedBackgroundColor;

  @override
  String toString() {
    return 'LaunchAssetsState(applicationId: $applicationId, themeId: $themeId, status: $status, selectedForegroundAsset: $selectedForegroundAsset, selectedBackgroundAsset: $selectedBackgroundAsset, selectedBackgroundColor: $selectedBackgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(
                    other.selectedForegroundAsset, selectedForegroundAsset) ||
                other.selectedForegroundAsset == selectedForegroundAsset) &&
            (identical(
                    other.selectedBackgroundAsset, selectedBackgroundAsset) ||
                other.selectedBackgroundAsset == selectedBackgroundAsset) &&
            (identical(
                    other.selectedBackgroundColor, selectedBackgroundColor) ||
                other.selectedBackgroundColor == selectedBackgroundColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      applicationId,
      themeId,
      status,
      selectedForegroundAsset,
      selectedBackgroundAsset,
      selectedBackgroundColor);

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends LaunchAssetsState {
  factory _Initial(
      {required final String applicationId,
      required final String themeId,
      final LaunchAssetsStateEnum status,
      final ThemeAssetModel? selectedForegroundAsset,
      final ThemeAssetModel? selectedBackgroundAsset,
      final Color? selectedBackgroundColor}) = _$InitialImpl;
  _Initial._() : super._();

  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  LaunchAssetsStateEnum get status;
  @override
  ThemeAssetModel? get selectedForegroundAsset;
  @override
  ThemeAssetModel? get selectedBackgroundAsset;
  @override
  Color? get selectedBackgroundColor;

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
