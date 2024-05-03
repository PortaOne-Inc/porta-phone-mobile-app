// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_create_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeCreateState {
  ThemeCreateStateStatus get status => throw _privateConstructorUsedError;
  ThemeModel? get themeModel => throw _privateConstructorUsedError;
  ThemeNameInput? get nameInput => throw _privateConstructorUsedError;
  Color? get seedColor => throw _privateConstructorUsedError;
  BaseException? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeCreateStateCopyWith<ThemeCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeCreateStateCopyWith<$Res> {
  factory $ThemeCreateStateCopyWith(
          ThemeCreateState value, $Res Function(ThemeCreateState) then) =
      _$ThemeCreateStateCopyWithImpl<$Res, ThemeCreateState>;
  @useResult
  $Res call(
      {ThemeCreateStateStatus status,
      ThemeModel? themeModel,
      ThemeNameInput? nameInput,
      Color? seedColor,
      BaseException? error});

  $ThemeModelCopyWith<$Res>? get themeModel;
}

/// @nodoc
class _$ThemeCreateStateCopyWithImpl<$Res, $Val extends ThemeCreateState>
    implements $ThemeCreateStateCopyWith<$Res> {
  _$ThemeCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? themeModel = freezed,
    Object? nameInput = freezed,
    Object? seedColor = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ThemeCreateStateStatus,
      themeModel: freezed == themeModel
          ? _value.themeModel
          : themeModel // ignore: cast_nullable_to_non_nullable
              as ThemeModel?,
      nameInput: freezed == nameInput
          ? _value.nameInput
          : nameInput // ignore: cast_nullable_to_non_nullable
              as ThemeNameInput?,
      seedColor: freezed == seedColor
          ? _value.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThemeModelCopyWith<$Res>? get themeModel {
    if (_value.themeModel == null) {
      return null;
    }

    return $ThemeModelCopyWith<$Res>(_value.themeModel!, (value) {
      return _then(_value.copyWith(themeModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThemeCreateStateInitialImplCopyWith<$Res>
    implements $ThemeCreateStateCopyWith<$Res> {
  factory _$$ThemeCreateStateInitialImplCopyWith(
          _$ThemeCreateStateInitialImpl value,
          $Res Function(_$ThemeCreateStateInitialImpl) then) =
      __$$ThemeCreateStateInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeCreateStateStatus status,
      ThemeModel? themeModel,
      ThemeNameInput? nameInput,
      Color? seedColor,
      BaseException? error});

  @override
  $ThemeModelCopyWith<$Res>? get themeModel;
}

/// @nodoc
class __$$ThemeCreateStateInitialImplCopyWithImpl<$Res>
    extends _$ThemeCreateStateCopyWithImpl<$Res, _$ThemeCreateStateInitialImpl>
    implements _$$ThemeCreateStateInitialImplCopyWith<$Res> {
  __$$ThemeCreateStateInitialImplCopyWithImpl(
      _$ThemeCreateStateInitialImpl _value,
      $Res Function(_$ThemeCreateStateInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? themeModel = freezed,
    Object? nameInput = freezed,
    Object? seedColor = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ThemeCreateStateInitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ThemeCreateStateStatus,
      themeModel: freezed == themeModel
          ? _value.themeModel
          : themeModel // ignore: cast_nullable_to_non_nullable
              as ThemeModel?,
      nameInput: freezed == nameInput
          ? _value.nameInput
          : nameInput // ignore: cast_nullable_to_non_nullable
              as ThemeNameInput?,
      seedColor: freezed == seedColor
          ? _value.seedColor
          : seedColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ));
  }
}

/// @nodoc

class _$ThemeCreateStateInitialImpl implements _ThemeCreateStateInitial {
  const _$ThemeCreateStateInitialImpl(
      {required this.status,
      this.themeModel,
      this.nameInput,
      this.seedColor,
      this.error});

  @override
  final ThemeCreateStateStatus status;
  @override
  final ThemeModel? themeModel;
  @override
  final ThemeNameInput? nameInput;
  @override
  final Color? seedColor;
  @override
  final BaseException? error;

  @override
  String toString() {
    return 'ThemeCreateState(status: $status, themeModel: $themeModel, nameInput: $nameInput, seedColor: $seedColor, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeCreateStateInitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.themeModel, themeModel) ||
                other.themeModel == themeModel) &&
            (identical(other.nameInput, nameInput) ||
                other.nameInput == nameInput) &&
            (identical(other.seedColor, seedColor) ||
                other.seedColor == seedColor) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, themeModel, nameInput, seedColor, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeCreateStateInitialImplCopyWith<_$ThemeCreateStateInitialImpl>
      get copyWith => __$$ThemeCreateStateInitialImplCopyWithImpl<
          _$ThemeCreateStateInitialImpl>(this, _$identity);
}

abstract class _ThemeCreateStateInitial implements ThemeCreateState {
  const factory _ThemeCreateStateInitial(
      {required final ThemeCreateStateStatus status,
      final ThemeModel? themeModel,
      final ThemeNameInput? nameInput,
      final Color? seedColor,
      final BaseException? error}) = _$ThemeCreateStateInitialImpl;

  @override
  ThemeCreateStateStatus get status;
  @override
  ThemeModel? get themeModel;
  @override
  ThemeNameInput? get nameInput;
  @override
  Color? get seedColor;
  @override
  BaseException? get error;
  @override
  @JsonKey(ignore: true)
  _$$ThemeCreateStateInitialImplCopyWith<_$ThemeCreateStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
