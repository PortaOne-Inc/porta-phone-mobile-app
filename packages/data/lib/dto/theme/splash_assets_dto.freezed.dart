// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_assets_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SplashAssetsDto _$SplashAssetsDtoFromJson(Map<String, dynamic> json) {
  return _SplashAssetsDto.fromJson(json);
}

/// @nodoc
mixin _$SplashAssetsDto {
  int? get originalAssetId => throw _privateConstructorUsedError;
  String? get pictureUrl => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  double get padding => throw _privateConstructorUsedError;
  String get fit => throw _privateConstructorUsedError;

  /// Serializes this SplashAssetsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashAssetsDtoCopyWith<SplashAssetsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashAssetsDtoCopyWith<$Res> {
  factory $SplashAssetsDtoCopyWith(
    SplashAssetsDto value,
    $Res Function(SplashAssetsDto) then,
  ) = _$SplashAssetsDtoCopyWithImpl<$Res, SplashAssetsDto>;
  @useResult
  $Res call({
    int? originalAssetId,
    String? pictureUrl,
    String? color,
    double padding,
    String fit,
  });
}

/// @nodoc
class _$SplashAssetsDtoCopyWithImpl<$Res, $Val extends SplashAssetsDto>
    implements $SplashAssetsDtoCopyWith<$Res> {
  _$SplashAssetsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashAssetsDto
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
    return _then(
      _value.copyWith(
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SplashAssetsDtoImplCopyWith<$Res>
    implements $SplashAssetsDtoCopyWith<$Res> {
  factory _$$SplashAssetsDtoImplCopyWith(
    _$SplashAssetsDtoImpl value,
    $Res Function(_$SplashAssetsDtoImpl) then,
  ) = __$$SplashAssetsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? originalAssetId,
    String? pictureUrl,
    String? color,
    double padding,
    String fit,
  });
}

/// @nodoc
class __$$SplashAssetsDtoImplCopyWithImpl<$Res>
    extends _$SplashAssetsDtoCopyWithImpl<$Res, _$SplashAssetsDtoImpl>
    implements _$$SplashAssetsDtoImplCopyWith<$Res> {
  __$$SplashAssetsDtoImplCopyWithImpl(
    _$SplashAssetsDtoImpl _value,
    $Res Function(_$SplashAssetsDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashAssetsDto
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
    return _then(
      _$SplashAssetsDtoImpl(
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
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$SplashAssetsDtoImpl implements _SplashAssetsDto {
  const _$SplashAssetsDtoImpl({
    this.originalAssetId,
    this.pictureUrl,
    this.color,
    this.padding = 0.0,
    this.fit = 'scaleDown',
  });

  factory _$SplashAssetsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashAssetsDtoImplFromJson(json);

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
    return 'SplashAssetsDto(originalAssetId: $originalAssetId, pictureUrl: $pictureUrl, color: $color, padding: $padding, fit: $fit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashAssetsDtoImpl &&
            (identical(other.originalAssetId, originalAssetId) ||
                other.originalAssetId == originalAssetId) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.fit, fit) || other.fit == fit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    originalAssetId,
    pictureUrl,
    color,
    padding,
    fit,
  );

  /// Create a copy of SplashAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashAssetsDtoImplCopyWith<_$SplashAssetsDtoImpl> get copyWith =>
      __$$SplashAssetsDtoImplCopyWithImpl<_$SplashAssetsDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashAssetsDtoImplToJson(this);
  }
}

abstract class _SplashAssetsDto implements SplashAssetsDto {
  const factory _SplashAssetsDto({
    final int? originalAssetId,
    final String? pictureUrl,
    final String? color,
    final double padding,
    final String fit,
  }) = _$SplashAssetsDtoImpl;

  factory _SplashAssetsDto.fromJson(Map<String, dynamic> json) =
      _$SplashAssetsDtoImpl.fromJson;

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

  /// Create a copy of SplashAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashAssetsDtoImplCopyWith<_$SplashAssetsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
