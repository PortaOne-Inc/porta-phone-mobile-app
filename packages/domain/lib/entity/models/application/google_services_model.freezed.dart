// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleServicesModel {
  String? get androidUrl => throw _privateConstructorUsedError;
  String? get iosUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleServicesModelCopyWith<GoogleServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleServicesModelCopyWith<$Res> {
  factory $GoogleServicesModelCopyWith(
          GoogleServicesModel value, $Res Function(GoogleServicesModel) then) =
      _$GoogleServicesModelCopyWithImpl<$Res, GoogleServicesModel>;
  @useResult
  $Res call({String? androidUrl, String? iosUrl});
}

/// @nodoc
class _$GoogleServicesModelCopyWithImpl<$Res, $Val extends GoogleServicesModel>
    implements $GoogleServicesModelCopyWith<$Res> {
  _$GoogleServicesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidUrl = freezed,
    Object? iosUrl = freezed,
  }) {
    return _then(_value.copyWith(
      androidUrl: freezed == androidUrl
          ? _value.androidUrl
          : androidUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      iosUrl: freezed == iosUrl
          ? _value.iosUrl
          : iosUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleServicesModelCopyWith<$Res>
    implements $GoogleServicesModelCopyWith<$Res> {
  factory _$$_GoogleServicesModelCopyWith(_$_GoogleServicesModel value,
          $Res Function(_$_GoogleServicesModel) then) =
      __$$_GoogleServicesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? androidUrl, String? iosUrl});
}

/// @nodoc
class __$$_GoogleServicesModelCopyWithImpl<$Res>
    extends _$GoogleServicesModelCopyWithImpl<$Res, _$_GoogleServicesModel>
    implements _$$_GoogleServicesModelCopyWith<$Res> {
  __$$_GoogleServicesModelCopyWithImpl(_$_GoogleServicesModel _value,
      $Res Function(_$_GoogleServicesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? androidUrl = freezed,
    Object? iosUrl = freezed,
  }) {
    return _then(_$_GoogleServicesModel(
      androidUrl: freezed == androidUrl
          ? _value.androidUrl
          : androidUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      iosUrl: freezed == iosUrl
          ? _value.iosUrl
          : iosUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GoogleServicesModel extends _GoogleServicesModel {
  const _$_GoogleServicesModel({this.androidUrl, this.iosUrl}) : super._();

  @override
  final String? androidUrl;
  @override
  final String? iosUrl;

  @override
  String toString() {
    return 'GoogleServicesModel(androidUrl: $androidUrl, iosUrl: $iosUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleServicesModel &&
            (identical(other.androidUrl, androidUrl) ||
                other.androidUrl == androidUrl) &&
            (identical(other.iosUrl, iosUrl) || other.iosUrl == iosUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, androidUrl, iosUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleServicesModelCopyWith<_$_GoogleServicesModel> get copyWith =>
      __$$_GoogleServicesModelCopyWithImpl<_$_GoogleServicesModel>(
          this, _$identity);
}

abstract class _GoogleServicesModel extends GoogleServicesModel {
  const factory _GoogleServicesModel(
      {final String? androidUrl,
      final String? iosUrl}) = _$_GoogleServicesModel;
  const _GoogleServicesModel._() : super._();

  @override
  String? get androidUrl;
  @override
  String? get iosUrl;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleServicesModelCopyWith<_$_GoogleServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
