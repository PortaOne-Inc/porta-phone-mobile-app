// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'texts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextsModel {
  String? get greeting => throw _privateConstructorUsedError;
  String? get contactEmail => throw _privateConstructorUsedError;

  /// Create a copy of TextsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextsModelCopyWith<TextsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextsModelCopyWith<$Res> {
  factory $TextsModelCopyWith(
          TextsModel value, $Res Function(TextsModel) then) =
      _$TextsModelCopyWithImpl<$Res, TextsModel>;
  @useResult
  $Res call({String? greeting, String? contactEmail});
}

/// @nodoc
class _$TextsModelCopyWithImpl<$Res, $Val extends TextsModel>
    implements $TextsModelCopyWith<$Res> {
  _$TextsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greeting = freezed,
    Object? contactEmail = freezed,
  }) {
    return _then(_value.copyWith(
      greeting: freezed == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextsModelImplCopyWith<$Res>
    implements $TextsModelCopyWith<$Res> {
  factory _$$TextsModelImplCopyWith(
          _$TextsModelImpl value, $Res Function(_$TextsModelImpl) then) =
      __$$TextsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? greeting, String? contactEmail});
}

/// @nodoc
class __$$TextsModelImplCopyWithImpl<$Res>
    extends _$TextsModelCopyWithImpl<$Res, _$TextsModelImpl>
    implements _$$TextsModelImplCopyWith<$Res> {
  __$$TextsModelImplCopyWithImpl(
      _$TextsModelImpl _value, $Res Function(_$TextsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greeting = freezed,
    Object? contactEmail = freezed,
  }) {
    return _then(_$TextsModelImpl(
      greeting: freezed == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TextsModelImpl implements _TextsModel {
  const _$TextsModelImpl({this.greeting, this.contactEmail});

  @override
  final String? greeting;
  @override
  final String? contactEmail;

  @override
  String toString() {
    return 'TextsModel(greeting: $greeting, contactEmail: $contactEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextsModelImpl &&
            (identical(other.greeting, greeting) ||
                other.greeting == greeting) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, greeting, contactEmail);

  /// Create a copy of TextsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextsModelImplCopyWith<_$TextsModelImpl> get copyWith =>
      __$$TextsModelImplCopyWithImpl<_$TextsModelImpl>(this, _$identity);
}

abstract class _TextsModel implements TextsModel {
  const factory _TextsModel(
      {final String? greeting, final String? contactEmail}) = _$TextsModelImpl;

  @override
  String? get greeting;
  @override
  String? get contactEmail;

  /// Create a copy of TextsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextsModelImplCopyWith<_$TextsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
