// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_branch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneBranch {
  String get name => throw _privateConstructorUsedError;
  PhoneBranchType get type => throw _privateConstructorUsedError;

  /// Create a copy of PhoneBranch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneBranchCopyWith<PhoneBranch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneBranchCopyWith<$Res> {
  factory $PhoneBranchCopyWith(
          PhoneBranch value, $Res Function(PhoneBranch) then) =
      _$PhoneBranchCopyWithImpl<$Res, PhoneBranch>;
  @useResult
  $Res call({String name, PhoneBranchType type});
}

/// @nodoc
class _$PhoneBranchCopyWithImpl<$Res, $Val extends PhoneBranch>
    implements $PhoneBranchCopyWith<$Res> {
  _$PhoneBranchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneBranch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PhoneBranchType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneBranchImplCopyWith<$Res>
    implements $PhoneBranchCopyWith<$Res> {
  factory _$$PhoneBranchImplCopyWith(
          _$PhoneBranchImpl value, $Res Function(_$PhoneBranchImpl) then) =
      __$$PhoneBranchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, PhoneBranchType type});
}

/// @nodoc
class __$$PhoneBranchImplCopyWithImpl<$Res>
    extends _$PhoneBranchCopyWithImpl<$Res, _$PhoneBranchImpl>
    implements _$$PhoneBranchImplCopyWith<$Res> {
  __$$PhoneBranchImplCopyWithImpl(
      _$PhoneBranchImpl _value, $Res Function(_$PhoneBranchImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneBranch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_$PhoneBranchImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PhoneBranchType,
    ));
  }
}

/// @nodoc

class _$PhoneBranchImpl extends _PhoneBranch {
  const _$PhoneBranchImpl(
      {required this.name, this.type = PhoneBranchType.regular})
      : super._();

  @override
  final String name;
  @override
  @JsonKey()
  final PhoneBranchType type;

  @override
  String toString() {
    return 'PhoneBranch(name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneBranchImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, type);

  /// Create a copy of PhoneBranch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneBranchImplCopyWith<_$PhoneBranchImpl> get copyWith =>
      __$$PhoneBranchImplCopyWithImpl<_$PhoneBranchImpl>(this, _$identity);
}

abstract class _PhoneBranch extends PhoneBranch {
  const factory _PhoneBranch(
      {required final String name,
      final PhoneBranchType type}) = _$PhoneBranchImpl;
  const _PhoneBranch._() : super._();

  @override
  String get name;
  @override
  PhoneBranchType get type;

  /// Create a copy of PhoneBranch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneBranchImplCopyWith<_$PhoneBranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
