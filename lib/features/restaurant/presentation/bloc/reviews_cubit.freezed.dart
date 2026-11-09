// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewsState {

 ViewStatus get status; ReviewSummary? get summary; List<Review> get reviews; int get page; bool get hasMore; bool get isLoadingMore; Failure? get failure;
/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewsStateCopyWith<ReviewsState> get copyWith => _$ReviewsStateCopyWithImpl<ReviewsState>(this as ReviewsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewsState&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(reviews),page,hasMore,isLoadingMore,failure);

@override
String toString() {
  return 'ReviewsState(status: $status, summary: $summary, reviews: $reviews, page: $page, hasMore: $hasMore, isLoadingMore: $isLoadingMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ReviewsStateCopyWith<$Res>  {
  factory $ReviewsStateCopyWith(ReviewsState value, $Res Function(ReviewsState) _then) = _$ReviewsStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, ReviewSummary? summary, List<Review> reviews, int page, bool hasMore, bool isLoadingMore, Failure? failure
});


$ReviewSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$ReviewsStateCopyWithImpl<$Res>
    implements $ReviewsStateCopyWith<$Res> {
  _$ReviewsStateCopyWithImpl(this._self, this._then);

  final ReviewsState _self;
  final $Res Function(ReviewsState) _then;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? summary = freezed,Object? reviews = null,Object? page = null,Object? hasMore = null,Object? isLoadingMore = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ReviewSummary?,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $ReviewSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewsState].
extension ReviewsStatePatterns on ReviewsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewsState value)  $default,){
final _that = this;
switch (_that) {
case _ReviewsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewsState value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  ReviewSummary? summary,  List<Review> reviews,  int page,  bool hasMore,  bool isLoadingMore,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewsState() when $default != null:
return $default(_that.status,_that.summary,_that.reviews,_that.page,_that.hasMore,_that.isLoadingMore,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  ReviewSummary? summary,  List<Review> reviews,  int page,  bool hasMore,  bool isLoadingMore,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _ReviewsState():
return $default(_that.status,_that.summary,_that.reviews,_that.page,_that.hasMore,_that.isLoadingMore,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  ReviewSummary? summary,  List<Review> reviews,  int page,  bool hasMore,  bool isLoadingMore,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _ReviewsState() when $default != null:
return $default(_that.status,_that.summary,_that.reviews,_that.page,_that.hasMore,_that.isLoadingMore,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _ReviewsState implements ReviewsState {
  const _ReviewsState({this.status = ViewStatus.initial, this.summary, final  List<Review> reviews = const [], this.page = 0, this.hasMore = false, this.isLoadingMore = false, this.failure}): _reviews = reviews;
  

@override@JsonKey() final  ViewStatus status;
@override final  ReviewSummary? summary;
 final  List<Review> _reviews;
@override@JsonKey() List<Review> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
@override final  Failure? failure;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewsStateCopyWith<_ReviewsState> get copyWith => __$ReviewsStateCopyWithImpl<_ReviewsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewsState&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(_reviews),page,hasMore,isLoadingMore,failure);

@override
String toString() {
  return 'ReviewsState(status: $status, summary: $summary, reviews: $reviews, page: $page, hasMore: $hasMore, isLoadingMore: $isLoadingMore, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ReviewsStateCopyWith<$Res> implements $ReviewsStateCopyWith<$Res> {
  factory _$ReviewsStateCopyWith(_ReviewsState value, $Res Function(_ReviewsState) _then) = __$ReviewsStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, ReviewSummary? summary, List<Review> reviews, int page, bool hasMore, bool isLoadingMore, Failure? failure
});


@override $ReviewSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$ReviewsStateCopyWithImpl<$Res>
    implements _$ReviewsStateCopyWith<$Res> {
  __$ReviewsStateCopyWithImpl(this._self, this._then);

  final _ReviewsState _self;
  final $Res Function(_ReviewsState) _then;

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? summary = freezed,Object? reviews = null,Object? page = null,Object? hasMore = null,Object? isLoadingMore = null,Object? failure = freezed,}) {
  return _then(_ReviewsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ReviewSummary?,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of ReviewsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $ReviewSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
