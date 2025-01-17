// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'build_version_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuildVersionDTO _$BuildVersionDTOFromJson(Map<String, dynamic> json) {
  return _BuildVersionDTO.fromJson(json);
}

/// @nodoc
mixin _$BuildVersionDTO {
  String? get buildName => throw _privateConstructorUsedError;
  int? get buildNumber => throw _privateConstructorUsedError;

  /// Serializes this BuildVersionDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuildVersionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuildVersionDTOCopyWith<BuildVersionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildVersionDTOCopyWith<$Res> {
  factory $BuildVersionDTOCopyWith(
          BuildVersionDTO value, $Res Function(BuildVersionDTO) then) =
      _$BuildVersionDTOCopyWithImpl<$Res, BuildVersionDTO>;
  @useResult
  $Res call({String? buildName, int? buildNumber});
}

/// @nodoc
class _$BuildVersionDTOCopyWithImpl<$Res, $Val extends BuildVersionDTO>
    implements $BuildVersionDTOCopyWith<$Res> {
  _$BuildVersionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuildVersionDTO
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$BuildVersionDTOImplCopyWith<$Res>
    implements $BuildVersionDTOCopyWith<$Res> {
  factory _$$BuildVersionDTOImplCopyWith(_$BuildVersionDTOImpl value,
          $Res Function(_$BuildVersionDTOImpl) then) =
      __$$BuildVersionDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? buildName, int? buildNumber});
}

/// @nodoc
class __$$BuildVersionDTOImplCopyWithImpl<$Res>
    extends _$BuildVersionDTOCopyWithImpl<$Res, _$BuildVersionDTOImpl>
    implements _$$BuildVersionDTOImplCopyWith<$Res> {
  __$$BuildVersionDTOImplCopyWithImpl(
      _$BuildVersionDTOImpl _value, $Res Function(_$BuildVersionDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of BuildVersionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buildName = freezed,
    Object? buildNumber = freezed,
  }) {
    return _then(_$BuildVersionDTOImpl(
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
class _$BuildVersionDTOImpl implements _BuildVersionDTO {
  const _$BuildVersionDTOImpl({this.buildName, this.buildNumber});

  factory _$BuildVersionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuildVersionDTOImplFromJson(json);

  @override
  final String? buildName;
  @override
  final int? buildNumber;

  @override
  String toString() {
    return 'BuildVersionDTO(buildName: $buildName, buildNumber: $buildNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuildVersionDTOImpl &&
            (identical(other.buildName, buildName) ||
                other.buildName == buildName) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, buildName, buildNumber);

  /// Create a copy of BuildVersionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildVersionDTOImplCopyWith<_$BuildVersionDTOImpl> get copyWith =>
      __$$BuildVersionDTOImplCopyWithImpl<_$BuildVersionDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuildVersionDTOImplToJson(
      this,
    );
  }
}

abstract class _BuildVersionDTO implements BuildVersionDTO {
  const factory _BuildVersionDTO(
      {final String? buildName,
      final int? buildNumber}) = _$BuildVersionDTOImpl;

  factory _BuildVersionDTO.fromJson(Map<String, dynamic> json) =
      _$BuildVersionDTOImpl.fromJson;

  @override
  String? get buildName;
  @override
  int? get buildNumber;

  /// Create a copy of BuildVersionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuildVersionDTOImplCopyWith<_$BuildVersionDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
