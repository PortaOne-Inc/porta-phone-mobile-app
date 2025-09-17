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

SplashSource _$SplashSourceFromJson(Map<String, dynamic> json) {
  return _SplashSource.fromJson(json);
}

/// @nodoc
mixin _$SplashSource {
  String? get foregroundAssetId => throw _privateConstructorUsedError;
  String? get backgroundAssetId => throw _privateConstructorUsedError;
  String? get backgroundColorHex => throw _privateConstructorUsedError;

  /// Serializes this SplashSource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashSourceCopyWith<SplashSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashSourceCopyWith<$Res> {
  factory $SplashSourceCopyWith(
          SplashSource value, $Res Function(SplashSource) then) =
      _$SplashSourceCopyWithImpl<$Res, SplashSource>;
  @useResult
  $Res call(
      {String? foregroundAssetId,
      String? backgroundAssetId,
      String? backgroundColorHex});
}

/// @nodoc
class _$SplashSourceCopyWithImpl<$Res, $Val extends SplashSource>
    implements $SplashSourceCopyWith<$Res> {
  _$SplashSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashSource
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
abstract class _$$SplashSourceImplCopyWith<$Res>
    implements $SplashSourceCopyWith<$Res> {
  factory _$$SplashSourceImplCopyWith(
          _$SplashSourceImpl value, $Res Function(_$SplashSourceImpl) then) =
      __$$SplashSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? foregroundAssetId,
      String? backgroundAssetId,
      String? backgroundColorHex});
}

/// @nodoc
class __$$SplashSourceImplCopyWithImpl<$Res>
    extends _$SplashSourceCopyWithImpl<$Res, _$SplashSourceImpl>
    implements _$$SplashSourceImplCopyWith<$Res> {
  __$$SplashSourceImplCopyWithImpl(
      _$SplashSourceImpl _value, $Res Function(_$SplashSourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foregroundAssetId = freezed,
    Object? backgroundAssetId = freezed,
    Object? backgroundColorHex = freezed,
  }) {
    return _then(_$SplashSourceImpl(
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
class _$SplashSourceImpl implements _SplashSource {
  const _$SplashSourceImpl(
      {this.foregroundAssetId,
      this.backgroundAssetId,
      this.backgroundColorHex});

  factory _$SplashSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashSourceImplFromJson(json);

  @override
  final String? foregroundAssetId;
  @override
  final String? backgroundAssetId;
  @override
  final String? backgroundColorHex;

  @override
  String toString() {
    return 'SplashSource(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashSourceImpl &&
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

  /// Create a copy of SplashSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashSourceImplCopyWith<_$SplashSourceImpl> get copyWith =>
      __$$SplashSourceImplCopyWithImpl<_$SplashSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashSourceImplToJson(
      this,
    );
  }
}

abstract class _SplashSource implements SplashSource {
  const factory _SplashSource(
      {final String? foregroundAssetId,
      final String? backgroundAssetId,
      final String? backgroundColorHex}) = _$SplashSourceImpl;

  factory _SplashSource.fromJson(Map<String, dynamic> json) =
      _$SplashSourceImpl.fromJson;

  @override
  String? get foregroundAssetId;
  @override
  String? get backgroundAssetId;
  @override
  String? get backgroundColorHex;

  /// Create a copy of SplashSource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashSourceImplCopyWith<_$SplashSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SplashAssetParams _$SplashAssetParamsFromJson(Map<String, dynamic> json) {
  return _SplashAssetParams.fromJson(json);
}

/// @nodoc
mixin _$SplashAssetParams {
  FitModel? get fit => throw _privateConstructorUsedError;
  double? get padding => throw _privateConstructorUsedError;

  /// Serializes this SplashAssetParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashAssetParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashAssetParamsCopyWith<SplashAssetParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashAssetParamsCopyWith<$Res> {
  factory $SplashAssetParamsCopyWith(
          SplashAssetParams value, $Res Function(SplashAssetParams) then) =
      _$SplashAssetParamsCopyWithImpl<$Res, SplashAssetParams>;
  @useResult
  $Res call({FitModel? fit, double? padding});
}

/// @nodoc
class _$SplashAssetParamsCopyWithImpl<$Res, $Val extends SplashAssetParams>
    implements $SplashAssetParamsCopyWith<$Res> {
  _$SplashAssetParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashAssetParams
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
              as FitModel?,
      padding: freezed == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashAssetParamsImplCopyWith<$Res>
    implements $SplashAssetParamsCopyWith<$Res> {
  factory _$$SplashAssetParamsImplCopyWith(_$SplashAssetParamsImpl value,
          $Res Function(_$SplashAssetParamsImpl) then) =
      __$$SplashAssetParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FitModel? fit, double? padding});
}

/// @nodoc
class __$$SplashAssetParamsImplCopyWithImpl<$Res>
    extends _$SplashAssetParamsCopyWithImpl<$Res, _$SplashAssetParamsImpl>
    implements _$$SplashAssetParamsImplCopyWith<$Res> {
  __$$SplashAssetParamsImplCopyWithImpl(_$SplashAssetParamsImpl _value,
      $Res Function(_$SplashAssetParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashAssetParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fit = freezed,
    Object? padding = freezed,
  }) {
    return _then(_$SplashAssetParamsImpl(
      fit: freezed == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as FitModel?,
      padding: freezed == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashAssetParamsImpl implements _SplashAssetParams {
  const _$SplashAssetParamsImpl({this.fit, this.padding});

  factory _$SplashAssetParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashAssetParamsImplFromJson(json);

  @override
  final FitModel? fit;
  @override
  final double? padding;

  @override
  String toString() {
    return 'SplashAssetParams(fit: $fit, padding: $padding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashAssetParamsImpl &&
            (identical(other.fit, fit) || other.fit == fit) &&
            (identical(other.padding, padding) || other.padding == padding));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fit, padding);

  /// Create a copy of SplashAssetParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashAssetParamsImplCopyWith<_$SplashAssetParamsImpl> get copyWith =>
      __$$SplashAssetParamsImplCopyWithImpl<_$SplashAssetParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashAssetParamsImplToJson(
      this,
    );
  }
}

abstract class _SplashAssetParams implements SplashAssetParams {
  const factory _SplashAssetParams(
      {final FitModel? fit, final double? padding}) = _$SplashAssetParamsImpl;

  factory _SplashAssetParams.fromJson(Map<String, dynamic> json) =
      _$SplashAssetParamsImpl.fromJson;

  @override
  FitModel? get fit;
  @override
  double? get padding;

  /// Create a copy of SplashAssetParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashAssetParamsImplCopyWith<_$SplashAssetParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SplashConstraintsValidation _$SplashConstraintsValidationFromJson(
    Map<String, dynamic> json) {
  return _SplashConstraintsValidation.fromJson(json);
}

/// @nodoc
mixin _$SplashConstraintsValidation {
  bool get compliant => throw _privateConstructorUsedError;
  double get delta => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  double? get tolerance => throw _privateConstructorUsedError;

  /// Serializes this SplashConstraintsValidation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashConstraintsValidation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashConstraintsValidationCopyWith<SplashConstraintsValidation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashConstraintsValidationCopyWith<$Res> {
  factory $SplashConstraintsValidationCopyWith(
          SplashConstraintsValidation value,
          $Res Function(SplashConstraintsValidation) then) =
      _$SplashConstraintsValidationCopyWithImpl<$Res,
          SplashConstraintsValidation>;
  @useResult
  $Res call({bool compliant, double delta, String message, double? tolerance});
}

/// @nodoc
class _$SplashConstraintsValidationCopyWithImpl<$Res,
        $Val extends SplashConstraintsValidation>
    implements $SplashConstraintsValidationCopyWith<$Res> {
  _$SplashConstraintsValidationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashConstraintsValidation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compliant = null,
    Object? delta = null,
    Object? message = null,
    Object? tolerance = freezed,
  }) {
    return _then(_value.copyWith(
      compliant: null == compliant
          ? _value.compliant
          : compliant // ignore: cast_nullable_to_non_nullable
              as bool,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tolerance: freezed == tolerance
          ? _value.tolerance
          : tolerance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashConstraintsValidationImplCopyWith<$Res>
    implements $SplashConstraintsValidationCopyWith<$Res> {
  factory _$$SplashConstraintsValidationImplCopyWith(
          _$SplashConstraintsValidationImpl value,
          $Res Function(_$SplashConstraintsValidationImpl) then) =
      __$$SplashConstraintsValidationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool compliant, double delta, String message, double? tolerance});
}

/// @nodoc
class __$$SplashConstraintsValidationImplCopyWithImpl<$Res>
    extends _$SplashConstraintsValidationCopyWithImpl<$Res,
        _$SplashConstraintsValidationImpl>
    implements _$$SplashConstraintsValidationImplCopyWith<$Res> {
  __$$SplashConstraintsValidationImplCopyWithImpl(
      _$SplashConstraintsValidationImpl _value,
      $Res Function(_$SplashConstraintsValidationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashConstraintsValidation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compliant = null,
    Object? delta = null,
    Object? message = null,
    Object? tolerance = freezed,
  }) {
    return _then(_$SplashConstraintsValidationImpl(
      compliant: null == compliant
          ? _value.compliant
          : compliant // ignore: cast_nullable_to_non_nullable
              as bool,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tolerance: freezed == tolerance
          ? _value.tolerance
          : tolerance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashConstraintsValidationImpl
    implements _SplashConstraintsValidation {
  const _$SplashConstraintsValidationImpl(
      {required this.compliant,
      required this.delta,
      required this.message,
      this.tolerance});

  factory _$SplashConstraintsValidationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SplashConstraintsValidationImplFromJson(json);

  @override
  final bool compliant;
  @override
  final double delta;
  @override
  final String message;
  @override
  final double? tolerance;

  @override
  String toString() {
    return 'SplashConstraintsValidation(compliant: $compliant, delta: $delta, message: $message, tolerance: $tolerance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashConstraintsValidationImpl &&
            (identical(other.compliant, compliant) ||
                other.compliant == compliant) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.tolerance, tolerance) ||
                other.tolerance == tolerance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, compliant, delta, message, tolerance);

  /// Create a copy of SplashConstraintsValidation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashConstraintsValidationImplCopyWith<_$SplashConstraintsValidationImpl>
      get copyWith => __$$SplashConstraintsValidationImplCopyWithImpl<
          _$SplashConstraintsValidationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashConstraintsValidationImplToJson(
      this,
    );
  }
}

abstract class _SplashConstraintsValidation
    implements SplashConstraintsValidation {
  const factory _SplashConstraintsValidation(
      {required final bool compliant,
      required final double delta,
      required final String message,
      final double? tolerance}) = _$SplashConstraintsValidationImpl;

  factory _SplashConstraintsValidation.fromJson(Map<String, dynamic> json) =
      _$SplashConstraintsValidationImpl.fromJson;

  @override
  bool get compliant;
  @override
  double get delta;
  @override
  String get message;
  @override
  double? get tolerance;

  /// Create a copy of SplashConstraintsValidation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashConstraintsValidationImplCopyWith<_$SplashConstraintsValidationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SplashIconConstraints _$SplashIconConstraintsFromJson(
    Map<String, dynamic> json) {
  return _SplashIconConstraints.fromJson(json);
}

/// @nodoc
mixin _$SplashIconConstraints {
  double get fullSize => throw _privateConstructorUsedError;
  double get maskDiameter => throw _privateConstructorUsedError;
  double get recommendedPadding => throw _privateConstructorUsedError;
  SplashConstraintsValidation get validation =>
      throw _privateConstructorUsedError;
  SplashMode? get mode => throw _privateConstructorUsedError;
  String? get recommendationBasis => throw _privateConstructorUsedError;

  /// Serializes this SplashIconConstraints to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SplashIconConstraints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplashIconConstraintsCopyWith<SplashIconConstraints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashIconConstraintsCopyWith<$Res> {
  factory $SplashIconConstraintsCopyWith(SplashIconConstraints value,
          $Res Function(SplashIconConstraints) then) =
      _$SplashIconConstraintsCopyWithImpl<$Res, SplashIconConstraints>;
  @useResult
  $Res call(
      {double fullSize,
      double maskDiameter,
      double recommendedPadding,
      SplashConstraintsValidation validation,
      SplashMode? mode,
      String? recommendationBasis});

  $SplashConstraintsValidationCopyWith<$Res> get validation;
}

/// @nodoc
class _$SplashIconConstraintsCopyWithImpl<$Res,
        $Val extends SplashIconConstraints>
    implements $SplashIconConstraintsCopyWith<$Res> {
  _$SplashIconConstraintsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashIconConstraints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullSize = null,
    Object? maskDiameter = null,
    Object? recommendedPadding = null,
    Object? validation = null,
    Object? mode = freezed,
    Object? recommendationBasis = freezed,
  }) {
    return _then(_value.copyWith(
      fullSize: null == fullSize
          ? _value.fullSize
          : fullSize // ignore: cast_nullable_to_non_nullable
              as double,
      maskDiameter: null == maskDiameter
          ? _value.maskDiameter
          : maskDiameter // ignore: cast_nullable_to_non_nullable
              as double,
      recommendedPadding: null == recommendedPadding
          ? _value.recommendedPadding
          : recommendedPadding // ignore: cast_nullable_to_non_nullable
              as double,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsValidation,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplashMode?,
      recommendationBasis: freezed == recommendationBasis
          ? _value.recommendationBasis
          : recommendationBasis // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SplashIconConstraints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashConstraintsValidationCopyWith<$Res> get validation {
    return $SplashConstraintsValidationCopyWith<$Res>(_value.validation,
        (value) {
      return _then(_value.copyWith(validation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SplashIconConstraintsImplCopyWith<$Res>
    implements $SplashIconConstraintsCopyWith<$Res> {
  factory _$$SplashIconConstraintsImplCopyWith(
          _$SplashIconConstraintsImpl value,
          $Res Function(_$SplashIconConstraintsImpl) then) =
      __$$SplashIconConstraintsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double fullSize,
      double maskDiameter,
      double recommendedPadding,
      SplashConstraintsValidation validation,
      SplashMode? mode,
      String? recommendationBasis});

  @override
  $SplashConstraintsValidationCopyWith<$Res> get validation;
}

/// @nodoc
class __$$SplashIconConstraintsImplCopyWithImpl<$Res>
    extends _$SplashIconConstraintsCopyWithImpl<$Res,
        _$SplashIconConstraintsImpl>
    implements _$$SplashIconConstraintsImplCopyWith<$Res> {
  __$$SplashIconConstraintsImplCopyWithImpl(_$SplashIconConstraintsImpl _value,
      $Res Function(_$SplashIconConstraintsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashIconConstraints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullSize = null,
    Object? maskDiameter = null,
    Object? recommendedPadding = null,
    Object? validation = null,
    Object? mode = freezed,
    Object? recommendationBasis = freezed,
  }) {
    return _then(_$SplashIconConstraintsImpl(
      fullSize: null == fullSize
          ? _value.fullSize
          : fullSize // ignore: cast_nullable_to_non_nullable
              as double,
      maskDiameter: null == maskDiameter
          ? _value.maskDiameter
          : maskDiameter // ignore: cast_nullable_to_non_nullable
              as double,
      recommendedPadding: null == recommendedPadding
          ? _value.recommendedPadding
          : recommendedPadding // ignore: cast_nullable_to_non_nullable
              as double,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as SplashConstraintsValidation,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplashMode?,
      recommendationBasis: freezed == recommendationBasis
          ? _value.recommendationBasis
          : recommendationBasis // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashIconConstraintsImpl implements _SplashIconConstraints {
  const _$SplashIconConstraintsImpl(
      {required this.fullSize,
      required this.maskDiameter,
      required this.recommendedPadding,
      required this.validation,
      this.mode,
      this.recommendationBasis});

  factory _$SplashIconConstraintsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashIconConstraintsImplFromJson(json);

  @override
  final double fullSize;
  @override
  final double maskDiameter;
  @override
  final double recommendedPadding;
  @override
  final SplashConstraintsValidation validation;
  @override
  final SplashMode? mode;
  @override
  final String? recommendationBasis;

  @override
  String toString() {
    return 'SplashIconConstraints(fullSize: $fullSize, maskDiameter: $maskDiameter, recommendedPadding: $recommendedPadding, validation: $validation, mode: $mode, recommendationBasis: $recommendationBasis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashIconConstraintsImpl &&
            (identical(other.fullSize, fullSize) ||
                other.fullSize == fullSize) &&
            (identical(other.maskDiameter, maskDiameter) ||
                other.maskDiameter == maskDiameter) &&
            (identical(other.recommendedPadding, recommendedPadding) ||
                other.recommendedPadding == recommendedPadding) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.recommendationBasis, recommendationBasis) ||
                other.recommendationBasis == recommendationBasis));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullSize, maskDiameter,
      recommendedPadding, validation, mode, recommendationBasis);

  /// Create a copy of SplashIconConstraints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashIconConstraintsImplCopyWith<_$SplashIconConstraintsImpl>
      get copyWith => __$$SplashIconConstraintsImplCopyWithImpl<
          _$SplashIconConstraintsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashIconConstraintsImplToJson(
      this,
    );
  }
}

abstract class _SplashIconConstraints implements SplashIconConstraints {
  const factory _SplashIconConstraints(
      {required final double fullSize,
      required final double maskDiameter,
      required final double recommendedPadding,
      required final SplashConstraintsValidation validation,
      final SplashMode? mode,
      final String? recommendationBasis}) = _$SplashIconConstraintsImpl;

  factory _SplashIconConstraints.fromJson(Map<String, dynamic> json) =
      _$SplashIconConstraintsImpl.fromJson;

  @override
  double get fullSize;
  @override
  double get maskDiameter;
  @override
  double get recommendedPadding;
  @override
  SplashConstraintsValidation get validation;
  @override
  SplashMode? get mode;
  @override
  String? get recommendationBasis;

  /// Create a copy of SplashIconConstraints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashIconConstraintsImplCopyWith<_$SplashIconConstraintsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SplashAssetModel _$SplashAssetModelFromJson(Map<String, dynamic> json) {
  return _SplashAssetModel.fromJson(json);
}

/// @nodoc
mixin _$SplashAssetModel {
  String get id => throw _privateConstructorUsedError;
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;

  /// ISO 8601 timestamps
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Source config (optional foreground/background/color)
  SplashSource? get source => throw _privateConstructorUsedError;

  /// Render parameters
  SplashAssetParams? get params => throw _privateConstructorUsedError;

  /// Mode (withBackground / withoutBackground)
  SplashMode? get mode => throw _privateConstructorUsedError;

  /// outputsArtifacts.splashArtifactId
  String? get splashArtifactId => throw _privateConstructorUsedError;

  /// Computed constraints & validation
  SplashIconConstraints? get iconConstraints =>
      throw _privateConstructorUsedError;

  /// Serializes this SplashAssetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

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
      {String id,
      String applicationId,
      String themeId,
      String createdAt,
      String updatedAt,
      SplashSource? source,
      SplashAssetParams? params,
      SplashMode? mode,
      String? splashArtifactId,
      SplashIconConstraints? iconConstraints});

  $SplashSourceCopyWith<$Res>? get source;
  $SplashAssetParamsCopyWith<$Res>? get params;
  $SplashIconConstraintsCopyWith<$Res>? get iconConstraints;
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
    Object? id = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? source = freezed,
    Object? params = freezed,
    Object? mode = freezed,
    Object? splashArtifactId = freezed,
    Object? iconConstraints = freezed,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SplashSource?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as SplashAssetParams?,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplashMode?,
      splashArtifactId: freezed == splashArtifactId
          ? _value.splashArtifactId
          : splashArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      iconConstraints: freezed == iconConstraints
          ? _value.iconConstraints
          : iconConstraints // ignore: cast_nullable_to_non_nullable
              as SplashIconConstraints?,
    ) as $Val);
  }

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashSourceCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SplashSourceCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashAssetParamsCopyWith<$Res>? get params {
    if (_value.params == null) {
      return null;
    }

    return $SplashAssetParamsCopyWith<$Res>(_value.params!, (value) {
      return _then(_value.copyWith(params: value) as $Val);
    });
  }

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SplashIconConstraintsCopyWith<$Res>? get iconConstraints {
    if (_value.iconConstraints == null) {
      return null;
    }

    return $SplashIconConstraintsCopyWith<$Res>(_value.iconConstraints!,
        (value) {
      return _then(_value.copyWith(iconConstraints: value) as $Val);
    });
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
      {String id,
      String applicationId,
      String themeId,
      String createdAt,
      String updatedAt,
      SplashSource? source,
      SplashAssetParams? params,
      SplashMode? mode,
      String? splashArtifactId,
      SplashIconConstraints? iconConstraints});

  @override
  $SplashSourceCopyWith<$Res>? get source;
  @override
  $SplashAssetParamsCopyWith<$Res>? get params;
  @override
  $SplashIconConstraintsCopyWith<$Res>? get iconConstraints;
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
    Object? id = null,
    Object? applicationId = null,
    Object? themeId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? source = freezed,
    Object? params = freezed,
    Object? mode = freezed,
    Object? splashArtifactId = freezed,
    Object? iconConstraints = freezed,
  }) {
    return _then(_$SplashAssetModelImpl(
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SplashSource?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as SplashAssetParams?,
      mode: freezed == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SplashMode?,
      splashArtifactId: freezed == splashArtifactId
          ? _value.splashArtifactId
          : splashArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      iconConstraints: freezed == iconConstraints
          ? _value.iconConstraints
          : iconConstraints // ignore: cast_nullable_to_non_nullable
              as SplashIconConstraints?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SplashAssetModelImpl implements _SplashAssetModel {
  const _$SplashAssetModelImpl(
      {required this.id,
      required this.applicationId,
      required this.themeId,
      required this.createdAt,
      required this.updatedAt,
      this.source,
      this.params,
      this.mode,
      this.splashArtifactId,
      this.iconConstraints});

  factory _$SplashAssetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SplashAssetModelImplFromJson(json);

  @override
  final String id;
  @override
  final String applicationId;
  @override
  final String themeId;

  /// ISO 8601 timestamps
  @override
  final String createdAt;
  @override
  final String updatedAt;

  /// Source config (optional foreground/background/color)
  @override
  final SplashSource? source;

  /// Render parameters
  @override
  final SplashAssetParams? params;

  /// Mode (withBackground / withoutBackground)
  @override
  final SplashMode? mode;

  /// outputsArtifacts.splashArtifactId
  @override
  final String? splashArtifactId;

  /// Computed constraints & validation
  @override
  final SplashIconConstraints? iconConstraints;

  @override
  String toString() {
    return 'SplashAssetModel(id: $id, applicationId: $applicationId, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt, source: $source, params: $params, mode: $mode, splashArtifactId: $splashArtifactId, iconConstraints: $iconConstraints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashAssetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.params, params) || other.params == params) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.splashArtifactId, splashArtifactId) ||
                other.splashArtifactId == splashArtifactId) &&
            (identical(other.iconConstraints, iconConstraints) ||
                other.iconConstraints == iconConstraints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      applicationId,
      themeId,
      createdAt,
      updatedAt,
      source,
      params,
      mode,
      splashArtifactId,
      iconConstraints);

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashAssetModelImplCopyWith<_$SplashAssetModelImpl> get copyWith =>
      __$$SplashAssetModelImplCopyWithImpl<_$SplashAssetModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SplashAssetModelImplToJson(
      this,
    );
  }
}

abstract class _SplashAssetModel implements SplashAssetModel {
  const factory _SplashAssetModel(
      {required final String id,
      required final String applicationId,
      required final String themeId,
      required final String createdAt,
      required final String updatedAt,
      final SplashSource? source,
      final SplashAssetParams? params,
      final SplashMode? mode,
      final String? splashArtifactId,
      final SplashIconConstraints? iconConstraints}) = _$SplashAssetModelImpl;

  factory _SplashAssetModel.fromJson(Map<String, dynamic> json) =
      _$SplashAssetModelImpl.fromJson;

  @override
  String get id;
  @override
  String get applicationId;
  @override
  String get themeId;

  /// ISO 8601 timestamps
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Source config (optional foreground/background/color)
  @override
  SplashSource? get source;

  /// Render parameters
  @override
  SplashAssetParams? get params;

  /// Mode (withBackground / withoutBackground)
  @override
  SplashMode? get mode;

  /// outputsArtifacts.splashArtifactId
  @override
  String? get splashArtifactId;

  /// Computed constraints & validation
  @override
  SplashIconConstraints? get iconConstraints;

  /// Create a copy of SplashAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashAssetModelImplCopyWith<_$SplashAssetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
