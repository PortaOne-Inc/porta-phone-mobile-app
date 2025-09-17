// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_assets_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FitPaddingDto _$FitPaddingDtoFromJson(Map<String, dynamic> json) {
  return _FitPaddingDto.fromJson(json);
}

/// @nodoc
mixin _$FitPaddingDto {
  FitDto? get fit => throw _privateConstructorUsedError;
  double? get paddingDp => throw _privateConstructorUsedError;

  /// Serializes this FitPaddingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FitPaddingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FitPaddingDtoCopyWith<FitPaddingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FitPaddingDtoCopyWith<$Res> {
  factory $FitPaddingDtoCopyWith(
          FitPaddingDto value, $Res Function(FitPaddingDto) then) =
      _$FitPaddingDtoCopyWithImpl<$Res, FitPaddingDto>;
  @useResult
  $Res call({FitDto? fit, double? paddingDp});
}

/// @nodoc
class _$FitPaddingDtoCopyWithImpl<$Res, $Val extends FitPaddingDto>
    implements $FitPaddingDtoCopyWith<$Res> {
  _$FitPaddingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FitPaddingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fit = freezed,
    Object? paddingDp = freezed,
  }) {
    return _then(_value.copyWith(
      fit: freezed == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as FitDto?,
      paddingDp: freezed == paddingDp
          ? _value.paddingDp
          : paddingDp // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FitPaddingDtoImplCopyWith<$Res>
    implements $FitPaddingDtoCopyWith<$Res> {
  factory _$$FitPaddingDtoImplCopyWith(
          _$FitPaddingDtoImpl value, $Res Function(_$FitPaddingDtoImpl) then) =
      __$$FitPaddingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FitDto? fit, double? paddingDp});
}

/// @nodoc
class __$$FitPaddingDtoImplCopyWithImpl<$Res>
    extends _$FitPaddingDtoCopyWithImpl<$Res, _$FitPaddingDtoImpl>
    implements _$$FitPaddingDtoImplCopyWith<$Res> {
  __$$FitPaddingDtoImplCopyWithImpl(
      _$FitPaddingDtoImpl _value, $Res Function(_$FitPaddingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FitPaddingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fit = freezed,
    Object? paddingDp = freezed,
  }) {
    return _then(_$FitPaddingDtoImpl(
      fit: freezed == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as FitDto?,
      paddingDp: freezed == paddingDp
          ? _value.paddingDp
          : paddingDp // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FitPaddingDtoImpl implements _FitPaddingDto {
  const _$FitPaddingDtoImpl({this.fit, this.paddingDp});

  factory _$FitPaddingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FitPaddingDtoImplFromJson(json);

  @override
  final FitDto? fit;
  @override
  final double? paddingDp;

  @override
  String toString() {
    return 'FitPaddingDto(fit: $fit, paddingDp: $paddingDp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FitPaddingDtoImpl &&
            (identical(other.fit, fit) || other.fit == fit) &&
            (identical(other.paddingDp, paddingDp) ||
                other.paddingDp == paddingDp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fit, paddingDp);

  /// Create a copy of FitPaddingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FitPaddingDtoImplCopyWith<_$FitPaddingDtoImpl> get copyWith =>
      __$$FitPaddingDtoImplCopyWithImpl<_$FitPaddingDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FitPaddingDtoImplToJson(
      this,
    );
  }
}

abstract class _FitPaddingDto implements FitPaddingDto {
  const factory _FitPaddingDto({final FitDto? fit, final double? paddingDp}) =
      _$FitPaddingDtoImpl;

  factory _FitPaddingDto.fromJson(Map<String, dynamic> json) =
      _$FitPaddingDtoImpl.fromJson;

  @override
  FitDto? get fit;
  @override
  double? get paddingDp;

  /// Create a copy of FitPaddingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FitPaddingDtoImplCopyWith<_$FitPaddingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlatformParamsDto _$PlatformParamsDtoFromJson(Map<String, dynamic> json) {
  return _PlatformParamsDto.fromJson(json);
}

/// @nodoc
mixin _$PlatformParamsDto {
  FitPaddingDto? get androidLegacy => throw _privateConstructorUsedError;
  FitPaddingDto? get androidAdaptive => throw _privateConstructorUsedError;
  FitPaddingDto? get ios => throw _privateConstructorUsedError;
  FitPaddingDto? get web => throw _privateConstructorUsedError;

  /// Serializes this PlatformParamsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlatformParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformParamsDtoCopyWith<PlatformParamsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformParamsDtoCopyWith<$Res> {
  factory $PlatformParamsDtoCopyWith(
          PlatformParamsDto value, $Res Function(PlatformParamsDto) then) =
      _$PlatformParamsDtoCopyWithImpl<$Res, PlatformParamsDto>;
  @useResult
  $Res call(
      {FitPaddingDto? androidLegacy,
      FitPaddingDto? androidAdaptive,
      FitPaddingDto? ios,
      FitPaddingDto? web});

  $FitPaddingDtoCopyWith<$Res>? get androidLegacy;
  $FitPaddingDtoCopyWith<$Res>? get androidAdaptive;
  $FitPaddingDtoCopyWith<$Res>? get ios;
  $FitPaddingDtoCopyWith<$Res>? get web;
}

/// @nodoc
class _$PlatformParamsDtoCopyWithImpl<$Res, $Val extends PlatformParamsDto>
    implements $PlatformParamsDtoCopyWith<$Res> {
  _$PlatformParamsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidLegacy = freezed,
    Object? androidAdaptive = freezed,
    Object? ios = freezed,
    Object? web = freezed,
  }) {
    return _then(_value.copyWith(
      androidLegacy: freezed == androidLegacy
          ? _value.androidLegacy
          : androidLegacy // ignore: cast_nullable_to_non_nullable
              as FitPaddingDto?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as FitPaddingDto?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as FitPaddingDto?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as FitPaddingDto?,
    ) as $Val);
  }

  /// Create a copy of PlatformParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitPaddingDtoCopyWith<$Res>? get androidLegacy {
    if (_value.androidLegacy == null) {
      return null;
    }

    return $FitPaddingDtoCopyWith<$Res>(_value.androidLegacy!, (value) {
      return _then(_value.copyWith(androidLegacy: value) as $Val);
    });
  }

  /// Create a copy of PlatformParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitPaddingDtoCopyWith<$Res>? get androidAdaptive {
    if (_value.androidAdaptive == null) {
      return null;
    }

    return $FitPaddingDtoCopyWith<$Res>(_value.androidAdaptive!, (value) {
      return _then(_value.copyWith(androidAdaptive: value) as $Val);
    });
  }

  /// Create a copy of PlatformParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitPaddingDtoCopyWith<$Res>? get ios {
    if (_value.ios == null) {
      return null;
    }

    return $FitPaddingDtoCopyWith<$Res>(_value.ios!, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  /// Create a copy of PlatformParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitPaddingDtoCopyWith<$Res>? get web {
    if (_value.web == null) {
      return null;
    }

    return $FitPaddingDtoCopyWith<$Res>(_value.web!, (value) {
      return _then(_value.copyWith(web: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlatformParamsDtoImplCopyWith<$Res>
    implements $PlatformParamsDtoCopyWith<$Res> {
  factory _$$PlatformParamsDtoImplCopyWith(_$PlatformParamsDtoImpl value,
          $Res Function(_$PlatformParamsDtoImpl) then) =
      __$$PlatformParamsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FitPaddingDto? androidLegacy,
      FitPaddingDto? androidAdaptive,
      FitPaddingDto? ios,
      FitPaddingDto? web});

  @override
  $FitPaddingDtoCopyWith<$Res>? get androidLegacy;
  @override
  $FitPaddingDtoCopyWith<$Res>? get androidAdaptive;
  @override
  $FitPaddingDtoCopyWith<$Res>? get ios;
  @override
  $FitPaddingDtoCopyWith<$Res>? get web;
}

/// @nodoc
class __$$PlatformParamsDtoImplCopyWithImpl<$Res>
    extends _$PlatformParamsDtoCopyWithImpl<$Res, _$PlatformParamsDtoImpl>
    implements _$$PlatformParamsDtoImplCopyWith<$Res> {
  __$$PlatformParamsDtoImplCopyWithImpl(_$PlatformParamsDtoImpl _value,
      $Res Function(_$PlatformParamsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlatformParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidLegacy = freezed,
    Object? androidAdaptive = freezed,
    Object? ios = freezed,
    Object? web = freezed,
  }) {
    return _then(_$PlatformParamsDtoImpl(
      androidLegacy: freezed == androidLegacy
          ? _value.androidLegacy
          : androidLegacy // ignore: cast_nullable_to_non_nullable
              as FitPaddingDto?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as FitPaddingDto?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as FitPaddingDto?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as FitPaddingDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformParamsDtoImpl implements _PlatformParamsDto {
  const _$PlatformParamsDtoImpl(
      {this.androidLegacy, this.androidAdaptive, this.ios, this.web});

  factory _$PlatformParamsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlatformParamsDtoImplFromJson(json);

  @override
  final FitPaddingDto? androidLegacy;
  @override
  final FitPaddingDto? androidAdaptive;
  @override
  final FitPaddingDto? ios;
  @override
  final FitPaddingDto? web;

  @override
  String toString() {
    return 'PlatformParamsDto(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformParamsDtoImpl &&
            (identical(other.androidLegacy, androidLegacy) ||
                other.androidLegacy == androidLegacy) &&
            (identical(other.androidAdaptive, androidAdaptive) ||
                other.androidAdaptive == androidAdaptive) &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.web, web) || other.web == web));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, androidLegacy, androidAdaptive, ios, web);

  /// Create a copy of PlatformParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformParamsDtoImplCopyWith<_$PlatformParamsDtoImpl> get copyWith =>
      __$$PlatformParamsDtoImplCopyWithImpl<_$PlatformParamsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformParamsDtoImplToJson(
      this,
    );
  }
}

abstract class _PlatformParamsDto implements PlatformParamsDto {
  const factory _PlatformParamsDto(
      {final FitPaddingDto? androidLegacy,
      final FitPaddingDto? androidAdaptive,
      final FitPaddingDto? ios,
      final FitPaddingDto? web}) = _$PlatformParamsDtoImpl;

  factory _PlatformParamsDto.fromJson(Map<String, dynamic> json) =
      _$PlatformParamsDtoImpl.fromJson;

  @override
  FitPaddingDto? get androidLegacy;
  @override
  FitPaddingDto? get androidAdaptive;
  @override
  FitPaddingDto? get ios;
  @override
  FitPaddingDto? get web;

  /// Create a copy of PlatformParamsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformParamsDtoImplCopyWith<_$PlatformParamsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SourceConfigDto _$SourceConfigDtoFromJson(Map<String, dynamic> json) {
  return _SourceConfigDto.fromJson(json);
}

/// @nodoc
mixin _$SourceConfigDto {
  String? get foregroundAssetId => throw _privateConstructorUsedError;
  String? get backgroundAssetId => throw _privateConstructorUsedError;
  String? get backgroundColorHex => throw _privateConstructorUsedError;

  /// Serializes this SourceConfigDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SourceConfigDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourceConfigDtoCopyWith<SourceConfigDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceConfigDtoCopyWith<$Res> {
  factory $SourceConfigDtoCopyWith(
          SourceConfigDto value, $Res Function(SourceConfigDto) then) =
      _$SourceConfigDtoCopyWithImpl<$Res, SourceConfigDto>;
  @useResult
  $Res call(
      {String? foregroundAssetId,
      String? backgroundAssetId,
      String? backgroundColorHex});
}

/// @nodoc
class _$SourceConfigDtoCopyWithImpl<$Res, $Val extends SourceConfigDto>
    implements $SourceConfigDtoCopyWith<$Res> {
  _$SourceConfigDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SourceConfigDto
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
abstract class _$$SourceConfigDtoImplCopyWith<$Res>
    implements $SourceConfigDtoCopyWith<$Res> {
  factory _$$SourceConfigDtoImplCopyWith(_$SourceConfigDtoImpl value,
          $Res Function(_$SourceConfigDtoImpl) then) =
      __$$SourceConfigDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? foregroundAssetId,
      String? backgroundAssetId,
      String? backgroundColorHex});
}

/// @nodoc
class __$$SourceConfigDtoImplCopyWithImpl<$Res>
    extends _$SourceConfigDtoCopyWithImpl<$Res, _$SourceConfigDtoImpl>
    implements _$$SourceConfigDtoImplCopyWith<$Res> {
  __$$SourceConfigDtoImplCopyWithImpl(
      _$SourceConfigDtoImpl _value, $Res Function(_$SourceConfigDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourceConfigDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foregroundAssetId = freezed,
    Object? backgroundAssetId = freezed,
    Object? backgroundColorHex = freezed,
  }) {
    return _then(_$SourceConfigDtoImpl(
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
class _$SourceConfigDtoImpl implements _SourceConfigDto {
  const _$SourceConfigDtoImpl(
      {this.foregroundAssetId,
      this.backgroundAssetId,
      this.backgroundColorHex});

  factory _$SourceConfigDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceConfigDtoImplFromJson(json);

  @override
  final String? foregroundAssetId;
  @override
  final String? backgroundAssetId;
  @override
  final String? backgroundColorHex;

  @override
  String toString() {
    return 'SourceConfigDto(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceConfigDtoImpl &&
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

  /// Create a copy of SourceConfigDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceConfigDtoImplCopyWith<_$SourceConfigDtoImpl> get copyWith =>
      __$$SourceConfigDtoImplCopyWithImpl<_$SourceConfigDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceConfigDtoImplToJson(
      this,
    );
  }
}

abstract class _SourceConfigDto implements SourceConfigDto {
  const factory _SourceConfigDto(
      {final String? foregroundAssetId,
      final String? backgroundAssetId,
      final String? backgroundColorHex}) = _$SourceConfigDtoImpl;

  factory _SourceConfigDto.fromJson(Map<String, dynamic> json) =
      _$SourceConfigDtoImpl.fromJson;

  @override
  String? get foregroundAssetId;
  @override
  String? get backgroundAssetId;
  @override
  String? get backgroundColorHex;

  /// Create a copy of SourceConfigDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourceConfigDtoImplCopyWith<_$SourceConfigDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OutputArtifactsDto _$OutputArtifactsDtoFromJson(Map<String, dynamic> json) {
  return _OutputArtifactsDto.fromJson(json);
}

/// @nodoc
mixin _$OutputArtifactsDto {
  String? get androidLegacyArtifactId => throw _privateConstructorUsedError;
  String? get androidAdaptiveForegroundArtifactId =>
      throw _privateConstructorUsedError;
  String? get androidAdaptiveBackgroundArtifactId =>
      throw _privateConstructorUsedError;
  String? get iosArtifactId => throw _privateConstructorUsedError;
  String? get webArtifactId => throw _privateConstructorUsedError;

  /// Serializes this OutputArtifactsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutputArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutputArtifactsDtoCopyWith<OutputArtifactsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutputArtifactsDtoCopyWith<$Res> {
  factory $OutputArtifactsDtoCopyWith(
          OutputArtifactsDto value, $Res Function(OutputArtifactsDto) then) =
      _$OutputArtifactsDtoCopyWithImpl<$Res, OutputArtifactsDto>;
  @useResult
  $Res call(
      {String? androidLegacyArtifactId,
      String? androidAdaptiveForegroundArtifactId,
      String? androidAdaptiveBackgroundArtifactId,
      String? iosArtifactId,
      String? webArtifactId});
}

/// @nodoc
class _$OutputArtifactsDtoCopyWithImpl<$Res, $Val extends OutputArtifactsDto>
    implements $OutputArtifactsDtoCopyWith<$Res> {
  _$OutputArtifactsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutputArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidLegacyArtifactId = freezed,
    Object? androidAdaptiveForegroundArtifactId = freezed,
    Object? androidAdaptiveBackgroundArtifactId = freezed,
    Object? iosArtifactId = freezed,
    Object? webArtifactId = freezed,
  }) {
    return _then(_value.copyWith(
      androidLegacyArtifactId: freezed == androidLegacyArtifactId
          ? _value.androidLegacyArtifactId
          : androidLegacyArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      androidAdaptiveForegroundArtifactId: freezed ==
              androidAdaptiveForegroundArtifactId
          ? _value.androidAdaptiveForegroundArtifactId
          : androidAdaptiveForegroundArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      androidAdaptiveBackgroundArtifactId: freezed ==
              androidAdaptiveBackgroundArtifactId
          ? _value.androidAdaptiveBackgroundArtifactId
          : androidAdaptiveBackgroundArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      iosArtifactId: freezed == iosArtifactId
          ? _value.iosArtifactId
          : iosArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      webArtifactId: freezed == webArtifactId
          ? _value.webArtifactId
          : webArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutputArtifactsDtoImplCopyWith<$Res>
    implements $OutputArtifactsDtoCopyWith<$Res> {
  factory _$$OutputArtifactsDtoImplCopyWith(_$OutputArtifactsDtoImpl value,
          $Res Function(_$OutputArtifactsDtoImpl) then) =
      __$$OutputArtifactsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? androidLegacyArtifactId,
      String? androidAdaptiveForegroundArtifactId,
      String? androidAdaptiveBackgroundArtifactId,
      String? iosArtifactId,
      String? webArtifactId});
}

/// @nodoc
class __$$OutputArtifactsDtoImplCopyWithImpl<$Res>
    extends _$OutputArtifactsDtoCopyWithImpl<$Res, _$OutputArtifactsDtoImpl>
    implements _$$OutputArtifactsDtoImplCopyWith<$Res> {
  __$$OutputArtifactsDtoImplCopyWithImpl(_$OutputArtifactsDtoImpl _value,
      $Res Function(_$OutputArtifactsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutputArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidLegacyArtifactId = freezed,
    Object? androidAdaptiveForegroundArtifactId = freezed,
    Object? androidAdaptiveBackgroundArtifactId = freezed,
    Object? iosArtifactId = freezed,
    Object? webArtifactId = freezed,
  }) {
    return _then(_$OutputArtifactsDtoImpl(
      androidLegacyArtifactId: freezed == androidLegacyArtifactId
          ? _value.androidLegacyArtifactId
          : androidLegacyArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      androidAdaptiveForegroundArtifactId: freezed ==
              androidAdaptiveForegroundArtifactId
          ? _value.androidAdaptiveForegroundArtifactId
          : androidAdaptiveForegroundArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      androidAdaptiveBackgroundArtifactId: freezed ==
              androidAdaptiveBackgroundArtifactId
          ? _value.androidAdaptiveBackgroundArtifactId
          : androidAdaptiveBackgroundArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      iosArtifactId: freezed == iosArtifactId
          ? _value.iosArtifactId
          : iosArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
      webArtifactId: freezed == webArtifactId
          ? _value.webArtifactId
          : webArtifactId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutputArtifactsDtoImpl implements _OutputArtifactsDto {
  const _$OutputArtifactsDtoImpl(
      {this.androidLegacyArtifactId,
      this.androidAdaptiveForegroundArtifactId,
      this.androidAdaptiveBackgroundArtifactId,
      this.iosArtifactId,
      this.webArtifactId});

  factory _$OutputArtifactsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutputArtifactsDtoImplFromJson(json);

  @override
  final String? androidLegacyArtifactId;
  @override
  final String? androidAdaptiveForegroundArtifactId;
  @override
  final String? androidAdaptiveBackgroundArtifactId;
  @override
  final String? iosArtifactId;
  @override
  final String? webArtifactId;

  @override
  String toString() {
    return 'OutputArtifactsDto(androidLegacyArtifactId: $androidLegacyArtifactId, androidAdaptiveForegroundArtifactId: $androidAdaptiveForegroundArtifactId, androidAdaptiveBackgroundArtifactId: $androidAdaptiveBackgroundArtifactId, iosArtifactId: $iosArtifactId, webArtifactId: $webArtifactId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutputArtifactsDtoImpl &&
            (identical(
                    other.androidLegacyArtifactId, androidLegacyArtifactId) ||
                other.androidLegacyArtifactId == androidLegacyArtifactId) &&
            (identical(other.androidAdaptiveForegroundArtifactId,
                    androidAdaptiveForegroundArtifactId) ||
                other.androidAdaptiveForegroundArtifactId ==
                    androidAdaptiveForegroundArtifactId) &&
            (identical(other.androidAdaptiveBackgroundArtifactId,
                    androidAdaptiveBackgroundArtifactId) ||
                other.androidAdaptiveBackgroundArtifactId ==
                    androidAdaptiveBackgroundArtifactId) &&
            (identical(other.iosArtifactId, iosArtifactId) ||
                other.iosArtifactId == iosArtifactId) &&
            (identical(other.webArtifactId, webArtifactId) ||
                other.webArtifactId == webArtifactId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      androidLegacyArtifactId,
      androidAdaptiveForegroundArtifactId,
      androidAdaptiveBackgroundArtifactId,
      iosArtifactId,
      webArtifactId);

  /// Create a copy of OutputArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutputArtifactsDtoImplCopyWith<_$OutputArtifactsDtoImpl> get copyWith =>
      __$$OutputArtifactsDtoImplCopyWithImpl<_$OutputArtifactsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutputArtifactsDtoImplToJson(
      this,
    );
  }
}

abstract class _OutputArtifactsDto implements OutputArtifactsDto {
  const factory _OutputArtifactsDto(
      {final String? androidLegacyArtifactId,
      final String? androidAdaptiveForegroundArtifactId,
      final String? androidAdaptiveBackgroundArtifactId,
      final String? iosArtifactId,
      final String? webArtifactId}) = _$OutputArtifactsDtoImpl;

  factory _OutputArtifactsDto.fromJson(Map<String, dynamic> json) =
      _$OutputArtifactsDtoImpl.fromJson;

  @override
  String? get androidLegacyArtifactId;
  @override
  String? get androidAdaptiveForegroundArtifactId;
  @override
  String? get androidAdaptiveBackgroundArtifactId;
  @override
  String? get iosArtifactId;
  @override
  String? get webArtifactId;

  /// Create a copy of OutputArtifactsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutputArtifactsDtoImplCopyWith<_$OutputArtifactsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LaunchAssetsDto _$LaunchAssetsDtoFromJson(Map<String, dynamic> json) {
  return _LaunchAssetsDto.fromJson(json);
}

/// @nodoc
mixin _$LaunchAssetsDto {
  String get id => throw _privateConstructorUsedError;
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  SourceConfigDto? get source => throw _privateConstructorUsedError;
  PlatformParamsDto? get params => throw _privateConstructorUsedError;
  OutputArtifactsDto? get outputsArtifacts =>
      throw _privateConstructorUsedError;

  /// Serializes this LaunchAssetsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaunchAssetsDtoCopyWith<LaunchAssetsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchAssetsDtoCopyWith<$Res> {
  factory $LaunchAssetsDtoCopyWith(
          LaunchAssetsDto value, $Res Function(LaunchAssetsDto) then) =
      _$LaunchAssetsDtoCopyWithImpl<$Res, LaunchAssetsDto>;
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      String createdAt,
      String updatedAt,
      SourceConfigDto? source,
      PlatformParamsDto? params,
      OutputArtifactsDto? outputsArtifacts});

  $SourceConfigDtoCopyWith<$Res>? get source;
  $PlatformParamsDtoCopyWith<$Res>? get params;
  $OutputArtifactsDtoCopyWith<$Res>? get outputsArtifacts;
}

/// @nodoc
class _$LaunchAssetsDtoCopyWithImpl<$Res, $Val extends LaunchAssetsDto>
    implements $LaunchAssetsDtoCopyWith<$Res> {
  _$LaunchAssetsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchAssetsDto
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
    Object? outputsArtifacts = freezed,
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
              as SourceConfigDto?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as PlatformParamsDto?,
      outputsArtifacts: freezed == outputsArtifacts
          ? _value.outputsArtifacts
          : outputsArtifacts // ignore: cast_nullable_to_non_nullable
              as OutputArtifactsDto?,
    ) as $Val);
  }

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SourceConfigDtoCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SourceConfigDtoCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformParamsDtoCopyWith<$Res>? get params {
    if (_value.params == null) {
      return null;
    }

    return $PlatformParamsDtoCopyWith<$Res>(_value.params!, (value) {
      return _then(_value.copyWith(params: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputArtifactsDtoCopyWith<$Res>? get outputsArtifacts {
    if (_value.outputsArtifacts == null) {
      return null;
    }

    return $OutputArtifactsDtoCopyWith<$Res>(_value.outputsArtifacts!, (value) {
      return _then(_value.copyWith(outputsArtifacts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LaunchAssetsDtoImplCopyWith<$Res>
    implements $LaunchAssetsDtoCopyWith<$Res> {
  factory _$$LaunchAssetsDtoImplCopyWith(_$LaunchAssetsDtoImpl value,
          $Res Function(_$LaunchAssetsDtoImpl) then) =
      __$$LaunchAssetsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      String createdAt,
      String updatedAt,
      SourceConfigDto? source,
      PlatformParamsDto? params,
      OutputArtifactsDto? outputsArtifacts});

  @override
  $SourceConfigDtoCopyWith<$Res>? get source;
  @override
  $PlatformParamsDtoCopyWith<$Res>? get params;
  @override
  $OutputArtifactsDtoCopyWith<$Res>? get outputsArtifacts;
}

/// @nodoc
class __$$LaunchAssetsDtoImplCopyWithImpl<$Res>
    extends _$LaunchAssetsDtoCopyWithImpl<$Res, _$LaunchAssetsDtoImpl>
    implements _$$LaunchAssetsDtoImplCopyWith<$Res> {
  __$$LaunchAssetsDtoImplCopyWithImpl(
      _$LaunchAssetsDtoImpl _value, $Res Function(_$LaunchAssetsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchAssetsDto
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
    Object? outputsArtifacts = freezed,
  }) {
    return _then(_$LaunchAssetsDtoImpl(
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
              as SourceConfigDto?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as PlatformParamsDto?,
      outputsArtifacts: freezed == outputsArtifacts
          ? _value.outputsArtifacts
          : outputsArtifacts // ignore: cast_nullable_to_non_nullable
              as OutputArtifactsDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LaunchAssetsDtoImpl implements _LaunchAssetsDto {
  const _$LaunchAssetsDtoImpl(
      {required this.id,
      required this.applicationId,
      required this.themeId,
      required this.createdAt,
      required this.updatedAt,
      this.source,
      this.params,
      this.outputsArtifacts});

  factory _$LaunchAssetsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaunchAssetsDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final SourceConfigDto? source;
  @override
  final PlatformParamsDto? params;
  @override
  final OutputArtifactsDto? outputsArtifacts;

  @override
  String toString() {
    return 'LaunchAssetsDto(id: $id, applicationId: $applicationId, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt, source: $source, params: $params, outputsArtifacts: $outputsArtifacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchAssetsDtoImpl &&
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
            (identical(other.outputsArtifacts, outputsArtifacts) ||
                other.outputsArtifacts == outputsArtifacts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, applicationId, themeId,
      createdAt, updatedAt, source, params, outputsArtifacts);

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchAssetsDtoImplCopyWith<_$LaunchAssetsDtoImpl> get copyWith =>
      __$$LaunchAssetsDtoImplCopyWithImpl<_$LaunchAssetsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaunchAssetsDtoImplToJson(
      this,
    );
  }
}

abstract class _LaunchAssetsDto implements LaunchAssetsDto {
  const factory _LaunchAssetsDto(
      {required final String id,
      required final String applicationId,
      required final String themeId,
      required final String createdAt,
      required final String updatedAt,
      final SourceConfigDto? source,
      final PlatformParamsDto? params,
      final OutputArtifactsDto? outputsArtifacts}) = _$LaunchAssetsDtoImpl;

  factory _LaunchAssetsDto.fromJson(Map<String, dynamic> json) =
      _$LaunchAssetsDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  SourceConfigDto? get source;
  @override
  PlatformParamsDto? get params;
  @override
  OutputArtifactsDto? get outputsArtifacts;

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchAssetsDtoImplCopyWith<_$LaunchAssetsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationSliceDto _$ValidationSliceDtoFromJson(Map<String, dynamic> json) {
  return _ValidationSliceDto.fromJson(json);
}

/// @nodoc
mixin _$ValidationSliceDto {
  bool get compliant => throw _privateConstructorUsedError;
  double get deltaDp => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this ValidationSliceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidationSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationSliceDtoCopyWith<ValidationSliceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationSliceDtoCopyWith<$Res> {
  factory $ValidationSliceDtoCopyWith(
          ValidationSliceDto value, $Res Function(ValidationSliceDto) then) =
      _$ValidationSliceDtoCopyWithImpl<$Res, ValidationSliceDto>;
  @useResult
  $Res call({bool compliant, double deltaDp, String? message});
}

/// @nodoc
class _$ValidationSliceDtoCopyWithImpl<$Res, $Val extends ValidationSliceDto>
    implements $ValidationSliceDtoCopyWith<$Res> {
  _$ValidationSliceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compliant = null,
    Object? deltaDp = null,
    Object? message = freezed,
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
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidationSliceDtoImplCopyWith<$Res>
    implements $ValidationSliceDtoCopyWith<$Res> {
  factory _$$ValidationSliceDtoImplCopyWith(_$ValidationSliceDtoImpl value,
          $Res Function(_$ValidationSliceDtoImpl) then) =
      __$$ValidationSliceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool compliant, double deltaDp, String? message});
}

/// @nodoc
class __$$ValidationSliceDtoImplCopyWithImpl<$Res>
    extends _$ValidationSliceDtoCopyWithImpl<$Res, _$ValidationSliceDtoImpl>
    implements _$$ValidationSliceDtoImplCopyWith<$Res> {
  __$$ValidationSliceDtoImplCopyWithImpl(_$ValidationSliceDtoImpl _value,
      $Res Function(_$ValidationSliceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidationSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compliant = null,
    Object? deltaDp = null,
    Object? message = freezed,
  }) {
    return _then(_$ValidationSliceDtoImpl(
      compliant: null == compliant
          ? _value.compliant
          : compliant // ignore: cast_nullable_to_non_nullable
              as bool,
      deltaDp: null == deltaDp
          ? _value.deltaDp
          : deltaDp // ignore: cast_nullable_to_non_nullable
              as double,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationSliceDtoImpl implements _ValidationSliceDto {
  const _$ValidationSliceDtoImpl(
      {required this.compliant, required this.deltaDp, this.message});

  factory _$ValidationSliceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationSliceDtoImplFromJson(json);

  @override
  final bool compliant;
  @override
  final double deltaDp;
  @override
  final String? message;

  @override
  String toString() {
    return 'ValidationSliceDto(compliant: $compliant, deltaDp: $deltaDp, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationSliceDtoImpl &&
            (identical(other.compliant, compliant) ||
                other.compliant == compliant) &&
            (identical(other.deltaDp, deltaDp) || other.deltaDp == deltaDp) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, compliant, deltaDp, message);

  /// Create a copy of ValidationSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationSliceDtoImplCopyWith<_$ValidationSliceDtoImpl> get copyWith =>
      __$$ValidationSliceDtoImplCopyWithImpl<_$ValidationSliceDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationSliceDtoImplToJson(
      this,
    );
  }
}

abstract class _ValidationSliceDto implements ValidationSliceDto {
  const factory _ValidationSliceDto(
      {required final bool compliant,
      required final double deltaDp,
      final String? message}) = _$ValidationSliceDtoImpl;

  factory _ValidationSliceDto.fromJson(Map<String, dynamic> json) =
      _$ValidationSliceDtoImpl.fromJson;

  @override
  bool get compliant;
  @override
  double get deltaDp;
  @override
  String? get message;

  /// Create a copy of ValidationSliceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationSliceDtoImplCopyWith<_$ValidationSliceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationReportDto _$ValidationReportDtoFromJson(Map<String, dynamic> json) {
  return _ValidationReportDto.fromJson(json);
}

/// @nodoc
mixin _$ValidationReportDto {
  ValidationSliceDto? get androidLegacy => throw _privateConstructorUsedError;
  ValidationSliceDto? get androidAdaptive => throw _privateConstructorUsedError;
  ValidationSliceDto? get ios => throw _privateConstructorUsedError;
  ValidationSliceDto? get web => throw _privateConstructorUsedError;

  /// Serializes this ValidationReportDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidationReportDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationReportDtoCopyWith<ValidationReportDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationReportDtoCopyWith<$Res> {
  factory $ValidationReportDtoCopyWith(
          ValidationReportDto value, $Res Function(ValidationReportDto) then) =
      _$ValidationReportDtoCopyWithImpl<$Res, ValidationReportDto>;
  @useResult
  $Res call(
      {ValidationSliceDto? androidLegacy,
      ValidationSliceDto? androidAdaptive,
      ValidationSliceDto? ios,
      ValidationSliceDto? web});

  $ValidationSliceDtoCopyWith<$Res>? get androidLegacy;
  $ValidationSliceDtoCopyWith<$Res>? get androidAdaptive;
  $ValidationSliceDtoCopyWith<$Res>? get ios;
  $ValidationSliceDtoCopyWith<$Res>? get web;
}

/// @nodoc
class _$ValidationReportDtoCopyWithImpl<$Res, $Val extends ValidationReportDto>
    implements $ValidationReportDtoCopyWith<$Res> {
  _$ValidationReportDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationReportDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidLegacy = freezed,
    Object? androidAdaptive = freezed,
    Object? ios = freezed,
    Object? web = freezed,
  }) {
    return _then(_value.copyWith(
      androidLegacy: freezed == androidLegacy
          ? _value.androidLegacy
          : androidLegacy // ignore: cast_nullable_to_non_nullable
              as ValidationSliceDto?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as ValidationSliceDto?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as ValidationSliceDto?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as ValidationSliceDto?,
    ) as $Val);
  }

  /// Create a copy of ValidationReportDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationSliceDtoCopyWith<$Res>? get androidLegacy {
    if (_value.androidLegacy == null) {
      return null;
    }

    return $ValidationSliceDtoCopyWith<$Res>(_value.androidLegacy!, (value) {
      return _then(_value.copyWith(androidLegacy: value) as $Val);
    });
  }

  /// Create a copy of ValidationReportDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationSliceDtoCopyWith<$Res>? get androidAdaptive {
    if (_value.androidAdaptive == null) {
      return null;
    }

    return $ValidationSliceDtoCopyWith<$Res>(_value.androidAdaptive!, (value) {
      return _then(_value.copyWith(androidAdaptive: value) as $Val);
    });
  }

  /// Create a copy of ValidationReportDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationSliceDtoCopyWith<$Res>? get ios {
    if (_value.ios == null) {
      return null;
    }

    return $ValidationSliceDtoCopyWith<$Res>(_value.ios!, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  /// Create a copy of ValidationReportDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationSliceDtoCopyWith<$Res>? get web {
    if (_value.web == null) {
      return null;
    }

    return $ValidationSliceDtoCopyWith<$Res>(_value.web!, (value) {
      return _then(_value.copyWith(web: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ValidationReportDtoImplCopyWith<$Res>
    implements $ValidationReportDtoCopyWith<$Res> {
  factory _$$ValidationReportDtoImplCopyWith(_$ValidationReportDtoImpl value,
          $Res Function(_$ValidationReportDtoImpl) then) =
      __$$ValidationReportDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ValidationSliceDto? androidLegacy,
      ValidationSliceDto? androidAdaptive,
      ValidationSliceDto? ios,
      ValidationSliceDto? web});

  @override
  $ValidationSliceDtoCopyWith<$Res>? get androidLegacy;
  @override
  $ValidationSliceDtoCopyWith<$Res>? get androidAdaptive;
  @override
  $ValidationSliceDtoCopyWith<$Res>? get ios;
  @override
  $ValidationSliceDtoCopyWith<$Res>? get web;
}

/// @nodoc
class __$$ValidationReportDtoImplCopyWithImpl<$Res>
    extends _$ValidationReportDtoCopyWithImpl<$Res, _$ValidationReportDtoImpl>
    implements _$$ValidationReportDtoImplCopyWith<$Res> {
  __$$ValidationReportDtoImplCopyWithImpl(_$ValidationReportDtoImpl _value,
      $Res Function(_$ValidationReportDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidationReportDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidLegacy = freezed,
    Object? androidAdaptive = freezed,
    Object? ios = freezed,
    Object? web = freezed,
  }) {
    return _then(_$ValidationReportDtoImpl(
      androidLegacy: freezed == androidLegacy
          ? _value.androidLegacy
          : androidLegacy // ignore: cast_nullable_to_non_nullable
              as ValidationSliceDto?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as ValidationSliceDto?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as ValidationSliceDto?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as ValidationSliceDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationReportDtoImpl implements _ValidationReportDto {
  const _$ValidationReportDtoImpl(
      {this.androidLegacy, this.androidAdaptive, this.ios, this.web});

  factory _$ValidationReportDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationReportDtoImplFromJson(json);

  @override
  final ValidationSliceDto? androidLegacy;
  @override
  final ValidationSliceDto? androidAdaptive;
  @override
  final ValidationSliceDto? ios;
  @override
  final ValidationSliceDto? web;

  @override
  String toString() {
    return 'ValidationReportDto(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationReportDtoImpl &&
            (identical(other.androidLegacy, androidLegacy) ||
                other.androidLegacy == androidLegacy) &&
            (identical(other.androidAdaptive, androidAdaptive) ||
                other.androidAdaptive == androidAdaptive) &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.web, web) || other.web == web));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, androidLegacy, androidAdaptive, ios, web);

  /// Create a copy of ValidationReportDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationReportDtoImplCopyWith<_$ValidationReportDtoImpl> get copyWith =>
      __$$ValidationReportDtoImplCopyWithImpl<_$ValidationReportDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationReportDtoImplToJson(
      this,
    );
  }
}

abstract class _ValidationReportDto implements ValidationReportDto {
  const factory _ValidationReportDto(
      {final ValidationSliceDto? androidLegacy,
      final ValidationSliceDto? androidAdaptive,
      final ValidationSliceDto? ios,
      final ValidationSliceDto? web}) = _$ValidationReportDtoImpl;

  factory _ValidationReportDto.fromJson(Map<String, dynamic> json) =
      _$ValidationReportDtoImpl.fromJson;

  @override
  ValidationSliceDto? get androidLegacy;
  @override
  ValidationSliceDto? get androidAdaptive;
  @override
  ValidationSliceDto? get ios;
  @override
  ValidationSliceDto? get web;

  /// Create a copy of ValidationReportDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationReportDtoImplCopyWith<_$ValidationReportDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LaunchAssetsEnvelopeDto _$LaunchAssetsEnvelopeDtoFromJson(
    Map<String, dynamic> json) {
  return _LaunchAssetsEnvelopeDto.fromJson(json);
}

/// @nodoc
mixin _$LaunchAssetsEnvelopeDto {
  LaunchAssetsDto get entity => throw _privateConstructorUsedError;
  Map<String, String>? get urls => throw _privateConstructorUsedError;
  ValidationReportDto? get validation => throw _privateConstructorUsedError;

  /// Serializes this LaunchAssetsEnvelopeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LaunchAssetsEnvelopeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaunchAssetsEnvelopeDtoCopyWith<LaunchAssetsEnvelopeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchAssetsEnvelopeDtoCopyWith<$Res> {
  factory $LaunchAssetsEnvelopeDtoCopyWith(LaunchAssetsEnvelopeDto value,
          $Res Function(LaunchAssetsEnvelopeDto) then) =
      _$LaunchAssetsEnvelopeDtoCopyWithImpl<$Res, LaunchAssetsEnvelopeDto>;
  @useResult
  $Res call(
      {LaunchAssetsDto entity,
      Map<String, String>? urls,
      ValidationReportDto? validation});

  $LaunchAssetsDtoCopyWith<$Res> get entity;
  $ValidationReportDtoCopyWith<$Res>? get validation;
}

/// @nodoc
class _$LaunchAssetsEnvelopeDtoCopyWithImpl<$Res,
        $Val extends LaunchAssetsEnvelopeDto>
    implements $LaunchAssetsEnvelopeDtoCopyWith<$Res> {
  _$LaunchAssetsEnvelopeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchAssetsEnvelopeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? urls = freezed,
    Object? validation = freezed,
  }) {
    return _then(_value.copyWith(
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsDto,
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      validation: freezed == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ValidationReportDto?,
    ) as $Val);
  }

  /// Create a copy of LaunchAssetsEnvelopeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetsDtoCopyWith<$Res> get entity {
    return $LaunchAssetsDtoCopyWith<$Res>(_value.entity, (value) {
      return _then(_value.copyWith(entity: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsEnvelopeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationReportDtoCopyWith<$Res>? get validation {
    if (_value.validation == null) {
      return null;
    }

    return $ValidationReportDtoCopyWith<$Res>(_value.validation!, (value) {
      return _then(_value.copyWith(validation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LaunchAssetsEnvelopeDtoImplCopyWith<$Res>
    implements $LaunchAssetsEnvelopeDtoCopyWith<$Res> {
  factory _$$LaunchAssetsEnvelopeDtoImplCopyWith(
          _$LaunchAssetsEnvelopeDtoImpl value,
          $Res Function(_$LaunchAssetsEnvelopeDtoImpl) then) =
      __$$LaunchAssetsEnvelopeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LaunchAssetsDto entity,
      Map<String, String>? urls,
      ValidationReportDto? validation});

  @override
  $LaunchAssetsDtoCopyWith<$Res> get entity;
  @override
  $ValidationReportDtoCopyWith<$Res>? get validation;
}

/// @nodoc
class __$$LaunchAssetsEnvelopeDtoImplCopyWithImpl<$Res>
    extends _$LaunchAssetsEnvelopeDtoCopyWithImpl<$Res,
        _$LaunchAssetsEnvelopeDtoImpl>
    implements _$$LaunchAssetsEnvelopeDtoImplCopyWith<$Res> {
  __$$LaunchAssetsEnvelopeDtoImplCopyWithImpl(
      _$LaunchAssetsEnvelopeDtoImpl _value,
      $Res Function(_$LaunchAssetsEnvelopeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchAssetsEnvelopeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? urls = freezed,
    Object? validation = freezed,
  }) {
    return _then(_$LaunchAssetsEnvelopeDtoImpl(
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsDto,
      urls: freezed == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      validation: freezed == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ValidationReportDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LaunchAssetsEnvelopeDtoImpl implements _LaunchAssetsEnvelopeDto {
  const _$LaunchAssetsEnvelopeDtoImpl(
      {required this.entity, final Map<String, String>? urls, this.validation})
      : _urls = urls;

  factory _$LaunchAssetsEnvelopeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaunchAssetsEnvelopeDtoImplFromJson(json);

  @override
  final LaunchAssetsDto entity;
  final Map<String, String>? _urls;
  @override
  Map<String, String>? get urls {
    final value = _urls;
    if (value == null) return null;
    if (_urls is EqualUnmodifiableMapView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final ValidationReportDto? validation;

  @override
  String toString() {
    return 'LaunchAssetsEnvelopeDto(entity: $entity, urls: $urls, validation: $validation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchAssetsEnvelopeDtoImpl &&
            (identical(other.entity, entity) || other.entity == entity) &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.validation, validation) ||
                other.validation == validation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, entity,
      const DeepCollectionEquality().hash(_urls), validation);

  /// Create a copy of LaunchAssetsEnvelopeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchAssetsEnvelopeDtoImplCopyWith<_$LaunchAssetsEnvelopeDtoImpl>
      get copyWith => __$$LaunchAssetsEnvelopeDtoImplCopyWithImpl<
          _$LaunchAssetsEnvelopeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaunchAssetsEnvelopeDtoImplToJson(
      this,
    );
  }
}

abstract class _LaunchAssetsEnvelopeDto implements LaunchAssetsEnvelopeDto {
  const factory _LaunchAssetsEnvelopeDto(
      {required final LaunchAssetsDto entity,
      final Map<String, String>? urls,
      final ValidationReportDto? validation}) = _$LaunchAssetsEnvelopeDtoImpl;

  factory _LaunchAssetsEnvelopeDto.fromJson(Map<String, dynamic> json) =
      _$LaunchAssetsEnvelopeDtoImpl.fromJson;

  @override
  LaunchAssetsDto get entity;
  @override
  Map<String, String>? get urls;
  @override
  ValidationReportDto? get validation;

  /// Create a copy of LaunchAssetsEnvelopeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchAssetsEnvelopeDtoImplCopyWith<_$LaunchAssetsEnvelopeDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
