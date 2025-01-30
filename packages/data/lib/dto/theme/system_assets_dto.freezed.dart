// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_assets_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LaunchAssetsDto _$LaunchAssetsDtoFromJson(Map<String, dynamic> json) {
  return _LaunchAssetsDto.fromJson(json);
}

/// @nodoc
mixin _$LaunchAssetsDto {
  LaunchAssetResourceDto? get notificationLogo =>
      throw _privateConstructorUsedError;
  LaunchAssetResourceDto? get adaptiveIconBackground =>
      throw _privateConstructorUsedError;
  LaunchAssetResourceDto? get adaptiveIconForeground =>
      throw _privateConstructorUsedError;
  LaunchAssetResourceDto? get androidLauncherIcon =>
      throw _privateConstructorUsedError;
  LaunchAssetResourceDto? get iosLauncherIcon =>
      throw _privateConstructorUsedError;
  LaunchAssetResourceDto? get webLauncherIcon =>
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
      {LaunchAssetResourceDto? notificationLogo,
      LaunchAssetResourceDto? adaptiveIconBackground,
      LaunchAssetResourceDto? adaptiveIconForeground,
      LaunchAssetResourceDto? androidLauncherIcon,
      LaunchAssetResourceDto? iosLauncherIcon,
      LaunchAssetResourceDto? webLauncherIcon});

  $LaunchAssetResourceDtoCopyWith<$Res>? get notificationLogo;
  $LaunchAssetResourceDtoCopyWith<$Res>? get adaptiveIconBackground;
  $LaunchAssetResourceDtoCopyWith<$Res>? get adaptiveIconForeground;
  $LaunchAssetResourceDtoCopyWith<$Res>? get androidLauncherIcon;
  $LaunchAssetResourceDtoCopyWith<$Res>? get iosLauncherIcon;
  $LaunchAssetResourceDtoCopyWith<$Res>? get webLauncherIcon;
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
    Object? notificationLogo = freezed,
    Object? adaptiveIconBackground = freezed,
    Object? adaptiveIconForeground = freezed,
    Object? androidLauncherIcon = freezed,
    Object? iosLauncherIcon = freezed,
    Object? webLauncherIcon = freezed,
  }) {
    return _then(_value.copyWith(
      notificationLogo: freezed == notificationLogo
          ? _value.notificationLogo
          : notificationLogo // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      adaptiveIconBackground: freezed == adaptiveIconBackground
          ? _value.adaptiveIconBackground
          : adaptiveIconBackground // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      adaptiveIconForeground: freezed == adaptiveIconForeground
          ? _value.adaptiveIconForeground
          : adaptiveIconForeground // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      androidLauncherIcon: freezed == androidLauncherIcon
          ? _value.androidLauncherIcon
          : androidLauncherIcon // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      iosLauncherIcon: freezed == iosLauncherIcon
          ? _value.iosLauncherIcon
          : iosLauncherIcon // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      webLauncherIcon: freezed == webLauncherIcon
          ? _value.webLauncherIcon
          : webLauncherIcon // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
    ) as $Val);
  }

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetResourceDtoCopyWith<$Res>? get notificationLogo {
    if (_value.notificationLogo == null) {
      return null;
    }

    return $LaunchAssetResourceDtoCopyWith<$Res>(_value.notificationLogo!,
        (value) {
      return _then(_value.copyWith(notificationLogo: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetResourceDtoCopyWith<$Res>? get adaptiveIconBackground {
    if (_value.adaptiveIconBackground == null) {
      return null;
    }

    return $LaunchAssetResourceDtoCopyWith<$Res>(_value.adaptiveIconBackground!,
        (value) {
      return _then(_value.copyWith(adaptiveIconBackground: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetResourceDtoCopyWith<$Res>? get adaptiveIconForeground {
    if (_value.adaptiveIconForeground == null) {
      return null;
    }

    return $LaunchAssetResourceDtoCopyWith<$Res>(_value.adaptiveIconForeground!,
        (value) {
      return _then(_value.copyWith(adaptiveIconForeground: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetResourceDtoCopyWith<$Res>? get androidLauncherIcon {
    if (_value.androidLauncherIcon == null) {
      return null;
    }

    return $LaunchAssetResourceDtoCopyWith<$Res>(_value.androidLauncherIcon!,
        (value) {
      return _then(_value.copyWith(androidLauncherIcon: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetResourceDtoCopyWith<$Res>? get iosLauncherIcon {
    if (_value.iosLauncherIcon == null) {
      return null;
    }

    return $LaunchAssetResourceDtoCopyWith<$Res>(_value.iosLauncherIcon!,
        (value) {
      return _then(_value.copyWith(iosLauncherIcon: value) as $Val);
    });
  }

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchAssetResourceDtoCopyWith<$Res>? get webLauncherIcon {
    if (_value.webLauncherIcon == null) {
      return null;
    }

    return $LaunchAssetResourceDtoCopyWith<$Res>(_value.webLauncherIcon!,
        (value) {
      return _then(_value.copyWith(webLauncherIcon: value) as $Val);
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
      {LaunchAssetResourceDto? notificationLogo,
      LaunchAssetResourceDto? adaptiveIconBackground,
      LaunchAssetResourceDto? adaptiveIconForeground,
      LaunchAssetResourceDto? androidLauncherIcon,
      LaunchAssetResourceDto? iosLauncherIcon,
      LaunchAssetResourceDto? webLauncherIcon});

  @override
  $LaunchAssetResourceDtoCopyWith<$Res>? get notificationLogo;
  @override
  $LaunchAssetResourceDtoCopyWith<$Res>? get adaptiveIconBackground;
  @override
  $LaunchAssetResourceDtoCopyWith<$Res>? get adaptiveIconForeground;
  @override
  $LaunchAssetResourceDtoCopyWith<$Res>? get androidLauncherIcon;
  @override
  $LaunchAssetResourceDtoCopyWith<$Res>? get iosLauncherIcon;
  @override
  $LaunchAssetResourceDtoCopyWith<$Res>? get webLauncherIcon;
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
    Object? notificationLogo = freezed,
    Object? adaptiveIconBackground = freezed,
    Object? adaptiveIconForeground = freezed,
    Object? androidLauncherIcon = freezed,
    Object? iosLauncherIcon = freezed,
    Object? webLauncherIcon = freezed,
  }) {
    return _then(_$LaunchAssetsDtoImpl(
      notificationLogo: freezed == notificationLogo
          ? _value.notificationLogo
          : notificationLogo // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      adaptiveIconBackground: freezed == adaptiveIconBackground
          ? _value.adaptiveIconBackground
          : adaptiveIconBackground // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      adaptiveIconForeground: freezed == adaptiveIconForeground
          ? _value.adaptiveIconForeground
          : adaptiveIconForeground // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      androidLauncherIcon: freezed == androidLauncherIcon
          ? _value.androidLauncherIcon
          : androidLauncherIcon // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      iosLauncherIcon: freezed == iosLauncherIcon
          ? _value.iosLauncherIcon
          : iosLauncherIcon // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
      webLauncherIcon: freezed == webLauncherIcon
          ? _value.webLauncherIcon
          : webLauncherIcon // ignore: cast_nullable_to_non_nullable
              as LaunchAssetResourceDto?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LaunchAssetsDtoImpl implements _LaunchAssetsDto {
  const _$LaunchAssetsDtoImpl(
      {this.notificationLogo,
      this.adaptiveIconBackground,
      this.adaptiveIconForeground,
      this.androidLauncherIcon,
      this.iosLauncherIcon,
      this.webLauncherIcon});

  factory _$LaunchAssetsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaunchAssetsDtoImplFromJson(json);

  @override
  final LaunchAssetResourceDto? notificationLogo;
  @override
  final LaunchAssetResourceDto? adaptiveIconBackground;
  @override
  final LaunchAssetResourceDto? adaptiveIconForeground;
  @override
  final LaunchAssetResourceDto? androidLauncherIcon;
  @override
  final LaunchAssetResourceDto? iosLauncherIcon;
  @override
  final LaunchAssetResourceDto? webLauncherIcon;

  @override
  String toString() {
    return 'LaunchAssetsDto(notificationLogo: $notificationLogo, adaptiveIconBackground: $adaptiveIconBackground, adaptiveIconForeground: $adaptiveIconForeground, androidLauncherIcon: $androidLauncherIcon, iosLauncherIcon: $iosLauncherIcon, webLauncherIcon: $webLauncherIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchAssetsDtoImpl &&
            (identical(other.notificationLogo, notificationLogo) ||
                other.notificationLogo == notificationLogo) &&
            (identical(other.adaptiveIconBackground, adaptiveIconBackground) ||
                other.adaptiveIconBackground == adaptiveIconBackground) &&
            (identical(other.adaptiveIconForeground, adaptiveIconForeground) ||
                other.adaptiveIconForeground == adaptiveIconForeground) &&
            (identical(other.androidLauncherIcon, androidLauncherIcon) ||
                other.androidLauncherIcon == androidLauncherIcon) &&
            (identical(other.iosLauncherIcon, iosLauncherIcon) ||
                other.iosLauncherIcon == iosLauncherIcon) &&
            (identical(other.webLauncherIcon, webLauncherIcon) ||
                other.webLauncherIcon == webLauncherIcon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationLogo,
      adaptiveIconBackground,
      adaptiveIconForeground,
      androidLauncherIcon,
      iosLauncherIcon,
      webLauncherIcon);

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
      {final LaunchAssetResourceDto? notificationLogo,
      final LaunchAssetResourceDto? adaptiveIconBackground,
      final LaunchAssetResourceDto? adaptiveIconForeground,
      final LaunchAssetResourceDto? androidLauncherIcon,
      final LaunchAssetResourceDto? iosLauncherIcon,
      final LaunchAssetResourceDto? webLauncherIcon}) = _$LaunchAssetsDtoImpl;

  factory _LaunchAssetsDto.fromJson(Map<String, dynamic> json) =
      _$LaunchAssetsDtoImpl.fromJson;

  @override
  LaunchAssetResourceDto? get notificationLogo;
  @override
  LaunchAssetResourceDto? get adaptiveIconBackground;
  @override
  LaunchAssetResourceDto? get adaptiveIconForeground;
  @override
  LaunchAssetResourceDto? get androidLauncherIcon;
  @override
  LaunchAssetResourceDto? get iosLauncherIcon;
  @override
  LaunchAssetResourceDto? get webLauncherIcon;

  /// Create a copy of LaunchAssetsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchAssetsDtoImplCopyWith<_$LaunchAssetsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LaunchAssetResourceDto _$LaunchAssetResourceDtoFromJson(
    Map<String, dynamic> json) {
  return _LaunchAssetResourceDto.fromJson(json);
}

/// @nodoc
mixin _$LaunchAssetResourceDto {
  String? get url => throw _privateConstructorUsedError;
  String? get originalAssetId => throw _privateConstructorUsedError;

  /// Serializes this LaunchAssetResourceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LaunchAssetResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LaunchAssetResourceDtoCopyWith<LaunchAssetResourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchAssetResourceDtoCopyWith<$Res> {
  factory $LaunchAssetResourceDtoCopyWith(LaunchAssetResourceDto value,
          $Res Function(LaunchAssetResourceDto) then) =
      _$LaunchAssetResourceDtoCopyWithImpl<$Res, LaunchAssetResourceDto>;
  @useResult
  $Res call({String? url, String? originalAssetId});
}

/// @nodoc
class _$LaunchAssetResourceDtoCopyWithImpl<$Res,
        $Val extends LaunchAssetResourceDto>
    implements $LaunchAssetResourceDtoCopyWith<$Res> {
  _$LaunchAssetResourceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchAssetResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? originalAssetId = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      originalAssetId: freezed == originalAssetId
          ? _value.originalAssetId
          : originalAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LaunchAssetResourceDtoImplCopyWith<$Res>
    implements $LaunchAssetResourceDtoCopyWith<$Res> {
  factory _$$LaunchAssetResourceDtoImplCopyWith(
          _$LaunchAssetResourceDtoImpl value,
          $Res Function(_$LaunchAssetResourceDtoImpl) then) =
      __$$LaunchAssetResourceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String? originalAssetId});
}

/// @nodoc
class __$$LaunchAssetResourceDtoImplCopyWithImpl<$Res>
    extends _$LaunchAssetResourceDtoCopyWithImpl<$Res,
        _$LaunchAssetResourceDtoImpl>
    implements _$$LaunchAssetResourceDtoImplCopyWith<$Res> {
  __$$LaunchAssetResourceDtoImplCopyWithImpl(
      _$LaunchAssetResourceDtoImpl _value,
      $Res Function(_$LaunchAssetResourceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchAssetResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? originalAssetId = freezed,
  }) {
    return _then(_$LaunchAssetResourceDtoImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      originalAssetId: freezed == originalAssetId
          ? _value.originalAssetId
          : originalAssetId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$LaunchAssetResourceDtoImpl implements _LaunchAssetResourceDto {
  const _$LaunchAssetResourceDtoImpl({this.url, this.originalAssetId});

  factory _$LaunchAssetResourceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LaunchAssetResourceDtoImplFromJson(json);

  @override
  final String? url;
  @override
  final String? originalAssetId;

  @override
  String toString() {
    return 'LaunchAssetResourceDto(url: $url, originalAssetId: $originalAssetId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LaunchAssetResourceDtoImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.originalAssetId, originalAssetId) ||
                other.originalAssetId == originalAssetId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, originalAssetId);

  /// Create a copy of LaunchAssetResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LaunchAssetResourceDtoImplCopyWith<_$LaunchAssetResourceDtoImpl>
      get copyWith => __$$LaunchAssetResourceDtoImplCopyWithImpl<
          _$LaunchAssetResourceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LaunchAssetResourceDtoImplToJson(
      this,
    );
  }
}

abstract class _LaunchAssetResourceDto implements LaunchAssetResourceDto {
  const factory _LaunchAssetResourceDto(
      {final String? url,
      final String? originalAssetId}) = _$LaunchAssetResourceDtoImpl;

  factory _LaunchAssetResourceDto.fromJson(Map<String, dynamic> json) =
      _$LaunchAssetResourceDtoImpl.fromJson;

  @override
  String? get url;
  @override
  String? get originalAssetId;

  /// Create a copy of LaunchAssetResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LaunchAssetResourceDtoImplCopyWith<_$LaunchAssetResourceDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
