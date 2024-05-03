// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_preview_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemePreviewState {
  ThemePreviewStatus? get status => throw _privateConstructorUsedError;
  ApplicationModel? get applicationModel => throw _privateConstructorUsedError;
  ThemeModel? get theme => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemePreviewStateCopyWith<ThemePreviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemePreviewStateCopyWith<$Res> {
  factory $ThemePreviewStateCopyWith(
          ThemePreviewState value, $Res Function(ThemePreviewState) then) =
      _$ThemePreviewStateCopyWithImpl<$Res, ThemePreviewState>;
  @useResult
  $Res call(
      {ThemePreviewStatus? status,
      ApplicationModel? applicationModel,
      ThemeModel? theme,
      Exception? error});

  $ApplicationModelCopyWith<$Res>? get applicationModel;
  $ThemeModelCopyWith<$Res>? get theme;
}

/// @nodoc
class _$ThemePreviewStateCopyWithImpl<$Res, $Val extends ThemePreviewState>
    implements $ThemePreviewStateCopyWith<$Res> {
  _$ThemePreviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? applicationModel = freezed,
    Object? theme = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ThemePreviewStatus?,
      applicationModel: freezed == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $ThemeModelCopyWith<$Res>? get theme {
    if (_value.theme == null) {
      return null;
    }

    return $ThemeModelCopyWith<$Res>(_value.theme!, (value) {
      return _then(_value.copyWith(theme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThemePreviewStateImplCopyWith<$Res>
    implements $ThemePreviewStateCopyWith<$Res> {
  factory _$$ThemePreviewStateImplCopyWith(_$ThemePreviewStateImpl value,
          $Res Function(_$ThemePreviewStateImpl) then) =
      __$$ThemePreviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemePreviewStatus? status,
      ApplicationModel? applicationModel,
      ThemeModel? theme,
      Exception? error});

  @override
  $ApplicationModelCopyWith<$Res>? get applicationModel;
  @override
  $ThemeModelCopyWith<$Res>? get theme;
}

/// @nodoc
class __$$ThemePreviewStateImplCopyWithImpl<$Res>
    extends _$ThemePreviewStateCopyWithImpl<$Res, _$ThemePreviewStateImpl>
    implements _$$ThemePreviewStateImplCopyWith<$Res> {
  __$$ThemePreviewStateImplCopyWithImpl(_$ThemePreviewStateImpl _value,
      $Res Function(_$ThemePreviewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? applicationModel = freezed,
    Object? theme = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ThemePreviewStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ThemePreviewStatus?,
      applicationModel: freezed == applicationModel
          ? _value.applicationModel
          : applicationModel // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ThemePreviewStateImpl implements _ThemePreviewState {
  _$ThemePreviewStateImpl(
      {this.status, this.applicationModel, this.theme, this.error});

  @override
  final ThemePreviewStatus? status;
  @override
  final ApplicationModel? applicationModel;
  @override
  final ThemeModel? theme;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'ThemePreviewState(status: $status, applicationModel: $applicationModel, theme: $theme, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemePreviewStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.applicationModel, applicationModel) ||
                other.applicationModel == applicationModel) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, applicationModel, theme, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemePreviewStateImplCopyWith<_$ThemePreviewStateImpl> get copyWith =>
      __$$ThemePreviewStateImplCopyWithImpl<_$ThemePreviewStateImpl>(
          this, _$identity);
}

abstract class _ThemePreviewState implements ThemePreviewState {
  factory _ThemePreviewState(
      {final ThemePreviewStatus? status,
      final ApplicationModel? applicationModel,
      final ThemeModel? theme,
      final Exception? error}) = _$ThemePreviewStateImpl;

  @override
  ThemePreviewStatus? get status;
  @override
  ApplicationModel? get applicationModel;
  @override
  ThemeModel? get theme;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$ThemePreviewStateImplCopyWith<_$ThemePreviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
