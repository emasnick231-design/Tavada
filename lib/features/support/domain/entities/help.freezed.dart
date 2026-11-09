// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HelpTopic {

 String get id; String get title; List<HelpArticleSummary> get articles;
/// Create a copy of HelpTopic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HelpTopicCopyWith<HelpTopic> get copyWith => _$HelpTopicCopyWithImpl<HelpTopic>(this as HelpTopic, _$identity);

  /// Serializes this HelpTopic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpTopic&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.articles, articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(articles));

@override
String toString() {
  return 'HelpTopic(id: $id, title: $title, articles: $articles)';
}


}

/// @nodoc
abstract mixin class $HelpTopicCopyWith<$Res>  {
  factory $HelpTopicCopyWith(HelpTopic value, $Res Function(HelpTopic) _then) = _$HelpTopicCopyWithImpl;
@useResult
$Res call({
 String id, String title, List<HelpArticleSummary> articles
});




}
/// @nodoc
class _$HelpTopicCopyWithImpl<$Res>
    implements $HelpTopicCopyWith<$Res> {
  _$HelpTopicCopyWithImpl(this._self, this._then);

  final HelpTopic _self;
  final $Res Function(HelpTopic) _then;

/// Create a copy of HelpTopic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? articles = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,articles: null == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<HelpArticleSummary>,
  ));
}

}


/// Adds pattern-matching-related methods to [HelpTopic].
extension HelpTopicPatterns on HelpTopic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HelpTopic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HelpTopic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HelpTopic value)  $default,){
final _that = this;
switch (_that) {
case _HelpTopic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HelpTopic value)?  $default,){
final _that = this;
switch (_that) {
case _HelpTopic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  List<HelpArticleSummary> articles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HelpTopic() when $default != null:
return $default(_that.id,_that.title,_that.articles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  List<HelpArticleSummary> articles)  $default,) {final _that = this;
switch (_that) {
case _HelpTopic():
return $default(_that.id,_that.title,_that.articles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  List<HelpArticleSummary> articles)?  $default,) {final _that = this;
switch (_that) {
case _HelpTopic() when $default != null:
return $default(_that.id,_that.title,_that.articles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HelpTopic implements HelpTopic {
  const _HelpTopic({required this.id, required this.title, final  List<HelpArticleSummary> articles = const []}): _articles = articles;
  factory _HelpTopic.fromJson(Map<String, dynamic> json) => _$HelpTopicFromJson(json);

@override final  String id;
@override final  String title;
 final  List<HelpArticleSummary> _articles;
@override@JsonKey() List<HelpArticleSummary> get articles {
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_articles);
}


/// Create a copy of HelpTopic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HelpTopicCopyWith<_HelpTopic> get copyWith => __$HelpTopicCopyWithImpl<_HelpTopic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HelpTopicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HelpTopic&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._articles, _articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_articles));

@override
String toString() {
  return 'HelpTopic(id: $id, title: $title, articles: $articles)';
}


}

/// @nodoc
abstract mixin class _$HelpTopicCopyWith<$Res> implements $HelpTopicCopyWith<$Res> {
  factory _$HelpTopicCopyWith(_HelpTopic value, $Res Function(_HelpTopic) _then) = __$HelpTopicCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<HelpArticleSummary> articles
});




}
/// @nodoc
class __$HelpTopicCopyWithImpl<$Res>
    implements _$HelpTopicCopyWith<$Res> {
  __$HelpTopicCopyWithImpl(this._self, this._then);

  final _HelpTopic _self;
  final $Res Function(_HelpTopic) _then;

/// Create a copy of HelpTopic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? articles = null,}) {
  return _then(_HelpTopic(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,articles: null == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<HelpArticleSummary>,
  ));
}


}


/// @nodoc
mixin _$HelpArticleSummary {

 String get id; String get title;
/// Create a copy of HelpArticleSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HelpArticleSummaryCopyWith<HelpArticleSummary> get copyWith => _$HelpArticleSummaryCopyWithImpl<HelpArticleSummary>(this as HelpArticleSummary, _$identity);

  /// Serializes this HelpArticleSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpArticleSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'HelpArticleSummary(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $HelpArticleSummaryCopyWith<$Res>  {
  factory $HelpArticleSummaryCopyWith(HelpArticleSummary value, $Res Function(HelpArticleSummary) _then) = _$HelpArticleSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String title
});




}
/// @nodoc
class _$HelpArticleSummaryCopyWithImpl<$Res>
    implements $HelpArticleSummaryCopyWith<$Res> {
  _$HelpArticleSummaryCopyWithImpl(this._self, this._then);

  final HelpArticleSummary _self;
  final $Res Function(HelpArticleSummary) _then;

/// Create a copy of HelpArticleSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HelpArticleSummary].
extension HelpArticleSummaryPatterns on HelpArticleSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HelpArticleSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HelpArticleSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HelpArticleSummary value)  $default,){
final _that = this;
switch (_that) {
case _HelpArticleSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HelpArticleSummary value)?  $default,){
final _that = this;
switch (_that) {
case _HelpArticleSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HelpArticleSummary() when $default != null:
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title)  $default,) {final _that = this;
switch (_that) {
case _HelpArticleSummary():
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title)?  $default,) {final _that = this;
switch (_that) {
case _HelpArticleSummary() when $default != null:
return $default(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HelpArticleSummary implements HelpArticleSummary {
  const _HelpArticleSummary({required this.id, required this.title});
  factory _HelpArticleSummary.fromJson(Map<String, dynamic> json) => _$HelpArticleSummaryFromJson(json);

@override final  String id;
@override final  String title;

/// Create a copy of HelpArticleSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HelpArticleSummaryCopyWith<_HelpArticleSummary> get copyWith => __$HelpArticleSummaryCopyWithImpl<_HelpArticleSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HelpArticleSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HelpArticleSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'HelpArticleSummary(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$HelpArticleSummaryCopyWith<$Res> implements $HelpArticleSummaryCopyWith<$Res> {
  factory _$HelpArticleSummaryCopyWith(_HelpArticleSummary value, $Res Function(_HelpArticleSummary) _then) = __$HelpArticleSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title
});




}
/// @nodoc
class __$HelpArticleSummaryCopyWithImpl<$Res>
    implements _$HelpArticleSummaryCopyWith<$Res> {
  __$HelpArticleSummaryCopyWithImpl(this._self, this._then);

  final _HelpArticleSummary _self;
  final $Res Function(_HelpArticleSummary) _then;

/// Create a copy of HelpArticleSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(_HelpArticleSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HelpArticle {

 String get id; String get topicId; String get title; String get body;
/// Create a copy of HelpArticle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HelpArticleCopyWith<HelpArticle> get copyWith => _$HelpArticleCopyWithImpl<HelpArticle>(this as HelpArticle, _$identity);

  /// Serializes this HelpArticle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpArticle&&(identical(other.id, id) || other.id == id)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,topicId,title,body);

@override
String toString() {
  return 'HelpArticle(id: $id, topicId: $topicId, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $HelpArticleCopyWith<$Res>  {
  factory $HelpArticleCopyWith(HelpArticle value, $Res Function(HelpArticle) _then) = _$HelpArticleCopyWithImpl;
@useResult
$Res call({
 String id, String topicId, String title, String body
});




}
/// @nodoc
class _$HelpArticleCopyWithImpl<$Res>
    implements $HelpArticleCopyWith<$Res> {
  _$HelpArticleCopyWithImpl(this._self, this._then);

  final HelpArticle _self;
  final $Res Function(HelpArticle) _then;

/// Create a copy of HelpArticle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? topicId = null,Object? title = null,Object? body = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HelpArticle].
extension HelpArticlePatterns on HelpArticle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HelpArticle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HelpArticle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HelpArticle value)  $default,){
final _that = this;
switch (_that) {
case _HelpArticle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HelpArticle value)?  $default,){
final _that = this;
switch (_that) {
case _HelpArticle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String topicId,  String title,  String body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HelpArticle() when $default != null:
return $default(_that.id,_that.topicId,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String topicId,  String title,  String body)  $default,) {final _that = this;
switch (_that) {
case _HelpArticle():
return $default(_that.id,_that.topicId,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String topicId,  String title,  String body)?  $default,) {final _that = this;
switch (_that) {
case _HelpArticle() when $default != null:
return $default(_that.id,_that.topicId,_that.title,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HelpArticle implements HelpArticle {
  const _HelpArticle({required this.id, required this.topicId, required this.title, required this.body});
  factory _HelpArticle.fromJson(Map<String, dynamic> json) => _$HelpArticleFromJson(json);

@override final  String id;
@override final  String topicId;
@override final  String title;
@override final  String body;

/// Create a copy of HelpArticle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HelpArticleCopyWith<_HelpArticle> get copyWith => __$HelpArticleCopyWithImpl<_HelpArticle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HelpArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HelpArticle&&(identical(other.id, id) || other.id == id)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,topicId,title,body);

@override
String toString() {
  return 'HelpArticle(id: $id, topicId: $topicId, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$HelpArticleCopyWith<$Res> implements $HelpArticleCopyWith<$Res> {
  factory _$HelpArticleCopyWith(_HelpArticle value, $Res Function(_HelpArticle) _then) = __$HelpArticleCopyWithImpl;
@override @useResult
$Res call({
 String id, String topicId, String title, String body
});




}
/// @nodoc
class __$HelpArticleCopyWithImpl<$Res>
    implements _$HelpArticleCopyWith<$Res> {
  __$HelpArticleCopyWithImpl(this._self, this._then);

  final _HelpArticle _self;
  final $Res Function(_HelpArticle) _then;

/// Create a copy of HelpArticle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? topicId = null,Object? title = null,Object? body = null,}) {
  return _then(_HelpArticle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
