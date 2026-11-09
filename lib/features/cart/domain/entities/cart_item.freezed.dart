// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelectedOption {

 String get groupId; String get groupTitle; String get optionId; String get name;@MoneyConverter() Money get price;
/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedOptionCopyWith<SelectedOption> get copyWith => _$SelectedOptionCopyWithImpl<SelectedOption>(this as SelectedOption, _$identity);

  /// Serializes this SelectedOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedOption&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupTitle, groupTitle) || other.groupTitle == groupTitle)&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,groupTitle,optionId,name,price);

@override
String toString() {
  return 'SelectedOption(groupId: $groupId, groupTitle: $groupTitle, optionId: $optionId, name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class $SelectedOptionCopyWith<$Res>  {
  factory $SelectedOptionCopyWith(SelectedOption value, $Res Function(SelectedOption) _then) = _$SelectedOptionCopyWithImpl;
@useResult
$Res call({
 String groupId, String groupTitle, String optionId, String name,@MoneyConverter() Money price
});




}
/// @nodoc
class _$SelectedOptionCopyWithImpl<$Res>
    implements $SelectedOptionCopyWith<$Res> {
  _$SelectedOptionCopyWithImpl(this._self, this._then);

  final SelectedOption _self;
  final $Res Function(SelectedOption) _then;

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? groupTitle = null,Object? optionId = null,Object? name = null,Object? price = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,groupTitle: null == groupTitle ? _self.groupTitle : groupTitle // ignore: cast_nullable_to_non_nullable
as String,optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectedOption].
extension SelectedOptionPatterns on SelectedOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedOption value)  $default,){
final _that = this;
switch (_that) {
case _SelectedOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedOption value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String groupId,  String groupTitle,  String optionId,  String name, @MoneyConverter()  Money price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
return $default(_that.groupId,_that.groupTitle,_that.optionId,_that.name,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String groupId,  String groupTitle,  String optionId,  String name, @MoneyConverter()  Money price)  $default,) {final _that = this;
switch (_that) {
case _SelectedOption():
return $default(_that.groupId,_that.groupTitle,_that.optionId,_that.name,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String groupId,  String groupTitle,  String optionId,  String name, @MoneyConverter()  Money price)?  $default,) {final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
return $default(_that.groupId,_that.groupTitle,_that.optionId,_that.name,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectedOption implements SelectedOption {
  const _SelectedOption({required this.groupId, required this.groupTitle, required this.optionId, required this.name, @MoneyConverter() this.price = Money.zero});
  factory _SelectedOption.fromJson(Map<String, dynamic> json) => _$SelectedOptionFromJson(json);

@override final  String groupId;
@override final  String groupTitle;
@override final  String optionId;
@override final  String name;
@override@JsonKey()@MoneyConverter() final  Money price;

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedOptionCopyWith<_SelectedOption> get copyWith => __$SelectedOptionCopyWithImpl<_SelectedOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectedOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedOption&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupTitle, groupTitle) || other.groupTitle == groupTitle)&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,groupTitle,optionId,name,price);

@override
String toString() {
  return 'SelectedOption(groupId: $groupId, groupTitle: $groupTitle, optionId: $optionId, name: $name, price: $price)';
}


}

/// @nodoc
abstract mixin class _$SelectedOptionCopyWith<$Res> implements $SelectedOptionCopyWith<$Res> {
  factory _$SelectedOptionCopyWith(_SelectedOption value, $Res Function(_SelectedOption) _then) = __$SelectedOptionCopyWithImpl;
@override @useResult
$Res call({
 String groupId, String groupTitle, String optionId, String name,@MoneyConverter() Money price
});




}
/// @nodoc
class __$SelectedOptionCopyWithImpl<$Res>
    implements _$SelectedOptionCopyWith<$Res> {
  __$SelectedOptionCopyWithImpl(this._self, this._then);

  final _SelectedOption _self;
  final $Res Function(_SelectedOption) _then;

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? groupTitle = null,Object? optionId = null,Object? name = null,Object? price = null,}) {
  return _then(_SelectedOption(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,groupTitle: null == groupTitle ? _self.groupTitle : groupTitle // ignore: cast_nullable_to_non_nullable
as String,optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}


}


/// @nodoc
mixin _$CartItem {

/// Unique line id (uuid).
 String get id; String get restaurantId; String get menuItemId; String get name; String get imageUrl;/// Base dish price, excluding options.
@MoneyConverter() Money get basePrice; int get quantity; List<SelectedOption> get options; String? get note;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,menuItemId,name,imageUrl,basePrice,quantity,const DeepCollectionEquality().hash(options),note);

@override
String toString() {
  return 'CartItem(id: $id, restaurantId: $restaurantId, menuItemId: $menuItemId, name: $name, imageUrl: $imageUrl, basePrice: $basePrice, quantity: $quantity, options: $options, note: $note)';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
 String id, String restaurantId, String menuItemId, String name, String imageUrl,@MoneyConverter() Money basePrice, int quantity, List<SelectedOption> options, String? note
});




}
/// @nodoc
class _$CartItemCopyWithImpl<$Res>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._self, this._then);

  final CartItem _self;
  final $Res Function(CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? restaurantId = null,Object? menuItemId = null,Object? name = null,Object? imageUrl = null,Object? basePrice = null,Object? quantity = null,Object? options = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as Money,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<SelectedOption>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartItem].
extension CartItemPatterns on CartItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItem value)  $default,){
final _that = this;
switch (_that) {
case _CartItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String restaurantId,  String menuItemId,  String name,  String imageUrl, @MoneyConverter()  Money basePrice,  int quantity,  List<SelectedOption> options,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.restaurantId,_that.menuItemId,_that.name,_that.imageUrl,_that.basePrice,_that.quantity,_that.options,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String restaurantId,  String menuItemId,  String name,  String imageUrl, @MoneyConverter()  Money basePrice,  int quantity,  List<SelectedOption> options,  String? note)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
return $default(_that.id,_that.restaurantId,_that.menuItemId,_that.name,_that.imageUrl,_that.basePrice,_that.quantity,_that.options,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String restaurantId,  String menuItemId,  String name,  String imageUrl, @MoneyConverter()  Money basePrice,  int quantity,  List<SelectedOption> options,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.restaurantId,_that.menuItemId,_that.name,_that.imageUrl,_that.basePrice,_that.quantity,_that.options,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItem extends CartItem {
  const _CartItem({required this.id, required this.restaurantId, required this.menuItemId, required this.name, required this.imageUrl, @MoneyConverter() required this.basePrice, this.quantity = 1, final  List<SelectedOption> options = const [], this.note}): _options = options,super._();
  factory _CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

/// Unique line id (uuid).
@override final  String id;
@override final  String restaurantId;
@override final  String menuItemId;
@override final  String name;
@override final  String imageUrl;
/// Base dish price, excluding options.
@override@MoneyConverter() final  Money basePrice;
@override@JsonKey() final  int quantity;
 final  List<SelectedOption> _options;
@override@JsonKey() List<SelectedOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  String? note;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemCopyWith<_CartItem> get copyWith => __$CartItemCopyWithImpl<_CartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,menuItemId,name,imageUrl,basePrice,quantity,const DeepCollectionEquality().hash(_options),note);

@override
String toString() {
  return 'CartItem(id: $id, restaurantId: $restaurantId, menuItemId: $menuItemId, name: $name, imageUrl: $imageUrl, basePrice: $basePrice, quantity: $quantity, options: $options, note: $note)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String restaurantId, String menuItemId, String name, String imageUrl,@MoneyConverter() Money basePrice, int quantity, List<SelectedOption> options, String? note
});




}
/// @nodoc
class __$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(this._self, this._then);

  final _CartItem _self;
  final $Res Function(_CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? restaurantId = null,Object? menuItemId = null,Object? name = null,Object? imageUrl = null,Object? basePrice = null,Object? quantity = null,Object? options = null,Object? note = freezed,}) {
  return _then(_CartItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as Money,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<SelectedOption>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StoreCart {

 String get restaurantId; String get restaurantName; String get restaurantLogoUrl; DateTime get updatedAt; List<CartItem> get items;
/// Create a copy of StoreCart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreCartCopyWith<StoreCart> get copyWith => _$StoreCartCopyWithImpl<StoreCart>(this as StoreCart, _$identity);

  /// Serializes this StoreCart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreCart&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.restaurantLogoUrl, restaurantLogoUrl) || other.restaurantLogoUrl == restaurantLogoUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,restaurantName,restaurantLogoUrl,updatedAt,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'StoreCart(restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantLogoUrl: $restaurantLogoUrl, updatedAt: $updatedAt, items: $items)';
}


}

/// @nodoc
abstract mixin class $StoreCartCopyWith<$Res>  {
  factory $StoreCartCopyWith(StoreCart value, $Res Function(StoreCart) _then) = _$StoreCartCopyWithImpl;
@useResult
$Res call({
 String restaurantId, String restaurantName, String restaurantLogoUrl, DateTime updatedAt, List<CartItem> items
});




}
/// @nodoc
class _$StoreCartCopyWithImpl<$Res>
    implements $StoreCartCopyWith<$Res> {
  _$StoreCartCopyWithImpl(this._self, this._then);

  final StoreCart _self;
  final $Res Function(StoreCart) _then;

/// Create a copy of StoreCart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantId = null,Object? restaurantName = null,Object? restaurantLogoUrl = null,Object? updatedAt = null,Object? items = null,}) {
  return _then(_self.copyWith(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,restaurantLogoUrl: null == restaurantLogoUrl ? _self.restaurantLogoUrl : restaurantLogoUrl // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreCart].
extension StoreCartPatterns on StoreCart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreCart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreCart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreCart value)  $default,){
final _that = this;
switch (_that) {
case _StoreCart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreCart value)?  $default,){
final _that = this;
switch (_that) {
case _StoreCart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String restaurantId,  String restaurantName,  String restaurantLogoUrl,  DateTime updatedAt,  List<CartItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreCart() when $default != null:
return $default(_that.restaurantId,_that.restaurantName,_that.restaurantLogoUrl,_that.updatedAt,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String restaurantId,  String restaurantName,  String restaurantLogoUrl,  DateTime updatedAt,  List<CartItem> items)  $default,) {final _that = this;
switch (_that) {
case _StoreCart():
return $default(_that.restaurantId,_that.restaurantName,_that.restaurantLogoUrl,_that.updatedAt,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String restaurantId,  String restaurantName,  String restaurantLogoUrl,  DateTime updatedAt,  List<CartItem> items)?  $default,) {final _that = this;
switch (_that) {
case _StoreCart() when $default != null:
return $default(_that.restaurantId,_that.restaurantName,_that.restaurantLogoUrl,_that.updatedAt,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreCart extends StoreCart {
  const _StoreCart({required this.restaurantId, required this.restaurantName, required this.restaurantLogoUrl, required this.updatedAt, final  List<CartItem> items = const []}): _items = items,super._();
  factory _StoreCart.fromJson(Map<String, dynamic> json) => _$StoreCartFromJson(json);

@override final  String restaurantId;
@override final  String restaurantName;
@override final  String restaurantLogoUrl;
@override final  DateTime updatedAt;
 final  List<CartItem> _items;
@override@JsonKey() List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of StoreCart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreCartCopyWith<_StoreCart> get copyWith => __$StoreCartCopyWithImpl<_StoreCart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreCartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreCart&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.restaurantLogoUrl, restaurantLogoUrl) || other.restaurantLogoUrl == restaurantLogoUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,restaurantName,restaurantLogoUrl,updatedAt,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'StoreCart(restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantLogoUrl: $restaurantLogoUrl, updatedAt: $updatedAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$StoreCartCopyWith<$Res> implements $StoreCartCopyWith<$Res> {
  factory _$StoreCartCopyWith(_StoreCart value, $Res Function(_StoreCart) _then) = __$StoreCartCopyWithImpl;
@override @useResult
$Res call({
 String restaurantId, String restaurantName, String restaurantLogoUrl, DateTime updatedAt, List<CartItem> items
});




}
/// @nodoc
class __$StoreCartCopyWithImpl<$Res>
    implements _$StoreCartCopyWith<$Res> {
  __$StoreCartCopyWithImpl(this._self, this._then);

  final _StoreCart _self;
  final $Res Function(_StoreCart) _then;

/// Create a copy of StoreCart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantId = null,Object? restaurantName = null,Object? restaurantLogoUrl = null,Object? updatedAt = null,Object? items = null,}) {
  return _then(_StoreCart(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,restaurantLogoUrl: null == restaurantLogoUrl ? _self.restaurantLogoUrl : restaurantLogoUrl // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,
  ));
}


}

/// @nodoc
mixin _$CartStoreInfo {

 String get id; String get name; String get logoUrl;
/// Create a copy of CartStoreInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStoreInfoCopyWith<CartStoreInfo> get copyWith => _$CartStoreInfoCopyWithImpl<CartStoreInfo>(this as CartStoreInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartStoreInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl);

@override
String toString() {
  return 'CartStoreInfo(id: $id, name: $name, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class $CartStoreInfoCopyWith<$Res>  {
  factory $CartStoreInfoCopyWith(CartStoreInfo value, $Res Function(CartStoreInfo) _then) = _$CartStoreInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String logoUrl
});




}
/// @nodoc
class _$CartStoreInfoCopyWithImpl<$Res>
    implements $CartStoreInfoCopyWith<$Res> {
  _$CartStoreInfoCopyWithImpl(this._self, this._then);

  final CartStoreInfo _self;
  final $Res Function(CartStoreInfo) _then;

/// Create a copy of CartStoreInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CartStoreInfo].
extension CartStoreInfoPatterns on CartStoreInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartStoreInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartStoreInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartStoreInfo value)  $default,){
final _that = this;
switch (_that) {
case _CartStoreInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartStoreInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CartStoreInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartStoreInfo() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl)  $default,) {final _that = this;
switch (_that) {
case _CartStoreInfo():
return $default(_that.id,_that.name,_that.logoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String logoUrl)?  $default,) {final _that = this;
switch (_that) {
case _CartStoreInfo() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl);case _:
  return null;

}
}

}

/// @nodoc


class _CartStoreInfo implements CartStoreInfo {
  const _CartStoreInfo({required this.id, required this.name, required this.logoUrl});
  

@override final  String id;
@override final  String name;
@override final  String logoUrl;

/// Create a copy of CartStoreInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStoreInfoCopyWith<_CartStoreInfo> get copyWith => __$CartStoreInfoCopyWithImpl<_CartStoreInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartStoreInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl);

@override
String toString() {
  return 'CartStoreInfo(id: $id, name: $name, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class _$CartStoreInfoCopyWith<$Res> implements $CartStoreInfoCopyWith<$Res> {
  factory _$CartStoreInfoCopyWith(_CartStoreInfo value, $Res Function(_CartStoreInfo) _then) = __$CartStoreInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String logoUrl
});




}
/// @nodoc
class __$CartStoreInfoCopyWithImpl<$Res>
    implements _$CartStoreInfoCopyWith<$Res> {
  __$CartStoreInfoCopyWithImpl(this._self, this._then);

  final _CartStoreInfo _self;
  final $Res Function(_CartStoreInfo) _then;

/// Create a copy of CartStoreInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,}) {
  return _then(_CartStoreInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
