// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashAssetModel {
  int? get originalAssetId => throw _privateConstructorUsedError;
  String? get pictureUrl => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  double get padding => throw _privateConstructorUsedError;
  String get fit => throw _privateConstructorUsedError;

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashAssetModelCopyWith<SplashAssetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashAssetModelCopyWith<$Res> {
  factory $SplashAssetModelCopyWith(
          SplashAssetModel value, $Res Function(SplashAssetModel) then) =
      _$SplashAssetModelCopyWithImpl<$Res, SplashAssetModel>;
  @useResult
  $Res call(
      {int? originalAssetId,
      String? pictureUrl,
      String? color,
      double padding,
      String fit});
}

/// @nodoc
class _$SplashAssetModelCopyWithImpl<$Res, $Val extends SplashAssetModel>
    implements $SplashAssetModelCopyWith<$Res> {
  _$SplashAssetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAssetId = freezed,
    Object? pictureUrl = freezed,
    Object? color = freezed,
    Object? padding = null,
    Object? fit = null,
  }) {
    return _then(_value.copyWith(
      originalAssetId: freezed == originalAssetId
          ? _value.originalAssetId
          : originalAssetId // ignore: cast_nullable_to_non_nullable
              as int?,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      fit: null == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashAssetModelImplCopyWith<$Res>
    implements $SplashAssetModelCopyWith<$Res> {
  factory _$$SplashAssetModelImplCopyWith(_$SplashAssetModelImpl value,
          $Res Function(_$SplashAssetModelImpl) then) =
      __$$SplashAssetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? originalAssetId,
      String? pictureUrl,
      String? color,
      double padding,
      String fit});
}

/// @nodoc
class __$$SplashAssetModelImplCopyWithImpl<$Res>
    extends _$SplashAssetModelCopyWithImpl<$Res, _$SplashAssetModelImpl>
    implements _$$SplashAssetModelImplCopyWith<$Res> {
  __$$SplashAssetModelImplCopyWithImpl(_$SplashAssetModelImpl _value,
      $Res Function(_$SplashAssetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalAssetId = freezed,
    Object? pictureUrl = freezed,
    Object? color = freezed,
    Object? padding = null,
    Object? fit = null,
  }) {
    return _then(_$SplashAssetModelImpl(
      originalAssetId: freezed == originalAssetId
          ? _value.originalAssetId
          : originalAssetId // ignore: cast_nullable_to_non_nullable
              as int?,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      fit: null == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SplashAssetModelImpl extends _SplashAssetModel {
  const _$SplashAssetModelImpl(
      {this.originalAssetId,
      this.pictureUrl,
      this.color,
      this.padding = 0.0,
      this.fit = 'scaleDown'})
      : super._();

  @override
  final int? originalAssetId;
  @override
  final String? pictureUrl;
  @override
  final String? color;
  @override
  @JsonKey()
  final double padding;
  @override
  @JsonKey()
  final String fit;

  @override
  String toString() {
    return 'SplashAssetModel(originalAssetId: $originalAssetId, pictureUrl: $pictureUrl, color: $color, padding: $padding, fit: $fit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashAssetModelImpl &&
            (identical(other.originalAssetId, originalAssetId) ||
                other.originalAssetId == originalAssetId) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.fit, fit) || other.fit == fit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, originalAssetId, pictureUrl, color, padding, fit);

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashAssetModelImplCopyWith<_$SplashAssetModelImpl> get copyWith =>
      __$$SplashAssetModelImplCopyWithImpl<_$SplashAssetModelImpl>(
          this, _$identity);
}

abstract class _SplashAssetModel extends SplashAssetModel {
  const factory _SplashAssetModel(
      {final int? originalAssetId,
      final String? pictureUrl,
      final String? color,
      final double padding,
      final String fit}) = _$SplashAssetModelImpl;
  const _SplashAssetModel._() : super._();

  @override
  int? get originalAssetId;
  @override
  String? get pictureUrl;
  @override
  String? get color;
  @override
  double get padding;
  @override
  String get fit;

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashAssetModelImplCopyWith<_$SplashAssetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
