// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_collection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApplicationCollectionState {
  ApplicationsStateStatus get status => throw _privateConstructorUsedError;
  List<ApplicationModel> get applications => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationCollectionStateCopyWith<ApplicationCollectionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationCollectionStateCopyWith<$Res> {
  factory $ApplicationCollectionStateCopyWith(ApplicationCollectionState value,
          $Res Function(ApplicationCollectionState) then) =
      _$ApplicationCollectionStateCopyWithImpl<$Res,
          ApplicationCollectionState>;
  @useResult
  $Res call(
      {ApplicationsStateStatus status,
      List<ApplicationModel> applications,
      Exception? error});
}

/// @nodoc
class _$ApplicationCollectionStateCopyWithImpl<$Res,
        $Val extends ApplicationCollectionState>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  _$ApplicationCollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? applications = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApplicationsStateStatus,
      applications: null == applications
          ? _value.applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationCollectionStateInitialImplCopyWith<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  factory _$$ApplicationCollectionStateInitialImplCopyWith(
          _$ApplicationCollectionStateInitialImpl value,
          $Res Function(_$ApplicationCollectionStateInitialImpl) then) =
      __$$ApplicationCollectionStateInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApplicationsStateStatus status,
      List<ApplicationModel> applications,
      Exception? error});
}

/// @nodoc
class __$$ApplicationCollectionStateInitialImplCopyWithImpl<$Res>
    extends _$ApplicationCollectionStateCopyWithImpl<$Res,
        _$ApplicationCollectionStateInitialImpl>
    implements _$$ApplicationCollectionStateInitialImplCopyWith<$Res> {
  __$$ApplicationCollectionStateInitialImplCopyWithImpl(
      _$ApplicationCollectionStateInitialImpl _value,
      $Res Function(_$ApplicationCollectionStateInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? applications = null,
    Object? error = freezed,
  }) {
    return _then(_$ApplicationCollectionStateInitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApplicationsStateStatus,
      applications: null == applications
          ? _value._applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<ApplicationModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ApplicationCollectionStateInitialImpl
    implements ApplicationCollectionStateInitial {
  const _$ApplicationCollectionStateInitialImpl(
      {required this.status,
      final List<ApplicationModel> applications = const [],
      this.error})
      : _applications = applications;

  @override
  final ApplicationsStateStatus status;
  final List<ApplicationModel> _applications;
  @override
  @JsonKey()
  List<ApplicationModel> get applications {
    if (_applications is EqualUnmodifiableListView) return _applications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applications);
  }

  @override
  final Exception? error;

  @override
  String toString() {
    return 'ApplicationCollectionState(status: $status, applications: $applications, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationCollectionStateInitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_applications), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationCollectionStateInitialImplCopyWith<
          _$ApplicationCollectionStateInitialImpl>
      get copyWith => __$$ApplicationCollectionStateInitialImplCopyWithImpl<
          _$ApplicationCollectionStateInitialImpl>(this, _$identity);
}

abstract class ApplicationCollectionStateInitial
    implements ApplicationCollectionState {
  const factory ApplicationCollectionStateInitial(
      {required final ApplicationsStateStatus status,
      final List<ApplicationModel> applications,
      final Exception? error}) = _$ApplicationCollectionStateInitialImpl;

  @override
  ApplicationsStateStatus get status;
  @override
  List<ApplicationModel> get applications;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationCollectionStateInitialImplCopyWith<
          _$ApplicationCollectionStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
