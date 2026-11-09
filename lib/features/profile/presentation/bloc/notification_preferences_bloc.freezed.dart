// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationPreferencesState {

 ViewStatus get status;/// Last values confirmed by the server.
 Map<NotificationChannel, ChannelPreferences> get saved;/// Values being edited on screen.
 Map<NotificationChannel, ChannelPreferences> get edited; SubmitStatus get saveStatus; Failure? get failure; Failure? get saveFailure;
/// Create a copy of NotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPreferencesStateCopyWith<NotificationPreferencesState> get copyWith => _$NotificationPreferencesStateCopyWithImpl<NotificationPreferencesState>(this as NotificationPreferencesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPreferencesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.saved, saved)&&const DeepCollectionEquality().equals(other.edited, edited)&&(identical(other.saveStatus, saveStatus) || other.saveStatus == saveStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saveFailure, saveFailure) || other.saveFailure == saveFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(saved),const DeepCollectionEquality().hash(edited),saveStatus,failure,saveFailure);

@override
String toString() {
  return 'NotificationPreferencesState(status: $status, saved: $saved, edited: $edited, saveStatus: $saveStatus, failure: $failure, saveFailure: $saveFailure)';
}


}

/// @nodoc
abstract mixin class $NotificationPreferencesStateCopyWith<$Res>  {
  factory $NotificationPreferencesStateCopyWith(NotificationPreferencesState value, $Res Function(NotificationPreferencesState) _then) = _$NotificationPreferencesStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, Map<NotificationChannel, ChannelPreferences> saved, Map<NotificationChannel, ChannelPreferences> edited, SubmitStatus saveStatus, Failure? failure, Failure? saveFailure
});




}
/// @nodoc
class _$NotificationPreferencesStateCopyWithImpl<$Res>
    implements $NotificationPreferencesStateCopyWith<$Res> {
  _$NotificationPreferencesStateCopyWithImpl(this._self, this._then);

  final NotificationPreferencesState _self;
  final $Res Function(NotificationPreferencesState) _then;

/// Create a copy of NotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? saved = null,Object? edited = null,Object? saveStatus = null,Object? failure = freezed,Object? saveFailure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as Map<NotificationChannel, ChannelPreferences>,edited: null == edited ? _self.edited : edited // ignore: cast_nullable_to_non_nullable
as Map<NotificationChannel, ChannelPreferences>,saveStatus: null == saveStatus ? _self.saveStatus : saveStatus // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saveFailure: freezed == saveFailure ? _self.saveFailure : saveFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPreferencesState].
extension NotificationPreferencesStatePatterns on NotificationPreferencesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPreferencesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPreferencesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPreferencesState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferencesState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPreferencesState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferencesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  Map<NotificationChannel, ChannelPreferences> saved,  Map<NotificationChannel, ChannelPreferences> edited,  SubmitStatus saveStatus,  Failure? failure,  Failure? saveFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPreferencesState() when $default != null:
return $default(_that.status,_that.saved,_that.edited,_that.saveStatus,_that.failure,_that.saveFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  Map<NotificationChannel, ChannelPreferences> saved,  Map<NotificationChannel, ChannelPreferences> edited,  SubmitStatus saveStatus,  Failure? failure,  Failure? saveFailure)  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferencesState():
return $default(_that.status,_that.saved,_that.edited,_that.saveStatus,_that.failure,_that.saveFailure);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  Map<NotificationChannel, ChannelPreferences> saved,  Map<NotificationChannel, ChannelPreferences> edited,  SubmitStatus saveStatus,  Failure? failure,  Failure? saveFailure)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferencesState() when $default != null:
return $default(_that.status,_that.saved,_that.edited,_that.saveStatus,_that.failure,_that.saveFailure);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationPreferencesState extends NotificationPreferencesState {
  const _NotificationPreferencesState({this.status = ViewStatus.initial, final  Map<NotificationChannel, ChannelPreferences> saved = const {}, final  Map<NotificationChannel, ChannelPreferences> edited = const {}, this.saveStatus = SubmitStatus.idle, this.failure, this.saveFailure}): _saved = saved,_edited = edited,super._();
  

@override@JsonKey() final  ViewStatus status;
/// Last values confirmed by the server.
 final  Map<NotificationChannel, ChannelPreferences> _saved;
/// Last values confirmed by the server.
@override@JsonKey() Map<NotificationChannel, ChannelPreferences> get saved {
  if (_saved is EqualUnmodifiableMapView) return _saved;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_saved);
}

/// Values being edited on screen.
 final  Map<NotificationChannel, ChannelPreferences> _edited;
/// Values being edited on screen.
@override@JsonKey() Map<NotificationChannel, ChannelPreferences> get edited {
  if (_edited is EqualUnmodifiableMapView) return _edited;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_edited);
}

@override@JsonKey() final  SubmitStatus saveStatus;
@override final  Failure? failure;
@override final  Failure? saveFailure;

/// Create a copy of NotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPreferencesStateCopyWith<_NotificationPreferencesState> get copyWith => __$NotificationPreferencesStateCopyWithImpl<_NotificationPreferencesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPreferencesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._saved, _saved)&&const DeepCollectionEquality().equals(other._edited, _edited)&&(identical(other.saveStatus, saveStatus) || other.saveStatus == saveStatus)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saveFailure, saveFailure) || other.saveFailure == saveFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_saved),const DeepCollectionEquality().hash(_edited),saveStatus,failure,saveFailure);

@override
String toString() {
  return 'NotificationPreferencesState(status: $status, saved: $saved, edited: $edited, saveStatus: $saveStatus, failure: $failure, saveFailure: $saveFailure)';
}


}

/// @nodoc
abstract mixin class _$NotificationPreferencesStateCopyWith<$Res> implements $NotificationPreferencesStateCopyWith<$Res> {
  factory _$NotificationPreferencesStateCopyWith(_NotificationPreferencesState value, $Res Function(_NotificationPreferencesState) _then) = __$NotificationPreferencesStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, Map<NotificationChannel, ChannelPreferences> saved, Map<NotificationChannel, ChannelPreferences> edited, SubmitStatus saveStatus, Failure? failure, Failure? saveFailure
});




}
/// @nodoc
class __$NotificationPreferencesStateCopyWithImpl<$Res>
    implements _$NotificationPreferencesStateCopyWith<$Res> {
  __$NotificationPreferencesStateCopyWithImpl(this._self, this._then);

  final _NotificationPreferencesState _self;
  final $Res Function(_NotificationPreferencesState) _then;

/// Create a copy of NotificationPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? saved = null,Object? edited = null,Object? saveStatus = null,Object? failure = freezed,Object? saveFailure = freezed,}) {
  return _then(_NotificationPreferencesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,saved: null == saved ? _self._saved : saved // ignore: cast_nullable_to_non_nullable
as Map<NotificationChannel, ChannelPreferences>,edited: null == edited ? _self._edited : edited // ignore: cast_nullable_to_non_nullable
as Map<NotificationChannel, ChannelPreferences>,saveStatus: null == saveStatus ? _self.saveStatus : saveStatus // ignore: cast_nullable_to_non_nullable
as SubmitStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saveFailure: freezed == saveFailure ? _self.saveFailure : saveFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
