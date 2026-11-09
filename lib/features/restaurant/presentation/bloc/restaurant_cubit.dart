import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/domain/repositories/catalog_repository.dart';

part 'restaurant_cubit.freezed.dart';

@freezed
abstract class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    @Default(ViewStatus.initial) ViewStatus status,
    Restaurant? restaurant,
    @Default([]) List<MenuSection> menu,
    @Default([]) List<MenuItem> popular,
    Failure? failure,
  }) = _RestaurantState;
}

/// Restaurant details, its menu and the "Popular orders" rail.
class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit(this._repository, this.restaurantId)
    : super(const RestaurantState());

  final CatalogRepository _repository;
  final String restaurantId;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading, failure: null));
    final (restaurant, menu, popular) = await (
      _repository.getRestaurant(restaurantId),
      _repository.getMenu(restaurantId),
      _repository.getPopularItems(restaurantId: restaurantId),
    ).wait;
    if (isClosed) return;
    final failure =
        restaurant.getLeft().toNullable() ?? menu.getLeft().toNullable();
    if (failure != null) {
      emit(state.copyWith(status: ViewStatus.failure, failure: failure));
      return;
    }
    emit(
      state.copyWith(
        status: ViewStatus.success,
        restaurant: restaurant.toNullable(),
        menu: menu.getOrElse((_) => const []),
        popular: popular.getOrElse((_) => const []),
      ),
    );
  }
}
