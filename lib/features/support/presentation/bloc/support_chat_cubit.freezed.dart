// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupportChatState {

 ViewStatus get status; ChatThread? get thread;/// Messages not yet confirmed by the server (sending or failed).
 List<ChatMessage> get pending; bool get agentTyping; Failure? get failure;
/// Create a copy of SupportChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportChatStateCopyWith<SupportChatState> get copyWith => _$SupportChatStateCopyWithImpl<SupportChatState>(this as SupportChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportChatState&&(identical(other.status, status) || other.status == status)&&(identical(other.thread, thread) || other.thread == thread)&&const DeepCollectionEquality().equals(other.pending, pending)&&(identical(other.agentTyping, agentTyping) || other.agentTyping == agentTyping)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,thread,const DeepCollectionEquality().hash(pending),agentTyping,failure);

@override
String toString() {
  return 'SupportChatState(status: $status, thread: $thread, pending: $pending, agentTyping: $agentTyping, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SupportChatStateCopyWith<$Res>  {
  factory $SupportChatStateCopyWith(SupportChatState value, $Res Function(SupportChatState) _then) = _$SupportChatStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, ChatThread? thread, List<ChatMessage> pending, bool agentTyping, Failure? failure
});


$ChatThreadCopyWith<$Res>? get thread;

}
/// @nodoc
class _$SupportChatStateCopyWithImpl<$Res>
    implements $SupportChatStateCopyWith<$Res> {
  _$SupportChatStateCopyWithImpl(this._self, this._then);

  final SupportChatState _self;
  final $Res Function(SupportChatState) _then;

/// Create a copy of SupportChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? thread = freezed,Object? pending = null,Object? agentTyping = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,thread: freezed == thread ? _self.thread : thread // ignore: cast_nullable_to_non_nullable
as ChatThread?,pending: null == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,agentTyping: null == agentTyping ? _self.agentTyping : agentTyping // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of SupportChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatThreadCopyWith<$Res>? get thread {
    if (_self.thread == null) {
    return null;
  }

  return $ChatThreadCopyWith<$Res>(_self.thread!, (value) {
    return _then(_self.copyWith(thread: value));
  });
}
}


/// Adds pattern-matching-related methods to [SupportChatState].
extension SupportChatStatePatterns on SupportChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportChatState value)  $default,){
final _that = this;
switch (_that) {
case _SupportChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportChatState value)?  $default,){
final _that = this;
switch (_that) {
case _SupportChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  ChatThread? thread,  List<ChatMessage> pending,  bool agentTyping,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportChatState() when $default != null:
return $default(_that.status,_that.thread,_that.pending,_that.agentTyping,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  ChatThread? thread,  List<ChatMessage> pending,  bool agentTyping,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _SupportChatState():
return $default(_that.status,_that.thread,_that.pending,_that.agentTyping,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  ChatThread? thread,  List<ChatMessage> pending,  bool agentTyping,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _SupportChatState() when $default != null:
return $default(_that.status,_that.thread,_that.pending,_that.agentTyping,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SupportChatState extends SupportChatState {
  const _SupportChatState({this.status = ViewStatus.initial, this.thread, final  List<ChatMessage> pending = const [], this.agentTyping = false, this.failure}): _pending = pending,super._();
  

@override@JsonKey() final  ViewStatus status;
@override final  ChatThread? thread;
/// Messages not yet confirmed by the server (sending or failed).
 final  List<ChatMessage> _pending;
/// Messages not yet confirmed by the server (sending or failed).
@override@JsonKey() List<ChatMessage> get pending {
  if (_pending is EqualUnmodifiableListView) return _pending;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pending);
}

@override@JsonKey() final  bool agentTyping;
@override final  Failure? failure;

/// Create a copy of SupportChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportChatStateCopyWith<_SupportChatState> get copyWith => __$SupportChatStateCopyWithImpl<_SupportChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportChatState&&(identical(other.status, status) || other.status == status)&&(identical(other.thread, thread) || other.thread == thread)&&const DeepCollectionEquality().equals(other._pending, _pending)&&(identical(other.agentTyping, agentTyping) || other.agentTyping == agentTyping)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,thread,const DeepCollectionEquality().hash(_pending),agentTyping,failure);

@override
String toString() {
  return 'SupportChatState(status: $status, thread: $thread, pending: $pending, agentTyping: $agentTyping, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SupportChatStateCopyWith<$Res> implements $SupportChatStateCopyWith<$Res> {
  factory _$SupportChatStateCopyWith(_SupportChatState value, $Res Function(_SupportChatState) _then) = __$SupportChatStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, ChatThread? thread, List<ChatMessage> pending, bool agentTyping, Failure? failure
});


@override $ChatThreadCopyWith<$Res>? get thread;

}
/// @nodoc
class __$SupportChatStateCopyWithImpl<$Res>
    implements _$SupportChatStateCopyWith<$Res> {
  __$SupportChatStateCopyWithImpl(this._self, this._then);

  final _SupportChatState _self;
  final $Res Function(_SupportChatState) _then;

/// Create a copy of SupportChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? thread = freezed,Object? pending = null,Object? agentTyping = null,Object? failure = freezed,}) {
  return _then(_SupportChatState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,thread: freezed == thread ? _self.thread : thread // ignore: cast_nullable_to_non_nullable
as ChatThread?,pending: null == pending ? _self._pending : pending // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,agentTyping: null == agentTyping ? _self.agentTyping : agentTyping // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of SupportChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatThreadCopyWith<$Res>? get thread {
    if (_self.thread == null) {
    return null;
  }

  return $ChatThreadCopyWith<$Res>(_self.thread!, (value) {
    return _then(_self.copyWith(thread: value));
  });
}
}

// dart format on
