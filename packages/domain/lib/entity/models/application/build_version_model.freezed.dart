// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'build_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuildVersionModel _$BuildVersionModelFromJson(Map<String, dynamic> json) {
  return _BuildVersionModel.fromJson(json);
}

/// @nodoc
mixin _$BuildVersionModel {
  String? get buildName => throw _privateConstructorUsedError;
  int? get buildNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuildVersionModelCopyWith<BuildVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildVersionModelCopyWith<$Res> {
  factory $BuildVersionModelCopyWith(
          BuildVersionModel value, $Res Function(BuildVersionModel) then) =
      _$BuildVersionModelCopyWithImpl<$Res, BuildVersionModel>;
  @useResult
  $Res call({String? buildName, int? buildNumber});
}

/// @nodoc
class _$BuildVersionModelCopyWithImpl<$Res, $Val extends BuildVersionModel>
    implements $BuildVersionModelCopyWith<$Res> {
  _$BuildVersionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buildName = freezed,
    Object? buildNumber = freezed,
  }) {
    return _then(_value.copyWith(
      buildName: freezed == buildName
          ? _value.buildName
          : buildName // ignore: cast_nullable_to_non_nullable
              as String?,
      buildNumber: freezed == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuildVersionModelImplCopyWith<$Res>
    implements $BuildVersionModelCopyWith<$Res> {
  factory _$$BuildVersionModelImplCopyWith(_$BuildVersionModelImpl value,
          $Res Function(_$BuildVersionModelImpl) then) =
      __$$BuildVersionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? buildName, int? buildNumber});
}

/// @nodoc
class __$$BuildVersionModelImplCopyWithImpl<$Res>
    extends _$BuildVersionModelCopyWithImpl<$Res, _$BuildVersionModelImpl>
    implements _$$BuildVersionModelImplCopyWith<$Res> {
  __$$BuildVersionModelImplCopyWithImpl(_$BuildVersionModelImpl _value,
      $Res Function(_$BuildVersionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buildName = freezed,
    Object? buildNumber = freezed,
  }) {
    return _then(_$BuildVersionModelImpl(
      buildName: freezed == buildName
          ? _value.buildName
          : buildName // ignore: cast_nullable_to_non_nullable
              as String?,
      buildNumber: freezed == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuildVersionModelImpl implements _BuildVersionModel {
  const _$BuildVersionModelImpl({this.buildName, this.buildNumber});

  factory _$BuildVersionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuildVersionModelImplFromJson(json);

  @override
  final String? buildName;
  @override
  final int? buildNumber;

  @override
  String toString() {
    return 'BuildVersionModel(buildName: $buildName, buildNumber: $buildNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuildVersionModelImpl &&
            (identical(other.buildName, buildName) ||
                other.buildName == buildName) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, buildName, buildNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildVersionModelImplCopyWith<_$BuildVersionModelImpl> get copyWith =>
      __$$BuildVersionModelImplCopyWithImpl<_$BuildVersionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuildVersionModelImplToJson(
      this,
    );
  }
}

abstract class _BuildVersionModel implements BuildVersionModel {
  const factory _BuildVersionModel(
      {final String? buildName,
      final int? buildNumber}) = _$BuildVersionModelImpl;

  factory _BuildVersionModel.fromJson(Map<String, dynamic> json) =
      _$BuildVersionModelImpl.fromJson;

  @override
  String? get buildName;
  @override
  int? get buildNumber;
  @override
  @JsonKey(ignore: true)
  _$$BuildVersionModelImplCopyWith<_$BuildVersionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
