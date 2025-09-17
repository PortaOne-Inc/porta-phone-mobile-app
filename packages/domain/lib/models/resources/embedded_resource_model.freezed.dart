// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'embedded_resource_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmbeddedResourceModel _$EmbeddedResourceModelFromJson(
    Map<String, dynamic> json) {
  return _EmbeddedResource.fromJson(json);
}

/// @nodoc
mixin _$EmbeddedResourceModel {
  String get uri => throw _privateConstructorUsedError;
  String get applicationId => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  EmbeddedResourceModelType get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;
  MetadataModel get metadata => throw _privateConstructorUsedError;
  List<String> get payload => throw _privateConstructorUsedError;
  bool get enableConsoleLogCapture => throw _privateConstructorUsedError;
  String? get reconnectStrategy => throw _privateConstructorUsedError;

  /// Serializes this EmbeddedResourceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmbeddedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmbeddedResourceModelCopyWith<EmbeddedResourceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmbeddedResourceModelCopyWith<$Res> {
  factory $EmbeddedResourceModelCopyWith(EmbeddedResourceModel value,
          $Res Function(EmbeddedResourceModel) then) =
      _$EmbeddedResourceModelCopyWithImpl<$Res, EmbeddedResourceModel>;
  @useResult
  $Res call(
      {String uri,
      String applicationId,
      String? id,
      EmbeddedResourceModelType type,
      Map<String, dynamic> attributes,
      MetadataModel metadata,
      List<String> payload,
      bool enableConsoleLogCapture,
      String? reconnectStrategy});

  $MetadataModelCopyWith<$Res> get metadata;
}

/// @nodoc
class _$EmbeddedResourceModelCopyWithImpl<$Res,
        $Val extends EmbeddedResourceModel>
    implements $EmbeddedResourceModelCopyWith<$Res> {
  _$EmbeddedResourceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmbeddedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? applicationId = null,
    Object? id = freezed,
    Object? type = null,
    Object? attributes = null,
    Object? metadata = null,
    Object? payload = null,
    Object? enableConsoleLogCapture = null,
    Object? reconnectStrategy = freezed,
  }) {
    return _then(_value.copyWith(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmbeddedResourceModelType,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MetadataModel,
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
    ) as $Val);
  }

  /// Create a copy of EmbeddedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetadataModelCopyWith<$Res> get metadata {
    return $MetadataModelCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmbeddedResourceImplCopyWith<$Res>
    implements $EmbeddedResourceModelCopyWith<$Res> {
  factory _$$EmbeddedResourceImplCopyWith(_$EmbeddedResourceImpl value,
          $Res Function(_$EmbeddedResourceImpl) then) =
      __$$EmbeddedResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uri,
      String applicationId,
      String? id,
      EmbeddedResourceModelType type,
      Map<String, dynamic> attributes,
      MetadataModel metadata,
      List<String> payload,
      bool enableConsoleLogCapture,
      String? reconnectStrategy});

  @override
  $MetadataModelCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$EmbeddedResourceImplCopyWithImpl<$Res>
    extends _$EmbeddedResourceModelCopyWithImpl<$Res, _$EmbeddedResourceImpl>
    implements _$$EmbeddedResourceImplCopyWith<$Res> {
  __$$EmbeddedResourceImplCopyWithImpl(_$EmbeddedResourceImpl _value,
      $Res Function(_$EmbeddedResourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmbeddedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? applicationId = null,
    Object? id = freezed,
    Object? type = null,
    Object? attributes = null,
    Object? metadata = null,
    Object? payload = null,
    Object? enableConsoleLogCapture = null,
    Object? reconnectStrategy = freezed,
  }) {
    return _then(_$EmbeddedResourceImpl(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmbeddedResourceModelType,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MetadataModel,
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmbeddedResourceImpl extends _EmbeddedResource {
  const _$EmbeddedResourceImpl(
      {required this.uri,
      required this.applicationId,
      this.id,
      this.type = EmbeddedResourceModelType.unknown,
      final Map<String, dynamic> attributes = const {},
      this.metadata = const MetadataModel(),
      final List<String> payload = const [],
      this.enableConsoleLogCapture = false,
      this.reconnectStrategy})
      : _attributes = attributes,
        _payload = payload,
        super._();

  factory _$EmbeddedResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmbeddedResourceImplFromJson(json);

  @override
  final String uri;
  @override
  final String applicationId;
  @override
  final String? id;
  @override
  @JsonKey()
  final EmbeddedResourceModelType type;
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
  final MetadataModel metadata;
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
  String toString() {
    return 'EmbeddedResourceModel(uri: $uri, applicationId: $applicationId, id: $id, type: $type, attributes: $attributes, metadata: $metadata, payload: $payload, enableConsoleLogCapture: $enableConsoleLogCapture, reconnectStrategy: $reconnectStrategy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmbeddedResourceImpl &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            (identical(other.id, id) || other.id == id) &&
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
                other.reconnectStrategy == reconnectStrategy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uri,
      applicationId,
      id,
      type,
      const DeepCollectionEquality().hash(_attributes),
      metadata,
      const DeepCollectionEquality().hash(_payload),
      enableConsoleLogCapture,
      reconnectStrategy);

  /// Create a copy of EmbeddedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmbeddedResourceImplCopyWith<_$EmbeddedResourceImpl> get copyWith =>
      __$$EmbeddedResourceImplCopyWithImpl<_$EmbeddedResourceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmbeddedResourceImplToJson(
      this,
    );
  }
}

abstract class _EmbeddedResource extends EmbeddedResourceModel {
  const factory _EmbeddedResource(
      {required final String uri,
      required final String applicationId,
      final String? id,
      final EmbeddedResourceModelType type,
      final Map<String, dynamic> attributes,
      final MetadataModel metadata,
      final List<String> payload,
      final bool enableConsoleLogCapture,
      final String? reconnectStrategy}) = _$EmbeddedResourceImpl;
  const _EmbeddedResource._() : super._();

  factory _EmbeddedResource.fromJson(Map<String, dynamic> json) =
      _$EmbeddedResourceImpl.fromJson;

  @override
  String get uri;
  @override
  String get applicationId;
  @override
  String? get id;
  @override
  EmbeddedResourceModelType get type;
  @override
  Map<String, dynamic> get attributes;
  @override
  MetadataModel get metadata;
  @override
  List<String> get payload;
  @override
  bool get enableConsoleLogCapture;
  @override
  String? get reconnectStrategy;

  /// Create a copy of EmbeddedResourceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmbeddedResourceImplCopyWith<_$EmbeddedResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
