// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_scheme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ColorSchemeModel {
  String get seed => throw _privateConstructorUsedError;
  Map<String, String?> get colors => throw _privateConstructorUsedError;
  List<String>? get gradientTabColor => throw _privateConstructorUsedError;
  LaunchModel? get launch => throw _privateConstructorUsedError;

  /// Create a copy of ColorSchemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorSchemeModelCopyWith<ColorSchemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorSchemeModelCopyWith<$Res> {
  factory $ColorSchemeModelCopyWith(
          ColorSchemeModel value, $Res Function(ColorSchemeModel) then) =
      _$ColorSchemeModelCopyWithImpl<$Res, ColorSchemeModel>;
  @useResult
  $Res call(
      {String seed,
      Map<String, String?> colors,
      List<String>? gradientTabColor,
      LaunchModel? launch});

  $LaunchModelCopyWith<$Res>? get launch;
}

/// @nodoc
class _$ColorSchemeModelCopyWithImpl<$Res, $Val extends ColorSchemeModel>
    implements $ColorSchemeModelCopyWith<$Res> {
  _$ColorSchemeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorSchemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = null,
    Object? colors = null,
    Object? gradientTabColor = freezed,
    Object? launch = freezed,
  }) {
    return _then(_value.copyWith(
      seed: null == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as String,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      gradientTabColor: freezed == gradientTabColor
          ? _value.gradientTabColor
          : gradientTabColor // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      launch: freezed == launch
          ? _value.launch
          : launch // ignore: cast_nullable_to_non_nullable
              as LaunchModel?,
    ) as $Val);
  }

  /// Create a copy of ColorSchemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchModelCopyWith<$Res>? get launch {
    if (_value.launch == null) {
      return null;
    }

    return $LaunchModelCopyWith<$Res>(_value.launch!, (value) {
      return _then(_value.copyWith(launch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ColorModelImplCopyWith<$Res>
    implements $ColorSchemeModelCopyWith<$Res> {
  factory _$$ColorModelImplCopyWith(
          _$ColorModelImpl value, $Res Function(_$ColorModelImpl) then) =
      __$$ColorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String seed,
      Map<String, String?> colors,
      List<String>? gradientTabColor,
      LaunchModel? launch});

  @override
  $LaunchModelCopyWith<$Res>? get launch;
}

/// @nodoc
class __$$ColorModelImplCopyWithImpl<$Res>
    extends _$ColorSchemeModelCopyWithImpl<$Res, _$ColorModelImpl>
    implements _$$ColorModelImplCopyWith<$Res> {
  __$$ColorModelImplCopyWithImpl(
      _$ColorModelImpl _value, $Res Function(_$ColorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorSchemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = null,
    Object? colors = null,
    Object? gradientTabColor = freezed,
    Object? launch = freezed,
  }) {
    return _then(_$ColorModelImpl(
      seed: null == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as String,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
      gradientTabColor: freezed == gradientTabColor
          ? _value._gradientTabColor
          : gradientTabColor // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      launch: freezed == launch
          ? _value.launch
          : launch // ignore: cast_nullable_to_non_nullable
              as LaunchModel?,
    ));
  }
}

/// @nodoc

class _$ColorModelImpl extends _ColorModel {
  const _$ColorModelImpl(
      {this.seed = '#FFFFFF',
      final Map<String, String?> colors = const {},
      final List<String>? gradientTabColor,
      this.launch})
      : _colors = colors,
        _gradientTabColor = gradientTabColor,
        super._();

  @override
  @JsonKey()
  final String seed;
  final Map<String, String?> _colors;
  @override
  @JsonKey()
  Map<String, String?> get colors {
    if (_colors is EqualUnmodifiableMapView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_colors);
  }

  final List<String>? _gradientTabColor;
  @override
  List<String>? get gradientTabColor {
    final value = _gradientTabColor;
    if (value == null) return null;
    if (_gradientTabColor is EqualUnmodifiableListView)
      return _gradientTabColor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final LaunchModel? launch;

  @override
  String toString() {
    return 'ColorSchemeModel(seed: $seed, colors: $colors, gradientTabColor: $gradientTabColor, launch: $launch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorModelImpl &&
            (identical(other.seed, seed) || other.seed == seed) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            const DeepCollectionEquality()
                .equals(other._gradientTabColor, _gradientTabColor) &&
            (identical(other.launch, launch) || other.launch == launch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      seed,
      const DeepCollectionEquality().hash(_colors),
      const DeepCollectionEquality().hash(_gradientTabColor),
      launch);

  /// Create a copy of ColorSchemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorModelImplCopyWith<_$ColorModelImpl> get copyWith =>
      __$$ColorModelImplCopyWithImpl<_$ColorModelImpl>(this, _$identity);
}

abstract class _ColorModel extends ColorSchemeModel {
  const factory _ColorModel(
      {final String seed,
      final Map<String, String?> colors,
      final List<String>? gradientTabColor,
      final LaunchModel? launch}) = _$ColorModelImpl;
  const _ColorModel._() : super._();

  @override
  String get seed;
  @override
  Map<String, String?> get colors;
  @override
  List<String>? get gradientTabColor;
  @override
  LaunchModel? get launch;

  /// Create a copy of ColorSchemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorModelImplCopyWith<_$ColorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LaunchModel {
  String? get adaptiveIconBackground => throw _privateConstructorUsedError;
  String? get splashBackground => throw _privateConstructorUsedError;

  /// Create a copy of LaunchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaunchModelCopyWith<LaunchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchModelCopyWith<$Res> {
  factory $LaunchModelCopyWith(
          LaunchModel value, $Res Function(LaunchModel) then) =
      _$LaunchModelCopyWithImpl<$Res, LaunchModel>;
  @useResult
  $Res call({String? adaptiveIconBackground, String? splashBackground});
}

/// @nodoc
class _$LaunchModelCopyWithImpl<$Res, $Val extends LaunchModel>
    implements $LaunchModelCopyWith<$Res> {
  _$LaunchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adaptiveIconBackground = freezed,
    Object? splashBackground = freezed,
  }) {
    return _then(_value.copyWith(
      adaptiveIconBackground: freezed == adaptiveIconBackground
          ? _value.adaptiveIconBackground
          : adaptiveIconBackground // ignore: cast_nullable_to_non_nullable
              as String?,
      splashBackground: freezed == splashBackground
          ? _value.splashBackground
          : splashBackground // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LaunchModelImplCopyWith<$Res>
    implements $LaunchModelCopyWith<$Res> {
  factory _$$LaunchModelImplCopyWith(
          _$LaunchModelImpl value, $Res Function(_$LaunchModelImpl) then) =
      __$$LaunchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? adaptiveIconBackground, String? splashBackground});
}

/// @nodoc
class __$$LaunchModelImplCopyWithImpl<$Res>
    extends _$LaunchModelCopyWithImpl<$Res, _$LaunchModelImpl>
    implements _$$LaunchModelImplCopyWith<$Res> {
  __$$LaunchModelImplCopyWithImpl(
      _$LaunchModelImpl _value, $Res Function(_$LaunchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adaptiveIconBackground = freezed,
    Object? splashBackground = freezed,
  }) {
    return _then(_$LaunchModelImpl(
      adaptiveIconBackground: freezed == adaptiveIconBackground
          ? _value.adaptiveIconBackground
          : adaptiveIconBackground // ignore: cast_nullable_to_non_nullable
              as String?,
      splashBackground: freezed == splashBackground
          ? _value.splashBackground
          : splashBackground // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LaunchModelImpl implements _LaunchModel {
  const _$LaunchModelImpl({this.adaptiveIconBackground, this.splashBackground});

  @override
  final String? adaptiveIconBackground;
  @override
  final String? splashBackground;

  @override
  String toString() {
    return 'LaunchModel(adaptiveIconBackground: $adaptiveIconBackground, splashBackground: $splashBackground)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchModelImpl &&
            (identical(other.adaptiveIconBackground, adaptiveIconBackground) ||
                other.adaptiveIconBackground == adaptiveIconBackground) &&
            (identical(other.splashBackground, splashBackground) ||
                other.splashBackground == splashBackground));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, adaptiveIconBackground, splashBackground);

  /// Create a copy of LaunchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchModelImplCopyWith<_$LaunchModelImpl> get copyWith =>
      __$$LaunchModelImplCopyWithImpl<_$LaunchModelImpl>(this, _$identity);
}

abstract class _LaunchModel implements LaunchModel {
  const factory _LaunchModel(
      {final String? adaptiveIconBackground,
      final String? splashBackground}) = _$LaunchModelImpl;

  @override
  String? get adaptiveIconBackground;
  @override
  String? get splashBackground;

  /// Create a copy of LaunchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchModelImplCopyWith<_$LaunchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
