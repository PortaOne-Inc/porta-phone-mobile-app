// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'embedded_resource_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmbeddedResourceDto {

 String get applicationId; String get uri; String? get id; String get type; Map<String, dynamic> get attributes; MetadataDto get metadata; List<String> get payload; bool get enableConsoleLogCapture; String? get reconnectStrategy; String? get createdAt; String? get updatedAt;
/// Create a copy of EmbeddedResourceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmbeddedResourceDtoCopyWith<EmbeddedResourceDto> get copyWith => _$EmbeddedResourceDtoCopyWithImpl<EmbeddedResourceDto>(this as EmbeddedResourceDto, _$identity);

  /// Serializes this EmbeddedResourceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmbeddedResourceDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.payload, payload)&&(identical(other.enableConsoleLogCapture, enableConsoleLogCapture) || other.enableConsoleLogCapture == enableConsoleLogCapture)&&(identical(other.reconnectStrategy, reconnectStrategy) || other.reconnectStrategy == reconnectStrategy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,uri,id,type,const DeepCollectionEquality().hash(attributes),metadata,const DeepCollectionEquality().hash(payload),enableConsoleLogCapture,reconnectStrategy,createdAt,updatedAt);

@override
String toString() {
  return 'EmbeddedResourceDto(applicationId: $applicationId, uri: $uri, id: $id, type: $type, attributes: $attributes, metadata: $metadata, payload: $payload, enableConsoleLogCapture: $enableConsoleLogCapture, reconnectStrategy: $reconnectStrategy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EmbeddedResourceDtoCopyWith<$Res>  {
  factory $EmbeddedResourceDtoCopyWith(EmbeddedResourceDto value, $Res Function(EmbeddedResourceDto) _then) = _$EmbeddedResourceDtoCopyWithImpl;
@useResult
$Res call({
 String applicationId, String uri, String? id, String type, Map<String, dynamic> attributes, MetadataDto metadata, List<String> payload, bool enableConsoleLogCapture, String? reconnectStrategy, String? createdAt, String? updatedAt
});


$MetadataDtoCopyWith<$Res> get metadata;

}
/// @nodoc
class _$EmbeddedResourceDtoCopyWithImpl<$Res>
    implements $EmbeddedResourceDtoCopyWith<$Res> {
  _$EmbeddedResourceDtoCopyWithImpl(this._self, this._then);

  final EmbeddedResourceDto _self;
  final $Res Function(EmbeddedResourceDto) _then;

/// Create a copy of EmbeddedResourceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applicationId = null,Object? uri = null,Object? id = freezed,Object? type = null,Object? attributes = null,Object? metadata = null,Object? payload = null,Object? enableConsoleLogCapture = null,Object? reconnectStrategy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataDto,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as List<String>,enableConsoleLogCapture: null == enableConsoleLogCapture ? _self.enableConsoleLogCapture : enableConsoleLogCapture // ignore: cast_nullable_to_non_nullable
as bool,reconnectStrategy: freezed == reconnectStrategy ? _self.reconnectStrategy : reconnectStrategy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EmbeddedResourceDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataDtoCopyWith<$Res> get metadata {
  
  return $MetadataDtoCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmbeddedResourceDto].
extension EmbeddedResourceDtoPatterns on EmbeddedResourceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmbeddedResourceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmbeddedResourceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmbeddedResourceDto value)  $default,){
final _that = this;
switch (_that) {
case _EmbeddedResourceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmbeddedResourceDto value)?  $default,){
final _that = this;
switch (_that) {
case _EmbeddedResourceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String applicationId,  String uri,  String? id,  String type,  Map<String, dynamic> attributes,  MetadataDto metadata,  List<String> payload,  bool enableConsoleLogCapture,  String? reconnectStrategy,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmbeddedResourceDto() when $default != null:
return $default(_that.applicationId,_that.uri,_that.id,_that.type,_that.attributes,_that.metadata,_that.payload,_that.enableConsoleLogCapture,_that.reconnectStrategy,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String applicationId,  String uri,  String? id,  String type,  Map<String, dynamic> attributes,  MetadataDto metadata,  List<String> payload,  bool enableConsoleLogCapture,  String? reconnectStrategy,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _EmbeddedResourceDto():
return $default(_that.applicationId,_that.uri,_that.id,_that.type,_that.attributes,_that.metadata,_that.payload,_that.enableConsoleLogCapture,_that.reconnectStrategy,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String applicationId,  String uri,  String? id,  String type,  Map<String, dynamic> attributes,  MetadataDto metadata,  List<String> payload,  bool enableConsoleLogCapture,  String? reconnectStrategy,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _EmbeddedResourceDto() when $default != null:
return $default(_that.applicationId,_that.uri,_that.id,_that.type,_that.attributes,_that.metadata,_that.payload,_that.enableConsoleLogCapture,_that.reconnectStrategy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _EmbeddedResourceDto extends EmbeddedResourceDto {
  const _EmbeddedResourceDto({required this.applicationId, required this.uri, this.id, this.type = 'unknown', final  Map<String, dynamic> attributes = const {}, this.metadata = const MetadataDto(), final  List<String> payload = const <String>[], this.enableConsoleLogCapture = false, this.reconnectStrategy, this.createdAt, this.updatedAt}): _attributes = attributes,_payload = payload,super._();
  factory _EmbeddedResourceDto.fromJson(Map<String, dynamic> json) => _$EmbeddedResourceDtoFromJson(json);

@override final  String applicationId;
@override final  String uri;
@override final  String? id;
@override@JsonKey() final  String type;
 final  Map<String, dynamic> _attributes;
@override@JsonKey() Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}

@override@JsonKey() final  MetadataDto metadata;
 final  List<String> _payload;
@override@JsonKey() List<String> get payload {
  if (_payload is EqualUnmodifiableListView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payload);
}

@override@JsonKey() final  bool enableConsoleLogCapture;
@override final  String? reconnectStrategy;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of EmbeddedResourceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmbeddedResourceDtoCopyWith<_EmbeddedResourceDto> get copyWith => __$EmbeddedResourceDtoCopyWithImpl<_EmbeddedResourceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmbeddedResourceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmbeddedResourceDto&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._payload, _payload)&&(identical(other.enableConsoleLogCapture, enableConsoleLogCapture) || other.enableConsoleLogCapture == enableConsoleLogCapture)&&(identical(other.reconnectStrategy, reconnectStrategy) || other.reconnectStrategy == reconnectStrategy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,applicationId,uri,id,type,const DeepCollectionEquality().hash(_attributes),metadata,const DeepCollectionEquality().hash(_payload),enableConsoleLogCapture,reconnectStrategy,createdAt,updatedAt);

@override
String toString() {
  return 'EmbeddedResourceDto(applicationId: $applicationId, uri: $uri, id: $id, type: $type, attributes: $attributes, metadata: $metadata, payload: $payload, enableConsoleLogCapture: $enableConsoleLogCapture, reconnectStrategy: $reconnectStrategy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EmbeddedResourceDtoCopyWith<$Res> implements $EmbeddedResourceDtoCopyWith<$Res> {
  factory _$EmbeddedResourceDtoCopyWith(_EmbeddedResourceDto value, $Res Function(_EmbeddedResourceDto) _then) = __$EmbeddedResourceDtoCopyWithImpl;
@override @useResult
$Res call({
 String applicationId, String uri, String? id, String type, Map<String, dynamic> attributes, MetadataDto metadata, List<String> payload, bool enableConsoleLogCapture, String? reconnectStrategy, String? createdAt, String? updatedAt
});


@override $MetadataDtoCopyWith<$Res> get metadata;

}
/// @nodoc
class __$EmbeddedResourceDtoCopyWithImpl<$Res>
    implements _$EmbeddedResourceDtoCopyWith<$Res> {
  __$EmbeddedResourceDtoCopyWithImpl(this._self, this._then);

  final _EmbeddedResourceDto _self;
  final $Res Function(_EmbeddedResourceDto) _then;

/// Create a copy of EmbeddedResourceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? uri = null,Object? id = freezed,Object? type = null,Object? attributes = null,Object? metadata = null,Object? payload = null,Object? enableConsoleLogCapture = null,Object? reconnectStrategy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_EmbeddedResourceDto(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as MetadataDto,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as List<String>,enableConsoleLogCapture: null == enableConsoleLogCapture ? _self.enableConsoleLogCapture : enableConsoleLogCapture // ignore: cast_nullable_to_non_nullable
as bool,reconnectStrategy: freezed == reconnectStrategy ? _self.reconnectStrategy : reconnectStrategy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EmbeddedResourceDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataDtoCopyWith<$Res> get metadata {
  
  return $MetadataDtoCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$MetadataDto {

 Map<String, dynamic> get attributes;
/// Create a copy of MetadataDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataDtoCopyWith<MetadataDto> get copyWith => _$MetadataDtoCopyWithImpl<MetadataDto>(this as MetadataDto, _$identity);

  /// Serializes this MetadataDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetadataDto&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'MetadataDto(attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $MetadataDtoCopyWith<$Res>  {
  factory $MetadataDtoCopyWith(MetadataDto value, $Res Function(MetadataDto) _then) = _$MetadataDtoCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> attributes
});




}
/// @nodoc
class _$MetadataDtoCopyWithImpl<$Res>
    implements $MetadataDtoCopyWith<$Res> {
  _$MetadataDtoCopyWithImpl(this._self, this._then);

  final MetadataDto _self;
  final $Res Function(MetadataDto) _then;

/// Create a copy of MetadataDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attributes = null,}) {
  return _then(_self.copyWith(
attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [MetadataDto].
extension MetadataDtoPatterns on MetadataDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetadataDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetadataDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetadataDto value)  $default,){
final _that = this;
switch (_that) {
case _MetadataDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetadataDto value)?  $default,){
final _that = this;
switch (_that) {
case _MetadataDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetadataDto() when $default != null:
return $default(_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> attributes)  $default,) {final _that = this;
switch (_that) {
case _MetadataDto():
return $default(_that.attributes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> attributes)?  $default,) {final _that = this;
switch (_that) {
case _MetadataDto() when $default != null:
return $default(_that.attributes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _MetadataDto extends MetadataDto {
  const _MetadataDto({final  Map<String, dynamic> attributes = const {}}): _attributes = attributes,super._();
  factory _MetadataDto.fromJson(Map<String, dynamic> json) => _$MetadataDtoFromJson(json);

 final  Map<String, dynamic> _attributes;
@override@JsonKey() Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


/// Create a copy of MetadataDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataDtoCopyWith<_MetadataDto> get copyWith => __$MetadataDtoCopyWithImpl<_MetadataDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetadataDto&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'MetadataDto(attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$MetadataDtoCopyWith<$Res> implements $MetadataDtoCopyWith<$Res> {
  factory _$MetadataDtoCopyWith(_MetadataDto value, $Res Function(_MetadataDto) _then) = __$MetadataDtoCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> attributes
});




}
/// @nodoc
class __$MetadataDtoCopyWithImpl<$Res>
    implements _$MetadataDtoCopyWith<$Res> {
  __$MetadataDtoCopyWithImpl(this._self, this._then);

  final _MetadataDto _self;
  final $Res Function(_MetadataDto) _then;

/// Create a copy of MetadataDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attributes = null,}) {
  return _then(_MetadataDto(
attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
