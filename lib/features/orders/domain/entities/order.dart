import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/models.dart';
import 'package:tavada_eats/features/cart/domain/entities/cart_item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

/// Lifecycle of an order. The five live steps map to the five segments of
/// the tracking progress bar.
@JsonEnum(fieldRename: FieldRename.snake)
enum OrderStatus {
  placed,
  preparing,
  riderPicked,
  dispatched,
  delivered,
  cancelled;

  /// 1-based step (number of filled progress segments).
  int get step => switch (this) {
    OrderStatus.placed => 1,
    OrderStatus.preparing => 2,
    OrderStatus.riderPicked => 3,
    OrderStatus.dispatched => 4,
    OrderStatus.delivered => 5,
    OrderStatus.cancelled => 0,
  };

  bool get isActive =>
      this != OrderStatus.delivered && this != OrderStatus.cancelled;

  /// The rider card is shown from the moment the rider picks the order.
  bool get hasRider => step >= OrderStatus.riderPicked.step;
}

@JsonEnum(fieldRename: FieldRename.snake)
enum DeliveryMode { delivery, pickup }

@JsonEnum(fieldRename: FieldRename.snake)
enum PaymentMethodType { wallet, card }

/// Timeline milestones shown on the order timeline screen.
@JsonEnum(fieldRename: FieldRename.snake)
enum OrderMilestone {
  confirmed,
  riderAssigned,
  readyForPickup,
  pickedUp,
  arrived,
}

/// Store snapshot captured when the order was placed.
@freezed
abstract class OrderRestaurant with _$OrderRestaurant {
  const factory OrderRestaurant({
    required String id,
    required String name,
    required String logoUrl,
    String? address,
    GeoPoint? location,
  }) = _OrderRestaurant;

  factory OrderRestaurant.fromJson(Map<String, dynamic> json) =>
      _$OrderRestaurantFromJson(json);
}

/// One ordered pack. Keeps the chosen options so "Repeat order" can rebuild
/// the basket exactly.
@freezed
abstract class OrderLine with _$OrderLine {
  const factory OrderLine({
    required String id,
    required String menuItemId,
    required String name,
    required String imageUrl,
    required int quantity,

    /// Dish price before options.
    @MoneyConverter() required Money basePrice,
    @Default([]) List<SelectedOption> options,
    String? note,
  }) = _OrderLine;

  const OrderLine._();

  factory OrderLine.fromJson(Map<String, dynamic> json) =>
      _$OrderLineFromJson(json);

  Money get unitPrice => basePrice + Money.sum(options.map((o) => o.price));

  Money get total => unitPrice * quantity;

  String get optionsSummary => options.map((o) => o.name).join(', ');
}

/// "Send as gift" details.
@freezed
abstract class GiftDetails with _$GiftDetails {
  const factory GiftDetails({
    required String senderName,
    required String recipientName,
    required String recipientPhone,
    String? note,
  }) = _GiftDetails;

  factory GiftDetails.fromJson(Map<String, dynamic> json) =>
      _$GiftDetailsFromJson(json);
}

@freezed
abstract class OrderRider with _$OrderRider {
  const factory OrderRider({
    required String name,
    required String phone,
    String? avatarUrl,
  }) = _OrderRider;

  factory OrderRider.fromJson(Map<String, dynamic> json) =>
      _$OrderRiderFromJson(json);
}

@freezed
abstract class OrderTimelineEntry with _$OrderTimelineEntry {
  const factory OrderTimelineEntry({
    required OrderMilestone milestone,
    required DateTime at,
  }) = _OrderTimelineEntry;

  factory OrderTimelineEntry.fromJson(Map<String, dynamic> json) =>
      _$OrderTimelineEntryFromJson(json);
}

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    required OrderRestaurant restaurant,
    required List<OrderLine> items,
    required OrderStatus status,
    required DateTime placedAt,

    /// Promised arrival time shown on the tracking card.
    required DateTime estimatedArrival,
    @MoneyConverter() required Money subtotal,
    @MoneyConverter() required Money deliveryFee,
    @MoneyConverter() required Money serviceFee,
    @MoneyConverter() required Money total,
    @MoneyConverter() @Default(Money.zero) Money discount,
    @Default(DeliveryMode.delivery) DeliveryMode deliveryMode,
    @Default(PaymentMethodType.wallet) PaymentMethodType paymentMethod,
    DeliveryAddress? address,
    String? instructions,
    GiftDetails? gift,
    @Default(false) bool cutlery,
    OrderRider? rider,
    @Default([]) List<OrderTimelineEntry> timeline,
    DateTime? deliveredAt,
    int? rating,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  int get itemCount => items.fold(0, (sum, i) => sum + i.quantity);

  bool get isActive => status.isActive;

  /// Minutes from placing to arrival ("Your food arrived in just 21mins").
  int get deliveryMinutes {
    final end = deliveredAt ?? estimatedArrival;
    final minutes = end.difference(placedAt).inMinutes;
    return minutes < 1 ? 1 : minutes;
  }
}
