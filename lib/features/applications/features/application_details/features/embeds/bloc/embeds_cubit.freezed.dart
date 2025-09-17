// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'embeds_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmbedsState {
  EmbedsStatus get status => throw _privateConstructorUsedError;
  List<EmbeddedResourceModel> get items => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError; // delete
  Set<String> get deletingIds => throw _privateConstructorUsedError;
  String? get deleteError => throw _privateConstructorUsedError; // create
  bool get creating => throw _privateConstructorUsedError;
  String? get createError => throw _privateConstructorUsedError; // update
  Set<String> get updatingIds => throw _privateConstructorUsedError;
  String? get updateError => throw _privateConstructorUsedError;

  /// Create a copy of EmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmbedsStateCopyWith<EmbedsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbedsStateCopyWith<$Res> {
  factory $EmbedsStateCopyWith(
          EmbedsState value, $Res Function(EmbedsState) then) =
      _$EmbedsStateCopyWithImpl<$Res, EmbedsState>;
  @useResult
  $Res call(
      {EmbedsStatus status,
      List<EmbeddedResourceModel> items,
      String? errorMessage,
      Set<String> deletingIds,
      String? deleteError,
      bool creating,
      String? createError,
      Set<String> updatingIds,
      String? updateError});
}

/// @nodoc
class _$EmbedsStateCopyWithImpl<$Res, $Val extends EmbedsState>
    implements $EmbedsStateCopyWith<$Res> {
  _$EmbedsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? errorMessage = freezed,
    Object? deletingIds = null,
    Object? deleteError = freezed,
    Object? creating = null,
    Object? createError = freezed,
    Object? updatingIds = null,
    Object? updateError = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmbedsStatus,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EmbeddedResourceModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      deletingIds: null == deletingIds
          ? _value.deletingIds
          : deletingIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      deleteError: freezed == deleteError
          ? _value.deleteError
          : deleteError // ignore: cast_nullable_to_non_nullable
              as String?,
      creating: null == creating
          ? _value.creating
          : creating // ignore: cast_nullable_to_non_nullable
              as bool,
      createError: freezed == createError
          ? _value.createError
          : createError // ignore: cast_nullable_to_non_nullable
              as String?,
      updatingIds: null == updatingIds
          ? _value.updatingIds
          : updatingIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      updateError: freezed == updateError
          ? _value.updateError
          : updateError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmbedsStateImplCopyWith<$Res>
    implements $EmbedsStateCopyWith<$Res> {
  factory _$$EmbedsStateImplCopyWith(
          _$EmbedsStateImpl value, $Res Function(_$EmbedsStateImpl) then) =
      __$$EmbedsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmbedsStatus status,
      List<EmbeddedResourceModel> items,
      String? errorMessage,
      Set<String> deletingIds,
      String? deleteError,
      bool creating,
      String? createError,
      Set<String> updatingIds,
      String? updateError});
}

/// @nodoc
class __$$EmbedsStateImplCopyWithImpl<$Res>
    extends _$EmbedsStateCopyWithImpl<$Res, _$EmbedsStateImpl>
    implements _$$EmbedsStateImplCopyWith<$Res> {
  __$$EmbedsStateImplCopyWithImpl(
      _$EmbedsStateImpl _value, $Res Function(_$EmbedsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? errorMessage = freezed,
    Object? deletingIds = null,
    Object? deleteError = freezed,
    Object? creating = null,
    Object? createError = freezed,
    Object? updatingIds = null,
    Object? updateError = freezed,
  }) {
    return _then(_$EmbedsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmbedsStatus,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<EmbeddedResourceModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      deletingIds: null == deletingIds
          ? _value._deletingIds
          : deletingIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      deleteError: freezed == deleteError
          ? _value.deleteError
          : deleteError // ignore: cast_nullable_to_non_nullable
              as String?,
      creating: null == creating
          ? _value.creating
          : creating // ignore: cast_nullable_to_non_nullable
              as bool,
      createError: freezed == createError
          ? _value.createError
          : createError // ignore: cast_nullable_to_non_nullable
              as String?,
      updatingIds: null == updatingIds
          ? _value._updatingIds
          : updatingIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      updateError: freezed == updateError
          ? _value.updateError
          : updateError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmbedsStateImpl implements _EmbedsState {
  const _$EmbedsStateImpl(
      {this.status = EmbedsStatus.initial,
      final List<EmbeddedResourceModel> items = const <EmbeddedResourceModel>[],
      this.errorMessage,
      final Set<String> deletingIds = const <String>{},
      this.deleteError,
      this.creating = false,
      this.createError,
      final Set<String> updatingIds = const <String>{},
      this.updateError})
      : _items = items,
        _deletingIds = deletingIds,
        _updatingIds = updatingIds;

  @override
  @JsonKey()
  final EmbedsStatus status;
  final List<EmbeddedResourceModel> _items;
  @override
  @JsonKey()
  List<EmbeddedResourceModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? errorMessage;
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
// create
  @override
  @JsonKey()
  final bool creating;
  @override
  final String? createError;
// update
  final Set<String> _updatingIds;
// update
  @override
  @JsonKey()
  Set<String> get updatingIds {
    if (_updatingIds is EqualUnmodifiableSetView) return _updatingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_updatingIds);
  }

  @override
  final String? updateError;

  @override
  String toString() {
    return 'EmbedsState(status: $status, items: $items, errorMessage: $errorMessage, deletingIds: $deletingIds, deleteError: $deleteError, creating: $creating, createError: $createError, updatingIds: $updatingIds, updateError: $updateError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbedsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._deletingIds, _deletingIds) &&
            (identical(other.deleteError, deleteError) ||
                other.deleteError == deleteError) &&
            (identical(other.creating, creating) ||
                other.creating == creating) &&
            (identical(other.createError, createError) ||
                other.createError == createError) &&
            const DeepCollectionEquality()
                .equals(other._updatingIds, _updatingIds) &&
            (identical(other.updateError, updateError) ||
                other.updateError == updateError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_items),
      errorMessage,
      const DeepCollectionEquality().hash(_deletingIds),
      deleteError,
      creating,
      createError,
      const DeepCollectionEquality().hash(_updatingIds),
      updateError);

  /// Create a copy of EmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbedsStateImplCopyWith<_$EmbedsStateImpl> get copyWith =>
      __$$EmbedsStateImplCopyWithImpl<_$EmbedsStateImpl>(this, _$identity);
}

abstract class _EmbedsState implements EmbedsState {
  const factory _EmbedsState(
      {final EmbedsStatus status,
      final List<EmbeddedResourceModel> items,
      final String? errorMessage,
      final Set<String> deletingIds,
      final String? deleteError,
      final bool creating,
      final String? createError,
      final Set<String> updatingIds,
      final String? updateError}) = _$EmbedsStateImpl;

  @override
  EmbedsStatus get status;
  @override
  List<EmbeddedResourceModel> get items;
  @override
  String? get errorMessage; // delete
  @override
  Set<String> get deletingIds;
  @override
  String? get deleteError; // create
  @override
  bool get creating;
  @override
  String? get createError; // update
  @override
  Set<String> get updatingIds;
  @override
  String? get updateError;

  /// Create a copy of EmbedsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmbedsStateImplCopyWith<_$EmbedsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
