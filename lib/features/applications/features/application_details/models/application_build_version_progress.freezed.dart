// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_build_version_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApplicationBuildVersionProgress {
  List<BuildPlatform> get progressNameUpdating =>
      throw _privateConstructorUsedError;
  List<BuildPlatform> get progressNumberUpdating =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApplicationBuildVersionProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplicationBuildVersionProgressCopyWith<ApplicationBuildVersionProgress>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationBuildVersionProgressCopyWith<$Res> {
  factory $ApplicationBuildVersionProgressCopyWith(
          ApplicationBuildVersionProgress value,
          $Res Function(ApplicationBuildVersionProgress) then) =
      _$ApplicationBuildVersionProgressCopyWithImpl<$Res,
          ApplicationBuildVersionProgress>;
  @useResult
  $Res call(
      {List<BuildPlatform> progressNameUpdating,
      List<BuildPlatform> progressNumberUpdating});
}

/// @nodoc
class _$ApplicationBuildVersionProgressCopyWithImpl<$Res,
        $Val extends ApplicationBuildVersionProgress>
    implements $ApplicationBuildVersionProgressCopyWith<$Res> {
  _$ApplicationBuildVersionProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplicationBuildVersionProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progressNameUpdating = null,
    Object? progressNumberUpdating = null,
  }) {
    return _then(_value.copyWith(
      progressNameUpdating: null == progressNameUpdating
          ? _value.progressNameUpdating
          : progressNameUpdating // ignore: cast_nullable_to_non_nullable
              as List<BuildPlatform>,
      progressNumberUpdating: null == progressNumberUpdating
          ? _value.progressNumberUpdating
          : progressNumberUpdating // ignore: cast_nullable_to_non_nullable
              as List<BuildPlatform>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplicationBuildVersionProgressImplCopyWith<$Res>
    implements $ApplicationBuildVersionProgressCopyWith<$Res> {
  factory _$$ApplicationBuildVersionProgressImplCopyWith(
          _$ApplicationBuildVersionProgressImpl value,
          $Res Function(_$ApplicationBuildVersionProgressImpl) then) =
      __$$ApplicationBuildVersionProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BuildPlatform> progressNameUpdating,
      List<BuildPlatform> progressNumberUpdating});
}

/// @nodoc
class __$$ApplicationBuildVersionProgressImplCopyWithImpl<$Res>
    extends _$ApplicationBuildVersionProgressCopyWithImpl<$Res,
        _$ApplicationBuildVersionProgressImpl>
    implements _$$ApplicationBuildVersionProgressImplCopyWith<$Res> {
  __$$ApplicationBuildVersionProgressImplCopyWithImpl(
      _$ApplicationBuildVersionProgressImpl _value,
      $Res Function(_$ApplicationBuildVersionProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplicationBuildVersionProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progressNameUpdating = null,
    Object? progressNumberUpdating = null,
  }) {
    return _then(_$ApplicationBuildVersionProgressImpl(
      progressNameUpdating: null == progressNameUpdating
          ? _value._progressNameUpdating
          : progressNameUpdating // ignore: cast_nullable_to_non_nullable
              as List<BuildPlatform>,
      progressNumberUpdating: null == progressNumberUpdating
          ? _value._progressNumberUpdating
          : progressNumberUpdating // ignore: cast_nullable_to_non_nullable
              as List<BuildPlatform>,
    ));
  }
}

/// @nodoc

class _$ApplicationBuildVersionProgressImpl
    extends _ApplicationBuildVersionProgress {
  const _$ApplicationBuildVersionProgressImpl(
      {required final List<BuildPlatform> progressNameUpdating,
      required final List<BuildPlatform> progressNumberUpdating})
      : _progressNameUpdating = progressNameUpdating,
        _progressNumberUpdating = progressNumberUpdating,
        super._();

  final List<BuildPlatform> _progressNameUpdating;
  @override
  List<BuildPlatform> get progressNameUpdating {
    if (_progressNameUpdating is EqualUnmodifiableListView)
      return _progressNameUpdating;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_progressNameUpdating);
  }

  final List<BuildPlatform> _progressNumberUpdating;
  @override
  List<BuildPlatform> get progressNumberUpdating {
    if (_progressNumberUpdating is EqualUnmodifiableListView)
      return _progressNumberUpdating;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_progressNumberUpdating);
  }

  @override
  String toString() {
    return 'ApplicationBuildVersionProgress(progressNameUpdating: $progressNameUpdating, progressNumberUpdating: $progressNumberUpdating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplicationBuildVersionProgressImpl &&
            const DeepCollectionEquality()
                .equals(other._progressNameUpdating, _progressNameUpdating) &&
            const DeepCollectionEquality().equals(
                other._progressNumberUpdating, _progressNumberUpdating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_progressNameUpdating),
      const DeepCollectionEquality().hash(_progressNumberUpdating));

  /// Create a copy of ApplicationBuildVersionProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplicationBuildVersionProgressImplCopyWith<
          _$ApplicationBuildVersionProgressImpl>
      get copyWith => __$$ApplicationBuildVersionProgressImplCopyWithImpl<
          _$ApplicationBuildVersionProgressImpl>(this, _$identity);
}

abstract class _ApplicationBuildVersionProgress
    extends ApplicationBuildVersionProgress {
  const factory _ApplicationBuildVersionProgress(
          {required final List<BuildPlatform> progressNameUpdating,
          required final List<BuildPlatform> progressNumberUpdating}) =
      _$ApplicationBuildVersionProgressImpl;
  const _ApplicationBuildVersionProgress._() : super._();

  @override
  List<BuildPlatform> get progressNameUpdating;
  @override
  List<BuildPlatform> get progressNumberUpdating;

  /// Create a copy of ApplicationBuildVersionProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplicationBuildVersionProgressImplCopyWith<
          _$ApplicationBuildVersionProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}
