// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderRestaurant {

 String get id; String get name; String get logoUrl; String? get address; GeoPoint? get location;
/// Create a copy of OrderRestaurant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderRestaurantCopyWith<OrderRestaurant> get copyWith => _$OrderRestaurantCopyWithImpl<OrderRestaurant>(this as OrderRestaurant, _$identity);

  /// Serializes this OrderRestaurant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderRestaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,address,location);

@override
String toString() {
  return 'OrderRestaurant(id: $id, name: $name, logoUrl: $logoUrl, address: $address, location: $location)';
}


}

/// @nodoc
abstract mixin class $OrderRestaurantCopyWith<$Res>  {
  factory $OrderRestaurantCopyWith(OrderRestaurant value, $Res Function(OrderRestaurant) _then) = _$OrderRestaurantCopyWithImpl;
@useResult
$Res call({
 String id, String name, String logoUrl, String? address, GeoPoint? location
});


$GeoPointCopyWith<$Res>? get location;

}
/// @nodoc
class _$OrderRestaurantCopyWithImpl<$Res>
    implements $OrderRestaurantCopyWith<$Res> {
  _$OrderRestaurantCopyWithImpl(this._self, this._then);

  final OrderRestaurant _self;
  final $Res Function(OrderRestaurant) _then;

/// Create a copy of OrderRestaurant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? address = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint?,
  ));
}
/// Create a copy of OrderRestaurant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderRestaurant].
extension OrderRestaurantPatterns on OrderRestaurant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderRestaurant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderRestaurant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderRestaurant value)  $default,){
final _that = this;
switch (_that) {
case _OrderRestaurant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderRestaurant value)?  $default,){
final _that = this;
switch (_that) {
case _OrderRestaurant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl,  String? address,  GeoPoint? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderRestaurant() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.address,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl,  String? address,  GeoPoint? location)  $default,) {final _that = this;
switch (_that) {
case _OrderRestaurant():
return $default(_that.id,_that.name,_that.logoUrl,_that.address,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String logoUrl,  String? address,  GeoPoint? location)?  $default,) {final _that = this;
switch (_that) {
case _OrderRestaurant() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.address,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderRestaurant implements OrderRestaurant {
  const _OrderRestaurant({required this.id, required this.name, required this.logoUrl, this.address, this.location});
  factory _OrderRestaurant.fromJson(Map<String, dynamic> json) => _$OrderRestaurantFromJson(json);

@override final  String id;
@override final  String name;
@override final  String logoUrl;
@override final  String? address;
@override final  GeoPoint? location;

/// Create a copy of OrderRestaurant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderRestaurantCopyWith<_OrderRestaurant> get copyWith => __$OrderRestaurantCopyWithImpl<_OrderRestaurant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderRestaurantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderRestaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,address,location);

@override
String toString() {
  return 'OrderRestaurant(id: $id, name: $name, logoUrl: $logoUrl, address: $address, location: $location)';
}


}

/// @nodoc
abstract mixin class _$OrderRestaurantCopyWith<$Res> implements $OrderRestaurantCopyWith<$Res> {
  factory _$OrderRestaurantCopyWith(_OrderRestaurant value, $Res Function(_OrderRestaurant) _then) = __$OrderRestaurantCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String logoUrl, String? address, GeoPoint? location
});


@override $GeoPointCopyWith<$Res>? get location;

}
/// @nodoc
class __$OrderRestaurantCopyWithImpl<$Res>
    implements _$OrderRestaurantCopyWith<$Res> {
  __$OrderRestaurantCopyWithImpl(this._self, this._then);

  final _OrderRestaurant _self;
  final $Res Function(_OrderRestaurant) _then;

/// Create a copy of OrderRestaurant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? address = freezed,Object? location = freezed,}) {
  return _then(_OrderRestaurant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint?,
  ));
}

/// Create a copy of OrderRestaurant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoPointCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $GeoPointCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$OrderLine {

 String get id; String get menuItemId; String get name; String get imageUrl; int get quantity;/// Dish price before options.
@MoneyConverter() Money get basePrice; List<SelectedOption> get options; String? get note;
/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineCopyWith<OrderLine> get copyWith => _$OrderLineCopyWithImpl<OrderLine>(this as OrderLine, _$identity);

  /// Serializes this OrderLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLine&&(identical(other.id, id) || other.id == id)&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,menuItemId,name,imageUrl,quantity,basePrice,const DeepCollectionEquality().hash(options),note);

@override
String toString() {
  return 'OrderLine(id: $id, menuItemId: $menuItemId, name: $name, imageUrl: $imageUrl, quantity: $quantity, basePrice: $basePrice, options: $options, note: $note)';
}


}

/// @nodoc
abstract mixin class $OrderLineCopyWith<$Res>  {
  factory $OrderLineCopyWith(OrderLine value, $Res Function(OrderLine) _then) = _$OrderLineCopyWithImpl;
@useResult
$Res call({
 String id, String menuItemId, String name, String imageUrl, int quantity,@MoneyConverter() Money basePrice, List<SelectedOption> options, String? note
});




}
/// @nodoc
class _$OrderLineCopyWithImpl<$Res>
    implements $OrderLineCopyWith<$Res> {
  _$OrderLineCopyWithImpl(this._self, this._then);

  final OrderLine _self;
  final $Res Function(OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? menuItemId = null,Object? name = null,Object? imageUrl = null,Object? quantity = null,Object? basePrice = null,Object? options = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as Money,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<SelectedOption>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLine].
extension OrderLinePatterns on OrderLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLine value)  $default,){
final _that = this;
switch (_that) {
case _OrderLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLine value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String menuItemId,  String name,  String imageUrl,  int quantity, @MoneyConverter()  Money basePrice,  List<SelectedOption> options,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.id,_that.menuItemId,_that.name,_that.imageUrl,_that.quantity,_that.basePrice,_that.options,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String menuItemId,  String name,  String imageUrl,  int quantity, @MoneyConverter()  Money basePrice,  List<SelectedOption> options,  String? note)  $default,) {final _that = this;
switch (_that) {
case _OrderLine():
return $default(_that.id,_that.menuItemId,_that.name,_that.imageUrl,_that.quantity,_that.basePrice,_that.options,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String menuItemId,  String name,  String imageUrl,  int quantity, @MoneyConverter()  Money basePrice,  List<SelectedOption> options,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.id,_that.menuItemId,_that.name,_that.imageUrl,_that.quantity,_that.basePrice,_that.options,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLine extends OrderLine {
  const _OrderLine({required this.id, required this.menuItemId, required this.name, required this.imageUrl, required this.quantity, @MoneyConverter() required this.basePrice, final  List<SelectedOption> options = const [], this.note}): _options = options,super._();
  factory _OrderLine.fromJson(Map<String, dynamic> json) => _$OrderLineFromJson(json);

@override final  String id;
@override final  String menuItemId;
@override final  String name;
@override final  String imageUrl;
@override final  int quantity;
/// Dish price before options.
@override@MoneyConverter() final  Money basePrice;
 final  List<SelectedOption> _options;
@override@JsonKey() List<SelectedOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  String? note;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineCopyWith<_OrderLine> get copyWith => __$OrderLineCopyWithImpl<_OrderLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLine&&(identical(other.id, id) || other.id == id)&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,menuItemId,name,imageUrl,quantity,basePrice,const DeepCollectionEquality().hash(_options),note);

@override
String toString() {
  return 'OrderLine(id: $id, menuItemId: $menuItemId, name: $name, imageUrl: $imageUrl, quantity: $quantity, basePrice: $basePrice, options: $options, note: $note)';
}


}

/// @nodoc
abstract mixin class _$OrderLineCopyWith<$Res> implements $OrderLineCopyWith<$Res> {
  factory _$OrderLineCopyWith(_OrderLine value, $Res Function(_OrderLine) _then) = __$OrderLineCopyWithImpl;
@override @useResult
$Res call({
 String id, String menuItemId, String name, String imageUrl, int quantity,@MoneyConverter() Money basePrice, List<SelectedOption> options, String? note
});




}
/// @nodoc
class __$OrderLineCopyWithImpl<$Res>
    implements _$OrderLineCopyWith<$Res> {
  __$OrderLineCopyWithImpl(this._self, this._then);

  final _OrderLine _self;
  final $Res Function(_OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? menuItemId = null,Object? name = null,Object? imageUrl = null,Object? quantity = null,Object? basePrice = null,Object? options = null,Object? note = freezed,}) {
  return _then(_OrderLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as Money,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<SelectedOption>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GiftDetails {

 String get senderName; String get recipientName; String get recipientPhone; String? get note;
/// Create a copy of GiftDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiftDetailsCopyWith<GiftDetails> get copyWith => _$GiftDetailsCopyWithImpl<GiftDetails>(this as GiftDetails, _$identity);

  /// Serializes this GiftDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GiftDetails&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,senderName,recipientName,recipientPhone,note);

@override
String toString() {
  return 'GiftDetails(senderName: $senderName, recipientName: $recipientName, recipientPhone: $recipientPhone, note: $note)';
}


}

/// @nodoc
abstract mixin class $GiftDetailsCopyWith<$Res>  {
  factory $GiftDetailsCopyWith(GiftDetails value, $Res Function(GiftDetails) _then) = _$GiftDetailsCopyWithImpl;
@useResult
$Res call({
 String senderName, String recipientName, String recipientPhone, String? note
});




}
/// @nodoc
class _$GiftDetailsCopyWithImpl<$Res>
    implements $GiftDetailsCopyWith<$Res> {
  _$GiftDetailsCopyWithImpl(this._self, this._then);

  final GiftDetails _self;
  final $Res Function(GiftDetails) _then;

/// Create a copy of GiftDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? senderName = null,Object? recipientName = null,Object? recipientPhone = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GiftDetails].
extension GiftDetailsPatterns on GiftDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GiftDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GiftDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GiftDetails value)  $default,){
final _that = this;
switch (_that) {
case _GiftDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GiftDetails value)?  $default,){
final _that = this;
switch (_that) {
case _GiftDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String senderName,  String recipientName,  String recipientPhone,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GiftDetails() when $default != null:
return $default(_that.senderName,_that.recipientName,_that.recipientPhone,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String senderName,  String recipientName,  String recipientPhone,  String? note)  $default,) {final _that = this;
switch (_that) {
case _GiftDetails():
return $default(_that.senderName,_that.recipientName,_that.recipientPhone,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String senderName,  String recipientName,  String recipientPhone,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _GiftDetails() when $default != null:
return $default(_that.senderName,_that.recipientName,_that.recipientPhone,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GiftDetails implements GiftDetails {
  const _GiftDetails({required this.senderName, required this.recipientName, required this.recipientPhone, this.note});
  factory _GiftDetails.fromJson(Map<String, dynamic> json) => _$GiftDetailsFromJson(json);

@override final  String senderName;
@override final  String recipientName;
@override final  String recipientPhone;
@override final  String? note;

/// Create a copy of GiftDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GiftDetailsCopyWith<_GiftDetails> get copyWith => __$GiftDetailsCopyWithImpl<_GiftDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiftDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GiftDetails&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhone, recipientPhone) || other.recipientPhone == recipientPhone)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,senderName,recipientName,recipientPhone,note);

@override
String toString() {
  return 'GiftDetails(senderName: $senderName, recipientName: $recipientName, recipientPhone: $recipientPhone, note: $note)';
}


}

/// @nodoc
abstract mixin class _$GiftDetailsCopyWith<$Res> implements $GiftDetailsCopyWith<$Res> {
  factory _$GiftDetailsCopyWith(_GiftDetails value, $Res Function(_GiftDetails) _then) = __$GiftDetailsCopyWithImpl;
@override @useResult
$Res call({
 String senderName, String recipientName, String recipientPhone, String? note
});




}
/// @nodoc
class __$GiftDetailsCopyWithImpl<$Res>
    implements _$GiftDetailsCopyWith<$Res> {
  __$GiftDetailsCopyWithImpl(this._self, this._then);

  final _GiftDetails _self;
  final $Res Function(_GiftDetails) _then;

/// Create a copy of GiftDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? senderName = null,Object? recipientName = null,Object? recipientPhone = null,Object? note = freezed,}) {
  return _then(_GiftDetails(
senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhone: null == recipientPhone ? _self.recipientPhone : recipientPhone // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderRider {

 String get name; String get phone; String? get avatarUrl;
/// Create a copy of OrderRider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderRiderCopyWith<OrderRider> get copyWith => _$OrderRiderCopyWithImpl<OrderRider>(this as OrderRider, _$identity);

  /// Serializes this OrderRider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderRider&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,avatarUrl);

@override
String toString() {
  return 'OrderRider(name: $name, phone: $phone, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $OrderRiderCopyWith<$Res>  {
  factory $OrderRiderCopyWith(OrderRider value, $Res Function(OrderRider) _then) = _$OrderRiderCopyWithImpl;
@useResult
$Res call({
 String name, String phone, String? avatarUrl
});




}
/// @nodoc
class _$OrderRiderCopyWithImpl<$Res>
    implements $OrderRiderCopyWith<$Res> {
  _$OrderRiderCopyWithImpl(this._self, this._then);

  final OrderRider _self;
  final $Res Function(OrderRider) _then;

/// Create a copy of OrderRider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? phone = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderRider].
extension OrderRiderPatterns on OrderRider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderRider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderRider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderRider value)  $default,){
final _that = this;
switch (_that) {
case _OrderRider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderRider value)?  $default,){
final _that = this;
switch (_that) {
case _OrderRider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String phone,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderRider() when $default != null:
return $default(_that.name,_that.phone,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String phone,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _OrderRider():
return $default(_that.name,_that.phone,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String phone,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _OrderRider() when $default != null:
return $default(_that.name,_that.phone,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderRider implements OrderRider {
  const _OrderRider({required this.name, required this.phone, this.avatarUrl});
  factory _OrderRider.fromJson(Map<String, dynamic> json) => _$OrderRiderFromJson(json);

@override final  String name;
@override final  String phone;
@override final  String? avatarUrl;

/// Create a copy of OrderRider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderRiderCopyWith<_OrderRider> get copyWith => __$OrderRiderCopyWithImpl<_OrderRider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderRiderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderRider&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,phone,avatarUrl);

@override
String toString() {
  return 'OrderRider(name: $name, phone: $phone, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$OrderRiderCopyWith<$Res> implements $OrderRiderCopyWith<$Res> {
  factory _$OrderRiderCopyWith(_OrderRider value, $Res Function(_OrderRider) _then) = __$OrderRiderCopyWithImpl;
@override @useResult
$Res call({
 String name, String phone, String? avatarUrl
});




}
/// @nodoc
class __$OrderRiderCopyWithImpl<$Res>
    implements _$OrderRiderCopyWith<$Res> {
  __$OrderRiderCopyWithImpl(this._self, this._then);

  final _OrderRider _self;
  final $Res Function(_OrderRider) _then;

/// Create a copy of OrderRider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? phone = null,Object? avatarUrl = freezed,}) {
  return _then(_OrderRider(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderTimelineEntry {

 OrderMilestone get milestone; DateTime get at;
/// Create a copy of OrderTimelineEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderTimelineEntryCopyWith<OrderTimelineEntry> get copyWith => _$OrderTimelineEntryCopyWithImpl<OrderTimelineEntry>(this as OrderTimelineEntry, _$identity);

  /// Serializes this OrderTimelineEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderTimelineEntry&&(identical(other.milestone, milestone) || other.milestone == milestone)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,milestone,at);

@override
String toString() {
  return 'OrderTimelineEntry(milestone: $milestone, at: $at)';
}


}

/// @nodoc
abstract mixin class $OrderTimelineEntryCopyWith<$Res>  {
  factory $OrderTimelineEntryCopyWith(OrderTimelineEntry value, $Res Function(OrderTimelineEntry) _then) = _$OrderTimelineEntryCopyWithImpl;
@useResult
$Res call({
 OrderMilestone milestone, DateTime at
});




}
/// @nodoc
class _$OrderTimelineEntryCopyWithImpl<$Res>
    implements $OrderTimelineEntryCopyWith<$Res> {
  _$OrderTimelineEntryCopyWithImpl(this._self, this._then);

  final OrderTimelineEntry _self;
  final $Res Function(OrderTimelineEntry) _then;

/// Create a copy of OrderTimelineEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? milestone = null,Object? at = null,}) {
  return _then(_self.copyWith(
milestone: null == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as OrderMilestone,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderTimelineEntry].
extension OrderTimelineEntryPatterns on OrderTimelineEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderTimelineEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderTimelineEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderTimelineEntry value)  $default,){
final _that = this;
switch (_that) {
case _OrderTimelineEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderTimelineEntry value)?  $default,){
final _that = this;
switch (_that) {
case _OrderTimelineEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderMilestone milestone,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderTimelineEntry() when $default != null:
return $default(_that.milestone,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderMilestone milestone,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _OrderTimelineEntry():
return $default(_that.milestone,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderMilestone milestone,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _OrderTimelineEntry() when $default != null:
return $default(_that.milestone,_that.at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderTimelineEntry implements OrderTimelineEntry {
  const _OrderTimelineEntry({required this.milestone, required this.at});
  factory _OrderTimelineEntry.fromJson(Map<String, dynamic> json) => _$OrderTimelineEntryFromJson(json);

@override final  OrderMilestone milestone;
@override final  DateTime at;

/// Create a copy of OrderTimelineEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderTimelineEntryCopyWith<_OrderTimelineEntry> get copyWith => __$OrderTimelineEntryCopyWithImpl<_OrderTimelineEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderTimelineEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderTimelineEntry&&(identical(other.milestone, milestone) || other.milestone == milestone)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,milestone,at);

@override
String toString() {
  return 'OrderTimelineEntry(milestone: $milestone, at: $at)';
}


}

/// @nodoc
abstract mixin class _$OrderTimelineEntryCopyWith<$Res> implements $OrderTimelineEntryCopyWith<$Res> {
  factory _$OrderTimelineEntryCopyWith(_OrderTimelineEntry value, $Res Function(_OrderTimelineEntry) _then) = __$OrderTimelineEntryCopyWithImpl;
@override @useResult
$Res call({
 OrderMilestone milestone, DateTime at
});




}
/// @nodoc
class __$OrderTimelineEntryCopyWithImpl<$Res>
    implements _$OrderTimelineEntryCopyWith<$Res> {
  __$OrderTimelineEntryCopyWithImpl(this._self, this._then);

  final _OrderTimelineEntry _self;
  final $Res Function(_OrderTimelineEntry) _then;

/// Create a copy of OrderTimelineEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? milestone = null,Object? at = null,}) {
  return _then(_OrderTimelineEntry(
milestone: null == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as OrderMilestone,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Order {

 String get id; OrderRestaurant get restaurant; List<OrderLine> get items; OrderStatus get status; DateTime get placedAt;/// Promised arrival time shown on the tracking card.
 DateTime get estimatedArrival;@MoneyConverter() Money get subtotal;@MoneyConverter() Money get deliveryFee;@MoneyConverter() Money get serviceFee;@MoneyConverter() Money get total;@MoneyConverter() Money get discount; DeliveryMode get deliveryMode; PaymentMethodType get paymentMethod; DeliveryAddress? get address; String? get instructions; GiftDetails? get gift; bool get cutlery; OrderRider? get rider; List<OrderTimelineEntry> get timeline; DateTime? get deliveredAt; int? get rating;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.status, status) || other.status == status)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.estimatedArrival, estimatedArrival) || other.estimatedArrival == estimatedArrival)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.deliveryMode, deliveryMode) || other.deliveryMode == deliveryMode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.address, address) || other.address == address)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.gift, gift) || other.gift == gift)&&(identical(other.cutlery, cutlery) || other.cutlery == cutlery)&&(identical(other.rider, rider) || other.rider == rider)&&const DeepCollectionEquality().equals(other.timeline, timeline)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,restaurant,const DeepCollectionEquality().hash(items),status,placedAt,estimatedArrival,subtotal,deliveryFee,serviceFee,total,discount,deliveryMode,paymentMethod,address,instructions,gift,cutlery,rider,const DeepCollectionEquality().hash(timeline),deliveredAt,rating]);

@override
String toString() {
  return 'Order(id: $id, restaurant: $restaurant, items: $items, status: $status, placedAt: $placedAt, estimatedArrival: $estimatedArrival, subtotal: $subtotal, deliveryFee: $deliveryFee, serviceFee: $serviceFee, total: $total, discount: $discount, deliveryMode: $deliveryMode, paymentMethod: $paymentMethod, address: $address, instructions: $instructions, gift: $gift, cutlery: $cutlery, rider: $rider, timeline: $timeline, deliveredAt: $deliveredAt, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, OrderRestaurant restaurant, List<OrderLine> items, OrderStatus status, DateTime placedAt, DateTime estimatedArrival,@MoneyConverter() Money subtotal,@MoneyConverter() Money deliveryFee,@MoneyConverter() Money serviceFee,@MoneyConverter() Money total,@MoneyConverter() Money discount, DeliveryMode deliveryMode, PaymentMethodType paymentMethod, DeliveryAddress? address, String? instructions, GiftDetails? gift, bool cutlery, OrderRider? rider, List<OrderTimelineEntry> timeline, DateTime? deliveredAt, int? rating
});


$OrderRestaurantCopyWith<$Res> get restaurant;$DeliveryAddressCopyWith<$Res>? get address;$GiftDetailsCopyWith<$Res>? get gift;$OrderRiderCopyWith<$Res>? get rider;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? restaurant = null,Object? items = null,Object? status = null,Object? placedAt = null,Object? estimatedArrival = null,Object? subtotal = null,Object? deliveryFee = null,Object? serviceFee = null,Object? total = null,Object? discount = null,Object? deliveryMode = null,Object? paymentMethod = null,Object? address = freezed,Object? instructions = freezed,Object? gift = freezed,Object? cutlery = null,Object? rider = freezed,Object? timeline = null,Object? deliveredAt = freezed,Object? rating = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as OrderRestaurant,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,estimatedArrival: null == estimatedArrival ? _self.estimatedArrival : estimatedArrival // ignore: cast_nullable_to_non_nullable
as DateTime,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as Money,serviceFee: null == serviceFee ? _self.serviceFee : serviceFee // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as Money,deliveryMode: null == deliveryMode ? _self.deliveryMode : deliveryMode // ignore: cast_nullable_to_non_nullable
as DeliveryMode,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as GiftDetails?,cutlery: null == cutlery ? _self.cutlery : cutlery // ignore: cast_nullable_to_non_nullable
as bool,rider: freezed == rider ? _self.rider : rider // ignore: cast_nullable_to_non_nullable
as OrderRider?,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<OrderTimelineEntry>,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderRestaurantCopyWith<$Res> get restaurant {
  
  return $OrderRestaurantCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $DeliveryAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftDetailsCopyWith<$Res>? get gift {
    if (_self.gift == null) {
    return null;
  }

  return $GiftDetailsCopyWith<$Res>(_self.gift!, (value) {
    return _then(_self.copyWith(gift: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderRiderCopyWith<$Res>? get rider {
    if (_self.rider == null) {
    return null;
  }

  return $OrderRiderCopyWith<$Res>(_self.rider!, (value) {
    return _then(_self.copyWith(rider: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  OrderRestaurant restaurant,  List<OrderLine> items,  OrderStatus status,  DateTime placedAt,  DateTime estimatedArrival, @MoneyConverter()  Money subtotal, @MoneyConverter()  Money deliveryFee, @MoneyConverter()  Money serviceFee, @MoneyConverter()  Money total, @MoneyConverter()  Money discount,  DeliveryMode deliveryMode,  PaymentMethodType paymentMethod,  DeliveryAddress? address,  String? instructions,  GiftDetails? gift,  bool cutlery,  OrderRider? rider,  List<OrderTimelineEntry> timeline,  DateTime? deliveredAt,  int? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.restaurant,_that.items,_that.status,_that.placedAt,_that.estimatedArrival,_that.subtotal,_that.deliveryFee,_that.serviceFee,_that.total,_that.discount,_that.deliveryMode,_that.paymentMethod,_that.address,_that.instructions,_that.gift,_that.cutlery,_that.rider,_that.timeline,_that.deliveredAt,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  OrderRestaurant restaurant,  List<OrderLine> items,  OrderStatus status,  DateTime placedAt,  DateTime estimatedArrival, @MoneyConverter()  Money subtotal, @MoneyConverter()  Money deliveryFee, @MoneyConverter()  Money serviceFee, @MoneyConverter()  Money total, @MoneyConverter()  Money discount,  DeliveryMode deliveryMode,  PaymentMethodType paymentMethod,  DeliveryAddress? address,  String? instructions,  GiftDetails? gift,  bool cutlery,  OrderRider? rider,  List<OrderTimelineEntry> timeline,  DateTime? deliveredAt,  int? rating)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.restaurant,_that.items,_that.status,_that.placedAt,_that.estimatedArrival,_that.subtotal,_that.deliveryFee,_that.serviceFee,_that.total,_that.discount,_that.deliveryMode,_that.paymentMethod,_that.address,_that.instructions,_that.gift,_that.cutlery,_that.rider,_that.timeline,_that.deliveredAt,_that.rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  OrderRestaurant restaurant,  List<OrderLine> items,  OrderStatus status,  DateTime placedAt,  DateTime estimatedArrival, @MoneyConverter()  Money subtotal, @MoneyConverter()  Money deliveryFee, @MoneyConverter()  Money serviceFee, @MoneyConverter()  Money total, @MoneyConverter()  Money discount,  DeliveryMode deliveryMode,  PaymentMethodType paymentMethod,  DeliveryAddress? address,  String? instructions,  GiftDetails? gift,  bool cutlery,  OrderRider? rider,  List<OrderTimelineEntry> timeline,  DateTime? deliveredAt,  int? rating)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.restaurant,_that.items,_that.status,_that.placedAt,_that.estimatedArrival,_that.subtotal,_that.deliveryFee,_that.serviceFee,_that.total,_that.discount,_that.deliveryMode,_that.paymentMethod,_that.address,_that.instructions,_that.gift,_that.cutlery,_that.rider,_that.timeline,_that.deliveredAt,_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order extends Order {
  const _Order({required this.id, required this.restaurant, required final  List<OrderLine> items, required this.status, required this.placedAt, required this.estimatedArrival, @MoneyConverter() required this.subtotal, @MoneyConverter() required this.deliveryFee, @MoneyConverter() required this.serviceFee, @MoneyConverter() required this.total, @MoneyConverter() this.discount = Money.zero, this.deliveryMode = DeliveryMode.delivery, this.paymentMethod = PaymentMethodType.wallet, this.address, this.instructions, this.gift, this.cutlery = false, this.rider, final  List<OrderTimelineEntry> timeline = const [], this.deliveredAt, this.rating}): _items = items,_timeline = timeline,super._();
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
@override final  OrderRestaurant restaurant;
 final  List<OrderLine> _items;
@override List<OrderLine> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  OrderStatus status;
@override final  DateTime placedAt;
/// Promised arrival time shown on the tracking card.
@override final  DateTime estimatedArrival;
@override@MoneyConverter() final  Money subtotal;
@override@MoneyConverter() final  Money deliveryFee;
@override@MoneyConverter() final  Money serviceFee;
@override@MoneyConverter() final  Money total;
@override@JsonKey()@MoneyConverter() final  Money discount;
@override@JsonKey() final  DeliveryMode deliveryMode;
@override@JsonKey() final  PaymentMethodType paymentMethod;
@override final  DeliveryAddress? address;
@override final  String? instructions;
@override final  GiftDetails? gift;
@override@JsonKey() final  bool cutlery;
@override final  OrderRider? rider;
 final  List<OrderTimelineEntry> _timeline;
@override@JsonKey() List<OrderTimelineEntry> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

@override final  DateTime? deliveredAt;
@override final  int? rating;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.status, status) || other.status == status)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.estimatedArrival, estimatedArrival) || other.estimatedArrival == estimatedArrival)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.deliveryMode, deliveryMode) || other.deliveryMode == deliveryMode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.address, address) || other.address == address)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.gift, gift) || other.gift == gift)&&(identical(other.cutlery, cutlery) || other.cutlery == cutlery)&&(identical(other.rider, rider) || other.rider == rider)&&const DeepCollectionEquality().equals(other._timeline, _timeline)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,restaurant,const DeepCollectionEquality().hash(_items),status,placedAt,estimatedArrival,subtotal,deliveryFee,serviceFee,total,discount,deliveryMode,paymentMethod,address,instructions,gift,cutlery,rider,const DeepCollectionEquality().hash(_timeline),deliveredAt,rating]);

@override
String toString() {
  return 'Order(id: $id, restaurant: $restaurant, items: $items, status: $status, placedAt: $placedAt, estimatedArrival: $estimatedArrival, subtotal: $subtotal, deliveryFee: $deliveryFee, serviceFee: $serviceFee, total: $total, discount: $discount, deliveryMode: $deliveryMode, paymentMethod: $paymentMethod, address: $address, instructions: $instructions, gift: $gift, cutlery: $cutlery, rider: $rider, timeline: $timeline, deliveredAt: $deliveredAt, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, OrderRestaurant restaurant, List<OrderLine> items, OrderStatus status, DateTime placedAt, DateTime estimatedArrival,@MoneyConverter() Money subtotal,@MoneyConverter() Money deliveryFee,@MoneyConverter() Money serviceFee,@MoneyConverter() Money total,@MoneyConverter() Money discount, DeliveryMode deliveryMode, PaymentMethodType paymentMethod, DeliveryAddress? address, String? instructions, GiftDetails? gift, bool cutlery, OrderRider? rider, List<OrderTimelineEntry> timeline, DateTime? deliveredAt, int? rating
});


@override $OrderRestaurantCopyWith<$Res> get restaurant;@override $DeliveryAddressCopyWith<$Res>? get address;@override $GiftDetailsCopyWith<$Res>? get gift;@override $OrderRiderCopyWith<$Res>? get rider;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? restaurant = null,Object? items = null,Object? status = null,Object? placedAt = null,Object? estimatedArrival = null,Object? subtotal = null,Object? deliveryFee = null,Object? serviceFee = null,Object? total = null,Object? discount = null,Object? deliveryMode = null,Object? paymentMethod = null,Object? address = freezed,Object? instructions = freezed,Object? gift = freezed,Object? cutlery = null,Object? rider = freezed,Object? timeline = null,Object? deliveredAt = freezed,Object? rating = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as OrderRestaurant,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as DateTime,estimatedArrival: null == estimatedArrival ? _self.estimatedArrival : estimatedArrival // ignore: cast_nullable_to_non_nullable
as DateTime,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as Money,serviceFee: null == serviceFee ? _self.serviceFee : serviceFee // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as Money,deliveryMode: null == deliveryMode ? _self.deliveryMode : deliveryMode // ignore: cast_nullable_to_non_nullable
as DeliveryMode,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as DeliveryAddress?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,gift: freezed == gift ? _self.gift : gift // ignore: cast_nullable_to_non_nullable
as GiftDetails?,cutlery: null == cutlery ? _self.cutlery : cutlery // ignore: cast_nullable_to_non_nullable
as bool,rider: freezed == rider ? _self.rider : rider // ignore: cast_nullable_to_non_nullable
as OrderRider?,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<OrderTimelineEntry>,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderRestaurantCopyWith<$Res> get restaurant {
  
  return $OrderRestaurantCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $DeliveryAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GiftDetailsCopyWith<$Res>? get gift {
    if (_self.gift == null) {
    return null;
  }

  return $GiftDetailsCopyWith<$Res>(_self.gift!, (value) {
    return _then(_self.copyWith(gift: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderRiderCopyWith<$Res>? get rider {
    if (_self.rider == null) {
    return null;
  }

  return $OrderRiderCopyWith<$Res>(_self.rider!, (value) {
    return _then(_self.copyWith(rider: value));
  });
}
}

// dart format on
