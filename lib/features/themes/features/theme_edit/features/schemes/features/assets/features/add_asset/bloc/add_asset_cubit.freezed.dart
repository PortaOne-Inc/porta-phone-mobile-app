// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_asset_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddAssetState {
  ThemeAssetModel? get asset => throw _privateConstructorUsedError;
  AddAssetStateEnum get status => throw _privateConstructorUsedError;

  /// Create a copy of AddAssetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddAssetStateCopyWith<AddAssetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAssetStateCopyWith<$Res> {
  factory $AddAssetStateCopyWith(
          AddAssetState value, $Res Function(AddAssetState) then) =
      _$AddAssetStateCopyWithImpl<$Res, AddAssetState>;
  @useResult
  $Res call({ThemeAssetModel? asset, AddAssetStateEnum status});

  $ThemeAssetModelCopyWith<$Res>? get asset;
}

/// @nodoc
class _$AddAssetStateCopyWithImpl<$Res, $Val extends AddAssetState>
    implements $AddAssetStateCopyWith<$Res> {
  _$AddAssetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddAssetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asset = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as ThemeAssetModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddAssetStateEnum,
    ) as $Val);
  }

  /// Create a copy of AddAssetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThemeAssetModelCopyWith<$Res>? get asset {
    if (_value.asset == null) {
      return null;
    }

    return $ThemeAssetModelCopyWith<$Res>(_value.asset!, (value) {
      return _then(_value.copyWith(asset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AddAssetStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeAssetModel? asset, AddAssetStateEnum status});

  @override
  $ThemeAssetModelCopyWith<$Res>? get asset;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AddAssetStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddAssetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asset = freezed,
    Object? status = null,
  }) {
    return _then(_$InitialImpl(
      asset: freezed == asset
          ? _value.asset
          : asset // ignore: cast_nullable_to_non_nullable
              as ThemeAssetModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AddAssetStateEnum,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.asset, this.status = AddAssetStateEnum.initial});

  @override
  final ThemeAssetModel? asset;
  @override
  @JsonKey()
  final AddAssetStateEnum status;

  @override
  String toString() {
    return 'AddAssetState(asset: $asset, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.asset, asset) || other.asset == asset) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, asset, status);

  /// Create a copy of AddAssetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements AddAssetState {
  const factory _Initial(
      {final ThemeAssetModel? asset,
      final AddAssetStateEnum status}) = _$InitialImpl;

  @override
  ThemeAssetModel? get asset;
  @override
  AddAssetStateEnum get status;

  /// Create a copy of AddAssetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
