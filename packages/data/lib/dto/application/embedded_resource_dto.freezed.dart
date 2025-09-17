// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'embedded_resource_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmbeddedResourceDto _$EmbeddedResourceDtoFromJson(Map<String, dynamic> json) {
  return _EmbeddedResourceDto.fromJson(json);
}

/// @nodoc
mixin _$EmbeddedResourceDto {
  String get id => throw _privateConstructorUsedError;
  String get applicationId => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;
  MetadataDto get metadata => throw _privateConstructorUsedError;
  List<String> get payload => throw _privateConstructorUsedError;
  bool get enableConsoleLogCapture => throw _privateConstructorUsedError;
  String? get reconnectStrategy => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EmbeddedResourceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmbeddedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmbeddedResourceDtoCopyWith<EmbeddedResourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbeddedResourceDtoCopyWith<$Res> {
  factory $EmbeddedResourceDtoCopyWith(
          EmbeddedResourceDto value, $Res Function(EmbeddedResourceDto) then) =
      _$EmbeddedResourceDtoCopyWithImpl<$Res, EmbeddedResourceDto>;
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String uri,
      String type,
      Map<String, dynamic> attributes,
      MetadataDto metadata,
      List<String> payload,
      bool enableConsoleLogCapture,
      String? reconnectStrategy,
      String? createdAt,
      String? updatedAt});

  $MetadataDtoCopyWith<$Res> get metadata;
}

/// @nodoc
class _$EmbeddedResourceDtoCopyWithImpl<$Res, $Val extends EmbeddedResourceDto>
    implements $EmbeddedResourceDtoCopyWith<$Res> {
  _$EmbeddedResourceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmbeddedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applicationId = null,
    Object? uri = null,
    Object? type = null,
    Object? attributes = null,
    Object? metadata = null,
    Object? payload = null,
    Object? enableConsoleLogCapture = null,
    Object? reconnectStrategy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MetadataDto,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enableConsoleLogCapture: null == enableConsoleLogCapture
          ? _value.enableConsoleLogCapture
          : enableConsoleLogCapture // ignore: cast_nullable_to_non_nullable
              as bool,
      reconnectStrategy: freezed == reconnectStrategy
          ? _value.reconnectStrategy
          : reconnectStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of EmbeddedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetadataDtoCopyWith<$Res> get metadata {
    return $MetadataDtoCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmbeddedResourceDtoImplCopyWith<$Res>
    implements $EmbeddedResourceDtoCopyWith<$Res> {
  factory _$$EmbeddedResourceDtoImplCopyWith(_$EmbeddedResourceDtoImpl value,
          $Res Function(_$EmbeddedResourceDtoImpl) then) =
      __$$EmbeddedResourceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String applicationId,
      String uri,
      String type,
      Map<String, dynamic> attributes,
      MetadataDto metadata,
      List<String> payload,
      bool enableConsoleLogCapture,
      String? reconnectStrategy,
      String? createdAt,
      String? updatedAt});

  @override
  $MetadataDtoCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$EmbeddedResourceDtoImplCopyWithImpl<$Res>
    extends _$EmbeddedResourceDtoCopyWithImpl<$Res, _$EmbeddedResourceDtoImpl>
    implements _$$EmbeddedResourceDtoImplCopyWith<$Res> {
  __$$EmbeddedResourceDtoImplCopyWithImpl(_$EmbeddedResourceDtoImpl _value,
      $Res Function(_$EmbeddedResourceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmbeddedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? applicationId = null,
    Object? uri = null,
    Object? type = null,
    Object? attributes = null,
    Object? metadata = null,
    Object? payload = null,
    Object? enableConsoleLogCapture = null,
    Object? reconnectStrategy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EmbeddedResourceDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MetadataDto,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as List<String>,
      enableConsoleLogCapture: null == enableConsoleLogCapture
          ? _value.enableConsoleLogCapture
          : enableConsoleLogCapture // ignore: cast_nullable_to_non_nullable
              as bool,
      reconnectStrategy: freezed == reconnectStrategy
          ? _value.reconnectStrategy
          : reconnectStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$EmbeddedResourceDtoImpl extends _EmbeddedResourceDto {
  const _$EmbeddedResourceDtoImpl(
      {required this.id,
      required this.applicationId,
      required this.uri,
      this.type = 'unknown',
      final Map<String, dynamic> attributes = const {},
      this.metadata = const MetadataDto(),
      final List<String> payload = const <String>[],
      this.enableConsoleLogCapture = false,
      this.reconnectStrategy,
      this.createdAt,
      this.updatedAt})
      : _attributes = attributes,
        _payload = payload,
        super._();

  factory _$EmbeddedResourceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddedResourceDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String applicationId;
  @override
  final String uri;
  @override
  @JsonKey()
  final String type;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  @JsonKey()
  final MetadataDto metadata;
  final List<String> _payload;
  @override
  @JsonKey()
  List<String> get payload {
    if (_payload is EqualUnmodifiableListView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payload);
  }

  @override
  @JsonKey()
  final bool enableConsoleLogCapture;
  @override
  final String? reconnectStrategy;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'EmbeddedResourceDto(id: $id, applicationId: $applicationId, uri: $uri, type: $type, attributes: $attributes, metadata: $metadata, payload: $payload, enableConsoleLogCapture: $enableConsoleLogCapture, reconnectStrategy: $reconnectStrategy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddedResourceDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(
                    other.enableConsoleLogCapture, enableConsoleLogCapture) ||
                other.enableConsoleLogCapture == enableConsoleLogCapture) &&
            (identical(other.reconnectStrategy, reconnectStrategy) ||
                other.reconnectStrategy == reconnectStrategy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      applicationId,
      uri,
      type,
      const DeepCollectionEquality().hash(_attributes),
      metadata,
      const DeepCollectionEquality().hash(_payload),
      enableConsoleLogCapture,
      reconnectStrategy,
      createdAt,
      updatedAt);

  /// Create a copy of EmbeddedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbeddedResourceDtoImplCopyWith<_$EmbeddedResourceDtoImpl> get copyWith =>
      __$$EmbeddedResourceDtoImplCopyWithImpl<_$EmbeddedResourceDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbeddedResourceDtoImplToJson(
      this,
    );
  }
}

abstract class _EmbeddedResourceDto extends EmbeddedResourceDto {
  const factory _EmbeddedResourceDto(
      {required final String id,
      required final String applicationId,
      required final String uri,
      final String type,
      final Map<String, dynamic> attributes,
      final MetadataDto metadata,
      final List<String> payload,
      final bool enableConsoleLogCapture,
      final String? reconnectStrategy,
      final String? createdAt,
      final String? updatedAt}) = _$EmbeddedResourceDtoImpl;
  const _EmbeddedResourceDto._() : super._();

  factory _EmbeddedResourceDto.fromJson(Map<String, dynamic> json) =
      _$EmbeddedResourceDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get applicationId;
  @override
  String get uri;
  @override
  String get type;
  @override
  Map<String, dynamic> get attributes;
  @override
  MetadataDto get metadata;
  @override
  List<String> get payload;
  @override
  bool get enableConsoleLogCapture;
  @override
  String? get reconnectStrategy;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of EmbeddedResourceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmbeddedResourceDtoImplCopyWith<_$EmbeddedResourceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetadataDto _$MetadataDtoFromJson(Map<String, dynamic> json) {
  return _MetadataDto.fromJson(json);
}

/// @nodoc
mixin _$MetadataDto {
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;

  /// Serializes this MetadataDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetadataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetadataDtoCopyWith<MetadataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataDtoCopyWith<$Res> {
  factory $MetadataDtoCopyWith(
          MetadataDto value, $Res Function(MetadataDto) then) =
      _$MetadataDtoCopyWithImpl<$Res, MetadataDto>;
  @useResult
  $Res call({Map<String, dynamic> attributes});
}

/// @nodoc
class _$MetadataDtoCopyWithImpl<$Res, $Val extends MetadataDto>
    implements $MetadataDtoCopyWith<$Res> {
  _$MetadataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetadataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetadataDtoImplCopyWith<$Res>
    implements $MetadataDtoCopyWith<$Res> {
  factory _$$MetadataDtoImplCopyWith(
          _$MetadataDtoImpl value, $Res Function(_$MetadataDtoImpl) then) =
      __$$MetadataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> attributes});
}

/// @nodoc
class __$$MetadataDtoImplCopyWithImpl<$Res>
    extends _$MetadataDtoCopyWithImpl<$Res, _$MetadataDtoImpl>
    implements _$$MetadataDtoImplCopyWith<$Res> {
  __$$MetadataDtoImplCopyWithImpl(
      _$MetadataDtoImpl _value, $Res Function(_$MetadataDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetadataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
  }) {
    return _then(_$MetadataDtoImpl(
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$MetadataDtoImpl extends _MetadataDto {
  const _$MetadataDtoImpl({final Map<String, dynamic> attributes = const {}})
      : _attributes = attributes,
        super._();

  factory _$MetadataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataDtoImplFromJson(json);

  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  String toString() {
    return 'MetadataDto(attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_attributes));

  /// Create a copy of MetadataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataDtoImplCopyWith<_$MetadataDtoImpl> get copyWith =>
      __$$MetadataDtoImplCopyWithImpl<_$MetadataDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataDtoImplToJson(
      this,
    );
  }
}

abstract class _MetadataDto extends MetadataDto {
  const factory _MetadataDto({final Map<String, dynamic> attributes}) =
      _$MetadataDtoImpl;
  const _MetadataDto._() : super._();

  factory _MetadataDto.fromJson(Map<String, dynamic> json) =
      _$MetadataDtoImpl.fromJson;

  @override
  Map<String, dynamic> get attributes;

  /// Create a copy of MetadataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetadataDtoImplCopyWith<_$MetadataDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
