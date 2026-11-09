// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelPreferences {

 NotificationChannel get channel; Set<NotificationCategory> get categories;
/// Create a copy of ChannelPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChannelPreferencesCopyWith<ChannelPreferences> get copyWith => _$ChannelPreferencesCopyWithImpl<ChannelPreferences>(this as ChannelPreferences, _$identity);

  /// Serializes this ChannelPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChannelPreferences&&(identical(other.channel, channel) || other.channel == channel)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channel,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ChannelPreferences(channel: $channel, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ChannelPreferencesCopyWith<$Res>  {
  factory $ChannelPreferencesCopyWith(ChannelPreferences value, $Res Function(ChannelPreferences) _then) = _$ChannelPreferencesCopyWithImpl;
@useResult
$Res call({
 NotificationChannel channel, Set<NotificationCategory> categories
});




}
/// @nodoc
class _$ChannelPreferencesCopyWithImpl<$Res>
    implements $ChannelPreferencesCopyWith<$Res> {
  _$ChannelPreferencesCopyWithImpl(this._self, this._then);

  final ChannelPreferences _self;
  final $Res Function(ChannelPreferences) _then;

/// Create a copy of ChannelPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? channel = null,Object? categories = null,}) {
  return _then(_self.copyWith(
channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as NotificationChannel,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as Set<NotificationCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChannelPreferences].
extension ChannelPreferencesPatterns on ChannelPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChannelPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChannelPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChannelPreferences value)  $default,){
final _that = this;
switch (_that) {
case _ChannelPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChannelPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _ChannelPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationChannel channel,  Set<NotificationCategory> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChannelPreferences() when $default != null:
return $default(_that.channel,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationChannel channel,  Set<NotificationCategory> categories)  $default,) {final _that = this;
switch (_that) {
case _ChannelPreferences():
return $default(_that.channel,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationChannel channel,  Set<NotificationCategory> categories)?  $default,) {final _that = this;
switch (_that) {
case _ChannelPreferences() when $default != null:
return $default(_that.channel,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChannelPreferences extends ChannelPreferences {
  const _ChannelPreferences({required this.channel, final  Set<NotificationCategory> categories = const {}}): _categories = categories,super._();
  factory _ChannelPreferences.fromJson(Map<String, dynamic> json) => _$ChannelPreferencesFromJson(json);

@override final  NotificationChannel channel;
 final  Set<NotificationCategory> _categories;
@override@JsonKey() Set<NotificationCategory> get categories {
  if (_categories is EqualUnmodifiableSetView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_categories);
}


/// Create a copy of ChannelPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChannelPreferencesCopyWith<_ChannelPreferences> get copyWith => __$ChannelPreferencesCopyWithImpl<_ChannelPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChannelPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChannelPreferences&&(identical(other.channel, channel) || other.channel == channel)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channel,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'ChannelPreferences(channel: $channel, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ChannelPreferencesCopyWith<$Res> implements $ChannelPreferencesCopyWith<$Res> {
  factory _$ChannelPreferencesCopyWith(_ChannelPreferences value, $Res Function(_ChannelPreferences) _then) = __$ChannelPreferencesCopyWithImpl;
@override @useResult
$Res call({
 NotificationChannel channel, Set<NotificationCategory> categories
});




}
/// @nodoc
class __$ChannelPreferencesCopyWithImpl<$Res>
    implements _$ChannelPreferencesCopyWith<$Res> {
  __$ChannelPreferencesCopyWithImpl(this._self, this._then);

  final _ChannelPreferences _self;
  final $Res Function(_ChannelPreferences) _then;

/// Create a copy of ChannelPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? channel = null,Object? categories = null,}) {
  return _then(_ChannelPreferences(
channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as NotificationChannel,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as Set<NotificationCategory>,
  ));
}


}


/// @nodoc
mixin _$AccessibilitySettings {

@JsonKey(unknownEnumValue: HearingPreference.none) HearingPreference get hearing;
/// Create a copy of AccessibilitySettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccessibilitySettingsCopyWith<AccessibilitySettings> get copyWith => _$AccessibilitySettingsCopyWithImpl<AccessibilitySettings>(this as AccessibilitySettings, _$identity);

  /// Serializes this AccessibilitySettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccessibilitySettings&&(identical(other.hearing, hearing) || other.hearing == hearing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hearing);

@override
String toString() {
  return 'AccessibilitySettings(hearing: $hearing)';
}


}

/// @nodoc
abstract mixin class $AccessibilitySettingsCopyWith<$Res>  {
  factory $AccessibilitySettingsCopyWith(AccessibilitySettings value, $Res Function(AccessibilitySettings) _then) = _$AccessibilitySettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: HearingPreference.none) HearingPreference hearing
});




}
/// @nodoc
class _$AccessibilitySettingsCopyWithImpl<$Res>
    implements $AccessibilitySettingsCopyWith<$Res> {
  _$AccessibilitySettingsCopyWithImpl(this._self, this._then);

  final AccessibilitySettings _self;
  final $Res Function(AccessibilitySettings) _then;

/// Create a copy of AccessibilitySettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hearing = null,}) {
  return _then(_self.copyWith(
hearing: null == hearing ? _self.hearing : hearing // ignore: cast_nullable_to_non_nullable
as HearingPreference,
  ));
}

}


/// Adds pattern-matching-related methods to [AccessibilitySettings].
extension AccessibilitySettingsPatterns on AccessibilitySettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccessibilitySettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccessibilitySettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccessibilitySettings value)  $default,){
final _that = this;
switch (_that) {
case _AccessibilitySettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccessibilitySettings value)?  $default,){
final _that = this;
switch (_that) {
case _AccessibilitySettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: HearingPreference.none)  HearingPreference hearing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccessibilitySettings() when $default != null:
return $default(_that.hearing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: HearingPreference.none)  HearingPreference hearing)  $default,) {final _that = this;
switch (_that) {
case _AccessibilitySettings():
return $default(_that.hearing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: HearingPreference.none)  HearingPreference hearing)?  $default,) {final _that = this;
switch (_that) {
case _AccessibilitySettings() when $default != null:
return $default(_that.hearing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccessibilitySettings implements AccessibilitySettings {
  const _AccessibilitySettings({@JsonKey(unknownEnumValue: HearingPreference.none) this.hearing = HearingPreference.none});
  factory _AccessibilitySettings.fromJson(Map<String, dynamic> json) => _$AccessibilitySettingsFromJson(json);

@override@JsonKey(unknownEnumValue: HearingPreference.none) final  HearingPreference hearing;

/// Create a copy of AccessibilitySettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccessibilitySettingsCopyWith<_AccessibilitySettings> get copyWith => __$AccessibilitySettingsCopyWithImpl<_AccessibilitySettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccessibilitySettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccessibilitySettings&&(identical(other.hearing, hearing) || other.hearing == hearing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hearing);

@override
String toString() {
  return 'AccessibilitySettings(hearing: $hearing)';
}


}

/// @nodoc
abstract mixin class _$AccessibilitySettingsCopyWith<$Res> implements $AccessibilitySettingsCopyWith<$Res> {
  factory _$AccessibilitySettingsCopyWith(_AccessibilitySettings value, $Res Function(_AccessibilitySettings) _then) = __$AccessibilitySettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: HearingPreference.none) HearingPreference hearing
});




}
/// @nodoc
class __$AccessibilitySettingsCopyWithImpl<$Res>
    implements _$AccessibilitySettingsCopyWith<$Res> {
  __$AccessibilitySettingsCopyWithImpl(this._self, this._then);

  final _AccessibilitySettings _self;
  final $Res Function(_AccessibilitySettings) _then;

/// Create a copy of AccessibilitySettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hearing = null,}) {
  return _then(_AccessibilitySettings(
hearing: null == hearing ? _self.hearing : hearing // ignore: cast_nullable_to_non_nullable
as HearingPreference,
  ));
}


}

// dart format on
