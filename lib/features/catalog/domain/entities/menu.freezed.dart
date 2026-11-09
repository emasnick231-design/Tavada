// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuSection {

 String get id; String get name; List<MenuItem> get items;
/// Create a copy of MenuSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuSectionCopyWith<MenuSection> get copyWith => _$MenuSectionCopyWithImpl<MenuSection>(this as MenuSection, _$identity);

  /// Serializes this MenuSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuSection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MenuSection(id: $id, name: $name, items: $items)';
}


}

/// @nodoc
abstract mixin class $MenuSectionCopyWith<$Res>  {
  factory $MenuSectionCopyWith(MenuSection value, $Res Function(MenuSection) _then) = _$MenuSectionCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<MenuItem> items
});




}
/// @nodoc
class _$MenuSectionCopyWithImpl<$Res>
    implements $MenuSectionCopyWith<$Res> {
  _$MenuSectionCopyWithImpl(this._self, this._then);

  final MenuSection _self;
  final $Res Function(MenuSection) _then;

/// Create a copy of MenuSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuSection].
extension MenuSectionPatterns on MenuSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuSection value)  $default,){
final _that = this;
switch (_that) {
case _MenuSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuSection value)?  $default,){
final _that = this;
switch (_that) {
case _MenuSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<MenuItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuSection() when $default != null:
return $default(_that.id,_that.name,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<MenuItem> items)  $default,) {final _that = this;
switch (_that) {
case _MenuSection():
return $default(_that.id,_that.name,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<MenuItem> items)?  $default,) {final _that = this;
switch (_that) {
case _MenuSection() when $default != null:
return $default(_that.id,_that.name,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuSection implements MenuSection {
  const _MenuSection({required this.id, required this.name, final  List<MenuItem> items = const []}): _items = items;
  factory _MenuSection.fromJson(Map<String, dynamic> json) => _$MenuSectionFromJson(json);

@override final  String id;
@override final  String name;
 final  List<MenuItem> _items;
@override@JsonKey() List<MenuItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MenuSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuSectionCopyWith<_MenuSection> get copyWith => __$MenuSectionCopyWithImpl<_MenuSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuSectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuSection&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MenuSection(id: $id, name: $name, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MenuSectionCopyWith<$Res> implements $MenuSectionCopyWith<$Res> {
  factory _$MenuSectionCopyWith(_MenuSection value, $Res Function(_MenuSection) _then) = __$MenuSectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<MenuItem> items
});




}
/// @nodoc
class __$MenuSectionCopyWithImpl<$Res>
    implements _$MenuSectionCopyWith<$Res> {
  __$MenuSectionCopyWithImpl(this._self, this._then);

  final _MenuSection _self;
  final $Res Function(_MenuSection) _then;

/// Create a copy of MenuSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? items = null,}) {
  return _then(_MenuSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}


}


/// @nodoc
mixin _$MenuItem {

 String get id; String get restaurantId; String get name; String get description;@MoneyConverter() Money get price; String get imageUrl;@NullableMoneyConverter() Money? get originalPrice; String? get sectionId; bool get isPopular; List<String> get tags; List<OptionGroup> get optionGroups;/// Denormalised for rails that show the store name (search, upsells).
 String? get restaurantName;
/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemCopyWith<MenuItem> get copyWith => _$MenuItemCopyWithImpl<MenuItem>(this as MenuItem, _$identity);

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.optionGroups, optionGroups)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,name,description,price,imageUrl,originalPrice,sectionId,isPopular,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(optionGroups),restaurantName);

@override
String toString() {
  return 'MenuItem(id: $id, restaurantId: $restaurantId, name: $name, description: $description, price: $price, imageUrl: $imageUrl, originalPrice: $originalPrice, sectionId: $sectionId, isPopular: $isPopular, tags: $tags, optionGroups: $optionGroups, restaurantName: $restaurantName)';
}


}

/// @nodoc
abstract mixin class $MenuItemCopyWith<$Res>  {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) _then) = _$MenuItemCopyWithImpl;
@useResult
$Res call({
 String id, String restaurantId, String name, String description,@MoneyConverter() Money price, String imageUrl,@NullableMoneyConverter() Money? originalPrice, String? sectionId, bool isPopular, List<String> tags, List<OptionGroup> optionGroups, String? restaurantName
});




}
/// @nodoc
class _$MenuItemCopyWithImpl<$Res>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._self, this._then);

  final MenuItem _self;
  final $Res Function(MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? restaurantId = null,Object? name = null,Object? description = null,Object? price = null,Object? imageUrl = null,Object? originalPrice = freezed,Object? sectionId = freezed,Object? isPopular = null,Object? tags = null,Object? optionGroups = null,Object? restaurantName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as Money?,sectionId: freezed == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String?,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,optionGroups: null == optionGroups ? _self.optionGroups : optionGroups // ignore: cast_nullable_to_non_nullable
as List<OptionGroup>,restaurantName: freezed == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItem].
extension MenuItemPatterns on MenuItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItem value)  $default,){
final _that = this;
switch (_that) {
case _MenuItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String restaurantId,  String name,  String description, @MoneyConverter()  Money price,  String imageUrl, @NullableMoneyConverter()  Money? originalPrice,  String? sectionId,  bool isPopular,  List<String> tags,  List<OptionGroup> optionGroups,  String? restaurantName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.id,_that.restaurantId,_that.name,_that.description,_that.price,_that.imageUrl,_that.originalPrice,_that.sectionId,_that.isPopular,_that.tags,_that.optionGroups,_that.restaurantName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String restaurantId,  String name,  String description, @MoneyConverter()  Money price,  String imageUrl, @NullableMoneyConverter()  Money? originalPrice,  String? sectionId,  bool isPopular,  List<String> tags,  List<OptionGroup> optionGroups,  String? restaurantName)  $default,) {final _that = this;
switch (_that) {
case _MenuItem():
return $default(_that.id,_that.restaurantId,_that.name,_that.description,_that.price,_that.imageUrl,_that.originalPrice,_that.sectionId,_that.isPopular,_that.tags,_that.optionGroups,_that.restaurantName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String restaurantId,  String name,  String description, @MoneyConverter()  Money price,  String imageUrl, @NullableMoneyConverter()  Money? originalPrice,  String? sectionId,  bool isPopular,  List<String> tags,  List<OptionGroup> optionGroups,  String? restaurantName)?  $default,) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.id,_that.restaurantId,_that.name,_that.description,_that.price,_that.imageUrl,_that.originalPrice,_that.sectionId,_that.isPopular,_that.tags,_that.optionGroups,_that.restaurantName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItem extends MenuItem {
  const _MenuItem({required this.id, required this.restaurantId, required this.name, required this.description, @MoneyConverter() required this.price, required this.imageUrl, @NullableMoneyConverter() this.originalPrice, this.sectionId, this.isPopular = false, final  List<String> tags = const [], final  List<OptionGroup> optionGroups = const [], this.restaurantName}): _tags = tags,_optionGroups = optionGroups,super._();
  factory _MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

@override final  String id;
@override final  String restaurantId;
@override final  String name;
@override final  String description;
@override@MoneyConverter() final  Money price;
@override final  String imageUrl;
@override@NullableMoneyConverter() final  Money? originalPrice;
@override final  String? sectionId;
@override@JsonKey() final  bool isPopular;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<OptionGroup> _optionGroups;
@override@JsonKey() List<OptionGroup> get optionGroups {
  if (_optionGroups is EqualUnmodifiableListView) return _optionGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionGroups);
}

/// Denormalised for rails that show the store name (search, upsells).
@override final  String? restaurantName;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemCopyWith<_MenuItem> get copyWith => __$MenuItemCopyWithImpl<_MenuItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._optionGroups, _optionGroups)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,name,description,price,imageUrl,originalPrice,sectionId,isPopular,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_optionGroups),restaurantName);

@override
String toString() {
  return 'MenuItem(id: $id, restaurantId: $restaurantId, name: $name, description: $description, price: $price, imageUrl: $imageUrl, originalPrice: $originalPrice, sectionId: $sectionId, isPopular: $isPopular, tags: $tags, optionGroups: $optionGroups, restaurantName: $restaurantName)';
}


}

/// @nodoc
abstract mixin class _$MenuItemCopyWith<$Res> implements $MenuItemCopyWith<$Res> {
  factory _$MenuItemCopyWith(_MenuItem value, $Res Function(_MenuItem) _then) = __$MenuItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String restaurantId, String name, String description,@MoneyConverter() Money price, String imageUrl,@NullableMoneyConverter() Money? originalPrice, String? sectionId, bool isPopular, List<String> tags, List<OptionGroup> optionGroups, String? restaurantName
});




}
/// @nodoc
class __$MenuItemCopyWithImpl<$Res>
    implements _$MenuItemCopyWith<$Res> {
  __$MenuItemCopyWithImpl(this._self, this._then);

  final _MenuItem _self;
  final $Res Function(_MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? restaurantId = null,Object? name = null,Object? description = null,Object? price = null,Object? imageUrl = null,Object? originalPrice = freezed,Object? sectionId = freezed,Object? isPopular = null,Object? tags = null,Object? optionGroups = null,Object? restaurantName = freezed,}) {
  return _then(_MenuItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as Money?,sectionId: freezed == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String?,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,optionGroups: null == optionGroups ? _self._optionGroups : optionGroups // ignore: cast_nullable_to_non_nullable
as List<OptionGroup>,restaurantName: freezed == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OptionGroup {

 String get id; String get title; List<MenuOption> get options; bool get isRequired; int get minSelect; int get maxSelect;
/// Create a copy of OptionGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptionGroupCopyWith<OptionGroup> get copyWith => _$OptionGroupCopyWithImpl<OptionGroup>(this as OptionGroup, _$identity);

  /// Serializes this OptionGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptionGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.minSelect, minSelect) || other.minSelect == minSelect)&&(identical(other.maxSelect, maxSelect) || other.maxSelect == maxSelect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(options),isRequired,minSelect,maxSelect);

@override
String toString() {
  return 'OptionGroup(id: $id, title: $title, options: $options, isRequired: $isRequired, minSelect: $minSelect, maxSelect: $maxSelect)';
}


}

/// @nodoc
abstract mixin class $OptionGroupCopyWith<$Res>  {
  factory $OptionGroupCopyWith(OptionGroup value, $Res Function(OptionGroup) _then) = _$OptionGroupCopyWithImpl;
@useResult
$Res call({
 String id, String title, List<MenuOption> options, bool isRequired, int minSelect, int maxSelect
});




}
/// @nodoc
class _$OptionGroupCopyWithImpl<$Res>
    implements $OptionGroupCopyWith<$Res> {
  _$OptionGroupCopyWithImpl(this._self, this._then);

  final OptionGroup _self;
  final $Res Function(OptionGroup) _then;

/// Create a copy of OptionGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? options = null,Object? isRequired = null,Object? minSelect = null,Object? maxSelect = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<MenuOption>,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,minSelect: null == minSelect ? _self.minSelect : minSelect // ignore: cast_nullable_to_non_nullable
as int,maxSelect: null == maxSelect ? _self.maxSelect : maxSelect // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OptionGroup].
extension OptionGroupPatterns on OptionGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptionGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptionGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptionGroup value)  $default,){
final _that = this;
switch (_that) {
case _OptionGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptionGroup value)?  $default,){
final _that = this;
switch (_that) {
case _OptionGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  List<MenuOption> options,  bool isRequired,  int minSelect,  int maxSelect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptionGroup() when $default != null:
return $default(_that.id,_that.title,_that.options,_that.isRequired,_that.minSelect,_that.maxSelect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  List<MenuOption> options,  bool isRequired,  int minSelect,  int maxSelect)  $default,) {final _that = this;
switch (_that) {
case _OptionGroup():
return $default(_that.id,_that.title,_that.options,_that.isRequired,_that.minSelect,_that.maxSelect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  List<MenuOption> options,  bool isRequired,  int minSelect,  int maxSelect)?  $default,) {final _that = this;
switch (_that) {
case _OptionGroup() when $default != null:
return $default(_that.id,_that.title,_that.options,_that.isRequired,_that.minSelect,_that.maxSelect);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptionGroup extends OptionGroup {
  const _OptionGroup({required this.id, required this.title, final  List<MenuOption> options = const [], this.isRequired = false, this.minSelect = 0, this.maxSelect = 1}): _options = options,super._();
  factory _OptionGroup.fromJson(Map<String, dynamic> json) => _$OptionGroupFromJson(json);

@override final  String id;
@override final  String title;
 final  List<MenuOption> _options;
@override@JsonKey() List<MenuOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override@JsonKey() final  bool isRequired;
@override@JsonKey() final  int minSelect;
@override@JsonKey() final  int maxSelect;

/// Create a copy of OptionGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptionGroupCopyWith<_OptionGroup> get copyWith => __$OptionGroupCopyWithImpl<_OptionGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptionGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptionGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.minSelect, minSelect) || other.minSelect == minSelect)&&(identical(other.maxSelect, maxSelect) || other.maxSelect == maxSelect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_options),isRequired,minSelect,maxSelect);

@override
String toString() {
  return 'OptionGroup(id: $id, title: $title, options: $options, isRequired: $isRequired, minSelect: $minSelect, maxSelect: $maxSelect)';
}


}

/// @nodoc
abstract mixin class _$OptionGroupCopyWith<$Res> implements $OptionGroupCopyWith<$Res> {
  factory _$OptionGroupCopyWith(_OptionGroup value, $Res Function(_OptionGroup) _then) = __$OptionGroupCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<MenuOption> options, bool isRequired, int minSelect, int maxSelect
});




}
/// @nodoc
class __$OptionGroupCopyWithImpl<$Res>
    implements _$OptionGroupCopyWith<$Res> {
  __$OptionGroupCopyWithImpl(this._self, this._then);

  final _OptionGroup _self;
  final $Res Function(_OptionGroup) _then;

/// Create a copy of OptionGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? options = null,Object? isRequired = null,Object? minSelect = null,Object? maxSelect = null,}) {
  return _then(_OptionGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<MenuOption>,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,minSelect: null == minSelect ? _self.minSelect : minSelect // ignore: cast_nullable_to_non_nullable
as int,maxSelect: null == maxSelect ? _self.maxSelect : maxSelect // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MenuOption {

 String get id; String get name;@MoneyConverter() Money get price;
/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuOptionCopyWith<MenuOption> get copyWith => _$MenuOptionCopyWithImpl<MenuOption>(this as MenuOption, _$identity);

  /// Serializes this MenuOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price);

@override
String toString() {
  return 'MenuOption(id: $id, name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class $MenuOptionCopyWith<$Res>  {
  factory $MenuOptionCopyWith(MenuOption value, $Res Function(MenuOption) _then) = _$MenuOptionCopyWithImpl;
@useResult
$Res call({
 String id, String name,@MoneyConverter() Money price
});




}
/// @nodoc
class _$MenuOptionCopyWithImpl<$Res>
    implements $MenuOptionCopyWith<$Res> {
  _$MenuOptionCopyWithImpl(this._self, this._then);

  final MenuOption _self;
  final $Res Function(MenuOption) _then;

/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuOption].
extension MenuOptionPatterns on MenuOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuOption value)  $default,){
final _that = this;
switch (_that) {
case _MenuOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuOption value)?  $default,){
final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @MoneyConverter()  Money price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
return $default(_that.id,_that.name,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @MoneyConverter()  Money price)  $default,) {final _that = this;
switch (_that) {
case _MenuOption():
return $default(_that.id,_that.name,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @MoneyConverter()  Money price)?  $default,) {final _that = this;
switch (_that) {
case _MenuOption() when $default != null:
return $default(_that.id,_that.name,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuOption implements MenuOption {
  const _MenuOption({required this.id, required this.name, @MoneyConverter() this.price = Money.zero});
  factory _MenuOption.fromJson(Map<String, dynamic> json) => _$MenuOptionFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey()@MoneyConverter() final  Money price;

/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuOptionCopyWith<_MenuOption> get copyWith => __$MenuOptionCopyWithImpl<_MenuOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price);

@override
String toString() {
  return 'MenuOption(id: $id, name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class _$MenuOptionCopyWith<$Res> implements $MenuOptionCopyWith<$Res> {
  factory _$MenuOptionCopyWith(_MenuOption value, $Res Function(_MenuOption) _then) = __$MenuOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@MoneyConverter() Money price
});




}
/// @nodoc
class __$MenuOptionCopyWithImpl<$Res>
    implements _$MenuOptionCopyWith<$Res> {
  __$MenuOptionCopyWithImpl(this._self, this._then);

  final _MenuOption _self;
  final $Res Function(_MenuOption) _then;

/// Create a copy of MenuOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,}) {
  return _then(_MenuOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}


}

// dart format on
