// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_embeds_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ManageEmbedsState {
  ManageEmbedsStatus get status => throw _privateConstructorUsedError;
  List<EmbeddedResourceModel> get items => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError; // create
  bool get creating => throw _privateConstructorUsedError;
  String? get createError => throw _privateConstructorUsedError; // delete
  Set<String> get deletingIds => throw _privateConstructorUsedError;
  String? get deleteError => throw _privateConstructorUsedError;
  String? get routeEmbedId => throw _privateConstructorUsedError;

  /// Create a copy of ManageEmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageEmbedsStateCopyWith<ManageEmbedsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageEmbedsStateCopyWith<$Res> {
  factory $ManageEmbedsStateCopyWith(
          ManageEmbedsState value, $Res Function(ManageEmbedsState) then) =
      _$ManageEmbedsStateCopyWithImpl<$Res, ManageEmbedsState>;
  @useResult
  $Res call(
      {ManageEmbedsStatus status,
      List<EmbeddedResourceModel> items,
      String? error,
      bool creating,
      String? createError,
      Set<String> deletingIds,
      String? deleteError,
      String? routeEmbedId});
}

/// @nodoc
class _$ManageEmbedsStateCopyWithImpl<$Res, $Val extends ManageEmbedsState>
    implements $ManageEmbedsStateCopyWith<$Res> {
  _$ManageEmbedsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManageEmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? error = freezed,
    Object? creating = null,
    Object? createError = freezed,
    Object? deletingIds = null,
    Object? deleteError = freezed,
    Object? routeEmbedId = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ManageEmbedsStatus,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EmbeddedResourceModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      creating: null == creating
          ? _value.creating
          : creating // ignore: cast_nullable_to_non_nullable
              as bool,
      createError: freezed == createError
          ? _value.createError
          : createError // ignore: cast_nullable_to_non_nullable
              as String?,
      deletingIds: null == deletingIds
          ? _value.deletingIds
          : deletingIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      deleteError: freezed == deleteError
          ? _value.deleteError
          : deleteError // ignore: cast_nullable_to_non_nullable
              as String?,
      routeEmbedId: freezed == routeEmbedId
          ? _value.routeEmbedId
          : routeEmbedId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManageEmbedsStateImplCopyWith<$Res>
    implements $ManageEmbedsStateCopyWith<$Res> {
  factory _$$ManageEmbedsStateImplCopyWith(_$ManageEmbedsStateImpl value,
          $Res Function(_$ManageEmbedsStateImpl) then) =
      __$$ManageEmbedsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ManageEmbedsStatus status,
      List<EmbeddedResourceModel> items,
      String? error,
      bool creating,
      String? createError,
      Set<String> deletingIds,
      String? deleteError,
      String? routeEmbedId});
}

/// @nodoc
class __$$ManageEmbedsStateImplCopyWithImpl<$Res>
    extends _$ManageEmbedsStateCopyWithImpl<$Res, _$ManageEmbedsStateImpl>
    implements _$$ManageEmbedsStateImplCopyWith<$Res> {
  __$$ManageEmbedsStateImplCopyWithImpl(_$ManageEmbedsStateImpl _value,
      $Res Function(_$ManageEmbedsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ManageEmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? error = freezed,
    Object? creating = null,
    Object? createError = freezed,
    Object? deletingIds = null,
    Object? deleteError = freezed,
    Object? routeEmbedId = freezed,
  }) {
    return _then(_$ManageEmbedsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ManageEmbedsStatus,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EmbeddedResourceModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      creating: null == creating
          ? _value.creating
          : creating // ignore: cast_nullable_to_non_nullable
              as bool,
      createError: freezed == createError
          ? _value.createError
          : createError // ignore: cast_nullable_to_non_nullable
              as String?,
      deletingIds: null == deletingIds
          ? _value._deletingIds
          : deletingIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      deleteError: freezed == deleteError
          ? _value.deleteError
          : deleteError // ignore: cast_nullable_to_non_nullable
              as String?,
      routeEmbedId: freezed == routeEmbedId
          ? _value.routeEmbedId
          : routeEmbedId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ManageEmbedsStateImpl implements _ManageEmbedsState {
  const _$ManageEmbedsStateImpl(
      {this.status = ManageEmbedsStatus.initial,
      final List<EmbeddedResourceModel> items = const <EmbeddedResourceModel>[],
      this.error,
      this.creating = false,
      this.createError,
      final Set<String> deletingIds = const <String>{},
      this.deleteError,
      this.routeEmbedId})
      : _items = items,
        _deletingIds = deletingIds;

  @override
  @JsonKey()
  final ManageEmbedsStatus status;
  final List<EmbeddedResourceModel> _items;
  @override
  @JsonKey()
  List<EmbeddedResourceModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? error;
// create
  @override
  @JsonKey()
  final bool creating;
  @override
  final String? createError;
// delete
  final Set<String> _deletingIds;
// delete
  @override
  @JsonKey()
  Set<String> get deletingIds {
    if (_deletingIds is EqualUnmodifiableSetView) return _deletingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_deletingIds);
  }

  @override
  final String? deleteError;
  @override
  final String? routeEmbedId;

  @override
  String toString() {
    return 'ManageEmbedsState(status: $status, items: $items, error: $error, creating: $creating, createError: $createError, deletingIds: $deletingIds, deleteError: $deleteError, routeEmbedId: $routeEmbedId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageEmbedsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.creating, creating) ||
                other.creating == creating) &&
            (identical(other.createError, createError) ||
                other.createError == createError) &&
            const DeepCollectionEquality()
                .equals(other._deletingIds, _deletingIds) &&
            (identical(other.deleteError, deleteError) ||
                other.deleteError == deleteError) &&
            (identical(other.routeEmbedId, routeEmbedId) ||
                other.routeEmbedId == routeEmbedId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_items),
      error,
      creating,
      createError,
      const DeepCollectionEquality().hash(_deletingIds),
      deleteError,
      routeEmbedId);

  /// Create a copy of ManageEmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageEmbedsStateImplCopyWith<_$ManageEmbedsStateImpl> get copyWith =>
      __$$ManageEmbedsStateImplCopyWithImpl<_$ManageEmbedsStateImpl>(
          this, _$identity);
}

abstract class _ManageEmbedsState implements ManageEmbedsState {
  const factory _ManageEmbedsState(
      {final ManageEmbedsStatus status,
      final List<EmbeddedResourceModel> items,
      final String? error,
      final bool creating,
      final String? createError,
      final Set<String> deletingIds,
      final String? deleteError,
      final String? routeEmbedId}) = _$ManageEmbedsStateImpl;

  @override
  ManageEmbedsStatus get status;
  @override
  List<EmbeddedResourceModel> get items;
  @override
  String? get error; // create
  @override
  bool get creating;
  @override
  String? get createError; // delete
  @override
  Set<String> get deletingIds;
  @override
  String? get deleteError;
  @override
  String? get routeEmbedId;

  /// Create a copy of ManageEmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManageEmbedsStateImplCopyWith<_$ManageEmbedsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
