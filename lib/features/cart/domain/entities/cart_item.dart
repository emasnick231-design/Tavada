import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/money.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

/// An option chosen for a dish ("Spice Level: Classic (Medium)").
@freezed
abstract class SelectedOption with _$SelectedOption {
  const factory SelectedOption({
    required String groupId,
    required String groupTitle,
    required String optionId,
    required String name,
    @MoneyConverter() @Default(Money.zero) Money price,
  }) = _SelectedOption;

  factory SelectedOption.fromJson(Map<String, dynamic> json) =>
      _$SelectedOptionFromJson(json);
}

/// A basket line — rendered as a "Pack" on the checkout screen.
@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    /// Unique line id (uuid).
    required String id,
    required String restaurantId,
    required String menuItemId,
    required String name,
    required String imageUrl,

    /// Base dish price, excluding options.
    @MoneyConverter() required Money basePrice,
    @Default(1) int quantity,
    @Default([]) List<SelectedOption> options,
    String? note,
  }) = _CartItem;

  const CartItem._();

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Money get optionsTotal => Money.sum(options.map((o) => o.price));

  /// Price of one unit including options.
  Money get unitPrice => basePrice + optionsTotal;

  Money get total => unitPrice * quantity;

  /// "Grilled Quarter Chicken, Classic (Medium), Portion of Plantain"
  String get optionsSummary => options.map((o) => o.name).join(', ');

  /// Two lines are "the same" when dish, options and note match — adding the
  /// same configuration again bumps quantity instead of adding a new pack.
  bool sameConfigurationAs(CartItem other) =>
      menuItemId == other.menuItemId &&
      note == other.note &&
      const SetEquality<String>().equals(
        options.map((o) => '${o.groupId}:${o.optionId}').toSet(),
        other.options.map((o) => '${o.groupId}:${o.optionId}').toSet(),
      );
}

/// All lines for one store.
@freezed
abstract class StoreCart with _$StoreCart {
  const factory StoreCart({
    required String restaurantId,
    required String restaurantName,
    required String restaurantLogoUrl,
    required DateTime updatedAt,
    @Default([]) List<CartItem> items,
  }) = _StoreCart;

  const StoreCart._();

  factory StoreCart.fromJson(Map<String, dynamic> json) =>
      _$StoreCartFromJson(json);

  int get itemCount => items.fold(0, (sum, i) => sum + i.quantity);

  Money get subtotal => Money.sum(items.map((i) => i.total));

  bool get isEmpty => items.isEmpty;
}

/// Lightweight store info passed when adding the first item of a store.
@freezed
abstract class CartStoreInfo with _$CartStoreInfo {
  const factory CartStoreInfo({
    required String id,
    required String name,
    required String logoUrl,
  }) = _CartStoreInfo;
}
