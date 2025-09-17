// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_assets_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FitPaddingModel _$FitPaddingModelFromJson(Map<String, dynamic> json) {
  return _FitPaddingModel.fromJson(json);
}

/// @nodoc
mixin _$FitPaddingModel {
  FitModel? get fit => throw _privateConstructorUsedError;
  double? get paddingDp => throw _privateConstructorUsedError;

  /// Serializes this FitPaddingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FitPaddingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FitPaddingModelCopyWith<FitPaddingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FitPaddingModelCopyWith<$Res> {
  factory $FitPaddingModelCopyWith(
          FitPaddingModel value, $Res Function(FitPaddingModel) then) =
      _$FitPaddingModelCopyWithImpl<$Res, FitPaddingModel>;
  @useResult
  $Res call({FitModel? fit, double? paddingDp});
}

/// @nodoc
class _$FitPaddingModelCopyWithImpl<$Res, $Val extends FitPaddingModel>
    implements $FitPaddingModelCopyWith<$Res> {
  _$FitPaddingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FitPaddingModel
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
              as FitModel?,
      paddingDp: freezed == paddingDp
          ? _value.paddingDp
          : paddingDp // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FitPaddingModelImplCopyWith<$Res>
    implements $FitPaddingModelCopyWith<$Res> {
  factory _$$FitPaddingModelImplCopyWith(_$FitPaddingModelImpl value,
          $Res Function(_$FitPaddingModelImpl) then) =
      __$$FitPaddingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FitModel? fit, double? paddingDp});
}

/// @nodoc
class __$$FitPaddingModelImplCopyWithImpl<$Res>
    extends _$FitPaddingModelCopyWithImpl<$Res, _$FitPaddingModelImpl>
    implements _$$FitPaddingModelImplCopyWith<$Res> {
  __$$FitPaddingModelImplCopyWithImpl(
      _$FitPaddingModelImpl _value, $Res Function(_$FitPaddingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FitPaddingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fit = freezed,
    Object? paddingDp = freezed,
  }) {
    return _then(_$FitPaddingModelImpl(
      fit: freezed == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as FitModel?,
      paddingDp: freezed == paddingDp
          ? _value.paddingDp
          : paddingDp // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FitPaddingModelImpl implements _FitPaddingModel {
  const _$FitPaddingModelImpl({this.fit, this.paddingDp});

  factory _$FitPaddingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FitPaddingModelImplFromJson(json);

  @override
  final FitModel? fit;
  @override
  final double? paddingDp;

  @override
  String toString() {
    return 'FitPaddingModel(fit: $fit, paddingDp: $paddingDp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FitPaddingModelImpl &&
            (identical(other.fit, fit) || other.fit == fit) &&
            (identical(other.paddingDp, paddingDp) ||
                other.paddingDp == paddingDp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fit, paddingDp);

  /// Create a copy of FitPaddingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FitPaddingModelImplCopyWith<_$FitPaddingModelImpl> get copyWith =>
      __$$FitPaddingModelImplCopyWithImpl<_$FitPaddingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FitPaddingModelImplToJson(
      this,
    );
  }
}

abstract class _FitPaddingModel implements FitPaddingModel {
  const factory _FitPaddingModel(
      {final FitModel? fit, final double? paddingDp}) = _$FitPaddingModelImpl;

  factory _FitPaddingModel.fromJson(Map<String, dynamic> json) =
      _$FitPaddingModelImpl.fromJson;

  @override
  FitModel? get fit;
  @override
  double? get paddingDp;

  /// Create a copy of FitPaddingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FitPaddingModelImplCopyWith<_$FitPaddingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlatformParamsModel _$PlatformParamsModelFromJson(Map<String, dynamic> json) {
  return _PlatformParamsModel.fromJson(json);
}

/// @nodoc
mixin _$PlatformParamsModel {
  FitPaddingModel? get androidLegacy => throw _privateConstructorUsedError;
  FitPaddingModel? get androidAdaptive => throw _privateConstructorUsedError;
  FitPaddingModel? get ios => throw _privateConstructorUsedError;
  FitPaddingModel? get web => throw _privateConstructorUsedError;

  /// Serializes this PlatformParamsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlatformParamsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformParamsModelCopyWith<PlatformParamsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformParamsModelCopyWith<$Res> {
  factory $PlatformParamsModelCopyWith(
          PlatformParamsModel value, $Res Function(PlatformParamsModel) then) =
      _$PlatformParamsModelCopyWithImpl<$Res, PlatformParamsModel>;
  @useResult
  $Res call(
      {FitPaddingModel? androidLegacy,
      FitPaddingModel? androidAdaptive,
      FitPaddingModel? ios,
      FitPaddingModel? web});

  $FitPaddingModelCopyWith<$Res>? get androidLegacy;
  $FitPaddingModelCopyWith<$Res>? get androidAdaptive;
  $FitPaddingModelCopyWith<$Res>? get ios;
  $FitPaddingModelCopyWith<$Res>? get web;
}

/// @nodoc
class _$PlatformParamsModelCopyWithImpl<$Res, $Val extends PlatformParamsModel>
    implements $PlatformParamsModelCopyWith<$Res> {
  _$PlatformParamsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformParamsModel
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
              as FitPaddingModel?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as FitPaddingModel?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as FitPaddingModel?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as FitPaddingModel?,
    ) as $Val);
  }

  /// Create a copy of PlatformParamsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitPaddingModelCopyWith<$Res>? get androidLegacy {
    if (_value.androidLegacy == null) {
      return null;
    }

    return $FitPaddingModelCopyWith<$Res>(_value.androidLegacy!, (value) {
      return _then(_value.copyWith(androidLegacy: value) as $Val);
    });
  }

  /// Create a copy of PlatformParamsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitPaddingModelCopyWith<$Res>? get androidAdaptive {
    if (_value.androidAdaptive == null) {
      return null;
    }

    return $FitPaddingModelCopyWith<$Res>(_value.androidAdaptive!, (value) {
      return _then(_value.copyWith(androidAdaptive: value) as $Val);
    });
  }

  /// Create a copy of PlatformParamsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitPaddingModelCopyWith<$Res>? get ios {
    if (_value.ios == null) {
      return null;
    }

    return $FitPaddingModelCopyWith<$Res>(_value.ios!, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  /// Create a copy of PlatformParamsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitPaddingModelCopyWith<$Res>? get web {
    if (_value.web == null) {
      return null;
    }

    return $FitPaddingModelCopyWith<$Res>(_value.web!, (value) {
      return _then(_value.copyWith(web: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlatformParamsModelImplCopyWith<$Res>
    implements $PlatformParamsModelCopyWith<$Res> {
  factory _$$PlatformParamsModelImplCopyWith(_$PlatformParamsModelImpl value,
          $Res Function(_$PlatformParamsModelImpl) then) =
      __$$PlatformParamsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FitPaddingModel? androidLegacy,
      FitPaddingModel? androidAdaptive,
      FitPaddingModel? ios,
      FitPaddingModel? web});

  @override
  $FitPaddingModelCopyWith<$Res>? get androidLegacy;
  @override
  $FitPaddingModelCopyWith<$Res>? get androidAdaptive;
  @override
  $FitPaddingModelCopyWith<$Res>? get ios;
  @override
  $FitPaddingModelCopyWith<$Res>? get web;
}

/// @nodoc
class __$$PlatformParamsModelImplCopyWithImpl<$Res>
    extends _$PlatformParamsModelCopyWithImpl<$Res, _$PlatformParamsModelImpl>
    implements _$$PlatformParamsModelImplCopyWith<$Res> {
  __$$PlatformParamsModelImplCopyWithImpl(_$PlatformParamsModelImpl _value,
      $Res Function(_$PlatformParamsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlatformParamsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidLegacy = freezed,
    Object? androidAdaptive = freezed,
    Object? ios = freezed,
    Object? web = freezed,
  }) {
    return _then(_$PlatformParamsModelImpl(
      androidLegacy: freezed == androidLegacy
          ? _value.androidLegacy
          : androidLegacy // ignore: cast_nullable_to_non_nullable
              as FitPaddingModel?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as FitPaddingModel?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as FitPaddingModel?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as FitPaddingModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformParamsModelImpl implements _PlatformParamsModel {
  const _$PlatformParamsModelImpl(
      {this.androidLegacy, this.androidAdaptive, this.ios, this.web});

  factory _$PlatformParamsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlatformParamsModelImplFromJson(json);

  @override
  final FitPaddingModel? androidLegacy;
  @override
  final FitPaddingModel? androidAdaptive;
  @override
  final FitPaddingModel? ios;
  @override
  final FitPaddingModel? web;

  @override
  String toString() {
    return 'PlatformParamsModel(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformParamsModelImpl &&
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

  /// Create a copy of PlatformParamsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformParamsModelImplCopyWith<_$PlatformParamsModelImpl> get copyWith =>
      __$$PlatformParamsModelImplCopyWithImpl<_$PlatformParamsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformParamsModelImplToJson(
      this,
    );
  }
}

abstract class _PlatformParamsModel implements PlatformParamsModel {
  const factory _PlatformParamsModel(
      {final FitPaddingModel? androidLegacy,
      final FitPaddingModel? androidAdaptive,
      final FitPaddingModel? ios,
      final FitPaddingModel? web}) = _$PlatformParamsModelImpl;

  factory _PlatformParamsModel.fromJson(Map<String, dynamic> json) =
      _$PlatformParamsModelImpl.fromJson;

  @override
  FitPaddingModel? get androidLegacy;
  @override
  FitPaddingModel? get androidAdaptive;
  @override
  FitPaddingModel? get ios;
  @override
  FitPaddingModel? get web;

  /// Create a copy of PlatformParamsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformParamsModelImplCopyWith<_$PlatformParamsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SourceConfigModel _$SourceConfigModelFromJson(Map<String, dynamic> json) {
  return _SourceConfigModel.fromJson(json);
}

/// @nodoc
mixin _$SourceConfigModel {
  String? get foregroundAssetId => throw _privateConstructorUsedError;
  String? get backgroundAssetId => throw _privateConstructorUsedError;
  String? get backgroundColorHex => throw _privateConstructorUsedError;

  /// Serializes this SourceConfigModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SourceConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourceConfigModelCopyWith<SourceConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceConfigModelCopyWith<$Res> {
  factory $SourceConfigModelCopyWith(
          SourceConfigModel value, $Res Function(SourceConfigModel) then) =
      _$SourceConfigModelCopyWithImpl<$Res, SourceConfigModel>;
  @useResult
  $Res call(
      {String? foregroundAssetId,
      String? backgroundAssetId,
      String? backgroundColorHex});
}

/// @nodoc
class _$SourceConfigModelCopyWithImpl<$Res, $Val extends SourceConfigModel>
    implements $SourceConfigModelCopyWith<$Res> {
  _$SourceConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SourceConfigModel
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
abstract class _$$SourceConfigModelImplCopyWith<$Res>
    implements $SourceConfigModelCopyWith<$Res> {
  factory _$$SourceConfigModelImplCopyWith(_$SourceConfigModelImpl value,
          $Res Function(_$SourceConfigModelImpl) then) =
      __$$SourceConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? foregroundAssetId,
      String? backgroundAssetId,
      String? backgroundColorHex});
}

/// @nodoc
class __$$SourceConfigModelImplCopyWithImpl<$Res>
    extends _$SourceConfigModelCopyWithImpl<$Res, _$SourceConfigModelImpl>
    implements _$$SourceConfigModelImplCopyWith<$Res> {
  __$$SourceConfigModelImplCopyWithImpl(_$SourceConfigModelImpl _value,
      $Res Function(_$SourceConfigModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourceConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foregroundAssetId = freezed,
    Object? backgroundAssetId = freezed,
    Object? backgroundColorHex = freezed,
  }) {
    return _then(_$SourceConfigModelImpl(
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
class _$SourceConfigModelImpl implements _SourceConfigModel {
  const _$SourceConfigModelImpl(
      {this.foregroundAssetId,
      this.backgroundAssetId,
      this.backgroundColorHex});

  factory _$SourceConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceConfigModelImplFromJson(json);

  @override
  final String? foregroundAssetId;
  @override
  final String? backgroundAssetId;
  @override
  final String? backgroundColorHex;

  @override
  String toString() {
    return 'SourceConfigModel(foregroundAssetId: $foregroundAssetId, backgroundAssetId: $backgroundAssetId, backgroundColorHex: $backgroundColorHex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceConfigModelImpl &&
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

  /// Create a copy of SourceConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceConfigModelImplCopyWith<_$SourceConfigModelImpl> get copyWith =>
      __$$SourceConfigModelImplCopyWithImpl<_$SourceConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceConfigModelImplToJson(
      this,
    );
  }
}

abstract class _SourceConfigModel implements SourceConfigModel {
  const factory _SourceConfigModel(
      {final String? foregroundAssetId,
      final String? backgroundAssetId,
      final String? backgroundColorHex}) = _$SourceConfigModelImpl;

  factory _SourceConfigModel.fromJson(Map<String, dynamic> json) =
      _$SourceConfigModelImpl.fromJson;

  @override
  String? get foregroundAssetId;
  @override
  String? get backgroundAssetId;
  @override
  String? get backgroundColorHex;

  /// Create a copy of SourceConfigModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourceConfigModelImplCopyWith<_$SourceConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OutputArtifactsModel _$OutputArtifactsModelFromJson(Map<String, dynamic> json) {
  return _OutputArtifactsModel.fromJson(json);
}

/// @nodoc
mixin _$OutputArtifactsModel {
  String? get androidLegacyArtifactId => throw _privateConstructorUsedError;
  String? get androidAdaptiveForegroundArtifactId =>
      throw _privateConstructorUsedError;
  String? get androidAdaptiveBackgroundArtifactId =>
      throw _privateConstructorUsedError;
  String? get iosArtifactId => throw _privateConstructorUsedError;
  String? get webArtifactId => throw _privateConstructorUsedError;

  /// Serializes this OutputArtifactsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutputArtifactsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutputArtifactsModelCopyWith<OutputArtifactsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutputArtifactsModelCopyWith<$Res> {
  factory $OutputArtifactsModelCopyWith(OutputArtifactsModel value,
          $Res Function(OutputArtifactsModel) then) =
      _$OutputArtifactsModelCopyWithImpl<$Res, OutputArtifactsModel>;
  @useResult
  $Res call(
      {String? androidLegacyArtifactId,
      String? androidAdaptiveForegroundArtifactId,
      String? androidAdaptiveBackgroundArtifactId,
      String? iosArtifactId,
      String? webArtifactId});
}

/// @nodoc
class _$OutputArtifactsModelCopyWithImpl<$Res,
        $Val extends OutputArtifactsModel>
    implements $OutputArtifactsModelCopyWith<$Res> {
  _$OutputArtifactsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutputArtifactsModel
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
abstract class _$$OutputArtifactsModelImplCopyWith<$Res>
    implements $OutputArtifactsModelCopyWith<$Res> {
  factory _$$OutputArtifactsModelImplCopyWith(_$OutputArtifactsModelImpl value,
          $Res Function(_$OutputArtifactsModelImpl) then) =
      __$$OutputArtifactsModelImplCopyWithImpl<$Res>;
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
class __$$OutputArtifactsModelImplCopyWithImpl<$Res>
    extends _$OutputArtifactsModelCopyWithImpl<$Res, _$OutputArtifactsModelImpl>
    implements _$$OutputArtifactsModelImplCopyWith<$Res> {
  __$$OutputArtifactsModelImplCopyWithImpl(_$OutputArtifactsModelImpl _value,
      $Res Function(_$OutputArtifactsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutputArtifactsModel
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
    return _then(_$OutputArtifactsModelImpl(
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
class _$OutputArtifactsModelImpl implements _OutputArtifactsModel {
  const _$OutputArtifactsModelImpl(
      {this.androidLegacyArtifactId,
      this.androidAdaptiveForegroundArtifactId,
      this.androidAdaptiveBackgroundArtifactId,
      this.iosArtifactId,
      this.webArtifactId});

  factory _$OutputArtifactsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutputArtifactsModelImplFromJson(json);

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
    return 'OutputArtifactsModel(androidLegacyArtifactId: $androidLegacyArtifactId, androidAdaptiveForegroundArtifactId: $androidAdaptiveForegroundArtifactId, androidAdaptiveBackgroundArtifactId: $androidAdaptiveBackgroundArtifactId, iosArtifactId: $iosArtifactId, webArtifactId: $webArtifactId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutputArtifactsModelImpl &&
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

  /// Create a copy of OutputArtifactsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutputArtifactsModelImplCopyWith<_$OutputArtifactsModelImpl>
      get copyWith =>
          __$$OutputArtifactsModelImplCopyWithImpl<_$OutputArtifactsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutputArtifactsModelImplToJson(
      this,
    );
  }
}

abstract class _OutputArtifactsModel implements OutputArtifactsModel {
  const factory _OutputArtifactsModel(
      {final String? androidLegacyArtifactId,
      final String? androidAdaptiveForegroundArtifactId,
      final String? androidAdaptiveBackgroundArtifactId,
      final String? iosArtifactId,
      final String? webArtifactId}) = _$OutputArtifactsModelImpl;

  factory _OutputArtifactsModel.fromJson(Map<String, dynamic> json) =
      _$OutputArtifactsModelImpl.fromJson;

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

  /// Create a copy of OutputArtifactsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutputArtifactsModelImplCopyWith<_$OutputArtifactsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LaunchAssetsModel _$LaunchAssetsModelFromJson(Map<String, dynamic> json) {
  return _LaunchAssetsModel.fromJson(json);
}

/// @nodoc
mixin _$LaunchAssetsModel {
  String get id => throw _privateConstructorUsedError;
  String get applicationId => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  SourceConfigModel? get source => throw _privateConstructorUsedError;
  PlatformParamsModel? get params => throw _privateConstructorUsedError;
  OutputArtifactsModel? get outputsArtifacts =>
      throw _privateConstructorUsedError;

  /// Serializes this LaunchAssetsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LaunchAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaunchAssetsModelCopyWith<LaunchAssetsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchAssetsModelCopyWith<$Res> {
  factory $LaunchAssetsModelCopyWith(
          LaunchAssetsModel value, $Res Function(LaunchAssetsModel) then) =
      _$LaunchAssetsModelCopyWithImpl<$Res, LaunchAssetsModel>;
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      DateTime createdAt,
      DateTime updatedAt,
      SourceConfigModel? source,
      PlatformParamsModel? params,
      OutputArtifactsModel? outputsArtifacts});

  $SourceConfigModelCopyWith<$Res>? get source;
  $PlatformParamsModelCopyWith<$Res>? get params;
  $OutputArtifactsModelCopyWith<$Res>? get outputsArtifacts;
}

/// @nodoc
class _$LaunchAssetsModelCopyWithImpl<$Res, $Val extends LaunchAssetsModel>
    implements $LaunchAssetsModelCopyWith<$Res> {
  _$LaunchAssetsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchAssetsModel
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceConfigModel?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as PlatformParamsModel?,
      outputsArtifacts: freezed == outputsArtifacts
          ? _value.outputsArtifacts
          : outputsArtifacts // ignore: cast_nullable_to_non_nullable
              as OutputArtifactsModel?,
    ) as $Val);
  }

  /// Create a copy of LaunchAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SourceConfigModelCopyWith<$Res>? get source {
    if (_value.source == null) {
      return null;
    }

    return $SourceConfigModelCopyWith<$Res>(_value.source!, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformParamsModelCopyWith<$Res>? get params {
    if (_value.params == null) {
      return null;
    }

    return $PlatformParamsModelCopyWith<$Res>(_value.params!, (value) {
      return _then(_value.copyWith(params: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutputArtifactsModelCopyWith<$Res>? get outputsArtifacts {
    if (_value.outputsArtifacts == null) {
      return null;
    }

    return $OutputArtifactsModelCopyWith<$Res>(_value.outputsArtifacts!,
        (value) {
      return _then(_value.copyWith(outputsArtifacts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LaunchAssetsModelImplCopyWith<$Res>
    implements $LaunchAssetsModelCopyWith<$Res> {
  factory _$$LaunchAssetsModelImplCopyWith(_$LaunchAssetsModelImpl value,
          $Res Function(_$LaunchAssetsModelImpl) then) =
      __$$LaunchAssetsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String themeId,
      DateTime createdAt,
      DateTime updatedAt,
      SourceConfigModel? source,
      PlatformParamsModel? params,
      OutputArtifactsModel? outputsArtifacts});

  @override
  $SourceConfigModelCopyWith<$Res>? get source;
  @override
  $PlatformParamsModelCopyWith<$Res>? get params;
  @override
  $OutputArtifactsModelCopyWith<$Res>? get outputsArtifacts;
}

/// @nodoc
class __$$LaunchAssetsModelImplCopyWithImpl<$Res>
    extends _$LaunchAssetsModelCopyWithImpl<$Res, _$LaunchAssetsModelImpl>
    implements _$$LaunchAssetsModelImplCopyWith<$Res> {
  __$$LaunchAssetsModelImplCopyWithImpl(_$LaunchAssetsModelImpl _value,
      $Res Function(_$LaunchAssetsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchAssetsModel
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
    return _then(_$LaunchAssetsModelImpl(
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceConfigModel?,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as PlatformParamsModel?,
      outputsArtifacts: freezed == outputsArtifacts
          ? _value.outputsArtifacts
          : outputsArtifacts // ignore: cast_nullable_to_non_nullable
              as OutputArtifactsModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LaunchAssetsModelImpl implements _LaunchAssetsModel {
  const _$LaunchAssetsModelImpl(
      {required this.id,
      required this.applicationId,
      required this.themeId,
      required this.createdAt,
      required this.updatedAt,
      this.source,
      this.params,
      this.outputsArtifacts});

  factory _$LaunchAssetsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaunchAssetsModelImplFromJson(json);

  @override
  final String id;
  @override
  final String applicationId;
  @override
  final String themeId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final SourceConfigModel? source;
  @override
  final PlatformParamsModel? params;
  @override
  final OutputArtifactsModel? outputsArtifacts;

  @override
  String toString() {
    return 'LaunchAssetsModel(id: $id, applicationId: $applicationId, themeId: $themeId, createdAt: $createdAt, updatedAt: $updatedAt, source: $source, params: $params, outputsArtifacts: $outputsArtifacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchAssetsModelImpl &&
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

  /// Create a copy of LaunchAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchAssetsModelImplCopyWith<_$LaunchAssetsModelImpl> get copyWith =>
      __$$LaunchAssetsModelImplCopyWithImpl<_$LaunchAssetsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaunchAssetsModelImplToJson(
      this,
    );
  }
}

abstract class _LaunchAssetsModel implements LaunchAssetsModel {
  const factory _LaunchAssetsModel(
      {required final String id,
      required final String applicationId,
      required final String themeId,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final SourceConfigModel? source,
      final PlatformParamsModel? params,
      final OutputArtifactsModel? outputsArtifacts}) = _$LaunchAssetsModelImpl;

  factory _LaunchAssetsModel.fromJson(Map<String, dynamic> json) =
      _$LaunchAssetsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get applicationId;
  @override
  String get themeId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  SourceConfigModel? get source;
  @override
  PlatformParamsModel? get params;
  @override
  OutputArtifactsModel? get outputsArtifacts;

  /// Create a copy of LaunchAssetsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchAssetsModelImplCopyWith<_$LaunchAssetsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationSlice _$ValidationSliceFromJson(Map<String, dynamic> json) {
  return _ValidationSlice.fromJson(json);
}

/// @nodoc
mixin _$ValidationSlice {
  bool get compliant => throw _privateConstructorUsedError;
  double get deltaDp => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this ValidationSlice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidationSlice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationSliceCopyWith<ValidationSlice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationSliceCopyWith<$Res> {
  factory $ValidationSliceCopyWith(
          ValidationSlice value, $Res Function(ValidationSlice) then) =
      _$ValidationSliceCopyWithImpl<$Res, ValidationSlice>;
  @useResult
  $Res call({bool compliant, double deltaDp, String? message});
}

/// @nodoc
class _$ValidationSliceCopyWithImpl<$Res, $Val extends ValidationSlice>
    implements $ValidationSliceCopyWith<$Res> {
  _$ValidationSliceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationSlice
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
abstract class _$$ValidationSliceImplCopyWith<$Res>
    implements $ValidationSliceCopyWith<$Res> {
  factory _$$ValidationSliceImplCopyWith(_$ValidationSliceImpl value,
          $Res Function(_$ValidationSliceImpl) then) =
      __$$ValidationSliceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool compliant, double deltaDp, String? message});
}

/// @nodoc
class __$$ValidationSliceImplCopyWithImpl<$Res>
    extends _$ValidationSliceCopyWithImpl<$Res, _$ValidationSliceImpl>
    implements _$$ValidationSliceImplCopyWith<$Res> {
  __$$ValidationSliceImplCopyWithImpl(
      _$ValidationSliceImpl _value, $Res Function(_$ValidationSliceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidationSlice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compliant = null,
    Object? deltaDp = null,
    Object? message = freezed,
  }) {
    return _then(_$ValidationSliceImpl(
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
class _$ValidationSliceImpl implements _ValidationSlice {
  const _$ValidationSliceImpl(
      {required this.compliant, required this.deltaDp, this.message});

  factory _$ValidationSliceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationSliceImplFromJson(json);

  @override
  final bool compliant;
  @override
  final double deltaDp;
  @override
  final String? message;

  @override
  String toString() {
    return 'ValidationSlice(compliant: $compliant, deltaDp: $deltaDp, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationSliceImpl &&
            (identical(other.compliant, compliant) ||
                other.compliant == compliant) &&
            (identical(other.deltaDp, deltaDp) || other.deltaDp == deltaDp) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, compliant, deltaDp, message);

  /// Create a copy of ValidationSlice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationSliceImplCopyWith<_$ValidationSliceImpl> get copyWith =>
      __$$ValidationSliceImplCopyWithImpl<_$ValidationSliceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationSliceImplToJson(
      this,
    );
  }
}

abstract class _ValidationSlice implements ValidationSlice {
  const factory _ValidationSlice(
      {required final bool compliant,
      required final double deltaDp,
      final String? message}) = _$ValidationSliceImpl;

  factory _ValidationSlice.fromJson(Map<String, dynamic> json) =
      _$ValidationSliceImpl.fromJson;

  @override
  bool get compliant;
  @override
  double get deltaDp;
  @override
  String? get message;

  /// Create a copy of ValidationSlice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationSliceImplCopyWith<_$ValidationSliceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidationReport _$ValidationReportFromJson(Map<String, dynamic> json) {
  return _ValidationReport.fromJson(json);
}

/// @nodoc
mixin _$ValidationReport {
  ValidationSlice? get androidLegacy => throw _privateConstructorUsedError;
  ValidationSlice? get androidAdaptive => throw _privateConstructorUsedError;
  ValidationSlice? get ios => throw _privateConstructorUsedError;
  ValidationSlice? get web => throw _privateConstructorUsedError;

  /// Serializes this ValidationReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidationReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationReportCopyWith<ValidationReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationReportCopyWith<$Res> {
  factory $ValidationReportCopyWith(
          ValidationReport value, $Res Function(ValidationReport) then) =
      _$ValidationReportCopyWithImpl<$Res, ValidationReport>;
  @useResult
  $Res call(
      {ValidationSlice? androidLegacy,
      ValidationSlice? androidAdaptive,
      ValidationSlice? ios,
      ValidationSlice? web});

  $ValidationSliceCopyWith<$Res>? get androidLegacy;
  $ValidationSliceCopyWith<$Res>? get androidAdaptive;
  $ValidationSliceCopyWith<$Res>? get ios;
  $ValidationSliceCopyWith<$Res>? get web;
}

/// @nodoc
class _$ValidationReportCopyWithImpl<$Res, $Val extends ValidationReport>
    implements $ValidationReportCopyWith<$Res> {
  _$ValidationReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationReport
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
              as ValidationSlice?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as ValidationSlice?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as ValidationSlice?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as ValidationSlice?,
    ) as $Val);
  }

  /// Create a copy of ValidationReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationSliceCopyWith<$Res>? get androidLegacy {
    if (_value.androidLegacy == null) {
      return null;
    }

    return $ValidationSliceCopyWith<$Res>(_value.androidLegacy!, (value) {
      return _then(_value.copyWith(androidLegacy: value) as $Val);
    });
  }

  /// Create a copy of ValidationReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationSliceCopyWith<$Res>? get androidAdaptive {
    if (_value.androidAdaptive == null) {
      return null;
    }

    return $ValidationSliceCopyWith<$Res>(_value.androidAdaptive!, (value) {
      return _then(_value.copyWith(androidAdaptive: value) as $Val);
    });
  }

  /// Create a copy of ValidationReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationSliceCopyWith<$Res>? get ios {
    if (_value.ios == null) {
      return null;
    }

    return $ValidationSliceCopyWith<$Res>(_value.ios!, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  /// Create a copy of ValidationReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationSliceCopyWith<$Res>? get web {
    if (_value.web == null) {
      return null;
    }

    return $ValidationSliceCopyWith<$Res>(_value.web!, (value) {
      return _then(_value.copyWith(web: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ValidationReportImplCopyWith<$Res>
    implements $ValidationReportCopyWith<$Res> {
  factory _$$ValidationReportImplCopyWith(_$ValidationReportImpl value,
          $Res Function(_$ValidationReportImpl) then) =
      __$$ValidationReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ValidationSlice? androidLegacy,
      ValidationSlice? androidAdaptive,
      ValidationSlice? ios,
      ValidationSlice? web});

  @override
  $ValidationSliceCopyWith<$Res>? get androidLegacy;
  @override
  $ValidationSliceCopyWith<$Res>? get androidAdaptive;
  @override
  $ValidationSliceCopyWith<$Res>? get ios;
  @override
  $ValidationSliceCopyWith<$Res>? get web;
}

/// @nodoc
class __$$ValidationReportImplCopyWithImpl<$Res>
    extends _$ValidationReportCopyWithImpl<$Res, _$ValidationReportImpl>
    implements _$$ValidationReportImplCopyWith<$Res> {
  __$$ValidationReportImplCopyWithImpl(_$ValidationReportImpl _value,
      $Res Function(_$ValidationReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidationReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidLegacy = freezed,
    Object? androidAdaptive = freezed,
    Object? ios = freezed,
    Object? web = freezed,
  }) {
    return _then(_$ValidationReportImpl(
      androidLegacy: freezed == androidLegacy
          ? _value.androidLegacy
          : androidLegacy // ignore: cast_nullable_to_non_nullable
              as ValidationSlice?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as ValidationSlice?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as ValidationSlice?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as ValidationSlice?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationReportImpl implements _ValidationReport {
  const _$ValidationReportImpl(
      {this.androidLegacy, this.androidAdaptive, this.ios, this.web});

  factory _$ValidationReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationReportImplFromJson(json);

  @override
  final ValidationSlice? androidLegacy;
  @override
  final ValidationSlice? androidAdaptive;
  @override
  final ValidationSlice? ios;
  @override
  final ValidationSlice? web;

  @override
  String toString() {
    return 'ValidationReport(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationReportImpl &&
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

  /// Create a copy of ValidationReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationReportImplCopyWith<_$ValidationReportImpl> get copyWith =>
      __$$ValidationReportImplCopyWithImpl<_$ValidationReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationReportImplToJson(
      this,
    );
  }
}

abstract class _ValidationReport implements ValidationReport {
  const factory _ValidationReport(
      {final ValidationSlice? androidLegacy,
      final ValidationSlice? androidAdaptive,
      final ValidationSlice? ios,
      final ValidationSlice? web}) = _$ValidationReportImpl;

  factory _ValidationReport.fromJson(Map<String, dynamic> json) =
      _$ValidationReportImpl.fromJson;

  @override
  ValidationSlice? get androidLegacy;
  @override
  ValidationSlice? get androidAdaptive;
  @override
  ValidationSlice? get ios;
  @override
  ValidationSlice? get web;

  /// Create a copy of ValidationReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationReportImplCopyWith<_$ValidationReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LaunchAssetsEnvelope _$LaunchAssetsEnvelopeFromJson(Map<String, dynamic> json) {
  return _LaunchAssetsEnvelope.fromJson(json);
}

/// @nodoc
mixin _$LaunchAssetsEnvelope {
  LaunchAssetsModel get entity => throw _privateConstructorUsedError;
  Map<String, String>? get urls => throw _privateConstructorUsedError;
  ValidationReport? get validation => throw _privateConstructorUsedError;

  /// Serializes this LaunchAssetsEnvelope to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LaunchAssetsEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaunchAssetsEnvelopeCopyWith<LaunchAssetsEnvelope> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchAssetsEnvelopeCopyWith<$Res> {
  factory $LaunchAssetsEnvelopeCopyWith(LaunchAssetsEnvelope value,
          $Res Function(LaunchAssetsEnvelope) then) =
      _$LaunchAssetsEnvelopeCopyWithImpl<$Res, LaunchAssetsEnvelope>;
  @useResult
  $Res call(
      {LaunchAssetsModel entity,
      Map<String, String>? urls,
      ValidationReport? validation});

  $LaunchAssetsModelCopyWith<$Res> get entity;
  $ValidationReportCopyWith<$Res>? get validation;
}

/// @nodoc
class _$LaunchAssetsEnvelopeCopyWithImpl<$Res,
        $Val extends LaunchAssetsEnvelope>
    implements $LaunchAssetsEnvelopeCopyWith<$Res> {
  _$LaunchAssetsEnvelopeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchAssetsEnvelope
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
              as LaunchAssetsModel,
      urls: freezed == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      validation: freezed == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ValidationReport?,
    ) as $Val);
  }

  /// Create a copy of LaunchAssetsEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetsModelCopyWith<$Res> get entity {
    return $LaunchAssetsModelCopyWith<$Res>(_value.entity, (value) {
      return _then(_value.copyWith(entity: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationReportCopyWith<$Res>? get validation {
    if (_value.validation == null) {
      return null;
    }

    return $ValidationReportCopyWith<$Res>(_value.validation!, (value) {
      return _then(_value.copyWith(validation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LaunchAssetsEnvelopeImplCopyWith<$Res>
    implements $LaunchAssetsEnvelopeCopyWith<$Res> {
  factory _$$LaunchAssetsEnvelopeImplCopyWith(_$LaunchAssetsEnvelopeImpl value,
          $Res Function(_$LaunchAssetsEnvelopeImpl) then) =
      __$$LaunchAssetsEnvelopeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LaunchAssetsModel entity,
      Map<String, String>? urls,
      ValidationReport? validation});

  @override
  $LaunchAssetsModelCopyWith<$Res> get entity;
  @override
  $ValidationReportCopyWith<$Res>? get validation;
}

/// @nodoc
class __$$LaunchAssetsEnvelopeImplCopyWithImpl<$Res>
    extends _$LaunchAssetsEnvelopeCopyWithImpl<$Res, _$LaunchAssetsEnvelopeImpl>
    implements _$$LaunchAssetsEnvelopeImplCopyWith<$Res> {
  __$$LaunchAssetsEnvelopeImplCopyWithImpl(_$LaunchAssetsEnvelopeImpl _value,
      $Res Function(_$LaunchAssetsEnvelopeImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchAssetsEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? urls = freezed,
    Object? validation = freezed,
  }) {
    return _then(_$LaunchAssetsEnvelopeImpl(
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as LaunchAssetsModel,
      urls: freezed == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      validation: freezed == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ValidationReport?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LaunchAssetsEnvelopeImpl implements _LaunchAssetsEnvelope {
  const _$LaunchAssetsEnvelopeImpl(
      {required this.entity, final Map<String, String>? urls, this.validation})
      : _urls = urls;

  factory _$LaunchAssetsEnvelopeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaunchAssetsEnvelopeImplFromJson(json);

  @override
  final LaunchAssetsModel entity;
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
  final ValidationReport? validation;

  @override
  String toString() {
    return 'LaunchAssetsEnvelope(entity: $entity, urls: $urls, validation: $validation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchAssetsEnvelopeImpl &&
            (identical(other.entity, entity) || other.entity == entity) &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.validation, validation) ||
                other.validation == validation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, entity,
      const DeepCollectionEquality().hash(_urls), validation);

  /// Create a copy of LaunchAssetsEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchAssetsEnvelopeImplCopyWith<_$LaunchAssetsEnvelopeImpl>
      get copyWith =>
          __$$LaunchAssetsEnvelopeImplCopyWithImpl<_$LaunchAssetsEnvelopeImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaunchAssetsEnvelopeImplToJson(
      this,
    );
  }
}

abstract class _LaunchAssetsEnvelope implements LaunchAssetsEnvelope {
  const factory _LaunchAssetsEnvelope(
      {required final LaunchAssetsModel entity,
      final Map<String, String>? urls,
      final ValidationReport? validation}) = _$LaunchAssetsEnvelopeImpl;

  factory _LaunchAssetsEnvelope.fromJson(Map<String, dynamic> json) =
      _$LaunchAssetsEnvelopeImpl.fromJson;

  @override
  LaunchAssetsModel get entity;
  @override
  Map<String, String>? get urls;
  @override
  ValidationReport? get validation;

  /// Create a copy of LaunchAssetsEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchAssetsEnvelopeImplCopyWith<_$LaunchAssetsEnvelopeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
