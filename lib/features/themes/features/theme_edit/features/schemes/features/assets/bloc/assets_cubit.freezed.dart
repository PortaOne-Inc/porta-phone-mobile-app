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
  bool get lockFilters => throw _privateConstructorUsedError;
  List<ThemeAssetType> get filters => throw _privateConstructorUsedError;

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
  $Res call({bool lockFilters, List<ThemeAssetType> filters});
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
    Object? lockFilters = null,
    Object? filters = null,
  }) {
    return _then(_value.copyWith(
      lockFilters: null == lockFilters
          ? _value.lockFilters
          : lockFilters // ignore: cast_nullable_to_non_nullable
              as bool,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<ThemeAssetType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AssetsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool lockFilters, List<ThemeAssetType> filters});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AssetsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lockFilters = null,
    Object? filters = null,
  }) {
    return _then(_$InitialImpl(
      lockFilters: null == lockFilters
          ? _value.lockFilters
          : lockFilters // ignore: cast_nullable_to_non_nullable
              as bool,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<ThemeAssetType>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.lockFilters = false,
      final List<ThemeAssetType> filters = ThemeAssetType.values})
      : _filters = filters;

  @override
  @JsonKey()
  final bool lockFilters;
  final List<ThemeAssetType> _filters;
  @override
  @JsonKey()
  List<ThemeAssetType> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  String toString() {
    return 'AssetsState(lockFilters: $lockFilters, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.lockFilters, lockFilters) ||
                other.lockFilters == lockFilters) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, lockFilters, const DeepCollectionEquality().hash(_filters));

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements AssetsState {
  const factory _Initial(
      {final bool lockFilters,
      final List<ThemeAssetType> filters}) = _$InitialImpl;

  @override
  bool get lockFilters;
  @override
  List<ThemeAssetType> get filters;

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
