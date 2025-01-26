// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preview_theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreviewThemeState {
  bool get frameVisible => throw _privateConstructorUsedError;
  PreviewType get previewType => throw _privateConstructorUsedError;
  ThemeSettings? get theme => throw _privateConstructorUsedError;
  ThemePreviewScreen get preview => throw _privateConstructorUsedError;

  /// Create a copy of PreviewThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreviewThemeStateCopyWith<PreviewThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewThemeStateCopyWith<$Res> {
  factory $PreviewThemeStateCopyWith(
          PreviewThemeState value, $Res Function(PreviewThemeState) then) =
      _$PreviewThemeStateCopyWithImpl<$Res, PreviewThemeState>;
  @useResult
  $Res call(
      {bool frameVisible,
      PreviewType previewType,
      ThemeSettings? theme,
      ThemePreviewScreen preview});

  $ThemeSettingsCopyWith<$Res>? get theme;
}

/// @nodoc
class _$PreviewThemeStateCopyWithImpl<$Res, $Val extends PreviewThemeState>
    implements $PreviewThemeStateCopyWith<$Res> {
  _$PreviewThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreviewThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frameVisible = null,
    Object? previewType = null,
    Object? theme = freezed,
    Object? preview = null,
  }) {
    return _then(_value.copyWith(
      frameVisible: null == frameVisible
          ? _value.frameVisible
          : frameVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      previewType: null == previewType
          ? _value.previewType
          : previewType // ignore: cast_nullable_to_non_nullable
              as PreviewType,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeSettings?,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as ThemePreviewScreen,
    ) as $Val);
  }

  /// Create a copy of PreviewThemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThemeSettingsCopyWith<$Res>? get theme {
    if (_value.theme == null) {
      return null;
    }

    return $ThemeSettingsCopyWith<$Res>(_value.theme!, (value) {
      return _then(_value.copyWith(theme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PreviewThemeStateImplCopyWith<$Res>
    implements $PreviewThemeStateCopyWith<$Res> {
  factory _$$PreviewThemeStateImplCopyWith(_$PreviewThemeStateImpl value,
          $Res Function(_$PreviewThemeStateImpl) then) =
      __$$PreviewThemeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool frameVisible,
      PreviewType previewType,
      ThemeSettings? theme,
      ThemePreviewScreen preview});

  @override
  $ThemeSettingsCopyWith<$Res>? get theme;
}

/// @nodoc
class __$$PreviewThemeStateImplCopyWithImpl<$Res>
    extends _$PreviewThemeStateCopyWithImpl<$Res, _$PreviewThemeStateImpl>
    implements _$$PreviewThemeStateImplCopyWith<$Res> {
  __$$PreviewThemeStateImplCopyWithImpl(_$PreviewThemeStateImpl _value,
      $Res Function(_$PreviewThemeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreviewThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frameVisible = null,
    Object? previewType = null,
    Object? theme = freezed,
    Object? preview = null,
  }) {
    return _then(_$PreviewThemeStateImpl(
      frameVisible: null == frameVisible
          ? _value.frameVisible
          : frameVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      previewType: null == previewType
          ? _value.previewType
          : previewType // ignore: cast_nullable_to_non_nullable
              as PreviewType,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeSettings?,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as ThemePreviewScreen,
    ));
  }
}

/// @nodoc

class _$PreviewThemeStateImpl implements _PreviewThemeState {
  const _$PreviewThemeStateImpl(
      {required this.frameVisible,
      required this.previewType,
      this.theme,
      this.preview = ThemePreviewScreen.layouts});

  @override
  final bool frameVisible;
  @override
  final PreviewType previewType;
  @override
  final ThemeSettings? theme;
  @override
  @JsonKey()
  final ThemePreviewScreen preview;

  @override
  String toString() {
    return 'PreviewThemeState(frameVisible: $frameVisible, previewType: $previewType, theme: $theme, preview: $preview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewThemeStateImpl &&
            (identical(other.frameVisible, frameVisible) ||
                other.frameVisible == frameVisible) &&
            (identical(other.previewType, previewType) ||
                other.previewType == previewType) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.preview, preview) || other.preview == preview));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, frameVisible, previewType, theme, preview);

  /// Create a copy of PreviewThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewThemeStateImplCopyWith<_$PreviewThemeStateImpl> get copyWith =>
      __$$PreviewThemeStateImplCopyWithImpl<_$PreviewThemeStateImpl>(
          this, _$identity);
}

abstract class _PreviewThemeState implements PreviewThemeState {
  const factory _PreviewThemeState(
      {required final bool frameVisible,
      required final PreviewType previewType,
      final ThemeSettings? theme,
      final ThemePreviewScreen preview}) = _$PreviewThemeStateImpl;

  @override
  bool get frameVisible;
  @override
  PreviewType get previewType;
  @override
  ThemeSettings? get theme;
  @override
  ThemePreviewScreen get preview;

  /// Create a copy of PreviewThemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreviewThemeStateImplCopyWith<_$PreviewThemeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
