// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_collection_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageCollectionDTO _$ImageCollectionDTOFromJson(Map<String, dynamic> json) {
  return _ImageCollectionDTO.fromJson(json);
}

/// @nodoc
mixin _$ImageCollectionDTO {
  ImageDTO? get onboarding => throw _privateConstructorUsedError;
  ImageDTO? get logo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCollectionDTOCopyWith<ImageCollectionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCollectionDTOCopyWith<$Res> {
  factory $ImageCollectionDTOCopyWith(
          ImageCollectionDTO value, $Res Function(ImageCollectionDTO) then) =
      _$ImageCollectionDTOCopyWithImpl<$Res, ImageCollectionDTO>;
  @useResult
  $Res call({ImageDTO? onboarding, ImageDTO? logo});

  $ImageDTOCopyWith<$Res>? get onboarding;
  $ImageDTOCopyWith<$Res>? get logo;
}

/// @nodoc
class _$ImageCollectionDTOCopyWithImpl<$Res, $Val extends ImageCollectionDTO>
    implements $ImageCollectionDTOCopyWith<$Res> {
  _$ImageCollectionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboarding = freezed,
    Object? logo = freezed,
  }) {
    return _then(_value.copyWith(
      onboarding: freezed == onboarding
          ? _value.onboarding
          : onboarding // ignore: cast_nullable_to_non_nullable
              as ImageDTO?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as ImageDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageDTOCopyWith<$Res>? get onboarding {
    if (_value.onboarding == null) {
      return null;
    }

    return $ImageDTOCopyWith<$Res>(_value.onboarding!, (value) {
      return _then(_value.copyWith(onboarding: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageDTOCopyWith<$Res>? get logo {
    if (_value.logo == null) {
      return null;
    }

    return $ImageDTOCopyWith<$Res>(_value.logo!, (value) {
      return _then(_value.copyWith(logo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageCollectionDTOCopyWith<$Res>
    implements $ImageCollectionDTOCopyWith<$Res> {
  factory _$$_ImageCollectionDTOCopyWith(_$_ImageCollectionDTO value,
          $Res Function(_$_ImageCollectionDTO) then) =
      __$$_ImageCollectionDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageDTO? onboarding, ImageDTO? logo});

  @override
  $ImageDTOCopyWith<$Res>? get onboarding;
  @override
  $ImageDTOCopyWith<$Res>? get logo;
}

/// @nodoc
class __$$_ImageCollectionDTOCopyWithImpl<$Res>
    extends _$ImageCollectionDTOCopyWithImpl<$Res, _$_ImageCollectionDTO>
    implements _$$_ImageCollectionDTOCopyWith<$Res> {
  __$$_ImageCollectionDTOCopyWithImpl(
      _$_ImageCollectionDTO _value, $Res Function(_$_ImageCollectionDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboarding = freezed,
    Object? logo = freezed,
  }) {
    return _then(_$_ImageCollectionDTO(
      onboarding: freezed == onboarding
          ? _value.onboarding
          : onboarding // ignore: cast_nullable_to_non_nullable
              as ImageDTO?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as ImageDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageCollectionDTO implements _ImageCollectionDTO {
  const _$_ImageCollectionDTO({this.onboarding, this.logo});

  factory _$_ImageCollectionDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ImageCollectionDTOFromJson(json);

  @override
  final ImageDTO? onboarding;
  @override
  final ImageDTO? logo;

  @override
  String toString() {
    return 'ImageCollectionDTO(onboarding: $onboarding, logo: $logo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageCollectionDTO &&
            (identical(other.onboarding, onboarding) ||
                other.onboarding == onboarding) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, onboarding, logo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageCollectionDTOCopyWith<_$_ImageCollectionDTO> get copyWith =>
      __$$_ImageCollectionDTOCopyWithImpl<_$_ImageCollectionDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageCollectionDTOToJson(
      this,
    );
  }
}

abstract class _ImageCollectionDTO implements ImageCollectionDTO {
  const factory _ImageCollectionDTO(
      {final ImageDTO? onboarding,
      final ImageDTO? logo}) = _$_ImageCollectionDTO;

  factory _ImageCollectionDTO.fromJson(Map<String, dynamic> json) =
      _$_ImageCollectionDTO.fromJson;

  @override
  ImageDTO? get onboarding;
  @override
  ImageDTO? get logo;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCollectionDTOCopyWith<_$_ImageCollectionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
