// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_edit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApplicationEditState {
  ApplicationEditStatus get status => throw _privateConstructorUsedError;
  ApplicationModel? get applicationModel => throw _privateConstructorUsedError;
  ApplicationNameInput? get nameInput => throw _privateConstructorUsedError;
  ApplicationIdentifierInput? get applicationIdentifierInput =>
      throw _privateConstructorUsedError;
  Uint8List? get androidGoogleServices => throw _privateConstructorUsedError;
  Uint8List? get iosGoogleServices => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationEditStateCopyWith<ApplicationEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationEditStateCopyWith<$Res> {
  factory $ApplicationEditStateCopyWith(ApplicationEditState value,
          $Res Function(ApplicationEditState) then) =
      _$ApplicationEditStateCopyWithImpl<$Res, ApplicationEditState>;
  @useResult
  $Res call(
      {ApplicationEditStatus status,
      ApplicationModel? applicationModel,
      ApplicationNameInput? nameInput,
      ApplicationIdentifierInput? applicationIdentifierInput,
      Uint8List? androidGoogleServices,
      Uint8List? iosGoogleServices,
      Exception? exception});

  $ApplicationModelCopyWith<$Res>? get applicationModel;
}

/// @nodoc
class _$ApplicationEditStateCopyWithImpl<$Res,
        $Val extends ApplicationEditState>
    implements $ApplicationEditStateCopyWith<$Res> {
  _$ApplicationEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? applicationModel = freezed,
    Object? nameInput = freezed,
    Object? applicationIdentifierInput = freezed,
    Object? androidGoogleServices = freezed,
    Object? iosGoogleServices = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApplicationEditStatus,
      applicationModel: freezed == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      nameInput: freezed == nameInput
          ? _value.nameInput
          : nameInput // ignore: cast_nullable_to_non_nullable
              as ApplicationNameInput?,
      applicationIdentifierInput: freezed == applicationIdentifierInput
          ? _value.applicationIdentifierInput
          : applicationIdentifierInput // ignore: cast_nullable_to_non_nullable
              as ApplicationIdentifierInput?,
      androidGoogleServices: freezed == androidGoogleServices
          ? _value.androidGoogleServices
          : androidGoogleServices // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      iosGoogleServices: freezed == iosGoogleServices
          ? _value.iosGoogleServices
          : iosGoogleServices // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApplicationModelCopyWith<$Res>? get applicationModel {
    if (_value.applicationModel == null) {
      return null;
    }

    return $ApplicationModelCopyWith<$Res>(_value.applicationModel!, (value) {
      return _then(_value.copyWith(applicationModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApplicationEditStateInitialCopyWith<$Res>
    implements $ApplicationEditStateCopyWith<$Res> {
  factory _$$ApplicationEditStateInitialCopyWith(
          _$ApplicationEditStateInitial value,
          $Res Function(_$ApplicationEditStateInitial) then) =
      __$$ApplicationEditStateInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApplicationEditStatus status,
      ApplicationModel? applicationModel,
      ApplicationNameInput? nameInput,
      ApplicationIdentifierInput? applicationIdentifierInput,
      Uint8List? androidGoogleServices,
      Uint8List? iosGoogleServices,
      Exception? exception});

  @override
  $ApplicationModelCopyWith<$Res>? get applicationModel;
}

/// @nodoc
class __$$ApplicationEditStateInitialCopyWithImpl<$Res>
    extends _$ApplicationEditStateCopyWithImpl<$Res,
        _$ApplicationEditStateInitial>
    implements _$$ApplicationEditStateInitialCopyWith<$Res> {
  __$$ApplicationEditStateInitialCopyWithImpl(
      _$ApplicationEditStateInitial _value,
      $Res Function(_$ApplicationEditStateInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? applicationModel = freezed,
    Object? nameInput = freezed,
    Object? applicationIdentifierInput = freezed,
    Object? androidGoogleServices = freezed,
    Object? iosGoogleServices = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$ApplicationEditStateInitial(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApplicationEditStatus,
      applicationModel: freezed == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      nameInput: freezed == nameInput
          ? _value.nameInput
          : nameInput // ignore: cast_nullable_to_non_nullable
              as ApplicationNameInput?,
      applicationIdentifierInput: freezed == applicationIdentifierInput
          ? _value.applicationIdentifierInput
          : applicationIdentifierInput // ignore: cast_nullable_to_non_nullable
              as ApplicationIdentifierInput?,
      androidGoogleServices: freezed == androidGoogleServices
          ? _value.androidGoogleServices
          : androidGoogleServices // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      iosGoogleServices: freezed == iosGoogleServices
          ? _value.iosGoogleServices
          : iosGoogleServices // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ApplicationEditStateInitial implements ApplicationEditStateInitial {
  const _$ApplicationEditStateInitial(
      {this.status = ApplicationEditStatus.initial,
      this.applicationModel,
      this.nameInput,
      this.applicationIdentifierInput,
      this.androidGoogleServices,
      this.iosGoogleServices,
      this.exception});

  @override
  @JsonKey()
  final ApplicationEditStatus status;
  @override
  final ApplicationModel? applicationModel;
  @override
  final ApplicationNameInput? nameInput;
  @override
  final ApplicationIdentifierInput? applicationIdentifierInput;
  @override
  final Uint8List? androidGoogleServices;
  @override
  final Uint8List? iosGoogleServices;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'ApplicationEditState(status: $status, applicationModel: $applicationModel, nameInput: $nameInput, applicationIdentifierInput: $applicationIdentifierInput, androidGoogleServices: $androidGoogleServices, iosGoogleServices: $iosGoogleServices, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationEditStateInitial &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.applicationModel, applicationModel) ||
                other.applicationModel == applicationModel) &&
            (identical(other.nameInput, nameInput) ||
                other.nameInput == nameInput) &&
            (identical(other.applicationIdentifierInput,
                    applicationIdentifierInput) ||
                other.applicationIdentifierInput ==
                    applicationIdentifierInput) &&
            const DeepCollectionEquality()
                .equals(other.androidGoogleServices, androidGoogleServices) &&
            const DeepCollectionEquality()
                .equals(other.iosGoogleServices, iosGoogleServices) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      applicationModel,
      nameInput,
      applicationIdentifierInput,
      const DeepCollectionEquality().hash(androidGoogleServices),
      const DeepCollectionEquality().hash(iosGoogleServices),
      exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationEditStateInitialCopyWith<_$ApplicationEditStateInitial>
      get copyWith => __$$ApplicationEditStateInitialCopyWithImpl<
          _$ApplicationEditStateInitial>(this, _$identity);
}

abstract class ApplicationEditStateInitial implements ApplicationEditState {
  const factory ApplicationEditStateInitial(
      {final ApplicationEditStatus status,
      final ApplicationModel? applicationModel,
      final ApplicationNameInput? nameInput,
      final ApplicationIdentifierInput? applicationIdentifierInput,
      final Uint8List? androidGoogleServices,
      final Uint8List? iosGoogleServices,
      final Exception? exception}) = _$ApplicationEditStateInitial;

  @override
  ApplicationEditStatus get status;
  @override
  ApplicationModel? get applicationModel;
  @override
  ApplicationNameInput? get nameInput;
  @override
  ApplicationIdentifierInput? get applicationIdentifierInput;
  @override
  Uint8List? get androidGoogleServices;
  @override
  Uint8List? get iosGoogleServices;
  @override
  Exception? get exception;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationEditStateInitialCopyWith<_$ApplicationEditStateInitial>
      get copyWith => throw _privateConstructorUsedError;
}
