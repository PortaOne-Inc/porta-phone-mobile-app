// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_create_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApplicationCreateState {
  ApplicationCreateStatus get status => throw _privateConstructorUsedError;
  ApplicationNameInput? get nameInput => throw _privateConstructorUsedError;
  ApplicationIdentifierInput? get applicationIdentifierInput =>
      throw _privateConstructorUsedError;
  Uint8List? get androidGoogleServices => throw _privateConstructorUsedError;
  Uint8List? get iosGoogleServices => throw _privateConstructorUsedError;
  Exception? get exception => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationCreateStateCopyWith<ApplicationCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationCreateStateCopyWith<$Res> {
  factory $ApplicationCreateStateCopyWith(ApplicationCreateState value,
          $Res Function(ApplicationCreateState) then) =
      _$ApplicationCreateStateCopyWithImpl<$Res, ApplicationCreateState>;
  @useResult
  $Res call(
      {ApplicationCreateStatus status,
      ApplicationNameInput? nameInput,
      ApplicationIdentifierInput? applicationIdentifierInput,
      Uint8List? androidGoogleServices,
      Uint8List? iosGoogleServices,
      Exception? exception});
}

/// @nodoc
class _$ApplicationCreateStateCopyWithImpl<$Res,
        $Val extends ApplicationCreateState>
    implements $ApplicationCreateStateCopyWith<$Res> {
  _$ApplicationCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
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
              as ApplicationCreateStatus,
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
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res>
    implements $ApplicationCreateStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApplicationCreateStatus status,
      ApplicationNameInput? nameInput,
      ApplicationIdentifierInput? applicationIdentifierInput,
      Uint8List? androidGoogleServices,
      Uint8List? iosGoogleServices,
      Exception? exception});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$ApplicationCreateStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? nameInput = freezed,
    Object? applicationIdentifierInput = freezed,
    Object? androidGoogleServices = freezed,
    Object? iosGoogleServices = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$Initial(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApplicationCreateStatus,
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

class _$Initial implements Initial {
  const _$Initial(
      {this.status = ApplicationCreateStatus.initial,
      this.nameInput,
      this.applicationIdentifierInput,
      this.androidGoogleServices,
      this.iosGoogleServices,
      this.exception});

  @override
  @JsonKey()
  final ApplicationCreateStatus status;
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
    return 'ApplicationCreateState(status: $status, nameInput: $nameInput, applicationIdentifierInput: $applicationIdentifierInput, androidGoogleServices: $androidGoogleServices, iosGoogleServices: $iosGoogleServices, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            (identical(other.status, status) || other.status == status) &&
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
      nameInput,
      applicationIdentifierInput,
      const DeepCollectionEquality().hash(androidGoogleServices),
      const DeepCollectionEquality().hash(iosGoogleServices),
      exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);
}

abstract class Initial implements ApplicationCreateState {
  const factory Initial(
      {final ApplicationCreateStatus status,
      final ApplicationNameInput? nameInput,
      final ApplicationIdentifierInput? applicationIdentifierInput,
      final Uint8List? androidGoogleServices,
      final Uint8List? iosGoogleServices,
      final Exception? exception}) = _$Initial;

  @override
  ApplicationCreateStatus get status;
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
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
