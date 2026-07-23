// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_collection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeCollectionState {

 ThemeCollectionStateStatus get status; List<ThemeModel> get themes; ThemeModel? get deleteTheme; ApplicationModel? get application; ApplicationModel? get deleteApplication; Object? get error;
/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeCollectionStateCopyWith<ThemeCollectionState> get copyWith => _$ThemeCollectionStateCopyWithImpl<ThemeCollectionState>(this as ThemeCollectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeCollectionState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.themes, themes)&&(identical(other.deleteTheme, deleteTheme) || other.deleteTheme == deleteTheme)&&(identical(other.application, application) || other.application == application)&&(identical(other.deleteApplication, deleteApplication) || other.deleteApplication == deleteApplication)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(themes),deleteTheme,application,deleteApplication,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ThemeCollectionState(status: $status, themes: $themes, deleteTheme: $deleteTheme, application: $application, deleteApplication: $deleteApplication, error: $error)';
}


}

/// @nodoc
abstract mixin class $ThemeCollectionStateCopyWith<$Res>  {
  factory $ThemeCollectionStateCopyWith(ThemeCollectionState value, $Res Function(ThemeCollectionState) _then) = _$ThemeCollectionStateCopyWithImpl;
@useResult
$Res call({
 ThemeCollectionStateStatus status, List<ThemeModel> themes, ThemeModel? deleteTheme, ApplicationModel? application, ApplicationModel? deleteApplication, Object? error
});


$ThemeModelCopyWith<$Res>? get deleteTheme;$ApplicationModelCopyWith<$Res>? get application;$ApplicationModelCopyWith<$Res>? get deleteApplication;

}
/// @nodoc
class _$ThemeCollectionStateCopyWithImpl<$Res>
    implements $ThemeCollectionStateCopyWith<$Res> {
  _$ThemeCollectionStateCopyWithImpl(this._self, this._then);

  final ThemeCollectionState _self;
  final $Res Function(ThemeCollectionState) _then;

/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? themes = null,Object? deleteTheme = freezed,Object? application = freezed,Object? deleteApplication = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemeCollectionStateStatus,themes: null == themes ? _self.themes : themes // ignore: cast_nullable_to_non_nullable
as List<ThemeModel>,deleteTheme: freezed == deleteTheme ? _self.deleteTheme : deleteTheme // ignore: cast_nullable_to_non_nullable
as ThemeModel?,application: freezed == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,deleteApplication: freezed == deleteApplication ? _self.deleteApplication : deleteApplication // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,error: freezed == error ? _self.error : error ,
  ));
}
/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeModelCopyWith<$Res>? get deleteTheme {
    if (_self.deleteTheme == null) {
    return null;
  }

  return $ThemeModelCopyWith<$Res>(_self.deleteTheme!, (value) {
    return _then(_self.copyWith(deleteTheme: value));
  });
}/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<$Res>? get application {
    if (_self.application == null) {
    return null;
  }

  return $ApplicationModelCopyWith<$Res>(_self.application!, (value) {
    return _then(_self.copyWith(application: value));
  });
}/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<$Res>? get deleteApplication {
    if (_self.deleteApplication == null) {
    return null;
  }

  return $ApplicationModelCopyWith<$Res>(_self.deleteApplication!, (value) {
    return _then(_self.copyWith(deleteApplication: value));
  });
}
}


/// Adds pattern-matching-related methods to [ThemeCollectionState].
extension ThemeCollectionStatePatterns on ThemeCollectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ThemeCollectionInitial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case ThemeCollectionInitial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ThemeCollectionInitial value)  $default,){
final _that = this;
switch (_that) {
case ThemeCollectionInitial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ThemeCollectionInitial value)?  $default,){
final _that = this;
switch (_that) {
case ThemeCollectionInitial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeCollectionStateStatus status,  List<ThemeModel> themes,  ThemeModel? deleteTheme,  ApplicationModel? application,  ApplicationModel? deleteApplication,  Object? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case ThemeCollectionInitial() when $default != null:
return $default(_that.status,_that.themes,_that.deleteTheme,_that.application,_that.deleteApplication,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeCollectionStateStatus status,  List<ThemeModel> themes,  ThemeModel? deleteTheme,  ApplicationModel? application,  ApplicationModel? deleteApplication,  Object? error)  $default,) {final _that = this;
switch (_that) {
case ThemeCollectionInitial():
return $default(_that.status,_that.themes,_that.deleteTheme,_that.application,_that.deleteApplication,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeCollectionStateStatus status,  List<ThemeModel> themes,  ThemeModel? deleteTheme,  ApplicationModel? application,  ApplicationModel? deleteApplication,  Object? error)?  $default,) {final _that = this;
switch (_that) {
case ThemeCollectionInitial() when $default != null:
return $default(_that.status,_that.themes,_that.deleteTheme,_that.application,_that.deleteApplication,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ThemeCollectionInitial extends ThemeCollectionState {
  const ThemeCollectionInitial({required this.status, final  List<ThemeModel> themes = const [], this.deleteTheme, this.application, this.deleteApplication, this.error}): _themes = themes,super._();
  

@override final  ThemeCollectionStateStatus status;
 final  List<ThemeModel> _themes;
@override@JsonKey() List<ThemeModel> get themes {
  if (_themes is EqualUnmodifiableListView) return _themes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_themes);
}

@override final  ThemeModel? deleteTheme;
@override final  ApplicationModel? application;
@override final  ApplicationModel? deleteApplication;
@override final  Object? error;

/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeCollectionInitialCopyWith<ThemeCollectionInitial> get copyWith => _$ThemeCollectionInitialCopyWithImpl<ThemeCollectionInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeCollectionInitial&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._themes, _themes)&&(identical(other.deleteTheme, deleteTheme) || other.deleteTheme == deleteTheme)&&(identical(other.application, application) || other.application == application)&&(identical(other.deleteApplication, deleteApplication) || other.deleteApplication == deleteApplication)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_themes),deleteTheme,application,deleteApplication,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ThemeCollectionState(status: $status, themes: $themes, deleteTheme: $deleteTheme, application: $application, deleteApplication: $deleteApplication, error: $error)';
}


}

/// @nodoc
abstract mixin class $ThemeCollectionInitialCopyWith<$Res> implements $ThemeCollectionStateCopyWith<$Res> {
  factory $ThemeCollectionInitialCopyWith(ThemeCollectionInitial value, $Res Function(ThemeCollectionInitial) _then) = _$ThemeCollectionInitialCopyWithImpl;
@override @useResult
$Res call({
 ThemeCollectionStateStatus status, List<ThemeModel> themes, ThemeModel? deleteTheme, ApplicationModel? application, ApplicationModel? deleteApplication, Object? error
});


@override $ThemeModelCopyWith<$Res>? get deleteTheme;@override $ApplicationModelCopyWith<$Res>? get application;@override $ApplicationModelCopyWith<$Res>? get deleteApplication;

}
/// @nodoc
class _$ThemeCollectionInitialCopyWithImpl<$Res>
    implements $ThemeCollectionInitialCopyWith<$Res> {
  _$ThemeCollectionInitialCopyWithImpl(this._self, this._then);

  final ThemeCollectionInitial _self;
  final $Res Function(ThemeCollectionInitial) _then;

/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? themes = null,Object? deleteTheme = freezed,Object? application = freezed,Object? deleteApplication = freezed,Object? error = freezed,}) {
  return _then(ThemeCollectionInitial(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ThemeCollectionStateStatus,themes: null == themes ? _self._themes : themes // ignore: cast_nullable_to_non_nullable
as List<ThemeModel>,deleteTheme: freezed == deleteTheme ? _self.deleteTheme : deleteTheme // ignore: cast_nullable_to_non_nullable
as ThemeModel?,application: freezed == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,deleteApplication: freezed == deleteApplication ? _self.deleteApplication : deleteApplication // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,error: freezed == error ? _self.error : error ,
  ));
}

/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemeModelCopyWith<$Res>? get deleteTheme {
    if (_self.deleteTheme == null) {
    return null;
  }

  return $ThemeModelCopyWith<$Res>(_self.deleteTheme!, (value) {
    return _then(_self.copyWith(deleteTheme: value));
  });
}/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<$Res>? get application {
    if (_self.application == null) {
    return null;
  }

  return $ApplicationModelCopyWith<$Res>(_self.application!, (value) {
    return _then(_self.copyWith(application: value));
  });
}/// Create a copy of ThemeCollectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<$Res>? get deleteApplication {
    if (_self.deleteApplication == null) {
    return null;
  }

  return $ApplicationModelCopyWith<$Res>(_self.deleteApplication!, (value) {
    return _then(_self.copyWith(deleteApplication: value));
  });
}
}

// dart format on
