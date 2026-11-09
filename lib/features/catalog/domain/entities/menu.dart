import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/money.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

/// A menu category with its dishes ("Starters & Small Chops").
@freezed
abstract class MenuSection with _$MenuSection {
  const factory MenuSection({
    required String id,
    required String name,
    @Default([]) List<MenuItem> items,
  }) = _MenuSection;

  factory MenuSection.fromJson(Map<String, dynamic> json) =>
      _$MenuSectionFromJson(json);
}

/// A dish/product.
@freezed
abstract class MenuItem with _$MenuItem {
  const factory MenuItem({
    required String id,
    required String restaurantId,
    required String name,
    required String description,
    @MoneyConverter() required Money price,
    required String imageUrl,
    @NullableMoneyConverter() Money? originalPrice,
    String? sectionId,
    @Default(false) bool isPopular,
    @Default([]) List<String> tags,
    @Default([]) List<OptionGroup> optionGroups,

    /// Denormalised for rails that show the store name (search, upsells).
    String? restaurantName,
  }) = _MenuItem;

  const MenuItem._();

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  /// Rounded discount percentage ("10% off").
  int get discountPercent => hasDiscount
      ? (((originalPrice!.minor - price.minor) / originalPrice!.minor) * 100)
            .round()
      : 0;

  bool get hasRequiredOptions => optionGroups.any((g) => g.isRequired);

  String get heroTag => 'menu-item-$restaurantId-$id';
}

/// "Spice Level (Required)", "Choose Your Protein", "Add Extra Sides".
@freezed
abstract class OptionGroup with _$OptionGroup {
  const factory OptionGroup({
    required String id,
    required String title,
    @Default([]) List<MenuOption> options,
    @Default(false) bool isRequired,
    @Default(0) int minSelect,
    @Default(1) int maxSelect,
  }) = _OptionGroup;

  const OptionGroup._();

  factory OptionGroup.fromJson(Map<String, dynamic> json) =>
      _$OptionGroupFromJson(json);

  bool get isSingleChoice => maxSelect == 1;
}

@freezed
abstract class MenuOption with _$MenuOption {
  const factory MenuOption({
    required String id,
    required String name,
    @MoneyConverter() @Default(Money.zero) Money price,
  }) = _MenuOption;

  factory MenuOption.fromJson(Map<String, dynamic> json) =>
      _$MenuOptionFromJson(json);
}
