// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_collection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationCollectionState {

 ApplicationsStateStatus get status; UserMetadata? get user; List<ApplicationModel> get applications; ApplicationModel? get deleteApplication; Exception? get error;
/// Create a copy of ApplicationCollectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationCollectionStateCopyWith<ApplicationCollectionState> get copyWith => _$ApplicationCollectionStateCopyWithImpl<ApplicationCollectionState>(this as ApplicationCollectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationCollectionState&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.applications, applications)&&(identical(other.deleteApplication, deleteApplication) || other.deleteApplication == deleteApplication)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,user,const DeepCollectionEquality().hash(applications),deleteApplication,error);

@override
String toString() {
  return 'ApplicationCollectionState(status: $status, user: $user, applications: $applications, deleteApplication: $deleteApplication, error: $error)';
}


}

/// @nodoc
abstract mixin class $ApplicationCollectionStateCopyWith<$Res>  {
  factory $ApplicationCollectionStateCopyWith(ApplicationCollectionState value, $Res Function(ApplicationCollectionState) _then) = _$ApplicationCollectionStateCopyWithImpl;
@useResult
$Res call({
 ApplicationsStateStatus status, UserMetadata? user, List<ApplicationModel> applications, ApplicationModel? deleteApplication, Exception? error
});


$UserMetadataCopyWith<$Res>? get user;$ApplicationModelCopyWith<$Res>? get deleteApplication;

}
/// @nodoc
class _$ApplicationCollectionStateCopyWithImpl<$Res>
    implements $ApplicationCollectionStateCopyWith<$Res> {
  _$ApplicationCollectionStateCopyWithImpl(this._self, this._then);

  final ApplicationCollectionState _self;
  final $Res Function(ApplicationCollectionState) _then;

/// Create a copy of ApplicationCollectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? user = freezed,Object? applications = null,Object? deleteApplication = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApplicationsStateStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserMetadata?,applications: null == applications ? _self.applications : applications // ignore: cast_nullable_to_non_nullable
as List<ApplicationModel>,deleteApplication: freezed == deleteApplication ? _self.deleteApplication : deleteApplication // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}
/// Create a copy of ApplicationCollectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserMetadataCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserMetadataCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ApplicationCollectionState
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


/// Adds pattern-matching-related methods to [ApplicationCollectionState].
extension ApplicationCollectionStatePatterns on ApplicationCollectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ApplicationCollectionStateInitial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApplicationCollectionStateInitial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ApplicationCollectionStateInitial value)  $default,){
final _that = this;
switch (_that) {
case ApplicationCollectionStateInitial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ApplicationCollectionStateInitial value)?  $default,){
final _that = this;
switch (_that) {
case ApplicationCollectionStateInitial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ApplicationsStateStatus status,  UserMetadata? user,  List<ApplicationModel> applications,  ApplicationModel? deleteApplication,  Exception? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplicationCollectionStateInitial() when $default != null:
return $default(_that.status,_that.user,_that.applications,_that.deleteApplication,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ApplicationsStateStatus status,  UserMetadata? user,  List<ApplicationModel> applications,  ApplicationModel? deleteApplication,  Exception? error)  $default,) {final _that = this;
switch (_that) {
case ApplicationCollectionStateInitial():
return $default(_that.status,_that.user,_that.applications,_that.deleteApplication,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ApplicationsStateStatus status,  UserMetadata? user,  List<ApplicationModel> applications,  ApplicationModel? deleteApplication,  Exception? error)?  $default,) {final _that = this;
switch (_that) {
case ApplicationCollectionStateInitial() when $default != null:
return $default(_that.status,_that.user,_that.applications,_that.deleteApplication,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ApplicationCollectionStateInitial extends ApplicationCollectionState {
  const ApplicationCollectionStateInitial({required this.status, this.user, final  List<ApplicationModel> applications = const [], this.deleteApplication, this.error}): _applications = applications,super._();
  

@override final  ApplicationsStateStatus status;
@override final  UserMetadata? user;
 final  List<ApplicationModel> _applications;
@override@JsonKey() List<ApplicationModel> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}

@override final  ApplicationModel? deleteApplication;
@override final  Exception? error;

/// Create a copy of ApplicationCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationCollectionStateInitialCopyWith<ApplicationCollectionStateInitial> get copyWith => _$ApplicationCollectionStateInitialCopyWithImpl<ApplicationCollectionStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationCollectionStateInitial&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._applications, _applications)&&(identical(other.deleteApplication, deleteApplication) || other.deleteApplication == deleteApplication)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,user,const DeepCollectionEquality().hash(_applications),deleteApplication,error);

@override
String toString() {
  return 'ApplicationCollectionState(status: $status, user: $user, applications: $applications, deleteApplication: $deleteApplication, error: $error)';
}


}

/// @nodoc
abstract mixin class $ApplicationCollectionStateInitialCopyWith<$Res> implements $ApplicationCollectionStateCopyWith<$Res> {
  factory $ApplicationCollectionStateInitialCopyWith(ApplicationCollectionStateInitial value, $Res Function(ApplicationCollectionStateInitial) _then) = _$ApplicationCollectionStateInitialCopyWithImpl;
@override @useResult
$Res call({
 ApplicationsStateStatus status, UserMetadata? user, List<ApplicationModel> applications, ApplicationModel? deleteApplication, Exception? error
});


@override $UserMetadataCopyWith<$Res>? get user;@override $ApplicationModelCopyWith<$Res>? get deleteApplication;

}
/// @nodoc
class _$ApplicationCollectionStateInitialCopyWithImpl<$Res>
    implements $ApplicationCollectionStateInitialCopyWith<$Res> {
  _$ApplicationCollectionStateInitialCopyWithImpl(this._self, this._then);

  final ApplicationCollectionStateInitial _self;
  final $Res Function(ApplicationCollectionStateInitial) _then;

/// Create a copy of ApplicationCollectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? user = freezed,Object? applications = null,Object? deleteApplication = freezed,Object? error = freezed,}) {
  return _then(ApplicationCollectionStateInitial(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApplicationsStateStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserMetadata?,applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<ApplicationModel>,deleteApplication: freezed == deleteApplication ? _self.deleteApplication : deleteApplication // ignore: cast_nullable_to_non_nullable
as ApplicationModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}

/// Create a copy of ApplicationCollectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserMetadataCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserMetadataCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ApplicationCollectionState
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
