// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'embedded_resource_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
EmbeddedResourceModel _$EmbeddedResourceModelFromJson(
  Map<String, dynamic> json
) {
    return _EmbeddedResource.fromJson(
      json
    );
}

/// @nodoc
mixin _$EmbeddedResourceModel {

 String get uri; String get applicationId; String? get id; EmbeddedResourceModelType get type; Map<String, dynamic> get attributes; MetadataModel get metadata; List<String> get payload; bool get enableConsoleLogCapture; String? get reconnectStrategy;
/// Create a copy of EmbeddedResourceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmbeddedResourceModelCopyWith<EmbeddedResourceModel> get copyWith => _$EmbeddedResourceModelCopyWithImpl<EmbeddedResourceModel>(this as EmbeddedResourceModel, _$identity);

  /// Serializes this EmbeddedResourceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmbeddedResourceModel&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.payload, payload)&&(identical(other.enableConsoleLogCapture, enableConsoleLogCapture) || other.enableConsoleLogCapture == enableConsoleLogCapture)&&(identical(other.reconnectStrategy, reconnectStrategy) || other.reconnectStrategy == reconnectStrategy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,applicationId,id,type,const DeepCollectionEquality().hash(attributes),metadata,const DeepCollectionEquality().hash(payload),enableConsoleLogCapture,reconnectStrategy);

@override
String toString() {
  return 'EmbeddedResourceModel(uri: $uri, applicationId: $applicationId, id: $id, type: $type, attributes: $attributes, metadata: $metadata, payload: $payload, enableConsoleLogCapture: $enableConsoleLogCapture, reconnectStrategy: $reconnectStrategy)';
}


}

/// @nodoc
abstract mixin class $EmbeddedResourceModelCopyWith<$Res>  {
  factory $EmbeddedResourceModelCopyWith(EmbeddedResourceModel value, $Res Function(EmbeddedResourceModel) _then) = _$EmbeddedResourceModelCopyWithImpl;
@useResult
$Res call({
 String uri, String applicationId, String? id, EmbeddedResourceModelType type, Map<String, dynamic> attributes, MetadataModel metadata, List<String> payload, bool enableConsoleLogCapture, String? reconnectStrategy
});


$MetadataModelCopyWith<$Res> get metadata;

}
/// @nodoc
class _$EmbeddedResourceModelCopyWithImpl<$Res>
    implements $EmbeddedResourceModelCopyWith<$Res> {
  _$EmbeddedResourceModelCopyWithImpl(this._self, this._then);

  final EmbeddedResourceModel _self;
  final $Res Function(EmbeddedResourceModel) _then;

/// Create a copy of EmbeddedResourceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = null,Object? applicationId = null,Object? id = freezed,Object? type = null,Object? attributes = null,Object? metadata = null,Object? payload = null,Object? enableConsoleLogCapture = null,Object? reconnectStrategy = freezed,}) {
  return _then(_self.copyWith(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EmbeddedResourceModelType,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataModel,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as List<String>,enableConsoleLogCapture: null == enableConsoleLogCapture ? _self.enableConsoleLogCapture : enableConsoleLogCapture // ignore: cast_nullable_to_non_nullable
as bool,reconnectStrategy: freezed == reconnectStrategy ? _self.reconnectStrategy : reconnectStrategy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EmbeddedResourceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataModelCopyWith<$Res> get metadata {
  
  return $MetadataModelCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmbeddedResourceModel].
extension EmbeddedResourceModelPatterns on EmbeddedResourceModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmbeddedResource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmbeddedResource() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmbeddedResource value)  $default,){
final _that = this;
switch (_that) {
case _EmbeddedResource():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmbeddedResource value)?  $default,){
final _that = this;
switch (_that) {
case _EmbeddedResource() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uri,  String applicationId,  String? id,  EmbeddedResourceModelType type,  Map<String, dynamic> attributes,  MetadataModel metadata,  List<String> payload,  bool enableConsoleLogCapture,  String? reconnectStrategy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmbeddedResource() when $default != null:
return $default(_that.uri,_that.applicationId,_that.id,_that.type,_that.attributes,_that.metadata,_that.payload,_that.enableConsoleLogCapture,_that.reconnectStrategy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uri,  String applicationId,  String? id,  EmbeddedResourceModelType type,  Map<String, dynamic> attributes,  MetadataModel metadata,  List<String> payload,  bool enableConsoleLogCapture,  String? reconnectStrategy)  $default,) {final _that = this;
switch (_that) {
case _EmbeddedResource():
return $default(_that.uri,_that.applicationId,_that.id,_that.type,_that.attributes,_that.metadata,_that.payload,_that.enableConsoleLogCapture,_that.reconnectStrategy);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uri,  String applicationId,  String? id,  EmbeddedResourceModelType type,  Map<String, dynamic> attributes,  MetadataModel metadata,  List<String> payload,  bool enableConsoleLogCapture,  String? reconnectStrategy)?  $default,) {final _that = this;
switch (_that) {
case _EmbeddedResource() when $default != null:
return $default(_that.uri,_that.applicationId,_that.id,_that.type,_that.attributes,_that.metadata,_that.payload,_that.enableConsoleLogCapture,_that.reconnectStrategy);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _EmbeddedResource extends EmbeddedResourceModel {
  const _EmbeddedResource({required this.uri, required this.applicationId, this.id, this.type = EmbeddedResourceModelType.unknown, final  Map<String, dynamic> attributes = const {}, this.metadata = const MetadataModel(), final  List<String> payload = const [], this.enableConsoleLogCapture = false, this.reconnectStrategy}): _attributes = attributes,_payload = payload,super._();
  factory _EmbeddedResource.fromJson(Map<String, dynamic> json) => _$EmbeddedResourceFromJson(json);

@override final  String uri;
@override final  String applicationId;
@override final  String? id;
@override@JsonKey() final  EmbeddedResourceModelType type;
 final  Map<String, dynamic> _attributes;
@override@JsonKey() Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}

@override@JsonKey() final  MetadataModel metadata;
 final  List<String> _payload;
@override@JsonKey() List<String> get payload {
  if (_payload is EqualUnmodifiableListView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payload);
}

@override@JsonKey() final  bool enableConsoleLogCapture;
@override final  String? reconnectStrategy;

/// Create a copy of EmbeddedResourceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmbeddedResourceCopyWith<_EmbeddedResource> get copyWith => __$EmbeddedResourceCopyWithImpl<_EmbeddedResource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmbeddedResourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmbeddedResource&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._payload, _payload)&&(identical(other.enableConsoleLogCapture, enableConsoleLogCapture) || other.enableConsoleLogCapture == enableConsoleLogCapture)&&(identical(other.reconnectStrategy, reconnectStrategy) || other.reconnectStrategy == reconnectStrategy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uri,applicationId,id,type,const DeepCollectionEquality().hash(_attributes),metadata,const DeepCollectionEquality().hash(_payload),enableConsoleLogCapture,reconnectStrategy);

@override
String toString() {
  return 'EmbeddedResourceModel(uri: $uri, applicationId: $applicationId, id: $id, type: $type, attributes: $attributes, metadata: $metadata, payload: $payload, enableConsoleLogCapture: $enableConsoleLogCapture, reconnectStrategy: $reconnectStrategy)';
}


}

/// @nodoc
abstract mixin class _$EmbeddedResourceCopyWith<$Res> implements $EmbeddedResourceModelCopyWith<$Res> {
  factory _$EmbeddedResourceCopyWith(_EmbeddedResource value, $Res Function(_EmbeddedResource) _then) = __$EmbeddedResourceCopyWithImpl;
@override @useResult
$Res call({
 String uri, String applicationId, String? id, EmbeddedResourceModelType type, Map<String, dynamic> attributes, MetadataModel metadata, List<String> payload, bool enableConsoleLogCapture, String? reconnectStrategy
});


@override $MetadataModelCopyWith<$Res> get metadata;

}
/// @nodoc
class __$EmbeddedResourceCopyWithImpl<$Res>
    implements _$EmbeddedResourceCopyWith<$Res> {
  __$EmbeddedResourceCopyWithImpl(this._self, this._then);

  final _EmbeddedResource _self;
  final $Res Function(_EmbeddedResource) _then;

/// Create a copy of EmbeddedResourceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = null,Object? applicationId = null,Object? id = freezed,Object? type = null,Object? attributes = null,Object? metadata = null,Object? payload = null,Object? enableConsoleLogCapture = null,Object? reconnectStrategy = freezed,}) {
  return _then(_EmbeddedResource(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EmbeddedResourceModelType,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataModel,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as List<String>,enableConsoleLogCapture: null == enableConsoleLogCapture ? _self.enableConsoleLogCapture : enableConsoleLogCapture // ignore: cast_nullable_to_non_nullable
as bool,reconnectStrategy: freezed == reconnectStrategy ? _self.reconnectStrategy : reconnectStrategy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EmbeddedResourceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataModelCopyWith<$Res> get metadata {
  
  return $MetadataModelCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
