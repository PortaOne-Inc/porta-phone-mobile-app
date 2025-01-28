// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeAssetModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Uint8List? get file => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Create a copy of ThemeAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeAssetModelCopyWith<ThemeAssetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeAssetModelCopyWith<$Res> {
  factory $ThemeAssetModelCopyWith(
          ThemeAssetModel value, $Res Function(ThemeAssetModel) then) =
      _$ThemeAssetModelCopyWithImpl<$Res, ThemeAssetModel>;
  @useResult
  $Res call(
      {int id, String name, String description, Uint8List? file, String? url});
}

/// @nodoc
class _$ThemeAssetModelCopyWithImpl<$Res, $Val extends ThemeAssetModel>
    implements $ThemeAssetModelCopyWith<$Res> {
  _$ThemeAssetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeAssetModelImplCopyWith<$Res>
    implements $ThemeAssetModelCopyWith<$Res> {
  factory _$$ThemeAssetModelImplCopyWith(_$ThemeAssetModelImpl value,
          $Res Function(_$ThemeAssetModelImpl) then) =
      __$$ThemeAssetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, String description, Uint8List? file, String? url});
}

/// @nodoc
class __$$ThemeAssetModelImplCopyWithImpl<$Res>
    extends _$ThemeAssetModelCopyWithImpl<$Res, _$ThemeAssetModelImpl>
    implements _$$ThemeAssetModelImplCopyWith<$Res> {
  __$$ThemeAssetModelImplCopyWithImpl(
      _$ThemeAssetModelImpl _value, $Res Function(_$ThemeAssetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? file = freezed,
    Object? url = freezed,
  }) {
    return _then(_$ThemeAssetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ThemeAssetModelImpl extends _ThemeAssetModel {
  const _$ThemeAssetModelImpl(
      {required this.id,
      required this.name,
      this.description = '',
      this.file,
      this.url})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  final Uint8List? file;
  @override
  final String? url;

  @override
  String toString() {
    return 'ThemeAssetModel(id: $id, name: $name, description: $description, file: $file, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeAssetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.file, file) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(file), url);

  /// Create a copy of ThemeAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeAssetModelImplCopyWith<_$ThemeAssetModelImpl> get copyWith =>
      __$$ThemeAssetModelImplCopyWithImpl<_$ThemeAssetModelImpl>(
          this, _$identity);
}

abstract class _ThemeAssetModel extends ThemeAssetModel {
  const factory _ThemeAssetModel(
      {required final int id,
      required final String name,
      final String description,
      final Uint8List? file,
      final String? url}) = _$ThemeAssetModelImpl;
  const _ThemeAssetModel._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  Uint8List? get file;
  @override
  String? get url;

  /// Create a copy of ThemeAssetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeAssetModelImplCopyWith<_$ThemeAssetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
