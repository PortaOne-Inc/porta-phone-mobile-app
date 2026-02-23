// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translations_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TranslationsState {

 TranslationsStateType get state; Filter get filter; Translations get translations; Exception? get exception;
/// Create a copy of TranslationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationsStateCopyWith<TranslationsState> get copyWith => _$TranslationsStateCopyWithImpl<TranslationsState>(this as TranslationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationsState&&(identical(other.state, state) || other.state == state)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.translations, translations) || other.translations == translations)&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,state,filter,translations,exception);

@override
String toString() {
  return 'TranslationsState(state: $state, filter: $filter, translations: $translations, exception: $exception)';
}


}

/// @nodoc
abstract mixin class $TranslationsStateCopyWith<$Res>  {
  factory $TranslationsStateCopyWith(TranslationsState value, $Res Function(TranslationsState) _then) = _$TranslationsStateCopyWithImpl;
@useResult
$Res call({
 TranslationsStateType state, Filter filter, Translations translations, Exception? exception
});


$FilterCopyWith<$Res> get filter;$TranslationsCopyWith<$Res> get translations;

}
/// @nodoc
class _$TranslationsStateCopyWithImpl<$Res>
    implements $TranslationsStateCopyWith<$Res> {
  _$TranslationsStateCopyWithImpl(this._self, this._then);

  final TranslationsState _self;
  final $Res Function(TranslationsState) _then;

/// Create a copy of TranslationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? filter = null,Object? translations = null,Object? exception = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TranslationsStateType,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter,translations: null == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as Translations,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}
/// Create a copy of TranslationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterCopyWith<$Res> get filter {
  
  return $FilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of TranslationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslationsCopyWith<$Res> get translations {
  
  return $TranslationsCopyWith<$Res>(_self.translations, (value) {
    return _then(_self.copyWith(translations: value));
  });
}
}


/// Adds pattern-matching-related methods to [TranslationsState].
extension TranslationsStatePatterns on TranslationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslationsState value)  $default,){
final _that = this;
switch (_that) {
case _TranslationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslationsState value)?  $default,){
final _that = this;
switch (_that) {
case _TranslationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TranslationsStateType state,  Filter filter,  Translations translations,  Exception? exception)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslationsState() when $default != null:
return $default(_that.state,_that.filter,_that.translations,_that.exception);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TranslationsStateType state,  Filter filter,  Translations translations,  Exception? exception)  $default,) {final _that = this;
switch (_that) {
case _TranslationsState():
return $default(_that.state,_that.filter,_that.translations,_that.exception);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TranslationsStateType state,  Filter filter,  Translations translations,  Exception? exception)?  $default,) {final _that = this;
switch (_that) {
case _TranslationsState() when $default != null:
return $default(_that.state,_that.filter,_that.translations,_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class _TranslationsState extends TranslationsState {
  const _TranslationsState({this.state = TranslationsStateType.initializing, this.filter = const Filter(), this.translations = const Translations(), this.exception}): super._();
  

@override@JsonKey() final  TranslationsStateType state;
@override@JsonKey() final  Filter filter;
@override@JsonKey() final  Translations translations;
@override final  Exception? exception;

/// Create a copy of TranslationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationsStateCopyWith<_TranslationsState> get copyWith => __$TranslationsStateCopyWithImpl<_TranslationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslationsState&&(identical(other.state, state) || other.state == state)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.translations, translations) || other.translations == translations)&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,state,filter,translations,exception);

@override
String toString() {
  return 'TranslationsState(state: $state, filter: $filter, translations: $translations, exception: $exception)';
}


}

/// @nodoc
abstract mixin class _$TranslationsStateCopyWith<$Res> implements $TranslationsStateCopyWith<$Res> {
  factory _$TranslationsStateCopyWith(_TranslationsState value, $Res Function(_TranslationsState) _then) = __$TranslationsStateCopyWithImpl;
@override @useResult
$Res call({
 TranslationsStateType state, Filter filter, Translations translations, Exception? exception
});


@override $FilterCopyWith<$Res> get filter;@override $TranslationsCopyWith<$Res> get translations;

}
/// @nodoc
class __$TranslationsStateCopyWithImpl<$Res>
    implements _$TranslationsStateCopyWith<$Res> {
  __$TranslationsStateCopyWithImpl(this._self, this._then);

  final _TranslationsState _self;
  final $Res Function(_TranslationsState) _then;

/// Create a copy of TranslationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? filter = null,Object? translations = null,Object? exception = freezed,}) {
  return _then(_TranslationsState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as TranslationsStateType,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as Filter,translations: null == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as Translations,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}

/// Create a copy of TranslationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterCopyWith<$Res> get filter {
  
  return $FilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of TranslationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranslationsCopyWith<$Res> get translations {
  
  return $TranslationsCopyWith<$Res>(_self.translations, (value) {
    return _then(_self.copyWith(translations: value));
  });
}
}

/// @nodoc
mixin _$Translations {

 List<Translation> get original; List<Translation> get overrided;
/// Create a copy of Translations
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationsCopyWith<Translations> get copyWith => _$TranslationsCopyWithImpl<Translations>(this as Translations, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Translations&&const DeepCollectionEquality().equals(other.original, original)&&const DeepCollectionEquality().equals(other.overrided, overrided));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(original),const DeepCollectionEquality().hash(overrided));

@override
String toString() {
  return 'Translations(original: $original, overrided: $overrided)';
}


}

/// @nodoc
abstract mixin class $TranslationsCopyWith<$Res>  {
  factory $TranslationsCopyWith(Translations value, $Res Function(Translations) _then) = _$TranslationsCopyWithImpl;
@useResult
$Res call({
 List<Translation> original, List<Translation> overrided
});




}
/// @nodoc
class _$TranslationsCopyWithImpl<$Res>
    implements $TranslationsCopyWith<$Res> {
  _$TranslationsCopyWithImpl(this._self, this._then);

  final Translations _self;
  final $Res Function(Translations) _then;

/// Create a copy of Translations
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? original = null,Object? overrided = null,}) {
  return _then(_self.copyWith(
original: null == original ? _self.original : original // ignore: cast_nullable_to_non_nullable
as List<Translation>,overrided: null == overrided ? _self.overrided : overrided // ignore: cast_nullable_to_non_nullable
as List<Translation>,
  ));
}

}


/// Adds pattern-matching-related methods to [Translations].
extension TranslationsPatterns on Translations {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Translations value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Translations() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Translations value)  $default,){
final _that = this;
switch (_that) {
case _Translations():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Translations value)?  $default,){
final _that = this;
switch (_that) {
case _Translations() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Translation> original,  List<Translation> overrided)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Translations() when $default != null:
return $default(_that.original,_that.overrided);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Translation> original,  List<Translation> overrided)  $default,) {final _that = this;
switch (_that) {
case _Translations():
return $default(_that.original,_that.overrided);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Translation> original,  List<Translation> overrided)?  $default,) {final _that = this;
switch (_that) {
case _Translations() when $default != null:
return $default(_that.original,_that.overrided);case _:
  return null;

}
}

}

/// @nodoc


class _Translations implements Translations {
  const _Translations({final  List<Translation> original = const [], final  List<Translation> overrided = const []}): _original = original,_overrided = overrided;
  

 final  List<Translation> _original;
@override@JsonKey() List<Translation> get original {
  if (_original is EqualUnmodifiableListView) return _original;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_original);
}

 final  List<Translation> _overrided;
@override@JsonKey() List<Translation> get overrided {
  if (_overrided is EqualUnmodifiableListView) return _overrided;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_overrided);
}


/// Create a copy of Translations
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationsCopyWith<_Translations> get copyWith => __$TranslationsCopyWithImpl<_Translations>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Translations&&const DeepCollectionEquality().equals(other._original, _original)&&const DeepCollectionEquality().equals(other._overrided, _overrided));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_original),const DeepCollectionEquality().hash(_overrided));

@override
String toString() {
  return 'Translations(original: $original, overrided: $overrided)';
}


}

/// @nodoc
abstract mixin class _$TranslationsCopyWith<$Res> implements $TranslationsCopyWith<$Res> {
  factory _$TranslationsCopyWith(_Translations value, $Res Function(_Translations) _then) = __$TranslationsCopyWithImpl;
@override @useResult
$Res call({
 List<Translation> original, List<Translation> overrided
});




}
/// @nodoc
class __$TranslationsCopyWithImpl<$Res>
    implements _$TranslationsCopyWith<$Res> {
  __$TranslationsCopyWithImpl(this._self, this._then);

  final _Translations _self;
  final $Res Function(_Translations) _then;

/// Create a copy of Translations
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? original = null,Object? overrided = null,}) {
  return _then(_Translations(
original: null == original ? _self._original : original // ignore: cast_nullable_to_non_nullable
as List<Translation>,overrided: null == overrided ? _self._overrided : overrided // ignore: cast_nullable_to_non_nullable
as List<Translation>,
  ));
}


}

/// @nodoc
mixin _$Filter {

 String get localeFilter; String get searchFilter;
/// Create a copy of Filter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterCopyWith<Filter> get copyWith => _$FilterCopyWithImpl<Filter>(this as Filter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Filter&&(identical(other.localeFilter, localeFilter) || other.localeFilter == localeFilter)&&(identical(other.searchFilter, searchFilter) || other.searchFilter == searchFilter));
}


@override
int get hashCode => Object.hash(runtimeType,localeFilter,searchFilter);

@override
String toString() {
  return 'Filter(localeFilter: $localeFilter, searchFilter: $searchFilter)';
}


}

/// @nodoc
abstract mixin class $FilterCopyWith<$Res>  {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) _then) = _$FilterCopyWithImpl;
@useResult
$Res call({
 String localeFilter, String searchFilter
});




}
/// @nodoc
class _$FilterCopyWithImpl<$Res>
    implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._self, this._then);

  final Filter _self;
  final $Res Function(Filter) _then;

/// Create a copy of Filter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localeFilter = null,Object? searchFilter = null,}) {
  return _then(_self.copyWith(
localeFilter: null == localeFilter ? _self.localeFilter : localeFilter // ignore: cast_nullable_to_non_nullable
as String,searchFilter: null == searchFilter ? _self.searchFilter : searchFilter // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Filter].
extension FilterPatterns on Filter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Filter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Filter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Filter value)  $default,){
final _that = this;
switch (_that) {
case _Filter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Filter value)?  $default,){
final _that = this;
switch (_that) {
case _Filter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localeFilter,  String searchFilter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Filter() when $default != null:
return $default(_that.localeFilter,_that.searchFilter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localeFilter,  String searchFilter)  $default,) {final _that = this;
switch (_that) {
case _Filter():
return $default(_that.localeFilter,_that.searchFilter);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localeFilter,  String searchFilter)?  $default,) {final _that = this;
switch (_that) {
case _Filter() when $default != null:
return $default(_that.localeFilter,_that.searchFilter);case _:
  return null;

}
}

}

/// @nodoc


class _Filter implements Filter {
  const _Filter({this.localeFilter = '', this.searchFilter = ''});
  

@override@JsonKey() final  String localeFilter;
@override@JsonKey() final  String searchFilter;

/// Create a copy of Filter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterCopyWith<_Filter> get copyWith => __$FilterCopyWithImpl<_Filter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Filter&&(identical(other.localeFilter, localeFilter) || other.localeFilter == localeFilter)&&(identical(other.searchFilter, searchFilter) || other.searchFilter == searchFilter));
}


@override
int get hashCode => Object.hash(runtimeType,localeFilter,searchFilter);

@override
String toString() {
  return 'Filter(localeFilter: $localeFilter, searchFilter: $searchFilter)';
}


}

/// @nodoc
abstract mixin class _$FilterCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$FilterCopyWith(_Filter value, $Res Function(_Filter) _then) = __$FilterCopyWithImpl;
@override @useResult
$Res call({
 String localeFilter, String searchFilter
});




}
/// @nodoc
class __$FilterCopyWithImpl<$Res>
    implements _$FilterCopyWith<$Res> {
  __$FilterCopyWithImpl(this._self, this._then);

  final _Filter _self;
  final $Res Function(_Filter) _then;

/// Create a copy of Filter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localeFilter = null,Object? searchFilter = null,}) {
  return _then(_Filter(
localeFilter: null == localeFilter ? _self.localeFilter : localeFilter // ignore: cast_nullable_to_non_nullable
as String,searchFilter: null == searchFilter ? _self.searchFilter : searchFilter // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
