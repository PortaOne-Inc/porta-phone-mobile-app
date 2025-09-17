// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'constraints_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlatformConstraintsDto _$PlatformConstraintsDtoFromJson(
    Map<String, dynamic> json) {
  return _PlatformConstraintsDto.fromJson(json);
}

/// @nodoc
mixin _$PlatformConstraintsDto {
  double? get sizeDp => throw _privateConstructorUsedError;
  double? get safeZoneDp => throw _privateConstructorUsedError;
  double? get toleranceDp => throw _privateConstructorUsedError;

  /// Serializes this PlatformConstraintsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlatformConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformConstraintsDtoCopyWith<PlatformConstraintsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformConstraintsDtoCopyWith<$Res> {
  factory $PlatformConstraintsDtoCopyWith(PlatformConstraintsDto value,
          $Res Function(PlatformConstraintsDto) then) =
      _$PlatformConstraintsDtoCopyWithImpl<$Res, PlatformConstraintsDto>;
  @useResult
  $Res call({double? sizeDp, double? safeZoneDp, double? toleranceDp});
}

/// @nodoc
class _$PlatformConstraintsDtoCopyWithImpl<$Res,
        $Val extends PlatformConstraintsDto>
    implements $PlatformConstraintsDtoCopyWith<$Res> {
  _$PlatformConstraintsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sizeDp = freezed,
    Object? safeZoneDp = freezed,
    Object? toleranceDp = freezed,
  }) {
    return _then(_value.copyWith(
      sizeDp: freezed == sizeDp
          ? _value.sizeDp
          : sizeDp // ignore: cast_nullable_to_non_nullable
              as double?,
      safeZoneDp: freezed == safeZoneDp
          ? _value.safeZoneDp
          : safeZoneDp // ignore: cast_nullable_to_non_nullable
              as double?,
      toleranceDp: freezed == toleranceDp
          ? _value.toleranceDp
          : toleranceDp // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlatformConstraintsDtoImplCopyWith<$Res>
    implements $PlatformConstraintsDtoCopyWith<$Res> {
  factory _$$PlatformConstraintsDtoImplCopyWith(
          _$PlatformConstraintsDtoImpl value,
          $Res Function(_$PlatformConstraintsDtoImpl) then) =
      __$$PlatformConstraintsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? sizeDp, double? safeZoneDp, double? toleranceDp});
}

/// @nodoc
class __$$PlatformConstraintsDtoImplCopyWithImpl<$Res>
    extends _$PlatformConstraintsDtoCopyWithImpl<$Res,
        _$PlatformConstraintsDtoImpl>
    implements _$$PlatformConstraintsDtoImplCopyWith<$Res> {
  __$$PlatformConstraintsDtoImplCopyWithImpl(
      _$PlatformConstraintsDtoImpl _value,
      $Res Function(_$PlatformConstraintsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlatformConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sizeDp = freezed,
    Object? safeZoneDp = freezed,
    Object? toleranceDp = freezed,
  }) {
    return _then(_$PlatformConstraintsDtoImpl(
      sizeDp: freezed == sizeDp
          ? _value.sizeDp
          : sizeDp // ignore: cast_nullable_to_non_nullable
              as double?,
      safeZoneDp: freezed == safeZoneDp
          ? _value.safeZoneDp
          : safeZoneDp // ignore: cast_nullable_to_non_nullable
              as double?,
      toleranceDp: freezed == toleranceDp
          ? _value.toleranceDp
          : toleranceDp // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlatformConstraintsDtoImpl implements _PlatformConstraintsDto {
  const _$PlatformConstraintsDtoImpl(
      {this.sizeDp, this.safeZoneDp, this.toleranceDp});

  factory _$PlatformConstraintsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlatformConstraintsDtoImplFromJson(json);

  @override
  final double? sizeDp;
  @override
  final double? safeZoneDp;
  @override
  final double? toleranceDp;

  @override
  String toString() {
    return 'PlatformConstraintsDto(sizeDp: $sizeDp, safeZoneDp: $safeZoneDp, toleranceDp: $toleranceDp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformConstraintsDtoImpl &&
            (identical(other.sizeDp, sizeDp) || other.sizeDp == sizeDp) &&
            (identical(other.safeZoneDp, safeZoneDp) ||
                other.safeZoneDp == safeZoneDp) &&
            (identical(other.toleranceDp, toleranceDp) ||
                other.toleranceDp == toleranceDp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sizeDp, safeZoneDp, toleranceDp);

  /// Create a copy of PlatformConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformConstraintsDtoImplCopyWith<_$PlatformConstraintsDtoImpl>
      get copyWith => __$$PlatformConstraintsDtoImplCopyWithImpl<
          _$PlatformConstraintsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlatformConstraintsDtoImplToJson(
      this,
    );
  }
}

abstract class _PlatformConstraintsDto implements PlatformConstraintsDto {
  const factory _PlatformConstraintsDto(
      {final double? sizeDp,
      final double? safeZoneDp,
      final double? toleranceDp}) = _$PlatformConstraintsDtoImpl;

  factory _PlatformConstraintsDto.fromJson(Map<String, dynamic> json) =
      _$PlatformConstraintsDtoImpl.fromJson;

  @override
  double? get sizeDp;
  @override
  double? get safeZoneDp;
  @override
  double? get toleranceDp;

  /// Create a copy of PlatformConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformConstraintsDtoImplCopyWith<_$PlatformConstraintsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ConstraintsDto _$ConstraintsDtoFromJson(Map<String, dynamic> json) {
  return _ConstraintsDto.fromJson(json);
}

/// @nodoc
mixin _$ConstraintsDto {
  PlatformConstraintsDto? get androidLegacy =>
      throw _privateConstructorUsedError;
  PlatformConstraintsDto? get androidAdaptive =>
      throw _privateConstructorUsedError;
  PlatformConstraintsDto? get ios => throw _privateConstructorUsedError;
  PlatformConstraintsDto? get web => throw _privateConstructorUsedError;

  /// Serializes this ConstraintsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConstraintsDtoCopyWith<ConstraintsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConstraintsDtoCopyWith<$Res> {
  factory $ConstraintsDtoCopyWith(
          ConstraintsDto value, $Res Function(ConstraintsDto) then) =
      _$ConstraintsDtoCopyWithImpl<$Res, ConstraintsDto>;
  @useResult
  $Res call(
      {PlatformConstraintsDto? androidLegacy,
      PlatformConstraintsDto? androidAdaptive,
      PlatformConstraintsDto? ios,
      PlatformConstraintsDto? web});

  $PlatformConstraintsDtoCopyWith<$Res>? get androidLegacy;
  $PlatformConstraintsDtoCopyWith<$Res>? get androidAdaptive;
  $PlatformConstraintsDtoCopyWith<$Res>? get ios;
  $PlatformConstraintsDtoCopyWith<$Res>? get web;
}

/// @nodoc
class _$ConstraintsDtoCopyWithImpl<$Res, $Val extends ConstraintsDto>
    implements $ConstraintsDtoCopyWith<$Res> {
  _$ConstraintsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConstraintsDto
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
              as PlatformConstraintsDto?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as PlatformConstraintsDto?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as PlatformConstraintsDto?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as PlatformConstraintsDto?,
    ) as $Val);
  }

  /// Create a copy of ConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformConstraintsDtoCopyWith<$Res>? get androidLegacy {
    if (_value.androidLegacy == null) {
      return null;
    }

    return $PlatformConstraintsDtoCopyWith<$Res>(_value.androidLegacy!,
        (value) {
      return _then(_value.copyWith(androidLegacy: value) as $Val);
    });
  }

  /// Create a copy of ConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformConstraintsDtoCopyWith<$Res>? get androidAdaptive {
    if (_value.androidAdaptive == null) {
      return null;
    }

    return $PlatformConstraintsDtoCopyWith<$Res>(_value.androidAdaptive!,
        (value) {
      return _then(_value.copyWith(androidAdaptive: value) as $Val);
    });
  }

  /// Create a copy of ConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformConstraintsDtoCopyWith<$Res>? get ios {
    if (_value.ios == null) {
      return null;
    }

    return $PlatformConstraintsDtoCopyWith<$Res>(_value.ios!, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  /// Create a copy of ConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlatformConstraintsDtoCopyWith<$Res>? get web {
    if (_value.web == null) {
      return null;
    }

    return $PlatformConstraintsDtoCopyWith<$Res>(_value.web!, (value) {
      return _then(_value.copyWith(web: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConstraintsDtoImplCopyWith<$Res>
    implements $ConstraintsDtoCopyWith<$Res> {
  factory _$$ConstraintsDtoImplCopyWith(_$ConstraintsDtoImpl value,
          $Res Function(_$ConstraintsDtoImpl) then) =
      __$$ConstraintsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlatformConstraintsDto? androidLegacy,
      PlatformConstraintsDto? androidAdaptive,
      PlatformConstraintsDto? ios,
      PlatformConstraintsDto? web});

  @override
  $PlatformConstraintsDtoCopyWith<$Res>? get androidLegacy;
  @override
  $PlatformConstraintsDtoCopyWith<$Res>? get androidAdaptive;
  @override
  $PlatformConstraintsDtoCopyWith<$Res>? get ios;
  @override
  $PlatformConstraintsDtoCopyWith<$Res>? get web;
}

/// @nodoc
class __$$ConstraintsDtoImplCopyWithImpl<$Res>
    extends _$ConstraintsDtoCopyWithImpl<$Res, _$ConstraintsDtoImpl>
    implements _$$ConstraintsDtoImplCopyWith<$Res> {
  __$$ConstraintsDtoImplCopyWithImpl(
      _$ConstraintsDtoImpl _value, $Res Function(_$ConstraintsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidLegacy = freezed,
    Object? androidAdaptive = freezed,
    Object? ios = freezed,
    Object? web = freezed,
  }) {
    return _then(_$ConstraintsDtoImpl(
      androidLegacy: freezed == androidLegacy
          ? _value.androidLegacy
          : androidLegacy // ignore: cast_nullable_to_non_nullable
              as PlatformConstraintsDto?,
      androidAdaptive: freezed == androidAdaptive
          ? _value.androidAdaptive
          : androidAdaptive // ignore: cast_nullable_to_non_nullable
              as PlatformConstraintsDto?,
      ios: freezed == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as PlatformConstraintsDto?,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as PlatformConstraintsDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConstraintsDtoImpl implements _ConstraintsDto {
  const _$ConstraintsDtoImpl(
      {this.androidLegacy, this.androidAdaptive, this.ios, this.web});

  factory _$ConstraintsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConstraintsDtoImplFromJson(json);

  @override
  final PlatformConstraintsDto? androidLegacy;
  @override
  final PlatformConstraintsDto? androidAdaptive;
  @override
  final PlatformConstraintsDto? ios;
  @override
  final PlatformConstraintsDto? web;

  @override
  String toString() {
    return 'ConstraintsDto(androidLegacy: $androidLegacy, androidAdaptive: $androidAdaptive, ios: $ios, web: $web)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConstraintsDtoImpl &&
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

  /// Create a copy of ConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConstraintsDtoImplCopyWith<_$ConstraintsDtoImpl> get copyWith =>
      __$$ConstraintsDtoImplCopyWithImpl<_$ConstraintsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConstraintsDtoImplToJson(
      this,
    );
  }
}

abstract class _ConstraintsDto implements ConstraintsDto {
  const factory _ConstraintsDto(
      {final PlatformConstraintsDto? androidLegacy,
      final PlatformConstraintsDto? androidAdaptive,
      final PlatformConstraintsDto? ios,
      final PlatformConstraintsDto? web}) = _$ConstraintsDtoImpl;

  factory _ConstraintsDto.fromJson(Map<String, dynamic> json) =
      _$ConstraintsDtoImpl.fromJson;

  @override
  PlatformConstraintsDto? get androidLegacy;
  @override
  PlatformConstraintsDto? get androidAdaptive;
  @override
  PlatformConstraintsDto? get ios;
  @override
  PlatformConstraintsDto? get web;

  /// Create a copy of ConstraintsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConstraintsDtoImplCopyWith<_$ConstraintsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
