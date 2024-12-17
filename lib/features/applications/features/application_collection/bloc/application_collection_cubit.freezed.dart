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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApplicationCollectionState {
  ApplicationsStateStatus get status => throw _privateConstructorUsedError;
  List<(ApplicationModel, Iterable<ApplicationValidateError>)>
      get applications => throw _privateConstructorUsedError;
  ApplicationModel? get deleteApplication => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of ApplicationCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      List<(ApplicationModel, Iterable<ApplicationValidateError>)> applications,
      ApplicationModel? deleteApplication,
      Exception? error});

  $ApplicationModelCopyWith<$Res>? get deleteApplication;
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

  /// Create a copy of ApplicationCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? applications = null,
    Object? deleteApplication = freezed,
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
              as List<(ApplicationModel, Iterable<ApplicationValidateError>)>,
      deleteApplication: freezed == deleteApplication
          ? _value.deleteApplication
          : deleteApplication // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }

  /// Create a copy of ApplicationCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApplicationModelCopyWith<$Res>? get deleteApplication {
    if (_value.deleteApplication == null) {
      return null;
    }

    return $ApplicationModelCopyWith<$Res>(_value.deleteApplication!, (value) {
      return _then(_value.copyWith(deleteApplication: value) as $Val);
    });
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
      List<(ApplicationModel, Iterable<ApplicationValidateError>)> applications,
      ApplicationModel? deleteApplication,
      Exception? error});

  @override
  $ApplicationModelCopyWith<$Res>? get deleteApplication;
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

  /// Create a copy of ApplicationCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? applications = null,
    Object? deleteApplication = freezed,
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
              as List<(ApplicationModel, Iterable<ApplicationValidateError>)>,
      deleteApplication: freezed == deleteApplication
          ? _value.deleteApplication
          : deleteApplication // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ApplicationCollectionStateInitialImpl
    extends ApplicationCollectionStateInitial {
  const _$ApplicationCollectionStateInitialImpl(
      {required this.status,
      final List<(ApplicationModel, Iterable<ApplicationValidateError>)>
          applications = const [],
      this.deleteApplication,
      this.error})
      : _applications = applications,
        super._();

  @override
  final ApplicationsStateStatus status;
  final List<(ApplicationModel, Iterable<ApplicationValidateError>)>
      _applications;
  @override
  @JsonKey()
  List<(ApplicationModel, Iterable<ApplicationValidateError>)>
      get applications {
    if (_applications is EqualUnmodifiableListView) return _applications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applications);
  }

  @override
  final ApplicationModel? deleteApplication;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'ApplicationCollectionState(status: $status, applications: $applications, deleteApplication: $deleteApplication, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationCollectionStateInitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._applications, _applications) &&
            (identical(other.deleteApplication, deleteApplication) ||
                other.deleteApplication == deleteApplication) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_applications),
      deleteApplication,
      error);

  /// Create a copy of ApplicationCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationCollectionStateInitialImplCopyWith<
          _$ApplicationCollectionStateInitialImpl>
      get copyWith => __$$ApplicationCollectionStateInitialImplCopyWithImpl<
          _$ApplicationCollectionStateInitialImpl>(this, _$identity);
}

abstract class ApplicationCollectionStateInitial
    extends ApplicationCollectionState {
  const factory ApplicationCollectionStateInitial(
      {required final ApplicationsStateStatus status,
      final List<(ApplicationModel, Iterable<ApplicationValidateError>)>
          applications,
      final ApplicationModel? deleteApplication,
      final Exception? error}) = _$ApplicationCollectionStateInitialImpl;
  const ApplicationCollectionStateInitial._() : super._();

  @override
  ApplicationsStateStatus get status;
  @override
  List<(ApplicationModel, Iterable<ApplicationValidateError>)> get applications;
  @override
  ApplicationModel? get deleteApplication;
  @override
  Exception? get error;

  /// Create a copy of ApplicationCollectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationCollectionStateInitialImplCopyWith<
          _$ApplicationCollectionStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
