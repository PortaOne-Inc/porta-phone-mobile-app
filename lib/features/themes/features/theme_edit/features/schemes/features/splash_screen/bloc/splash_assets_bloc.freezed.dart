// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_assets_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashAssetsState {
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  ThemeAssetModel? get selectedForegroundAsset =>
      throw _privateConstructorUsedError;
  Color? get backgroundColor => throw _privateConstructorUsedError;
  SplashAssetsStateEnum get status => throw _privateConstructorUsedError;

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashAssetsStateCopyWith<SplashAssetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashAssetsStateCopyWith<$Res> {
  factory $SplashAssetsStateCopyWith(
          SplashAssetsState value, $Res Function(SplashAssetsState) then) =
      _$SplashAssetsStateCopyWithImpl<$Res, SplashAssetsState>;
  @useResult
  $Res call(
      {String applicationId,
      String themeId,
      ThemeAssetModel? selectedForegroundAsset,
      Color? backgroundColor,
      SplashAssetsStateEnum status});

  $ThemeAssetModelCopyWith<$Res>? get selectedForegroundAsset;
}

/// @nodoc
class _$SplashAssetsStateCopyWithImpl<$Res, $Val extends SplashAssetsState>
    implements $SplashAssetsStateCopyWith<$Res> {
  _$SplashAssetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? themeId = null,
    Object? selectedForegroundAsset = freezed,
    Object? backgroundColor = freezed,
    Object? status = null,
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
      selectedForegroundAsset: freezed == selectedForegroundAsset
          ? _value.selectedForegroundAsset
          : selectedForegroundAsset // ignore: cast_nullable_to_non_nullable
              as ThemeAssetModel?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SplashAssetsStateEnum,
    ) as $Val);
  }

  /// Create a copy of SplashAssetsState
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
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SplashAssetsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String themeId,
      ThemeAssetModel? selectedForegroundAsset,
      Color? backgroundColor,
      SplashAssetsStateEnum status});

  @override
  $ThemeAssetModelCopyWith<$Res>? get selectedForegroundAsset;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SplashAssetsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? themeId = null,
    Object? selectedForegroundAsset = freezed,
    Object? backgroundColor = freezed,
    Object? status = null,
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
      selectedForegroundAsset: freezed == selectedForegroundAsset
          ? _value.selectedForegroundAsset
          : selectedForegroundAsset // ignore: cast_nullable_to_non_nullable
              as ThemeAssetModel?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SplashAssetsStateEnum,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  _$InitialImpl(
      {required this.applicationId,
      required this.themeId,
      this.selectedForegroundAsset,
      this.backgroundColor,
      this.status = SplashAssetsStateEnum.initial})
      : super._();

  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final ThemeAssetModel? selectedForegroundAsset;
  @override
  final Color? backgroundColor;
  @override
  @JsonKey()
  final SplashAssetsStateEnum status;

  @override
  String toString() {
    return 'SplashAssetsState(applicationId: $applicationId, themeId: $themeId, selectedForegroundAsset: $selectedForegroundAsset, backgroundColor: $backgroundColor, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(
                    other.selectedForegroundAsset, selectedForegroundAsset) ||
                other.selectedForegroundAsset == selectedForegroundAsset) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, applicationId, themeId,
      selectedForegroundAsset, backgroundColor, status);

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends SplashAssetsState {
  factory _Initial(
      {required final String applicationId,
      required final String themeId,
      final ThemeAssetModel? selectedForegroundAsset,
      final Color? backgroundColor,
      final SplashAssetsStateEnum status}) = _$InitialImpl;
  _Initial._() : super._();

  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  ThemeAssetModel? get selectedForegroundAsset;
  @override
  Color? get backgroundColor;
  @override
  SplashAssetsStateEnum get status;

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
