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
  String? get updatedAt => throw _privateConstructorUsedError;
  SplashAssetModel? get existing => throw _privateConstructorUsedError;
  List<AssetModel> get assets => throw _privateConstructorUsedError;
  SplashConstraintsDefaultsModel? get constraintsDefaults =>
      throw _privateConstructorUsedError;
  String? get selectedAssetId => throw _privateConstructorUsedError;
  AssetModel? get selectedAsset => throw _privateConstructorUsedError;
  double get padding => throw _privateConstructorUsedError;
  String? get backgroundColorHex => throw _privateConstructorUsedError;
  SplashAssetsStatus get status => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

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
      String? updatedAt,
      SplashAssetModel? existing,
      List<AssetModel> assets,
      SplashConstraintsDefaultsModel? constraintsDefaults,
      String? selectedAssetId,
      AssetModel? selectedAsset,
      double padding,
      String? backgroundColorHex,
      SplashAssetsStatus status,
      Object? error});

  $SplashAssetModelCopyWith<$Res>? get existing;
  $SplashConstraintsDefaultsModelCopyWith<$Res>? get constraintsDefaults;
  $AssetModelCopyWith<$Res>? get selectedAsset;
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
    Object? updatedAt = freezed,
    Object? existing = freezed,
    Object? assets = null,
    Object? constraintsDefaults = freezed,
    Object? selectedAssetId = freezed,
    Object? selectedAsset = freezed,
    Object? padding = null,
    Object? backgroundColorHex = freezed,
    Object? status = null,
    Object? error = freezed,
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      existing: freezed == existing
          ? _value.existing
          : existing // ignore: cast_nullable_to_non_nullable
              as SplashAssetModel?,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetModel>,
      constraintsDefaults: freezed == constraintsDefaults
          ? _value.constraintsDefaults
          : constraintsDefaults // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsDefaultsModel?,
      selectedAssetId: freezed == selectedAssetId
          ? _value.selectedAssetId
          : selectedAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAsset: freezed == selectedAsset
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as AssetModel?,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      backgroundColorHex: freezed == backgroundColorHex
          ? _value.backgroundColorHex
          : backgroundColorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SplashAssetsStatus,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashAssetModelCopyWith<$Res>? get existing {
    if (_value.existing == null) {
      return null;
    }

    return $SplashAssetModelCopyWith<$Res>(_value.existing!, (value) {
      return _then(_value.copyWith(existing: value) as $Val);
    });
  }

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashConstraintsDefaultsModelCopyWith<$Res>? get constraintsDefaults {
    if (_value.constraintsDefaults == null) {
      return null;
    }

    return $SplashConstraintsDefaultsModelCopyWith<$Res>(
        _value.constraintsDefaults!, (value) {
      return _then(_value.copyWith(constraintsDefaults: value) as $Val);
    });
  }

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssetModelCopyWith<$Res>? get selectedAsset {
    if (_value.selectedAsset == null) {
      return null;
    }

    return $AssetModelCopyWith<$Res>(_value.selectedAsset!, (value) {
      return _then(_value.copyWith(selectedAsset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SplashAssetsStateImplCopyWith<$Res>
    implements $SplashAssetsStateCopyWith<$Res> {
  factory _$$SplashAssetsStateImplCopyWith(_$SplashAssetsStateImpl value,
          $Res Function(_$SplashAssetsStateImpl) then) =
      __$$SplashAssetsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String themeId,
      String? updatedAt,
      SplashAssetModel? existing,
      List<AssetModel> assets,
      SplashConstraintsDefaultsModel? constraintsDefaults,
      String? selectedAssetId,
      AssetModel? selectedAsset,
      double padding,
      String? backgroundColorHex,
      SplashAssetsStatus status,
      Object? error});

  @override
  $SplashAssetModelCopyWith<$Res>? get existing;
  @override
  $SplashConstraintsDefaultsModelCopyWith<$Res>? get constraintsDefaults;
  @override
  $AssetModelCopyWith<$Res>? get selectedAsset;
}

/// @nodoc
class __$$SplashAssetsStateImplCopyWithImpl<$Res>
    extends _$SplashAssetsStateCopyWithImpl<$Res, _$SplashAssetsStateImpl>
    implements _$$SplashAssetsStateImplCopyWith<$Res> {
  __$$SplashAssetsStateImplCopyWithImpl(_$SplashAssetsStateImpl _value,
      $Res Function(_$SplashAssetsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? themeId = null,
    Object? updatedAt = freezed,
    Object? existing = freezed,
    Object? assets = null,
    Object? constraintsDefaults = freezed,
    Object? selectedAssetId = freezed,
    Object? selectedAsset = freezed,
    Object? padding = null,
    Object? backgroundColorHex = freezed,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$SplashAssetsStateImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      existing: freezed == existing
          ? _value.existing
          : existing // ignore: cast_nullable_to_non_nullable
              as SplashAssetModel?,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetModel>,
      constraintsDefaults: freezed == constraintsDefaults
          ? _value.constraintsDefaults
          : constraintsDefaults // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsDefaultsModel?,
      selectedAssetId: freezed == selectedAssetId
          ? _value.selectedAssetId
          : selectedAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAsset: freezed == selectedAsset
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as AssetModel?,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      backgroundColorHex: freezed == backgroundColorHex
          ? _value.backgroundColorHex
          : backgroundColorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SplashAssetsStatus,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$SplashAssetsStateImpl extends _SplashAssetsState {
  _$SplashAssetsStateImpl(
      {required this.applicationId,
      required this.themeId,
      this.updatedAt,
      this.existing,
      final List<AssetModel> assets = const <AssetModel>[],
      this.constraintsDefaults,
      this.selectedAssetId,
      this.selectedAsset,
      this.padding = 0,
      this.backgroundColorHex,
      this.status = SplashAssetsStatus.initial,
      this.error})
      : _assets = assets,
        super._();

  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final String? updatedAt;
  @override
  final SplashAssetModel? existing;
  final List<AssetModel> _assets;
  @override
  @JsonKey()
  List<AssetModel> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  final SplashConstraintsDefaultsModel? constraintsDefaults;
  @override
  final String? selectedAssetId;
  @override
  final AssetModel? selectedAsset;
  @override
  @JsonKey()
  final double padding;
  @override
  final String? backgroundColorHex;
  @override
  @JsonKey()
  final SplashAssetsStatus status;
  @override
  final Object? error;

  @override
  String toString() {
    return 'SplashAssetsState(applicationId: $applicationId, themeId: $themeId, updatedAt: $updatedAt, existing: $existing, assets: $assets, constraintsDefaults: $constraintsDefaults, selectedAssetId: $selectedAssetId, selectedAsset: $selectedAsset, padding: $padding, backgroundColorHex: $backgroundColorHex, status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashAssetsStateImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.existing, existing) ||
                other.existing == existing) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.constraintsDefaults, constraintsDefaults) ||
                other.constraintsDefaults == constraintsDefaults) &&
            (identical(other.selectedAssetId, selectedAssetId) ||
                other.selectedAssetId == selectedAssetId) &&
            (identical(other.selectedAsset, selectedAsset) ||
                other.selectedAsset == selectedAsset) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.backgroundColorHex, backgroundColorHex) ||
                other.backgroundColorHex == backgroundColorHex) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      applicationId,
      themeId,
      updatedAt,
      existing,
      const DeepCollectionEquality().hash(_assets),
      constraintsDefaults,
      selectedAssetId,
      selectedAsset,
      padding,
      backgroundColorHex,
      status,
      const DeepCollectionEquality().hash(error));

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashAssetsStateImplCopyWith<_$SplashAssetsStateImpl> get copyWith =>
      __$$SplashAssetsStateImplCopyWithImpl<_$SplashAssetsStateImpl>(
          this, _$identity);
}

abstract class _SplashAssetsState extends SplashAssetsState {
  factory _SplashAssetsState(
      {required final String applicationId,
      required final String themeId,
      final String? updatedAt,
      final SplashAssetModel? existing,
      final List<AssetModel> assets,
      final SplashConstraintsDefaultsModel? constraintsDefaults,
      final String? selectedAssetId,
      final AssetModel? selectedAsset,
      final double padding,
      final String? backgroundColorHex,
      final SplashAssetsStatus status,
      final Object? error}) = _$SplashAssetsStateImpl;
  _SplashAssetsState._() : super._();

  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  String? get updatedAt;
  @override
  SplashAssetModel? get existing;
  @override
  List<AssetModel> get assets;
  @override
  SplashConstraintsDefaultsModel? get constraintsDefaults;
  @override
  String? get selectedAssetId;
  @override
  AssetModel? get selectedAsset;
  @override
  double get padding;
  @override
  String? get backgroundColorHex;
  @override
  SplashAssetsStatus get status;
  @override
  Object? get error;

  /// Create a copy of SplashAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashAssetsStateImplCopyWith<_$SplashAssetsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
