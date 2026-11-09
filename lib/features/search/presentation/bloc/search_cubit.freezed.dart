// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 SearchPhase get phase; String get query; List<String> get recent; List<String> get suggestions; List<Category> get categories; CatalogFilters get options; RestaurantFilter get filter; ViewStatus get status; SearchResults? get results; Failure? get failure;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.recent, recent)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.options, options) || other.options == options)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.status, status) || other.status == status)&&(identical(other.results, results) || other.results == results)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,phase,query,const DeepCollectionEquality().hash(recent),const DeepCollectionEquality().hash(suggestions),const DeepCollectionEquality().hash(categories),options,filter,status,results,failure);

@override
String toString() {
  return 'SearchState(phase: $phase, query: $query, recent: $recent, suggestions: $suggestions, categories: $categories, options: $options, filter: $filter, status: $status, results: $results, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 SearchPhase phase, String query, List<String> recent, List<String> suggestions, List<Category> categories, CatalogFilters options, RestaurantFilter filter, ViewStatus status, SearchResults? results, Failure? failure
});


$CatalogFiltersCopyWith<$Res> get options;$RestaurantFilterCopyWith<$Res> get filter;$SearchResultsCopyWith<$Res>? get results;

}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? query = null,Object? recent = null,Object? suggestions = null,Object? categories = null,Object? options = null,Object? filter = null,Object? status = null,Object? results = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as SearchPhase,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,recent: null == recent ? _self.recent : recent // ignore: cast_nullable_to_non_nullable
as List<String>,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as CatalogFilters,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RestaurantFilter,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as SearchResults?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogFiltersCopyWith<$Res> get options {
  
  return $CatalogFiltersCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantFilterCopyWith<$Res> get filter {
  
  return $RestaurantFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultsCopyWith<$Res>? get results {
    if (_self.results == null) {
    return null;
  }

  return $SearchResultsCopyWith<$Res>(_self.results!, (value) {
    return _then(_self.copyWith(results: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchPhase phase,  String query,  List<String> recent,  List<String> suggestions,  List<Category> categories,  CatalogFilters options,  RestaurantFilter filter,  ViewStatus status,  SearchResults? results,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.phase,_that.query,_that.recent,_that.suggestions,_that.categories,_that.options,_that.filter,_that.status,_that.results,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchPhase phase,  String query,  List<String> recent,  List<String> suggestions,  List<Category> categories,  CatalogFilters options,  RestaurantFilter filter,  ViewStatus status,  SearchResults? results,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.phase,_that.query,_that.recent,_that.suggestions,_that.categories,_that.options,_that.filter,_that.status,_that.results,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchPhase phase,  String query,  List<String> recent,  List<String> suggestions,  List<Category> categories,  CatalogFilters options,  RestaurantFilter filter,  ViewStatus status,  SearchResults? results,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.phase,_that.query,_that.recent,_that.suggestions,_that.categories,_that.options,_that.filter,_that.status,_that.results,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.phase = SearchPhase.idle, this.query = '', final  List<String> recent = const [], final  List<String> suggestions = const [], final  List<Category> categories = const [], this.options = const CatalogFilters(), this.filter = const RestaurantFilter(), this.status = ViewStatus.initial, this.results, this.failure}): _recent = recent,_suggestions = suggestions,_categories = categories;
  

@override@JsonKey() final  SearchPhase phase;
@override@JsonKey() final  String query;
 final  List<String> _recent;
@override@JsonKey() List<String> get recent {
  if (_recent is EqualUnmodifiableListView) return _recent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recent);
}

 final  List<String> _suggestions;
@override@JsonKey() List<String> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

 final  List<Category> _categories;
@override@JsonKey() List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  CatalogFilters options;
@override@JsonKey() final  RestaurantFilter filter;
@override@JsonKey() final  ViewStatus status;
@override final  SearchResults? results;
@override final  Failure? failure;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._recent, _recent)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.options, options) || other.options == options)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.status, status) || other.status == status)&&(identical(other.results, results) || other.results == results)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,phase,query,const DeepCollectionEquality().hash(_recent),const DeepCollectionEquality().hash(_suggestions),const DeepCollectionEquality().hash(_categories),options,filter,status,results,failure);

@override
String toString() {
  return 'SearchState(phase: $phase, query: $query, recent: $recent, suggestions: $suggestions, categories: $categories, options: $options, filter: $filter, status: $status, results: $results, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 SearchPhase phase, String query, List<String> recent, List<String> suggestions, List<Category> categories, CatalogFilters options, RestaurantFilter filter, ViewStatus status, SearchResults? results, Failure? failure
});


@override $CatalogFiltersCopyWith<$Res> get options;@override $RestaurantFilterCopyWith<$Res> get filter;@override $SearchResultsCopyWith<$Res>? get results;

}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? query = null,Object? recent = null,Object? suggestions = null,Object? categories = null,Object? options = null,Object? filter = null,Object? status = null,Object? results = freezed,Object? failure = freezed,}) {
  return _then(_SearchState(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as SearchPhase,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,recent: null == recent ? _self._recent : recent // ignore: cast_nullable_to_non_nullable
as List<String>,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as CatalogFilters,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RestaurantFilter,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as SearchResults?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogFiltersCopyWith<$Res> get options {
  
  return $CatalogFiltersCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantFilterCopyWith<$Res> get filter {
  
  return $RestaurantFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultsCopyWith<$Res>? get results {
    if (_self.results == null) {
    return null;
  }

  return $SearchResultsCopyWith<$Res>(_self.results!, (value) {
    return _then(_self.copyWith(results: value));
  });
}
}

// dart format on
