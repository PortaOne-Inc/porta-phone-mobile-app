// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_asset_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SplashSourceDto _$SplashSourceDtoFromJson(Map<String, dynamic> json) {
  return _SplashSourceDto.fromJson(json);
}

/// @nodoc
mixin _$SplashSourceDto {
  String? get foregroundAssetId => throw _privateConstructorUsedError;
  String? get backgroundAssetId => throw _privateConstructorUsedError;
  String? get backgroundColorHex => throw _privateConstructorUsedError;

  /// Serializes this SplashSourceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashSourceDtoCopyWith<SplashSourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashSourceDtoCopyWith<$Res> {
  factory $SplashSourceDtoCopyWith(
          SplashSourceDto value, $Res Function(SplashSourceDto) then) =
      _$SplashSourceDtoCopyWithImpl<$Res, SplashSourceDto>;
  @useResult
  $Res call(
      {String? foregroundAssetId,
      String? backgroundAssetId,
      String? backgroundColorHex});
}

/// @nodoc
class _$SplashSourceDtoCopyWithImpl<$Res, $Val extends SplashSourceDto>
    implements $SplashSourceDtoCopyWith<$Res> {
  _$SplashSourceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foregroundAssetId = freezed,
    Object? backgroundAssetId = freezed,
    Object? backgroundColorHex = freezed,
  }) {
    return _then(_value.copyWith(
      foregroundAssetId: freezed == foregroundAssetId
          ? _value.foregroundAssetId
          : foregroundAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundAssetId: freezed == backgroundAssetId
          ? _value.backgroundAssetId
          : backgroundAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColorHex: freezed == backgroundColorHex
          ? _value.backgroundColorHex
          : backgroundColorHex // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashSourceDtoImplCopyWith<$Res>
    implements $SplashSourceDtoCopyWith<$Res> {
  factory _$$SplashSourceDtoImplCopyWith(_$SplashSourceDtoImpl value,
          $Res Function(_$SplashSourceDtoImpl) then) =
      __$$SplashSourceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? foregroundAssetId,
      String? backgroundAssetId,
      String? backgroundColorHex});
}

/// @nodoc
class __$$SplashSourceDtoImplCopyWithImpl<$Res>
    extends _$SplashSourceDtoCopyWithImpl<$Res, _$SplashSourceDtoImpl>
    implements _$$SplashSourceDtoImplCopyWith<$Res> {
  __$$SplashSourceDtoImplCopyWithImpl(
      _$SplashSourceDtoImpl _value, $Res Function(_$SplashSourceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foregroundAssetId = freezed,
    Object? backgroundAssetId = freezed,
    Object? backgroundColorHex = freezed,
  }) {
    return _then(_$SplashSourceDtoImpl(
      foregroundAssetId: freezed == foregroundAssetId
          ? _value.foregroundAssetId
          : foregroundAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundAssetId: freezed == backgroundAssetId
          ? _value.backgroundAssetId
          : backgroundAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColorHex: freezed == backgroundColorHex
          ? _value.backgroundColorHex
          : backgroundColorHex // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashSourceDtoImpl implements _SplashSourceDto {
  const _$SplashSourceDtoImpl(
      {this.foregroundAssetId,
      this.backgroundAssetId,
      this.backgroundColorHex});

  factory _$SplashSourceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashSourceDtoImplFromJson(json);

  @override
  final String? foregroundAssetId;
  @override
  final String? backgroundAssetId;
  @override
  final String? backgroundColorHex;

  @override
  String toString() {
    return 'SplashSourceDto(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashSourceDtoImpl &&
            (identical(other.foregroundAssetId, foregroundAssetId) ||
                other.foregroundAssetId == foregroundAssetId) &&
            (identical(other.backgroundAssetId, backgroundAssetId) ||
                other.backgroundAssetId == backgroundAssetId) &&
            (identical(other.backgroundColorHex, backgroundColorHex) ||
                other.backgroundColorHex == backgroundColorHex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, foregroundAssetId, backgroundAssetId, backgroundColorHex);

  /// Create a copy of SplashSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashSourceDtoImplCopyWith<_$SplashSourceDtoImpl> get copyWith =>
      __$$SplashSourceDtoImplCopyWithImpl<_$SplashSourceDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashSourceDtoImplToJson(
      this,
    );
  }
}

abstract class _SplashSourceDto implements SplashSourceDto {
  const factory _SplashSourceDto(
      {final String? foregroundAssetId,
      final String? backgroundAssetId,
      final String? backgroundColorHex}) = _$SplashSourceDtoImpl;

  factory _SplashSourceDto.fromJson(Map<String, dynamic> json) =
      _$SplashSourceDtoImpl.fromJson;

  @override
  String? get foregroundAssetId;
  @override
  String? get backgroundAssetId;
  @override
  String? get backgroundColorHex;

  /// Create a copy of SplashSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashSourceDtoImplCopyWith<_$SplashSourceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SplashAssetParamsDto _$SplashAssetParamsDtoFromJson(Map<String, dynamic> json) {
  return _SplashAssetParamsDto.fromJson(json);
}

/// @nodoc
mixin _$SplashAssetParamsDto {
  FitDto? get fit => throw _privateConstructorUsedError;
  double? get padding => throw _privateConstructorUsedError;

  /// Serializes this SplashAssetParamsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashAssetParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashAssetParamsDtoCopyWith<SplashAssetParamsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashAssetParamsDtoCopyWith<$Res> {
  factory $SplashAssetParamsDtoCopyWith(SplashAssetParamsDto value,
          $Res Function(SplashAssetParamsDto) then) =
      _$SplashAssetParamsDtoCopyWithImpl<$Res, SplashAssetParamsDto>;
  @useResult
  $Res call({FitDto? fit, double? padding});
}

/// @nodoc
class _$SplashAssetParamsDtoCopyWithImpl<$Res,
        $Val extends SplashAssetParamsDto>
    implements $SplashAssetParamsDtoCopyWith<$Res> {
  _$SplashAssetParamsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashAssetParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fit = freezed,
    Object? padding = freezed,
  }) {
    return _then(_value.copyWith(
      fit: freezed == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as FitDto?,
      padding: freezed == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashAssetParamsDtoImplCopyWith<$Res>
    implements $SplashAssetParamsDtoCopyWith<$Res> {
  factory _$$SplashAssetParamsDtoImplCopyWith(_$SplashAssetParamsDtoImpl value,
          $Res Function(_$SplashAssetParamsDtoImpl) then) =
      __$$SplashAssetParamsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FitDto? fit, double? padding});
}

/// @nodoc
class __$$SplashAssetParamsDtoImplCopyWithImpl<$Res>
    extends _$SplashAssetParamsDtoCopyWithImpl<$Res, _$SplashAssetParamsDtoImpl>
    implements _$$SplashAssetParamsDtoImplCopyWith<$Res> {
  __$$SplashAssetParamsDtoImplCopyWithImpl(_$SplashAssetParamsDtoImpl _value,
      $Res Function(_$SplashAssetParamsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashAssetParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fit = freezed,
    Object? padding = freezed,
  }) {
    return _then(_$SplashAssetParamsDtoImpl(
      fit: freezed == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as FitDto?,
      padding: freezed == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashAssetParamsDtoImpl implements _SplashAssetParamsDto {
  const _$SplashAssetParamsDtoImpl({this.fit, this.padding});

  factory _$SplashAssetParamsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashAssetParamsDtoImplFromJson(json);

  @override
  final FitDto? fit;
  @override
  final double? padding;

  @override
  String toString() {
    return 'SplashAssetParamsDto(fit: $fit, padding: $padding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashAssetParamsDtoImpl &&
            (identical(other.fit, fit) || other.fit == fit) &&
            (identical(other.padding, padding) || other.padding == padding));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fit, padding);

  /// Create a copy of SplashAssetParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashAssetParamsDtoImplCopyWith<_$SplashAssetParamsDtoImpl>
      get copyWith =>
          __$$SplashAssetParamsDtoImplCopyWithImpl<_$SplashAssetParamsDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashAssetParamsDtoImplToJson(
      this,
    );
  }
}

abstract class _SplashAssetParamsDto implements SplashAssetParamsDto {
  const factory _SplashAssetParamsDto(
      {final FitDto? fit, final double? padding}) = _$SplashAssetParamsDtoImpl;

  factory _SplashAssetParamsDto.fromJson(Map<String, dynamic> json) =
      _$SplashAssetParamsDtoImpl.fromJson;

  @override
  FitDto? get fit;
  @override
  double? get padding;

  /// Create a copy of SplashAssetParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashAssetParamsDtoImplCopyWith<_$SplashAssetParamsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SplashConstraintsValidationDto _$SplashConstraintsValidationDtoFromJson(
    Map<String, dynamic> json) {
  return _SplashConstraintsValidationDto.fromJson(json);
}

/// @nodoc
mixin _$SplashConstraintsValidationDto {
  bool get compliant => throw _privateConstructorUsedError;
  double get deltaDp => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  double? get toleranceDp => throw _privateConstructorUsedError;

  /// Serializes this SplashConstraintsValidationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashConstraintsValidationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashConstraintsValidationDtoCopyWith<SplashConstraintsValidationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashConstraintsValidationDtoCopyWith<$Res> {
  factory $SplashConstraintsValidationDtoCopyWith(
          SplashConstraintsValidationDto value,
          $Res Function(SplashConstraintsValidationDto) then) =
      _$SplashConstraintsValidationDtoCopyWithImpl<$Res,
          SplashConstraintsValidationDto>;
  @useResult
  $Res call(
      {bool compliant, double deltaDp, String message, double? toleranceDp});
}

/// @nodoc
class _$SplashConstraintsValidationDtoCopyWithImpl<$Res,
        $Val extends SplashConstraintsValidationDto>
    implements $SplashConstraintsValidationDtoCopyWith<$Res> {
  _$SplashConstraintsValidationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashConstraintsValidationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compliant = null,
    Object? deltaDp = null,
    Object? message = null,
    Object? toleranceDp = freezed,
  }) {
    return _then(_value.copyWith(
      compliant: null == compliant
          ? _value.compliant
          : compliant // ignore: cast_nullable_to_non_nullable
              as bool,
      deltaDp: null == deltaDp
          ? _value.deltaDp
          : deltaDp // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      toleranceDp: freezed == toleranceDp
          ? _value.toleranceDp
          : toleranceDp // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashConstraintsValidationDtoImplCopyWith<$Res>
    implements $SplashConstraintsValidationDtoCopyWith<$Res> {
  factory _$$SplashConstraintsValidationDtoImplCopyWith(
          _$SplashConstraintsValidationDtoImpl value,
          $Res Function(_$SplashConstraintsValidationDtoImpl) then) =
      __$$SplashConstraintsValidationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool compliant, double deltaDp, String message, double? toleranceDp});
}

/// @nodoc
class __$$SplashConstraintsValidationDtoImplCopyWithImpl<$Res>
    extends _$SplashConstraintsValidationDtoCopyWithImpl<$Res,
        _$SplashConstraintsValidationDtoImpl>
    implements _$$SplashConstraintsValidationDtoImplCopyWith<$Res> {
  __$$SplashConstraintsValidationDtoImplCopyWithImpl(
      _$SplashConstraintsValidationDtoImpl _value,
      $Res Function(_$SplashConstraintsValidationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashConstraintsValidationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compliant = null,
    Object? deltaDp = null,
    Object? message = null,
    Object? toleranceDp = freezed,
  }) {
    return _then(_$SplashConstraintsValidationDtoImpl(
      compliant: null == compliant
          ? _value.compliant
          : compliant // ignore: cast_nullable_to_non_nullable
              as bool,
      deltaDp: null == deltaDp
          ? _value.deltaDp
          : deltaDp // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      toleranceDp: freezed == toleranceDp
          ? _value.toleranceDp
          : toleranceDp // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashConstraintsValidationDtoImpl
    implements _SplashConstraintsValidationDto {
  const _$SplashConstraintsValidationDtoImpl(
      {required this.compliant,
      required this.deltaDp,
      required this.message,
      this.toleranceDp});

  factory _$SplashConstraintsValidationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SplashConstraintsValidationDtoImplFromJson(json);

  @override
  final bool compliant;
  @override
  final double deltaDp;
  @override
  final String message;
  @override
  final double? toleranceDp;

  @override
  String toString() {
    return 'SplashConstraintsValidationDto(compliant: $compliant, deltaDp: $deltaDp, message: $message, toleranceDp: $toleranceDp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashConstraintsValidationDtoImpl &&
            (identical(other.compliant, compliant) ||
                other.compliant == compliant) &&
            (identical(other.deltaDp, deltaDp) || other.deltaDp == deltaDp) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.toleranceDp, toleranceDp) ||
                other.toleranceDp == toleranceDp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, compliant, deltaDp, message, toleranceDp);

  /// Create a copy of SplashConstraintsValidationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashConstraintsValidationDtoImplCopyWith<
          _$SplashConstraintsValidationDtoImpl>
      get copyWith => __$$SplashConstraintsValidationDtoImplCopyWithImpl<
          _$SplashConstraintsValidationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashConstraintsValidationDtoImplToJson(
      this,
    );
  }
}

abstract class _SplashConstraintsValidationDto
    implements SplashConstraintsValidationDto {
  const factory _SplashConstraintsValidationDto(
      {required final bool compliant,
      required final double deltaDp,
      required final String message,
      final double? toleranceDp}) = _$SplashConstraintsValidationDtoImpl;

  factory _SplashConstraintsValidationDto.fromJson(Map<String, dynamic> json) =
      _$SplashConstraintsValidationDtoImpl.fromJson;

  @override
  bool get compliant;
  @override
  double get deltaDp;
  @override
  String get message;
  @override
  double? get toleranceDp;

  /// Create a copy of SplashConstraintsValidationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashConstraintsValidationDtoImplCopyWith<
          _$SplashConstraintsValidationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SplashIconConstraintsDto _$SplashIconConstraintsDtoFromJson(
    Map<String, dynamic> json) {
  return _SplashIconConstraintsDto.fromJson(json);
}

/// @nodoc
mixin _$SplashIconConstraintsDto {
  double get fullSizeDp => throw _privateConstructorUsedError;
  double get maskDiameterDp => throw _privateConstructorUsedError;
  double get recommendedPaddingDp => throw _privateConstructorUsedError;
  SplashConstraintsValidationDto get validation =>
      throw _privateConstructorUsedError;
  SplashModeDto get mode => throw _privateConstructorUsedError;
  String get recommendationBasis => throw _privateConstructorUsedError;

  /// Serializes this SplashIconConstraintsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashIconConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashIconConstraintsDtoCopyWith<SplashIconConstraintsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashIconConstraintsDtoCopyWith<$Res> {
  factory $SplashIconConstraintsDtoCopyWith(SplashIconConstraintsDto value,
          $Res Function(SplashIconConstraintsDto) then) =
      _$SplashIconConstraintsDtoCopyWithImpl<$Res, SplashIconConstraintsDto>;
  @useResult
  $Res call(
      {double fullSizeDp,
      double maskDiameterDp,
      double recommendedPaddingDp,
      SplashConstraintsValidationDto validation,
      SplashModeDto mode,
      String recommendationBasis});

  $SplashConstraintsValidationDtoCopyWith<$Res> get validation;
}

/// @nodoc
class _$SplashIconConstraintsDtoCopyWithImpl<$Res,
        $Val extends SplashIconConstraintsDto>
    implements $SplashIconConstraintsDtoCopyWith<$Res> {
  _$SplashIconConstraintsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashIconConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullSizeDp = null,
    Object? maskDiameterDp = null,
    Object? recommendedPaddingDp = null,
    Object? validation = null,
    Object? mode = null,
    Object? recommendationBasis = null,
  }) {
    return _then(_value.copyWith(
      fullSizeDp: null == fullSizeDp
          ? _value.fullSizeDp
          : fullSizeDp // ignore: cast_nullable_to_non_nullable
              as double,
      maskDiameterDp: null == maskDiameterDp
          ? _value.maskDiameterDp
          : maskDiameterDp // ignore: cast_nullable_to_non_nullable
              as double,
      recommendedPaddingDp: null == recommendedPaddingDp
          ? _value.recommendedPaddingDp
          : recommendedPaddingDp // ignore: cast_nullable_to_non_nullable
              as double,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsValidationDto,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplashModeDto,
      recommendationBasis: null == recommendationBasis
          ? _value.recommendationBasis
          : recommendationBasis // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of SplashIconConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashConstraintsValidationDtoCopyWith<$Res> get validation {
    return $SplashConstraintsValidationDtoCopyWith<$Res>(_value.validation,
        (value) {
      return _then(_value.copyWith(validation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SplashIconConstraintsDtoImplCopyWith<$Res>
    implements $SplashIconConstraintsDtoCopyWith<$Res> {
  factory _$$SplashIconConstraintsDtoImplCopyWith(
          _$SplashIconConstraintsDtoImpl value,
          $Res Function(_$SplashIconConstraintsDtoImpl) then) =
      __$$SplashIconConstraintsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double fullSizeDp,
      double maskDiameterDp,
      double recommendedPaddingDp,
      SplashConstraintsValidationDto validation,
      SplashModeDto mode,
      String recommendationBasis});

  @override
  $SplashConstraintsValidationDtoCopyWith<$Res> get validation;
}

/// @nodoc
class __$$SplashIconConstraintsDtoImplCopyWithImpl<$Res>
    extends _$SplashIconConstraintsDtoCopyWithImpl<$Res,
        _$SplashIconConstraintsDtoImpl>
    implements _$$SplashIconConstraintsDtoImplCopyWith<$Res> {
  __$$SplashIconConstraintsDtoImplCopyWithImpl(
      _$SplashIconConstraintsDtoImpl _value,
      $Res Function(_$SplashIconConstraintsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashIconConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullSizeDp = null,
    Object? maskDiameterDp = null,
    Object? recommendedPaddingDp = null,
    Object? validation = null,
    Object? mode = null,
    Object? recommendationBasis = null,
  }) {
    return _then(_$SplashIconConstraintsDtoImpl(
      fullSizeDp: null == fullSizeDp
          ? _value.fullSizeDp
          : fullSizeDp // ignore: cast_nullable_to_non_nullable
              as double,
      maskDiameterDp: null == maskDiameterDp
          ? _value.maskDiameterDp
          : maskDiameterDp // ignore: cast_nullable_to_non_nullable
              as double,
      recommendedPaddingDp: null == recommendedPaddingDp
          ? _value.recommendedPaddingDp
          : recommendedPaddingDp // ignore: cast_nullable_to_non_nullable
              as double,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsValidationDto,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplashModeDto,
      recommendationBasis: null == recommendationBasis
          ? _value.recommendationBasis
          : recommendationBasis // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashIconConstraintsDtoImpl implements _SplashIconConstraintsDto {
  const _$SplashIconConstraintsDtoImpl(
      {required this.fullSizeDp,
      required this.maskDiameterDp,
      required this.recommendedPaddingDp,
      required this.validation,
      this.mode = SplashModeDto.withBackground,
      this.recommendationBasis = 'safeZone'});

  factory _$SplashIconConstraintsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashIconConstraintsDtoImplFromJson(json);

  @override
  final double fullSizeDp;
  @override
  final double maskDiameterDp;
  @override
  final double recommendedPaddingDp;
  @override
  final SplashConstraintsValidationDto validation;
  @override
  @JsonKey()
  final SplashModeDto mode;
  @override
  @JsonKey()
  final String recommendationBasis;

  @override
  String toString() {
    return 'SplashIconConstraintsDto(fullSizeDp: $fullSizeDp, maskDiameterDp: $maskDiameterDp, recommendedPaddingDp: $recommendedPaddingDp, validation: $validation, mode: $mode, recommendationBasis: $recommendationBasis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashIconConstraintsDtoImpl &&
            (identical(other.fullSizeDp, fullSizeDp) ||
                other.fullSizeDp == fullSizeDp) &&
            (identical(other.maskDiameterDp, maskDiameterDp) ||
                other.maskDiameterDp == maskDiameterDp) &&
            (identical(other.recommendedPaddingDp, recommendedPaddingDp) ||
                other.recommendedPaddingDp == recommendedPaddingDp) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.recommendationBasis, recommendationBasis) ||
                other.recommendationBasis == recommendationBasis));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullSizeDp, maskDiameterDp,
      recommendedPaddingDp, validation, mode, recommendationBasis);

  /// Create a copy of SplashIconConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashIconConstraintsDtoImplCopyWith<_$SplashIconConstraintsDtoImpl>
      get copyWith => __$$SplashIconConstraintsDtoImplCopyWithImpl<
          _$SplashIconConstraintsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashIconConstraintsDtoImplToJson(
      this,
    );
  }
}

abstract class _SplashIconConstraintsDto implements SplashIconConstraintsDto {
  const factory _SplashIconConstraintsDto(
      {required final double fullSizeDp,
      required final double maskDiameterDp,
      required final double recommendedPaddingDp,
      required final SplashConstraintsValidationDto validation,
      final SplashModeDto mode,
      final String recommendationBasis}) = _$SplashIconConstraintsDtoImpl;

  factory _SplashIconConstraintsDto.fromJson(Map<String, dynamic> json) =
      _$SplashIconConstraintsDtoImpl.fromJson;

  @override
  double get fullSizeDp;
  @override
  double get maskDiameterDp;
  @override
  double get recommendedPaddingDp;
  @override
  SplashConstraintsValidationDto get validation;
  @override
  SplashModeDto get mode;
  @override
  String get recommendationBasis;

  /// Create a copy of SplashIconConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashIconConstraintsDtoImplCopyWith<_$SplashIconConstraintsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SplashAssetDto _$SplashAssetDtoFromJson(Map<String, dynamic> json) {
  return _SplashAssetDto.fromJson(json);
}

/// @nodoc
mixin _$SplashAssetDto {
  String get id => throw _privateConstructorUsedError; // themeId
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  SplashSourceDto? get source => throw _privateConstructorUsedError;
  SplashAssetParamsDto? get params => throw _privateConstructorUsedError;
  SplashModeDto? get mode => throw _privateConstructorUsedError;
  SplashOutputsArtifactsDto? get outputsArtifacts =>
      throw _privateConstructorUsedError;
  String? get splashArtifactId => throw _privateConstructorUsedError;
  SplashIconConstraintsDto? get iconConstraints =>
      throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  Map<String, String>? get urls => throw _privateConstructorUsedError;

  /// Serializes this SplashAssetDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashAssetDtoCopyWith<SplashAssetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashAssetDtoCopyWith<$Res> {
  factory $SplashAssetDtoCopyWith(
          SplashAssetDto value, $Res Function(SplashAssetDto) then) =
      _$SplashAssetDtoCopyWithImpl<$Res, SplashAssetDto>;
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      SplashSourceDto? source,
      SplashAssetParamsDto? params,
      SplashModeDto? mode,
      SplashOutputsArtifactsDto? outputsArtifacts,
      String? splashArtifactId,
      SplashIconConstraintsDto? iconConstraints,
      String? createdAt,
      String? updatedAt,
      Map<String, String>? urls});

  $SplashSourceDtoCopyWith<$Res>? get source;
  $SplashAssetParamsDtoCopyWith<$Res>? get params;
  $SplashOutputsArtifactsDtoCopyWith<$Res>? get outputsArtifacts;
  $SplashIconConstraintsDtoCopyWith<$Res>? get iconConstraints;
}

/// @nodoc
class _$SplashAssetDtoCopyWithImpl<$Res, $Val extends SplashAssetDto>
    implements $SplashAssetDtoCopyWith<$Res> {
  _$SplashAssetDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? source = freezed,
    Object? params = freezed,
    Object? mode = freezed,
    Object? outputsArtifacts = freezed,
    Object? splashArtifactId = freezed,
    Object? iconConstraints = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? urls = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SplashSourceDto?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as SplashAssetParamsDto?,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplashModeDto?,
      outputsArtifacts: freezed == outputsArtifacts
          ? _value.outputsArtifacts
          : outputsArtifacts // ignore: cast_nullable_to_non_nullable
              as SplashOutputsArtifactsDto?,
      splashArtifactId: freezed == splashArtifactId
          ? _value.splashArtifactId
          : splashArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      iconConstraints: freezed == iconConstraints
          ? _value.iconConstraints
          : iconConstraints // ignore: cast_nullable_to_non_nullable
              as SplashIconConstraintsDto?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }

  /// Create a copy of SplashAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashSourceDtoCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SplashSourceDtoCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }

  /// Create a copy of SplashAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashAssetParamsDtoCopyWith<$Res>? get params {
    if (_value.params == null) {
      return null;
    }

    return $SplashAssetParamsDtoCopyWith<$Res>(_value.params!, (value) {
      return _then(_value.copyWith(params: value) as $Val);
    });
  }

  /// Create a copy of SplashAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashOutputsArtifactsDtoCopyWith<$Res>? get outputsArtifacts {
    if (_value.outputsArtifacts == null) {
      return null;
    }

    return $SplashOutputsArtifactsDtoCopyWith<$Res>(_value.outputsArtifacts!,
        (value) {
      return _then(_value.copyWith(outputsArtifacts: value) as $Val);
    });
  }

  /// Create a copy of SplashAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashIconConstraintsDtoCopyWith<$Res>? get iconConstraints {
    if (_value.iconConstraints == null) {
      return null;
    }

    return $SplashIconConstraintsDtoCopyWith<$Res>(_value.iconConstraints!,
        (value) {
      return _then(_value.copyWith(iconConstraints: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SplashAssetDtoImplCopyWith<$Res>
    implements $SplashAssetDtoCopyWith<$Res> {
  factory _$$SplashAssetDtoImplCopyWith(_$SplashAssetDtoImpl value,
          $Res Function(_$SplashAssetDtoImpl) then) =
      __$$SplashAssetDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      SplashSourceDto? source,
      SplashAssetParamsDto? params,
      SplashModeDto? mode,
      SplashOutputsArtifactsDto? outputsArtifacts,
      String? splashArtifactId,
      SplashIconConstraintsDto? iconConstraints,
      String? createdAt,
      String? updatedAt,
      Map<String, String>? urls});

  @override
  $SplashSourceDtoCopyWith<$Res>? get source;
  @override
  $SplashAssetParamsDtoCopyWith<$Res>? get params;
  @override
  $SplashOutputsArtifactsDtoCopyWith<$Res>? get outputsArtifacts;
  @override
  $SplashIconConstraintsDtoCopyWith<$Res>? get iconConstraints;
}

/// @nodoc
class __$$SplashAssetDtoImplCopyWithImpl<$Res>
    extends _$SplashAssetDtoCopyWithImpl<$Res, _$SplashAssetDtoImpl>
    implements _$$SplashAssetDtoImplCopyWith<$Res> {
  __$$SplashAssetDtoImplCopyWithImpl(
      _$SplashAssetDtoImpl _value, $Res Function(_$SplashAssetDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? source = freezed,
    Object? params = freezed,
    Object? mode = freezed,
    Object? outputsArtifacts = freezed,
    Object? splashArtifactId = freezed,
    Object? iconConstraints = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? urls = freezed,
  }) {
    return _then(_$SplashAssetDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SplashSourceDto?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as SplashAssetParamsDto?,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplashModeDto?,
      outputsArtifacts: freezed == outputsArtifacts
          ? _value.outputsArtifacts
          : outputsArtifacts // ignore: cast_nullable_to_non_nullable
              as SplashOutputsArtifactsDto?,
      splashArtifactId: freezed == splashArtifactId
          ? _value.splashArtifactId
          : splashArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      iconConstraints: freezed == iconConstraints
          ? _value.iconConstraints
          : iconConstraints // ignore: cast_nullable_to_non_nullable
              as SplashIconConstraintsDto?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SplashAssetDtoImpl extends _SplashAssetDto {
  const _$SplashAssetDtoImpl(
      {required this.id,
      required this.applicationId,
      required this.themeId,
      this.source,
      this.params,
      this.mode,
      this.outputsArtifacts,
      this.splashArtifactId,
      this.iconConstraints,
      this.createdAt,
      this.updatedAt,
      this.urls})
      : super._();

  factory _$SplashAssetDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashAssetDtoImplFromJson(json);

  @override
  final String id;
// themeId
  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final SplashSourceDto? source;
  @override
  final SplashAssetParamsDto? params;
  @override
  final SplashModeDto? mode;
  @override
  final SplashOutputsArtifactsDto? outputsArtifacts;
  @override
  final String? splashArtifactId;
  @override
  final SplashIconConstraintsDto? iconConstraints;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final Map<String, String>? urls;

  @override
  String toString() {
    return 'SplashAssetDto(id: $id, applicationId: $applicationId, themeId: $themeId, source: $source, params: $params, mode: $mode, outputsArtifacts: $outputsArtifacts, splashArtifactId: $splashArtifactId, iconConstraints: $iconConstraints, createdAt: $createdAt, updatedAt: $updatedAt, urls: $urls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashAssetDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.params, params) || other.params == params) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.outputsArtifacts, outputsArtifacts) ||
                other.outputsArtifacts == outputsArtifacts) &&
            (identical(other.splashArtifactId, splashArtifactId) ||
                other.splashArtifactId == splashArtifactId) &&
            (identical(other.iconConstraints, iconConstraints) ||
                other.iconConstraints == iconConstraints) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.urls, urls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      applicationId,
      themeId,
      source,
      params,
      mode,
      outputsArtifacts,
      splashArtifactId,
      iconConstraints,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(urls));

  /// Create a copy of SplashAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashAssetDtoImplCopyWith<_$SplashAssetDtoImpl> get copyWith =>
      __$$SplashAssetDtoImplCopyWithImpl<_$SplashAssetDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashAssetDtoImplToJson(
      this,
    );
  }
}

abstract class _SplashAssetDto extends SplashAssetDto {
  const factory _SplashAssetDto(
      {required final String id,
      required final String applicationId,
      required final String themeId,
      final SplashSourceDto? source,
      final SplashAssetParamsDto? params,
      final SplashModeDto? mode,
      final SplashOutputsArtifactsDto? outputsArtifacts,
      final String? splashArtifactId,
      final SplashIconConstraintsDto? iconConstraints,
      final String? createdAt,
      final String? updatedAt,
      final Map<String, String>? urls}) = _$SplashAssetDtoImpl;
  const _SplashAssetDto._() : super._();

  factory _SplashAssetDto.fromJson(Map<String, dynamic> json) =
      _$SplashAssetDtoImpl.fromJson;

  @override
  String get id; // themeId
  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  SplashSourceDto? get source;
  @override
  SplashAssetParamsDto? get params;
  @override
  SplashModeDto? get mode;
  @override
  SplashOutputsArtifactsDto? get outputsArtifacts;
  @override
  String? get splashArtifactId;
  @override
  SplashIconConstraintsDto? get iconConstraints;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  Map<String, String>? get urls;

  /// Create a copy of SplashAssetDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashAssetDtoImplCopyWith<_$SplashAssetDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SplashConstraintsDefaultsSliceDto _$SplashConstraintsDefaultsSliceDtoFromJson(
    Map<String, dynamic> json) {
  return _SplashConstraintsDefaultsSliceDto.fromJson(json);
}

/// @nodoc
mixin _$SplashConstraintsDefaultsSliceDto {
  double get fullSizeDp => throw _privateConstructorUsedError;
  double get maskDiameterDp => throw _privateConstructorUsedError;
  double get toleranceDp => throw _privateConstructorUsedError;

  /// Serializes this SplashConstraintsDefaultsSliceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashConstraintsDefaultsSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashConstraintsDefaultsSliceDtoCopyWith<SplashConstraintsDefaultsSliceDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> {
  factory $SplashConstraintsDefaultsSliceDtoCopyWith(
          SplashConstraintsDefaultsSliceDto value,
          $Res Function(SplashConstraintsDefaultsSliceDto) then) =
      _$SplashConstraintsDefaultsSliceDtoCopyWithImpl<$Res,
          SplashConstraintsDefaultsSliceDto>;
  @useResult
  $Res call({double fullSizeDp, double maskDiameterDp, double toleranceDp});
}

/// @nodoc
class _$SplashConstraintsDefaultsSliceDtoCopyWithImpl<$Res,
        $Val extends SplashConstraintsDefaultsSliceDto>
    implements $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> {
  _$SplashConstraintsDefaultsSliceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashConstraintsDefaultsSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullSizeDp = null,
    Object? maskDiameterDp = null,
    Object? toleranceDp = null,
  }) {
    return _then(_value.copyWith(
      fullSizeDp: null == fullSizeDp
          ? _value.fullSizeDp
          : fullSizeDp // ignore: cast_nullable_to_non_nullable
              as double,
      maskDiameterDp: null == maskDiameterDp
          ? _value.maskDiameterDp
          : maskDiameterDp // ignore: cast_nullable_to_non_nullable
              as double,
      toleranceDp: null == toleranceDp
          ? _value.toleranceDp
          : toleranceDp // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashConstraintsDefaultsSliceDtoImplCopyWith<$Res>
    implements $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> {
  factory _$$SplashConstraintsDefaultsSliceDtoImplCopyWith(
          _$SplashConstraintsDefaultsSliceDtoImpl value,
          $Res Function(_$SplashConstraintsDefaultsSliceDtoImpl) then) =
      __$$SplashConstraintsDefaultsSliceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double fullSizeDp, double maskDiameterDp, double toleranceDp});
}

/// @nodoc
class __$$SplashConstraintsDefaultsSliceDtoImplCopyWithImpl<$Res>
    extends _$SplashConstraintsDefaultsSliceDtoCopyWithImpl<$Res,
        _$SplashConstraintsDefaultsSliceDtoImpl>
    implements _$$SplashConstraintsDefaultsSliceDtoImplCopyWith<$Res> {
  __$$SplashConstraintsDefaultsSliceDtoImplCopyWithImpl(
      _$SplashConstraintsDefaultsSliceDtoImpl _value,
      $Res Function(_$SplashConstraintsDefaultsSliceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashConstraintsDefaultsSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullSizeDp = null,
    Object? maskDiameterDp = null,
    Object? toleranceDp = null,
  }) {
    return _then(_$SplashConstraintsDefaultsSliceDtoImpl(
      fullSizeDp: null == fullSizeDp
          ? _value.fullSizeDp
          : fullSizeDp // ignore: cast_nullable_to_non_nullable
              as double,
      maskDiameterDp: null == maskDiameterDp
          ? _value.maskDiameterDp
          : maskDiameterDp // ignore: cast_nullable_to_non_nullable
              as double,
      toleranceDp: null == toleranceDp
          ? _value.toleranceDp
          : toleranceDp // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashConstraintsDefaultsSliceDtoImpl
    implements _SplashConstraintsDefaultsSliceDto {
  const _$SplashConstraintsDefaultsSliceDtoImpl(
      {required this.fullSizeDp,
      required this.maskDiameterDp,
      required this.toleranceDp});

  factory _$SplashConstraintsDefaultsSliceDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SplashConstraintsDefaultsSliceDtoImplFromJson(json);

  @override
  final double fullSizeDp;
  @override
  final double maskDiameterDp;
  @override
  final double toleranceDp;

  @override
  String toString() {
    return 'SplashConstraintsDefaultsSliceDto(fullSizeDp: $fullSizeDp, maskDiameterDp: $maskDiameterDp, toleranceDp: $toleranceDp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashConstraintsDefaultsSliceDtoImpl &&
            (identical(other.fullSizeDp, fullSizeDp) ||
                other.fullSizeDp == fullSizeDp) &&
            (identical(other.maskDiameterDp, maskDiameterDp) ||
                other.maskDiameterDp == maskDiameterDp) &&
            (identical(other.toleranceDp, toleranceDp) ||
                other.toleranceDp == toleranceDp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fullSizeDp, maskDiameterDp, toleranceDp);

  /// Create a copy of SplashConstraintsDefaultsSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashConstraintsDefaultsSliceDtoImplCopyWith<
          _$SplashConstraintsDefaultsSliceDtoImpl>
      get copyWith => __$$SplashConstraintsDefaultsSliceDtoImplCopyWithImpl<
          _$SplashConstraintsDefaultsSliceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashConstraintsDefaultsSliceDtoImplToJson(
      this,
    );
  }
}

abstract class _SplashConstraintsDefaultsSliceDto
    implements SplashConstraintsDefaultsSliceDto {
  const factory _SplashConstraintsDefaultsSliceDto(
          {required final double fullSizeDp,
          required final double maskDiameterDp,
          required final double toleranceDp}) =
      _$SplashConstraintsDefaultsSliceDtoImpl;

  factory _SplashConstraintsDefaultsSliceDto.fromJson(
          Map<String, dynamic> json) =
      _$SplashConstraintsDefaultsSliceDtoImpl.fromJson;

  @override
  double get fullSizeDp;
  @override
  double get maskDiameterDp;
  @override
  double get toleranceDp;

  /// Create a copy of SplashConstraintsDefaultsSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashConstraintsDefaultsSliceDtoImplCopyWith<
          _$SplashConstraintsDefaultsSliceDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SplashConstraintsDefaultsDto _$SplashConstraintsDefaultsDtoFromJson(
    Map<String, dynamic> json) {
  return _SplashConstraintsDefaultsDto.fromJson(json);
}

/// @nodoc
mixin _$SplashConstraintsDefaultsDto {
  SplashConstraintsDefaultsSliceDto get withBackground =>
      throw _privateConstructorUsedError;
  SplashConstraintsDefaultsSliceDto get withoutBackground =>
      throw _privateConstructorUsedError;

  /// Serializes this SplashConstraintsDefaultsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashConstraintsDefaultsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashConstraintsDefaultsDtoCopyWith<SplashConstraintsDefaultsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashConstraintsDefaultsDtoCopyWith<$Res> {
  factory $SplashConstraintsDefaultsDtoCopyWith(
          SplashConstraintsDefaultsDto value,
          $Res Function(SplashConstraintsDefaultsDto) then) =
      _$SplashConstraintsDefaultsDtoCopyWithImpl<$Res,
          SplashConstraintsDefaultsDto>;
  @useResult
  $Res call(
      {SplashConstraintsDefaultsSliceDto withBackground,
      SplashConstraintsDefaultsSliceDto withoutBackground});

  $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withBackground;
  $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withoutBackground;
}

/// @nodoc
class _$SplashConstraintsDefaultsDtoCopyWithImpl<$Res,
        $Val extends SplashConstraintsDefaultsDto>
    implements $SplashConstraintsDefaultsDtoCopyWith<$Res> {
  _$SplashConstraintsDefaultsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashConstraintsDefaultsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withBackground = null,
    Object? withoutBackground = null,
  }) {
    return _then(_value.copyWith(
      withBackground: null == withBackground
          ? _value.withBackground
          : withBackground // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsDefaultsSliceDto,
      withoutBackground: null == withoutBackground
          ? _value.withoutBackground
          : withoutBackground // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsDefaultsSliceDto,
    ) as $Val);
  }

  /// Create a copy of SplashConstraintsDefaultsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withBackground {
    return $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>(
        _value.withBackground, (value) {
      return _then(_value.copyWith(withBackground: value) as $Val);
    });
  }

  /// Create a copy of SplashConstraintsDefaultsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withoutBackground {
    return $SplashConstraintsDefaultsSliceDtoCopyWith<$Res>(
        _value.withoutBackground, (value) {
      return _then(_value.copyWith(withoutBackground: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SplashConstraintsDefaultsDtoImplCopyWith<$Res>
    implements $SplashConstraintsDefaultsDtoCopyWith<$Res> {
  factory _$$SplashConstraintsDefaultsDtoImplCopyWith(
          _$SplashConstraintsDefaultsDtoImpl value,
          $Res Function(_$SplashConstraintsDefaultsDtoImpl) then) =
      __$$SplashConstraintsDefaultsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SplashConstraintsDefaultsSliceDto withBackground,
      SplashConstraintsDefaultsSliceDto withoutBackground});

  @override
  $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withBackground;
  @override
  $SplashConstraintsDefaultsSliceDtoCopyWith<$Res> get withoutBackground;
}

/// @nodoc
class __$$SplashConstraintsDefaultsDtoImplCopyWithImpl<$Res>
    extends _$SplashConstraintsDefaultsDtoCopyWithImpl<$Res,
        _$SplashConstraintsDefaultsDtoImpl>
    implements _$$SplashConstraintsDefaultsDtoImplCopyWith<$Res> {
  __$$SplashConstraintsDefaultsDtoImplCopyWithImpl(
      _$SplashConstraintsDefaultsDtoImpl _value,
      $Res Function(_$SplashConstraintsDefaultsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashConstraintsDefaultsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withBackground = null,
    Object? withoutBackground = null,
  }) {
    return _then(_$SplashConstraintsDefaultsDtoImpl(
      withBackground: null == withBackground
          ? _value.withBackground
          : withBackground // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsDefaultsSliceDto,
      withoutBackground: null == withoutBackground
          ? _value.withoutBackground
          : withoutBackground // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsDefaultsSliceDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashConstraintsDefaultsDtoImpl
    implements _SplashConstraintsDefaultsDto {
  const _$SplashConstraintsDefaultsDtoImpl(
      {required this.withBackground, required this.withoutBackground});

  factory _$SplashConstraintsDefaultsDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SplashConstraintsDefaultsDtoImplFromJson(json);

  @override
  final SplashConstraintsDefaultsSliceDto withBackground;
  @override
  final SplashConstraintsDefaultsSliceDto withoutBackground;

  @override
  String toString() {
    return 'SplashConstraintsDefaultsDto(withBackground: $withBackground, withoutBackground: $withoutBackground)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashConstraintsDefaultsDtoImpl &&
            (identical(other.withBackground, withBackground) ||
                other.withBackground == withBackground) &&
            (identical(other.withoutBackground, withoutBackground) ||
                other.withoutBackground == withoutBackground));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, withBackground, withoutBackground);

  /// Create a copy of SplashConstraintsDefaultsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashConstraintsDefaultsDtoImplCopyWith<
          _$SplashConstraintsDefaultsDtoImpl>
      get copyWith => __$$SplashConstraintsDefaultsDtoImplCopyWithImpl<
          _$SplashConstraintsDefaultsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashConstraintsDefaultsDtoImplToJson(
      this,
    );
  }
}

abstract class _SplashConstraintsDefaultsDto
    implements SplashConstraintsDefaultsDto {
  const factory _SplashConstraintsDefaultsDto(
          {required final SplashConstraintsDefaultsSliceDto withBackground,
          required final SplashConstraintsDefaultsSliceDto withoutBackground}) =
      _$SplashConstraintsDefaultsDtoImpl;

  factory _SplashConstraintsDefaultsDto.fromJson(Map<String, dynamic> json) =
      _$SplashConstraintsDefaultsDtoImpl.fromJson;

  @override
  SplashConstraintsDefaultsSliceDto get withBackground;
  @override
  SplashConstraintsDefaultsSliceDto get withoutBackground;

  /// Create a copy of SplashConstraintsDefaultsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashConstraintsDefaultsDtoImplCopyWith<
          _$SplashConstraintsDefaultsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SplashOutputsArtifactsDto _$SplashOutputsArtifactsDtoFromJson(
    Map<String, dynamic> json) {
  return _SplashOutputsArtifactsDto.fromJson(json);
}

/// @nodoc
mixin _$SplashOutputsArtifactsDto {
  String? get splashArtifactId => throw _privateConstructorUsedError;

  /// Serializes this SplashOutputsArtifactsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashOutputsArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashOutputsArtifactsDtoCopyWith<SplashOutputsArtifactsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashOutputsArtifactsDtoCopyWith<$Res> {
  factory $SplashOutputsArtifactsDtoCopyWith(SplashOutputsArtifactsDto value,
          $Res Function(SplashOutputsArtifactsDto) then) =
      _$SplashOutputsArtifactsDtoCopyWithImpl<$Res, SplashOutputsArtifactsDto>;
  @useResult
  $Res call({String? splashArtifactId});
}

/// @nodoc
class _$SplashOutputsArtifactsDtoCopyWithImpl<$Res,
        $Val extends SplashOutputsArtifactsDto>
    implements $SplashOutputsArtifactsDtoCopyWith<$Res> {
  _$SplashOutputsArtifactsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashOutputsArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splashArtifactId = freezed,
  }) {
    return _then(_value.copyWith(
      splashArtifactId: freezed == splashArtifactId
          ? _value.splashArtifactId
          : splashArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashOutputsArtifactsDtoImplCopyWith<$Res>
    implements $SplashOutputsArtifactsDtoCopyWith<$Res> {
  factory _$$SplashOutputsArtifactsDtoImplCopyWith(
          _$SplashOutputsArtifactsDtoImpl value,
          $Res Function(_$SplashOutputsArtifactsDtoImpl) then) =
      __$$SplashOutputsArtifactsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? splashArtifactId});
}

/// @nodoc
class __$$SplashOutputsArtifactsDtoImplCopyWithImpl<$Res>
    extends _$SplashOutputsArtifactsDtoCopyWithImpl<$Res,
        _$SplashOutputsArtifactsDtoImpl>
    implements _$$SplashOutputsArtifactsDtoImplCopyWith<$Res> {
  __$$SplashOutputsArtifactsDtoImplCopyWithImpl(
      _$SplashOutputsArtifactsDtoImpl _value,
      $Res Function(_$SplashOutputsArtifactsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashOutputsArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splashArtifactId = freezed,
  }) {
    return _then(_$SplashOutputsArtifactsDtoImpl(
      splashArtifactId: freezed == splashArtifactId
          ? _value.splashArtifactId
          : splashArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashOutputsArtifactsDtoImpl implements _SplashOutputsArtifactsDto {
  const _$SplashOutputsArtifactsDtoImpl({this.splashArtifactId});

  factory _$SplashOutputsArtifactsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashOutputsArtifactsDtoImplFromJson(json);

  @override
  final String? splashArtifactId;

  @override
  String toString() {
    return 'SplashOutputsArtifactsDto(splashArtifactId: $splashArtifactId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashOutputsArtifactsDtoImpl &&
            (identical(other.splashArtifactId, splashArtifactId) ||
                other.splashArtifactId == splashArtifactId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, splashArtifactId);

  /// Create a copy of SplashOutputsArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashOutputsArtifactsDtoImplCopyWith<_$SplashOutputsArtifactsDtoImpl>
      get copyWith => __$$SplashOutputsArtifactsDtoImplCopyWithImpl<
          _$SplashOutputsArtifactsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashOutputsArtifactsDtoImplToJson(
      this,
    );
  }
}

abstract class _SplashOutputsArtifactsDto implements SplashOutputsArtifactsDto {
  const factory _SplashOutputsArtifactsDto({final String? splashArtifactId}) =
      _$SplashOutputsArtifactsDtoImpl;

  factory _SplashOutputsArtifactsDto.fromJson(Map<String, dynamic> json) =
      _$SplashOutputsArtifactsDtoImpl.fromJson;

  @override
  String? get splashArtifactId;

  /// Create a copy of SplashOutputsArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashOutputsArtifactsDtoImplCopyWith<_$SplashOutputsArtifactsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
