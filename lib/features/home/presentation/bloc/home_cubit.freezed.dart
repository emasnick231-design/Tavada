// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 ViewStatus get status; HomeFeed get feed; Failure? get failure;/// Options for the cuisine / dietary / delivery fee sheets.
 CatalogFilters get filterOptions;/// Shows the filter chip row under the search bar.
 bool get showFilters; RestaurantFilter get filter; ViewStatus get resultsStatus; List<Restaurant> get results; Failure? get resultsFailure;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.status, status) || other.status == status)&&(identical(other.feed, feed) || other.feed == feed)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.filterOptions, filterOptions) || other.filterOptions == filterOptions)&&(identical(other.showFilters, showFilters) || other.showFilters == showFilters)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.resultsStatus, resultsStatus) || other.resultsStatus == resultsStatus)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.resultsFailure, resultsFailure) || other.resultsFailure == resultsFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,feed,failure,filterOptions,showFilters,filter,resultsStatus,const DeepCollectionEquality().hash(results),resultsFailure);

@override
String toString() {
  return 'HomeState(status: $status, feed: $feed, failure: $failure, filterOptions: $filterOptions, showFilters: $showFilters, filter: $filter, resultsStatus: $resultsStatus, results: $results, resultsFailure: $resultsFailure)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, HomeFeed feed, Failure? failure, CatalogFilters filterOptions, bool showFilters, RestaurantFilter filter, ViewStatus resultsStatus, List<Restaurant> results, Failure? resultsFailure
});


$HomeFeedCopyWith<$Res> get feed;$CatalogFiltersCopyWith<$Res> get filterOptions;$RestaurantFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? feed = null,Object? failure = freezed,Object? filterOptions = null,Object? showFilters = null,Object? filter = null,Object? resultsStatus = null,Object? results = null,Object? resultsFailure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as HomeFeed,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,filterOptions: null == filterOptions ? _self.filterOptions : filterOptions // ignore: cast_nullable_to_non_nullable
as CatalogFilters,showFilters: null == showFilters ? _self.showFilters : showFilters // ignore: cast_nullable_to_non_nullable
as bool,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RestaurantFilter,resultsStatus: null == resultsStatus ? _self.resultsStatus : resultsStatus // ignore: cast_nullable_to_non_nullable
as ViewStatus,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Restaurant>,resultsFailure: freezed == resultsFailure ? _self.resultsFailure : resultsFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeFeedCopyWith<$Res> get feed {
  
  return $HomeFeedCopyWith<$Res>(_self.feed, (value) {
    return _then(_self.copyWith(feed: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogFiltersCopyWith<$Res> get filterOptions {
  
  return $CatalogFiltersCopyWith<$Res>(_self.filterOptions, (value) {
    return _then(_self.copyWith(filterOptions: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantFilterCopyWith<$Res> get filter {
  
  return $RestaurantFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  HomeFeed feed,  Failure? failure,  CatalogFilters filterOptions,  bool showFilters,  RestaurantFilter filter,  ViewStatus resultsStatus,  List<Restaurant> results,  Failure? resultsFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.status,_that.feed,_that.failure,_that.filterOptions,_that.showFilters,_that.filter,_that.resultsStatus,_that.results,_that.resultsFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  HomeFeed feed,  Failure? failure,  CatalogFilters filterOptions,  bool showFilters,  RestaurantFilter filter,  ViewStatus resultsStatus,  List<Restaurant> results,  Failure? resultsFailure)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.status,_that.feed,_that.failure,_that.filterOptions,_that.showFilters,_that.filter,_that.resultsStatus,_that.results,_that.resultsFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  HomeFeed feed,  Failure? failure,  CatalogFilters filterOptions,  bool showFilters,  RestaurantFilter filter,  ViewStatus resultsStatus,  List<Restaurant> results,  Failure? resultsFailure)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.status,_that.feed,_that.failure,_that.filterOptions,_that.showFilters,_that.filter,_that.resultsStatus,_that.results,_that.resultsFailure);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({this.status = ViewStatus.initial, this.feed = const HomeFeed(), this.failure, this.filterOptions = const CatalogFilters(), this.showFilters = false, this.filter = const RestaurantFilter(), this.resultsStatus = ViewStatus.initial, final  List<Restaurant> results = const [], this.resultsFailure}): _results = results,super._();
  

@override@JsonKey() final  ViewStatus status;
@override@JsonKey() final  HomeFeed feed;
@override final  Failure? failure;
/// Options for the cuisine / dietary / delivery fee sheets.
@override@JsonKey() final  CatalogFilters filterOptions;
/// Shows the filter chip row under the search bar.
@override@JsonKey() final  bool showFilters;
@override@JsonKey() final  RestaurantFilter filter;
@override@JsonKey() final  ViewStatus resultsStatus;
 final  List<Restaurant> _results;
@override@JsonKey() List<Restaurant> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  Failure? resultsFailure;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.status, status) || other.status == status)&&(identical(other.feed, feed) || other.feed == feed)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.filterOptions, filterOptions) || other.filterOptions == filterOptions)&&(identical(other.showFilters, showFilters) || other.showFilters == showFilters)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.resultsStatus, resultsStatus) || other.resultsStatus == resultsStatus)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.resultsFailure, resultsFailure) || other.resultsFailure == resultsFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,feed,failure,filterOptions,showFilters,filter,resultsStatus,const DeepCollectionEquality().hash(_results),resultsFailure);

@override
String toString() {
  return 'HomeState(status: $status, feed: $feed, failure: $failure, filterOptions: $filterOptions, showFilters: $showFilters, filter: $filter, resultsStatus: $resultsStatus, results: $results, resultsFailure: $resultsFailure)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, HomeFeed feed, Failure? failure, CatalogFilters filterOptions, bool showFilters, RestaurantFilter filter, ViewStatus resultsStatus, List<Restaurant> results, Failure? resultsFailure
});


@override $HomeFeedCopyWith<$Res> get feed;@override $CatalogFiltersCopyWith<$Res> get filterOptions;@override $RestaurantFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? feed = null,Object? failure = freezed,Object? filterOptions = null,Object? showFilters = null,Object? filter = null,Object? resultsStatus = null,Object? results = null,Object? resultsFailure = freezed,}) {
  return _then(_HomeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as HomeFeed,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,filterOptions: null == filterOptions ? _self.filterOptions : filterOptions // ignore: cast_nullable_to_non_nullable
as CatalogFilters,showFilters: null == showFilters ? _self.showFilters : showFilters // ignore: cast_nullable_to_non_nullable
as bool,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RestaurantFilter,resultsStatus: null == resultsStatus ? _self.resultsStatus : resultsStatus // ignore: cast_nullable_to_non_nullable
as ViewStatus,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Restaurant>,resultsFailure: freezed == resultsFailure ? _self.resultsFailure : resultsFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeFeedCopyWith<$Res> get feed {
  
  return $HomeFeedCopyWith<$Res>(_self.feed, (value) {
    return _then(_self.copyWith(feed: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogFiltersCopyWith<$Res> get filterOptions {
  
  return $CatalogFiltersCopyWith<$Res>(_self.filterOptions, (value) {
    return _then(_self.copyWith(filterOptions: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantFilterCopyWith<$Res> get filter {
  
  return $RestaurantFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

// dart format on
