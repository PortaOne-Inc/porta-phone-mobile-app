// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_scheme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageSchemeModel {
  ImageModel get primaryOnboardingLogo => throw _privateConstructorUsedError;
  ImageModel get secondaryOnboardingLogo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageSchemeModelCopyWith<ImageSchemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSchemeModelCopyWith<$Res> {
  factory $ImageSchemeModelCopyWith(
          ImageSchemeModel value, $Res Function(ImageSchemeModel) then) =
      _$ImageSchemeModelCopyWithImpl<$Res, ImageSchemeModel>;
  @useResult
  $Res call(
      {ImageModel primaryOnboardingLogo, ImageModel secondaryOnboardingLogo});

  $ImageModelCopyWith<$Res> get primaryOnboardingLogo;
  $ImageModelCopyWith<$Res> get secondaryOnboardingLogo;
}

/// @nodoc
class _$ImageSchemeModelCopyWithImpl<$Res, $Val extends ImageSchemeModel>
    implements $ImageSchemeModelCopyWith<$Res> {
  _$ImageSchemeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryOnboardingLogo = null,
    Object? secondaryOnboardingLogo = null,
  }) {
    return _then(_value.copyWith(
      primaryOnboardingLogo: null == primaryOnboardingLogo
          ? _value.primaryOnboardingLogo
          : primaryOnboardingLogo // ignore: cast_nullable_to_non_nullable
              as ImageModel,
      secondaryOnboardingLogo: null == secondaryOnboardingLogo
          ? _value.secondaryOnboardingLogo
          : secondaryOnboardingLogo // ignore: cast_nullable_to_non_nullable
              as ImageModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<$Res> get primaryOnboardingLogo {
    return $ImageModelCopyWith<$Res>(_value.primaryOnboardingLogo, (value) {
      return _then(_value.copyWith(primaryOnboardingLogo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<$Res> get secondaryOnboardingLogo {
    return $ImageModelCopyWith<$Res>(_value.secondaryOnboardingLogo, (value) {
      return _then(_value.copyWith(secondaryOnboardingLogo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImageSchemeModelImplCopyWith<$Res>
    implements $ImageSchemeModelCopyWith<$Res> {
  factory _$$ImageSchemeModelImplCopyWith(_$ImageSchemeModelImpl value,
          $Res Function(_$ImageSchemeModelImpl) then) =
      __$$ImageSchemeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ImageModel primaryOnboardingLogo, ImageModel secondaryOnboardingLogo});

  @override
  $ImageModelCopyWith<$Res> get primaryOnboardingLogo;
  @override
  $ImageModelCopyWith<$Res> get secondaryOnboardingLogo;
}

/// @nodoc
class __$$ImageSchemeModelImplCopyWithImpl<$Res>
    extends _$ImageSchemeModelCopyWithImpl<$Res, _$ImageSchemeModelImpl>
    implements _$$ImageSchemeModelImplCopyWith<$Res> {
  __$$ImageSchemeModelImplCopyWithImpl(_$ImageSchemeModelImpl _value,
      $Res Function(_$ImageSchemeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaryOnboardingLogo = null,
    Object? secondaryOnboardingLogo = null,
  }) {
    return _then(_$ImageSchemeModelImpl(
      primaryOnboardingLogo: null == primaryOnboardingLogo
          ? _value.primaryOnboardingLogo
          : primaryOnboardingLogo // ignore: cast_nullable_to_non_nullable
              as ImageModel,
      secondaryOnboardingLogo: null == secondaryOnboardingLogo
          ? _value.secondaryOnboardingLogo
          : secondaryOnboardingLogo // ignore: cast_nullable_to_non_nullable
              as ImageModel,
    ));
  }
}

/// @nodoc

class _$ImageSchemeModelImpl extends _ImageSchemeModel {
  const _$ImageSchemeModelImpl(
      {this.primaryOnboardingLogo = const ImageModel(),
      this.secondaryOnboardingLogo = const ImageModel()})
      : super._();

  @override
  @JsonKey()
  final ImageModel primaryOnboardingLogo;
  @override
  @JsonKey()
  final ImageModel secondaryOnboardingLogo;

  @override
  String toString() {
    return 'ImageSchemeModel(primaryOnboardingLogo: $primaryOnboardingLogo, secondaryOnboardingLogo: $secondaryOnboardingLogo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageSchemeModelImpl &&
            (identical(other.primaryOnboardingLogo, primaryOnboardingLogo) ||
                other.primaryOnboardingLogo == primaryOnboardingLogo) &&
            (identical(
                    other.secondaryOnboardingLogo, secondaryOnboardingLogo) ||
                other.secondaryOnboardingLogo == secondaryOnboardingLogo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, primaryOnboardingLogo, secondaryOnboardingLogo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageSchemeModelImplCopyWith<_$ImageSchemeModelImpl> get copyWith =>
      __$$ImageSchemeModelImplCopyWithImpl<_$ImageSchemeModelImpl>(
          this, _$identity);
}

abstract class _ImageSchemeModel extends ImageSchemeModel {
  const factory _ImageSchemeModel(
      {final ImageModel primaryOnboardingLogo,
      final ImageModel secondaryOnboardingLogo}) = _$ImageSchemeModelImpl;
  const _ImageSchemeModel._() : super._();

  @override
  ImageModel get primaryOnboardingLogo;
  @override
  ImageModel get secondaryOnboardingLogo;
  @override
  @JsonKey(ignore: true)
  _$$ImageSchemeModelImplCopyWith<_$ImageSchemeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
