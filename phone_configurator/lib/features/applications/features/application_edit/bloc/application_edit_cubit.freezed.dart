// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_edit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationEditState {

 ApplicationEditStatus get status; ApplicationNameInput? get nameInput; ApplicationIdentifierInput? get androidPlatformIdInput; ApplicationIdentifierInput? get iosPlatformIdInput; ApplicationBuildNameInput? get androidBuildNameInput; ApplicationBuildNumberInput? get androidBuildNumberInput; ApplicationBuildNameInput? get iosBuildNameInput; ApplicationBuildNumberInput? get iosBuildNumberInput; Exception? get exception;
/// Create a copy of ApplicationEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationEditStateCopyWith<ApplicationEditState> get copyWith => _$ApplicationEditStateCopyWithImpl<ApplicationEditState>(this as ApplicationEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationEditState&&(identical(other.status, status) || other.status == status)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.androidPlatformIdInput, androidPlatformIdInput) || other.androidPlatformIdInput == androidPlatformIdInput)&&(identical(other.iosPlatformIdInput, iosPlatformIdInput) || other.iosPlatformIdInput == iosPlatformIdInput)&&(identical(other.androidBuildNameInput, androidBuildNameInput) || other.androidBuildNameInput == androidBuildNameInput)&&(identical(other.androidBuildNumberInput, androidBuildNumberInput) || other.androidBuildNumberInput == androidBuildNumberInput)&&(identical(other.iosBuildNameInput, iosBuildNameInput) || other.iosBuildNameInput == iosBuildNameInput)&&(identical(other.iosBuildNumberInput, iosBuildNumberInput) || other.iosBuildNumberInput == iosBuildNumberInput)&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,status,nameInput,androidPlatformIdInput,iosPlatformIdInput,androidBuildNameInput,androidBuildNumberInput,iosBuildNameInput,iosBuildNumberInput,exception);

@override
String toString() {
  return 'ApplicationEditState(status: $status, nameInput: $nameInput, androidPlatformIdInput: $androidPlatformIdInput, iosPlatformIdInput: $iosPlatformIdInput, androidBuildNameInput: $androidBuildNameInput, androidBuildNumberInput: $androidBuildNumberInput, iosBuildNameInput: $iosBuildNameInput, iosBuildNumberInput: $iosBuildNumberInput, exception: $exception)';
}


}

/// @nodoc
abstract mixin class $ApplicationEditStateCopyWith<$Res>  {
  factory $ApplicationEditStateCopyWith(ApplicationEditState value, $Res Function(ApplicationEditState) _then) = _$ApplicationEditStateCopyWithImpl;
@useResult
$Res call({
 ApplicationEditStatus status, ApplicationNameInput? nameInput, ApplicationIdentifierInput? androidPlatformIdInput, ApplicationIdentifierInput? iosPlatformIdInput, ApplicationBuildNameInput? androidBuildNameInput, ApplicationBuildNumberInput? androidBuildNumberInput, ApplicationBuildNameInput? iosBuildNameInput, ApplicationBuildNumberInput? iosBuildNumberInput, Exception? exception
});




}
/// @nodoc
class _$ApplicationEditStateCopyWithImpl<$Res>
    implements $ApplicationEditStateCopyWith<$Res> {
  _$ApplicationEditStateCopyWithImpl(this._self, this._then);

  final ApplicationEditState _self;
  final $Res Function(ApplicationEditState) _then;

/// Create a copy of ApplicationEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? nameInput = freezed,Object? androidPlatformIdInput = freezed,Object? iosPlatformIdInput = freezed,Object? androidBuildNameInput = freezed,Object? androidBuildNumberInput = freezed,Object? iosBuildNameInput = freezed,Object? iosBuildNumberInput = freezed,Object? exception = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApplicationEditStatus,nameInput: freezed == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as ApplicationNameInput?,androidPlatformIdInput: freezed == androidPlatformIdInput ? _self.androidPlatformIdInput : androidPlatformIdInput // ignore: cast_nullable_to_non_nullable
as ApplicationIdentifierInput?,iosPlatformIdInput: freezed == iosPlatformIdInput ? _self.iosPlatformIdInput : iosPlatformIdInput // ignore: cast_nullable_to_non_nullable
as ApplicationIdentifierInput?,androidBuildNameInput: freezed == androidBuildNameInput ? _self.androidBuildNameInput : androidBuildNameInput // ignore: cast_nullable_to_non_nullable
as ApplicationBuildNameInput?,androidBuildNumberInput: freezed == androidBuildNumberInput ? _self.androidBuildNumberInput : androidBuildNumberInput // ignore: cast_nullable_to_non_nullable
as ApplicationBuildNumberInput?,iosBuildNameInput: freezed == iosBuildNameInput ? _self.iosBuildNameInput : iosBuildNameInput // ignore: cast_nullable_to_non_nullable
as ApplicationBuildNameInput?,iosBuildNumberInput: freezed == iosBuildNumberInput ? _self.iosBuildNumberInput : iosBuildNumberInput // ignore: cast_nullable_to_non_nullable
as ApplicationBuildNumberInput?,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicationEditState].
extension ApplicationEditStatePatterns on ApplicationEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ApplicationEditStateInitial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApplicationEditStateInitial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ApplicationEditStateInitial value)  $default,){
final _that = this;
switch (_that) {
case ApplicationEditStateInitial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ApplicationEditStateInitial value)?  $default,){
final _that = this;
switch (_that) {
case ApplicationEditStateInitial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ApplicationEditStatus status,  ApplicationNameInput? nameInput,  ApplicationIdentifierInput? androidPlatformIdInput,  ApplicationIdentifierInput? iosPlatformIdInput,  ApplicationBuildNameInput? androidBuildNameInput,  ApplicationBuildNumberInput? androidBuildNumberInput,  ApplicationBuildNameInput? iosBuildNameInput,  ApplicationBuildNumberInput? iosBuildNumberInput,  Exception? exception)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApplicationEditStateInitial() when $default != null:
return $default(_that.status,_that.nameInput,_that.androidPlatformIdInput,_that.iosPlatformIdInput,_that.androidBuildNameInput,_that.androidBuildNumberInput,_that.iosBuildNameInput,_that.iosBuildNumberInput,_that.exception);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ApplicationEditStatus status,  ApplicationNameInput? nameInput,  ApplicationIdentifierInput? androidPlatformIdInput,  ApplicationIdentifierInput? iosPlatformIdInput,  ApplicationBuildNameInput? androidBuildNameInput,  ApplicationBuildNumberInput? androidBuildNumberInput,  ApplicationBuildNameInput? iosBuildNameInput,  ApplicationBuildNumberInput? iosBuildNumberInput,  Exception? exception)  $default,) {final _that = this;
switch (_that) {
case ApplicationEditStateInitial():
return $default(_that.status,_that.nameInput,_that.androidPlatformIdInput,_that.iosPlatformIdInput,_that.androidBuildNameInput,_that.androidBuildNumberInput,_that.iosBuildNameInput,_that.iosBuildNumberInput,_that.exception);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ApplicationEditStatus status,  ApplicationNameInput? nameInput,  ApplicationIdentifierInput? androidPlatformIdInput,  ApplicationIdentifierInput? iosPlatformIdInput,  ApplicationBuildNameInput? androidBuildNameInput,  ApplicationBuildNumberInput? androidBuildNumberInput,  ApplicationBuildNameInput? iosBuildNameInput,  ApplicationBuildNumberInput? iosBuildNumberInput,  Exception? exception)?  $default,) {final _that = this;
switch (_that) {
case ApplicationEditStateInitial() when $default != null:
return $default(_that.status,_that.nameInput,_that.androidPlatformIdInput,_that.iosPlatformIdInput,_that.androidBuildNameInput,_that.androidBuildNumberInput,_that.iosBuildNameInput,_that.iosBuildNumberInput,_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class ApplicationEditStateInitial implements ApplicationEditState {
  const ApplicationEditStateInitial({this.status = ApplicationEditStatus.initial, this.nameInput, this.androidPlatformIdInput, this.iosPlatformIdInput, this.androidBuildNameInput, this.androidBuildNumberInput, this.iosBuildNameInput, this.iosBuildNumberInput, this.exception});
  

@override@JsonKey() final  ApplicationEditStatus status;
@override final  ApplicationNameInput? nameInput;
@override final  ApplicationIdentifierInput? androidPlatformIdInput;
@override final  ApplicationIdentifierInput? iosPlatformIdInput;
@override final  ApplicationBuildNameInput? androidBuildNameInput;
@override final  ApplicationBuildNumberInput? androidBuildNumberInput;
@override final  ApplicationBuildNameInput? iosBuildNameInput;
@override final  ApplicationBuildNumberInput? iosBuildNumberInput;
@override final  Exception? exception;

/// Create a copy of ApplicationEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationEditStateInitialCopyWith<ApplicationEditStateInitial> get copyWith => _$ApplicationEditStateInitialCopyWithImpl<ApplicationEditStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationEditStateInitial&&(identical(other.status, status) || other.status == status)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.androidPlatformIdInput, androidPlatformIdInput) || other.androidPlatformIdInput == androidPlatformIdInput)&&(identical(other.iosPlatformIdInput, iosPlatformIdInput) || other.iosPlatformIdInput == iosPlatformIdInput)&&(identical(other.androidBuildNameInput, androidBuildNameInput) || other.androidBuildNameInput == androidBuildNameInput)&&(identical(other.androidBuildNumberInput, androidBuildNumberInput) || other.androidBuildNumberInput == androidBuildNumberInput)&&(identical(other.iosBuildNameInput, iosBuildNameInput) || other.iosBuildNameInput == iosBuildNameInput)&&(identical(other.iosBuildNumberInput, iosBuildNumberInput) || other.iosBuildNumberInput == iosBuildNumberInput)&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,status,nameInput,androidPlatformIdInput,iosPlatformIdInput,androidBuildNameInput,androidBuildNumberInput,iosBuildNameInput,iosBuildNumberInput,exception);

@override
String toString() {
  return 'ApplicationEditState(status: $status, nameInput: $nameInput, androidPlatformIdInput: $androidPlatformIdInput, iosPlatformIdInput: $iosPlatformIdInput, androidBuildNameInput: $androidBuildNameInput, androidBuildNumberInput: $androidBuildNumberInput, iosBuildNameInput: $iosBuildNameInput, iosBuildNumberInput: $iosBuildNumberInput, exception: $exception)';
}


}

/// @nodoc
abstract mixin class $ApplicationEditStateInitialCopyWith<$Res> implements $ApplicationEditStateCopyWith<$Res> {
  factory $ApplicationEditStateInitialCopyWith(ApplicationEditStateInitial value, $Res Function(ApplicationEditStateInitial) _then) = _$ApplicationEditStateInitialCopyWithImpl;
@override @useResult
$Res call({
 ApplicationEditStatus status, ApplicationNameInput? nameInput, ApplicationIdentifierInput? androidPlatformIdInput, ApplicationIdentifierInput? iosPlatformIdInput, ApplicationBuildNameInput? androidBuildNameInput, ApplicationBuildNumberInput? androidBuildNumberInput, ApplicationBuildNameInput? iosBuildNameInput, ApplicationBuildNumberInput? iosBuildNumberInput, Exception? exception
});




}
/// @nodoc
class _$ApplicationEditStateInitialCopyWithImpl<$Res>
    implements $ApplicationEditStateInitialCopyWith<$Res> {
  _$ApplicationEditStateInitialCopyWithImpl(this._self, this._then);

  final ApplicationEditStateInitial _self;
  final $Res Function(ApplicationEditStateInitial) _then;

/// Create a copy of ApplicationEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? nameInput = freezed,Object? androidPlatformIdInput = freezed,Object? iosPlatformIdInput = freezed,Object? androidBuildNameInput = freezed,Object? androidBuildNumberInput = freezed,Object? iosBuildNameInput = freezed,Object? iosBuildNumberInput = freezed,Object? exception = freezed,}) {
  return _then(ApplicationEditStateInitial(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApplicationEditStatus,nameInput: freezed == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as ApplicationNameInput?,androidPlatformIdInput: freezed == androidPlatformIdInput ? _self.androidPlatformIdInput : androidPlatformIdInput // ignore: cast_nullable_to_non_nullable
as ApplicationIdentifierInput?,iosPlatformIdInput: freezed == iosPlatformIdInput ? _self.iosPlatformIdInput : iosPlatformIdInput // ignore: cast_nullable_to_non_nullable
as ApplicationIdentifierInput?,androidBuildNameInput: freezed == androidBuildNameInput ? _self.androidBuildNameInput : androidBuildNameInput // ignore: cast_nullable_to_non_nullable
as ApplicationBuildNameInput?,androidBuildNumberInput: freezed == androidBuildNumberInput ? _self.androidBuildNumberInput : androidBuildNumberInput // ignore: cast_nullable_to_non_nullable
as ApplicationBuildNumberInput?,iosBuildNameInput: freezed == iosBuildNameInput ? _self.iosBuildNameInput : iosBuildNameInput // ignore: cast_nullable_to_non_nullable
as ApplicationBuildNameInput?,iosBuildNumberInput: freezed == iosBuildNumberInput ? _self.iosBuildNumberInput : iosBuildNumberInput // ignore: cast_nullable_to_non_nullable
as ApplicationBuildNumberInput?,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}


}

// dart format on
