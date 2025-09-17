// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssetsState {
  String get applicationId => throw _privateConstructorUsedError;
  AssetsStatus get status => throw _privateConstructorUsedError;
  List<AssetModel> get assets => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError; // create flow
  bool get creating => throw _privateConstructorUsedError;
  String? get createError => throw _privateConstructorUsedError; // delete flow
  bool get deleting => throw _privateConstructorUsedError;
  String? get deleteError => throw _privateConstructorUsedError;
  String? get deletingAssetId => throw _privateConstructorUsedError; // filters
  bool get lockFilters => throw _privateConstructorUsedError;

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetsStateCopyWith<AssetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetsStateCopyWith<$Res> {
  factory $AssetsStateCopyWith(
          AssetsState value, $Res Function(AssetsState) then) =
      _$AssetsStateCopyWithImpl<$Res, AssetsState>;
  @useResult
  $Res call(
      {String applicationId,
      AssetsStatus status,
      List<AssetModel> assets,
      String? errorMessage,
      bool creating,
      String? createError,
      bool deleting,
      String? deleteError,
      String? deletingAssetId,
      bool lockFilters});
}

/// @nodoc
class _$AssetsStateCopyWithImpl<$Res, $Val extends AssetsState>
    implements $AssetsStateCopyWith<$Res> {
  _$AssetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? status = null,
    Object? assets = null,
    Object? errorMessage = freezed,
    Object? creating = null,
    Object? createError = freezed,
    Object? deleting = null,
    Object? deleteError = freezed,
    Object? deletingAssetId = freezed,
    Object? lockFilters = null,
  }) {
    return _then(_value.copyWith(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssetsStatus,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      creating: null == creating
          ? _value.creating
          : creating // ignore: cast_nullable_to_non_nullable
              as bool,
      createError: freezed == createError
          ? _value.createError
          : createError // ignore: cast_nullable_to_non_nullable
              as String?,
      deleting: null == deleting
          ? _value.deleting
          : deleting // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteError: freezed == deleteError
          ? _value.deleteError
          : deleteError // ignore: cast_nullable_to_non_nullable
              as String?,
      deletingAssetId: freezed == deletingAssetId
          ? _value.deletingAssetId
          : deletingAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      lockFilters: null == lockFilters
          ? _value.lockFilters
          : lockFilters // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetsStateImplCopyWith<$Res>
    implements $AssetsStateCopyWith<$Res> {
  factory _$$AssetsStateImplCopyWith(
          _$AssetsStateImpl value, $Res Function(_$AssetsStateImpl) then) =
      __$$AssetsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      AssetsStatus status,
      List<AssetModel> assets,
      String? errorMessage,
      bool creating,
      String? createError,
      bool deleting,
      String? deleteError,
      String? deletingAssetId,
      bool lockFilters});
}

/// @nodoc
class __$$AssetsStateImplCopyWithImpl<$Res>
    extends _$AssetsStateCopyWithImpl<$Res, _$AssetsStateImpl>
    implements _$$AssetsStateImplCopyWith<$Res> {
  __$$AssetsStateImplCopyWithImpl(
      _$AssetsStateImpl _value, $Res Function(_$AssetsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? status = null,
    Object? assets = null,
    Object? errorMessage = freezed,
    Object? creating = null,
    Object? createError = freezed,
    Object? deleting = null,
    Object? deleteError = freezed,
    Object? deletingAssetId = freezed,
    Object? lockFilters = null,
  }) {
    return _then(_$AssetsStateImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AssetsStatus,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      creating: null == creating
          ? _value.creating
          : creating // ignore: cast_nullable_to_non_nullable
              as bool,
      createError: freezed == createError
          ? _value.createError
          : createError // ignore: cast_nullable_to_non_nullable
              as String?,
      deleting: null == deleting
          ? _value.deleting
          : deleting // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteError: freezed == deleteError
          ? _value.deleteError
          : deleteError // ignore: cast_nullable_to_non_nullable
              as String?,
      deletingAssetId: freezed == deletingAssetId
          ? _value.deletingAssetId
          : deletingAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      lockFilters: null == lockFilters
          ? _value.lockFilters
          : lockFilters // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AssetsStateImpl with DiagnosticableTreeMixin implements _AssetsState {
  const _$AssetsStateImpl(
      {required this.applicationId,
      this.status = AssetsStatus.initial,
      final List<AssetModel> assets = const <AssetModel>[],
      this.errorMessage,
      this.creating = false,
      this.createError,
      this.deleting = false,
      this.deleteError,
      this.deletingAssetId,
      this.lockFilters = false})
      : _assets = assets;

  @override
  final String applicationId;
  @override
  @JsonKey()
  final AssetsStatus status;
  final List<AssetModel> _assets;
  @override
  @JsonKey()
  List<AssetModel> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  final String? errorMessage;
// create flow
  @override
  @JsonKey()
  final bool creating;
  @override
  final String? createError;
// delete flow
  @override
  @JsonKey()
  final bool deleting;
  @override
  final String? deleteError;
  @override
  final String? deletingAssetId;
// filters
  @override
  @JsonKey()
  final bool lockFilters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AssetsState(applicationId: $applicationId, status: $status, assets: $assets, errorMessage: $errorMessage, creating: $creating, createError: $createError, deleting: $deleting, deleteError: $deleteError, deletingAssetId: $deletingAssetId, lockFilters: $lockFilters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AssetsState'))
      ..add(DiagnosticsProperty('applicationId', applicationId))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('assets', assets))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('creating', creating))
      ..add(DiagnosticsProperty('createError', createError))
      ..add(DiagnosticsProperty('deleting', deleting))
      ..add(DiagnosticsProperty('deleteError', deleteError))
      ..add(DiagnosticsProperty('deletingAssetId', deletingAssetId))
      ..add(DiagnosticsProperty('lockFilters', lockFilters));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetsStateImpl &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.creating, creating) ||
                other.creating == creating) &&
            (identical(other.createError, createError) ||
                other.createError == createError) &&
            (identical(other.deleting, deleting) ||
                other.deleting == deleting) &&
            (identical(other.deleteError, deleteError) ||
                other.deleteError == deleteError) &&
            (identical(other.deletingAssetId, deletingAssetId) ||
                other.deletingAssetId == deletingAssetId) &&
            (identical(other.lockFilters, lockFilters) ||
                other.lockFilters == lockFilters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      applicationId,
      status,
      const DeepCollectionEquality().hash(_assets),
      errorMessage,
      creating,
      createError,
      deleting,
      deleteError,
      deletingAssetId,
      lockFilters);

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetsStateImplCopyWith<_$AssetsStateImpl> get copyWith =>
      __$$AssetsStateImplCopyWithImpl<_$AssetsStateImpl>(this, _$identity);
}

abstract class _AssetsState implements AssetsState {
  const factory _AssetsState(
      {required final String applicationId,
      final AssetsStatus status,
      final List<AssetModel> assets,
      final String? errorMessage,
      final bool creating,
      final String? createError,
      final bool deleting,
      final String? deleteError,
      final String? deletingAssetId,
      final bool lockFilters}) = _$AssetsStateImpl;

  @override
  String get applicationId;
  @override
  AssetsStatus get status;
  @override
  List<AssetModel> get assets;
  @override
  String? get errorMessage; // create flow
  @override
  bool get creating;
  @override
  String? get createError; // delete flow
  @override
  bool get deleting;
  @override
  String? get deleteError;
  @override
  String? get deletingAssetId; // filters
  @override
  bool get lockFilters;

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetsStateImplCopyWith<_$AssetsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
