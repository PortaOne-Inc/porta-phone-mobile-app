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
  LaunchAssetsEnvelope? get envelope => throw _privateConstructorUsedError;
  List<AssetModel> get assets => throw _privateConstructorUsedError;
  ConstraintsModel? get constraints => throw _privateConstructorUsedError;
  String? get selectedBackgroundColorHex => throw _privateConstructorUsedError;
  AssetModel? get selectedForegroundAsset => throw _privateConstructorUsedError;
  AssetModel? get selectedBackgroundAsset => throw _privateConstructorUsedError;
  double get paddingAndroidLegacy => throw _privateConstructorUsedError;
  double get paddingAndroidAdaptive => throw _privateConstructorUsedError;
  double get paddingIOS => throw _privateConstructorUsedError;
  double get paddingWEB => throw _privateConstructorUsedError;
  LaunchAssetsStatus get status => throw _privateConstructorUsedError;
  bool get saving => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

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
      LaunchAssetsEnvelope? envelope,
      List<AssetModel> assets,
      ConstraintsModel? constraints,
      String? selectedBackgroundColorHex,
      AssetModel? selectedForegroundAsset,
      AssetModel? selectedBackgroundAsset,
      double paddingAndroidLegacy,
      double paddingAndroidAdaptive,
      double paddingIOS,
      double paddingWEB,
      LaunchAssetsStatus status,
      bool saving,
      String? error});

  $LaunchAssetsEnvelopeCopyWith<$Res>? get envelope;
  $ConstraintsModelCopyWith<$Res>? get constraints;
  $AssetModelCopyWith<$Res>? get selectedForegroundAsset;
  $AssetModelCopyWith<$Res>? get selectedBackgroundAsset;
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
    Object? envelope = freezed,
    Object? assets = null,
    Object? constraints = freezed,
    Object? selectedBackgroundColorHex = freezed,
    Object? selectedForegroundAsset = freezed,
    Object? selectedBackgroundAsset = freezed,
    Object? paddingAndroidLegacy = null,
    Object? paddingAndroidAdaptive = null,
    Object? paddingIOS = null,
    Object? paddingWEB = null,
    Object? status = null,
    Object? saving = null,
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
      envelope: freezed == envelope
          ? _value.envelope
          : envelope // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsEnvelope?,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetModel>,
      constraints: freezed == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as ConstraintsModel?,
      selectedBackgroundColorHex: freezed == selectedBackgroundColorHex
          ? _value.selectedBackgroundColorHex
          : selectedBackgroundColorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedForegroundAsset: freezed == selectedForegroundAsset
          ? _value.selectedForegroundAsset
          : selectedForegroundAsset // ignore: cast_nullable_to_non_nullable
              as AssetModel?,
      selectedBackgroundAsset: freezed == selectedBackgroundAsset
          ? _value.selectedBackgroundAsset
          : selectedBackgroundAsset // ignore: cast_nullable_to_non_nullable
              as AssetModel?,
      paddingAndroidLegacy: null == paddingAndroidLegacy
          ? _value.paddingAndroidLegacy
          : paddingAndroidLegacy // ignore: cast_nullable_to_non_nullable
              as double,
      paddingAndroidAdaptive: null == paddingAndroidAdaptive
          ? _value.paddingAndroidAdaptive
          : paddingAndroidAdaptive // ignore: cast_nullable_to_non_nullable
              as double,
      paddingIOS: null == paddingIOS
          ? _value.paddingIOS
          : paddingIOS // ignore: cast_nullable_to_non_nullable
              as double,
      paddingWEB: null == paddingWEB
          ? _value.paddingWEB
          : paddingWEB // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsStatus,
      saving: null == saving
          ? _value.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetsEnvelopeCopyWith<$Res>? get envelope {
    if (_value.envelope == null) {
      return null;
    }

    return $LaunchAssetsEnvelopeCopyWith<$Res>(_value.envelope!, (value) {
      return _then(_value.copyWith(envelope: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConstraintsModelCopyWith<$Res>? get constraints {
    if (_value.constraints == null) {
      return null;
    }

    return $ConstraintsModelCopyWith<$Res>(_value.constraints!, (value) {
      return _then(_value.copyWith(constraints: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssetModelCopyWith<$Res>? get selectedForegroundAsset {
    if (_value.selectedForegroundAsset == null) {
      return null;
    }

    return $AssetModelCopyWith<$Res>(_value.selectedForegroundAsset!, (value) {
      return _then(_value.copyWith(selectedForegroundAsset: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssetModelCopyWith<$Res>? get selectedBackgroundAsset {
    if (_value.selectedBackgroundAsset == null) {
      return null;
    }

    return $AssetModelCopyWith<$Res>(_value.selectedBackgroundAsset!, (value) {
      return _then(_value.copyWith(selectedBackgroundAsset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LaunchAssetsStateImplCopyWith<$Res>
    implements $LaunchAssetsStateCopyWith<$Res> {
  factory _$$LaunchAssetsStateImplCopyWith(_$LaunchAssetsStateImpl value,
          $Res Function(_$LaunchAssetsStateImpl) then) =
      __$$LaunchAssetsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String themeId,
      LaunchAssetsEnvelope? envelope,
      List<AssetModel> assets,
      ConstraintsModel? constraints,
      String? selectedBackgroundColorHex,
      AssetModel? selectedForegroundAsset,
      AssetModel? selectedBackgroundAsset,
      double paddingAndroidLegacy,
      double paddingAndroidAdaptive,
      double paddingIOS,
      double paddingWEB,
      LaunchAssetsStatus status,
      bool saving,
      String? error});

  @override
  $LaunchAssetsEnvelopeCopyWith<$Res>? get envelope;
  @override
  $ConstraintsModelCopyWith<$Res>? get constraints;
  @override
  $AssetModelCopyWith<$Res>? get selectedForegroundAsset;
  @override
  $AssetModelCopyWith<$Res>? get selectedBackgroundAsset;
}

/// @nodoc
class __$$LaunchAssetsStateImplCopyWithImpl<$Res>
    extends _$LaunchAssetsStateCopyWithImpl<$Res, _$LaunchAssetsStateImpl>
    implements _$$LaunchAssetsStateImplCopyWith<$Res> {
  __$$LaunchAssetsStateImplCopyWithImpl(_$LaunchAssetsStateImpl _value,
      $Res Function(_$LaunchAssetsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? themeId = null,
    Object? envelope = freezed,
    Object? assets = null,
    Object? constraints = freezed,
    Object? selectedBackgroundColorHex = freezed,
    Object? selectedForegroundAsset = freezed,
    Object? selectedBackgroundAsset = freezed,
    Object? paddingAndroidLegacy = null,
    Object? paddingAndroidAdaptive = null,
    Object? paddingIOS = null,
    Object? paddingWEB = null,
    Object? status = null,
    Object? saving = null,
    Object? error = freezed,
  }) {
    return _then(_$LaunchAssetsStateImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      envelope: freezed == envelope
          ? _value.envelope
          : envelope // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsEnvelope?,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetModel>,
      constraints: freezed == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as ConstraintsModel?,
      selectedBackgroundColorHex: freezed == selectedBackgroundColorHex
          ? _value.selectedBackgroundColorHex
          : selectedBackgroundColorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedForegroundAsset: freezed == selectedForegroundAsset
          ? _value.selectedForegroundAsset
          : selectedForegroundAsset // ignore: cast_nullable_to_non_nullable
              as AssetModel?,
      selectedBackgroundAsset: freezed == selectedBackgroundAsset
          ? _value.selectedBackgroundAsset
          : selectedBackgroundAsset // ignore: cast_nullable_to_non_nullable
              as AssetModel?,
      paddingAndroidLegacy: null == paddingAndroidLegacy
          ? _value.paddingAndroidLegacy
          : paddingAndroidLegacy // ignore: cast_nullable_to_non_nullable
              as double,
      paddingAndroidAdaptive: null == paddingAndroidAdaptive
          ? _value.paddingAndroidAdaptive
          : paddingAndroidAdaptive // ignore: cast_nullable_to_non_nullable
              as double,
      paddingIOS: null == paddingIOS
          ? _value.paddingIOS
          : paddingIOS // ignore: cast_nullable_to_non_nullable
              as double,
      paddingWEB: null == paddingWEB
          ? _value.paddingWEB
          : paddingWEB // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsStatus,
      saving: null == saving
          ? _value.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LaunchAssetsStateImpl extends _LaunchAssetsState {
  _$LaunchAssetsStateImpl(
      {required this.applicationId,
      required this.themeId,
      this.envelope,
      final List<AssetModel> assets = const <AssetModel>[],
      this.constraints,
      this.selectedBackgroundColorHex,
      this.selectedForegroundAsset,
      this.selectedBackgroundAsset,
      this.paddingAndroidLegacy = 0.0,
      this.paddingAndroidAdaptive = 0.0,
      this.paddingIOS = 0.0,
      this.paddingWEB = 0.0,
      this.status = LaunchAssetsStatus.initial,
      this.saving = false,
      this.error})
      : _assets = assets,
        super._();

  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final LaunchAssetsEnvelope? envelope;
  final List<AssetModel> _assets;
  @override
  @JsonKey()
  List<AssetModel> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  final ConstraintsModel? constraints;
  @override
  final String? selectedBackgroundColorHex;
  @override
  final AssetModel? selectedForegroundAsset;
  @override
  final AssetModel? selectedBackgroundAsset;
  @override
  @JsonKey()
  final double paddingAndroidLegacy;
  @override
  @JsonKey()
  final double paddingAndroidAdaptive;
  @override
  @JsonKey()
  final double paddingIOS;
  @override
  @JsonKey()
  final double paddingWEB;
  @override
  @JsonKey()
  final LaunchAssetsStatus status;
  @override
  @JsonKey()
  final bool saving;
  @override
  final String? error;

  @override
  String toString() {
    return 'LaunchAssetsState(applicationId: $applicationId, themeId: $themeId, envelope: $envelope, assets: $assets, constraints: $constraints, selectedBackgroundColorHex: $selectedBackgroundColorHex, selectedForegroundAsset: $selectedForegroundAsset, selectedBackgroundAsset: $selectedBackgroundAsset, paddingAndroidLegacy: $paddingAndroidLegacy, paddingAndroidAdaptive: $paddingAndroidAdaptive, paddingIOS: $paddingIOS, paddingWEB: $paddingWEB, status: $status, saving: $saving, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchAssetsStateImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.envelope, envelope) ||
                other.envelope == envelope) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.constraints, constraints) ||
                other.constraints == constraints) &&
            (identical(other.selectedBackgroundColorHex,
                    selectedBackgroundColorHex) ||
                other.selectedBackgroundColorHex ==
                    selectedBackgroundColorHex) &&
            (identical(
                    other.selectedForegroundAsset, selectedForegroundAsset) ||
                other.selectedForegroundAsset == selectedForegroundAsset) &&
            (identical(
                    other.selectedBackgroundAsset, selectedBackgroundAsset) ||
                other.selectedBackgroundAsset == selectedBackgroundAsset) &&
            (identical(other.paddingAndroidLegacy, paddingAndroidLegacy) ||
                other.paddingAndroidLegacy == paddingAndroidLegacy) &&
            (identical(other.paddingAndroidAdaptive, paddingAndroidAdaptive) ||
                other.paddingAndroidAdaptive == paddingAndroidAdaptive) &&
            (identical(other.paddingIOS, paddingIOS) ||
                other.paddingIOS == paddingIOS) &&
            (identical(other.paddingWEB, paddingWEB) ||
                other.paddingWEB == paddingWEB) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      applicationId,
      themeId,
      envelope,
      const DeepCollectionEquality().hash(_assets),
      constraints,
      selectedBackgroundColorHex,
      selectedForegroundAsset,
      selectedBackgroundAsset,
      paddingAndroidLegacy,
      paddingAndroidAdaptive,
      paddingIOS,
      paddingWEB,
      status,
      saving,
      error);

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchAssetsStateImplCopyWith<_$LaunchAssetsStateImpl> get copyWith =>
      __$$LaunchAssetsStateImplCopyWithImpl<_$LaunchAssetsStateImpl>(
          this, _$identity);
}

abstract class _LaunchAssetsState extends LaunchAssetsState {
  factory _LaunchAssetsState(
      {required final String applicationId,
      required final String themeId,
      final LaunchAssetsEnvelope? envelope,
      final List<AssetModel> assets,
      final ConstraintsModel? constraints,
      final String? selectedBackgroundColorHex,
      final AssetModel? selectedForegroundAsset,
      final AssetModel? selectedBackgroundAsset,
      final double paddingAndroidLegacy,
      final double paddingAndroidAdaptive,
      final double paddingIOS,
      final double paddingWEB,
      final LaunchAssetsStatus status,
      final bool saving,
      final String? error}) = _$LaunchAssetsStateImpl;
  _LaunchAssetsState._() : super._();

  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  LaunchAssetsEnvelope? get envelope;
  @override
  List<AssetModel> get assets;
  @override
  ConstraintsModel? get constraints;
  @override
  String? get selectedBackgroundColorHex;
  @override
  AssetModel? get selectedForegroundAsset;
  @override
  AssetModel? get selectedBackgroundAsset;
  @override
  double get paddingAndroidLegacy;
  @override
  double get paddingAndroidAdaptive;
  @override
  double get paddingIOS;
  @override
  double get paddingWEB;
  @override
  LaunchAssetsStatus get status;
  @override
  bool get saving;
  @override
  String? get error;

  /// Create a copy of LaunchAssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchAssetsStateImplCopyWith<_$LaunchAssetsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
