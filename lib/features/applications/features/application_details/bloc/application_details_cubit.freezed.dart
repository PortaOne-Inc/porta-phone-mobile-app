// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApplicationDetailsState {
  ApplicationDetailsStateStatus get status =>
      throw _privateConstructorUsedError;
  List<ThemeModel> get themes => throw _privateConstructorUsedError;
  ThemeModel? get deleteTheme => throw _privateConstructorUsedError;
  ApplicationModel? get application => throw _privateConstructorUsedError;
  ApplicationModel? get deleteApplication => throw _privateConstructorUsedError;
  BaseException? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApplicationDetailsStateCopyWith<ApplicationDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationDetailsStateCopyWith<$Res> {
  factory $ApplicationDetailsStateCopyWith(ApplicationDetailsState value,
          $Res Function(ApplicationDetailsState) then) =
      _$ApplicationDetailsStateCopyWithImpl<$Res, ApplicationDetailsState>;
  @useResult
  $Res call(
      {ApplicationDetailsStateStatus status,
      List<ThemeModel> themes,
      ThemeModel? deleteTheme,
      ApplicationModel? application,
      ApplicationModel? deleteApplication,
      BaseException? error});

  $ThemeModelCopyWith<$Res>? get deleteTheme;
  $ApplicationModelCopyWith<$Res>? get application;
  $ApplicationModelCopyWith<$Res>? get deleteApplication;
}

/// @nodoc
class _$ApplicationDetailsStateCopyWithImpl<$Res,
        $Val extends ApplicationDetailsState>
    implements $ApplicationDetailsStateCopyWith<$Res> {
  _$ApplicationDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? themes = null,
    Object? deleteTheme = freezed,
    Object? application = freezed,
    Object? deleteApplication = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApplicationDetailsStateStatus,
      themes: null == themes
          ? _value.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<ThemeModel>,
      deleteTheme: freezed == deleteTheme
          ? _value.deleteTheme
          : deleteTheme // ignore: cast_nullable_to_non_nullable
              as ThemeModel?,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      deleteApplication: freezed == deleteApplication
          ? _value.deleteApplication
          : deleteApplication // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThemeModelCopyWith<$Res>? get deleteTheme {
    if (_value.deleteTheme == null) {
      return null;
    }

    return $ThemeModelCopyWith<$Res>(_value.deleteTheme!, (value) {
      return _then(_value.copyWith(deleteTheme: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ApplicationModelCopyWith<$Res>? get application {
    if (_value.application == null) {
      return null;
    }

    return $ApplicationModelCopyWith<$Res>(_value.application!, (value) {
      return _then(_value.copyWith(application: value) as $Val);
    });
  }

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
abstract class _$$ApplicationDetailsStateInitialImplCopyWith<$Res>
    implements $ApplicationDetailsStateCopyWith<$Res> {
  factory _$$ApplicationDetailsStateInitialImplCopyWith(
          _$ApplicationDetailsStateInitialImpl value,
          $Res Function(_$ApplicationDetailsStateInitialImpl) then) =
      __$$ApplicationDetailsStateInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApplicationDetailsStateStatus status,
      List<ThemeModel> themes,
      ThemeModel? deleteTheme,
      ApplicationModel? application,
      ApplicationModel? deleteApplication,
      BaseException? error});

  @override
  $ThemeModelCopyWith<$Res>? get deleteTheme;
  @override
  $ApplicationModelCopyWith<$Res>? get application;
  @override
  $ApplicationModelCopyWith<$Res>? get deleteApplication;
}

/// @nodoc
class __$$ApplicationDetailsStateInitialImplCopyWithImpl<$Res>
    extends _$ApplicationDetailsStateCopyWithImpl<$Res,
        _$ApplicationDetailsStateInitialImpl>
    implements _$$ApplicationDetailsStateInitialImplCopyWith<$Res> {
  __$$ApplicationDetailsStateInitialImplCopyWithImpl(
      _$ApplicationDetailsStateInitialImpl _value,
      $Res Function(_$ApplicationDetailsStateInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? themes = null,
    Object? deleteTheme = freezed,
    Object? application = freezed,
    Object? deleteApplication = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ApplicationDetailsStateInitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ApplicationDetailsStateStatus,
      themes: null == themes
          ? _value._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<ThemeModel>,
      deleteTheme: freezed == deleteTheme
          ? _value.deleteTheme
          : deleteTheme // ignore: cast_nullable_to_non_nullable
              as ThemeModel?,
      application: freezed == application
          ? _value.application
          : application // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      deleteApplication: freezed == deleteApplication
          ? _value.deleteApplication
          : deleteApplication // ignore: cast_nullable_to_non_nullable
              as ApplicationModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException?,
    ));
  }
}

/// @nodoc

class _$ApplicationDetailsStateInitialImpl
    implements ApplicationDetailsStateInitial {
  const _$ApplicationDetailsStateInitialImpl(
      {required this.status,
      final List<ThemeModel> themes = const [],
      this.deleteTheme,
      this.application,
      this.deleteApplication,
      this.error})
      : _themes = themes;

  @override
  final ApplicationDetailsStateStatus status;
  final List<ThemeModel> _themes;
  @override
  @JsonKey()
  List<ThemeModel> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  @override
  final ThemeModel? deleteTheme;
  @override
  final ApplicationModel? application;
  @override
  final ApplicationModel? deleteApplication;
  @override
  final BaseException? error;

  @override
  String toString() {
    return 'ApplicationDetailsState(status: $status, themes: $themes, deleteTheme: $deleteTheme, application: $application, deleteApplication: $deleteApplication, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationDetailsStateInitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._themes, _themes) &&
            (identical(other.deleteTheme, deleteTheme) ||
                other.deleteTheme == deleteTheme) &&
            (identical(other.application, application) ||
                other.application == application) &&
            (identical(other.deleteApplication, deleteApplication) ||
                other.deleteApplication == deleteApplication) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_themes),
      deleteTheme,
      application,
      deleteApplication,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationDetailsStateInitialImplCopyWith<
          _$ApplicationDetailsStateInitialImpl>
      get copyWith => __$$ApplicationDetailsStateInitialImplCopyWithImpl<
          _$ApplicationDetailsStateInitialImpl>(this, _$identity);
}

abstract class ApplicationDetailsStateInitial
    implements ApplicationDetailsState {
  const factory ApplicationDetailsStateInitial(
      {required final ApplicationDetailsStateStatus status,
      final List<ThemeModel> themes,
      final ThemeModel? deleteTheme,
      final ApplicationModel? application,
      final ApplicationModel? deleteApplication,
      final BaseException? error}) = _$ApplicationDetailsStateInitialImpl;

  @override
  ApplicationDetailsStateStatus get status;
  @override
  List<ThemeModel> get themes;
  @override
  ThemeModel? get deleteTheme;
  @override
  ApplicationModel? get application;
  @override
  ApplicationModel? get deleteApplication;
  @override
  BaseException? get error;
  @override
  @JsonKey(ignore: true)
  _$$ApplicationDetailsStateInitialImplCopyWith<
          _$ApplicationDetailsStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
