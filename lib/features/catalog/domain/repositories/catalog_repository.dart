import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/catalog/domain/entities/discovery.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant_filter.dart';
import 'package:tavada_eats/features/catalog/domain/entities/review.dart';

/// Read-only marketplace data shared by Home, Search, Stores, Restaurant and
/// Orders ("Continue shopping").
abstract interface class CatalogRepository {
  FutureResult<HomeFeed> getHomeFeed();

  FutureResult<List<Restaurant>> getRestaurants({
    RestaurantFilter filter = const RestaurantFilter(),
  });

  FutureResult<List<Restaurant>> getFeaturedStores();

  FutureResult<Restaurant> getRestaurant(String id);

  FutureResult<List<MenuSection>> getMenu(String restaurantId);

  FutureResult<MenuItem> getMenuItem({
    required String restaurantId,
    required String itemId,
  });

  /// Popular dishes across stores (upsell rails).
  FutureResult<List<MenuItem>> getPopularItems({
    String? restaurantId,
    int limit = 8,
  });

  FutureResult<List<Category>> getCategories();

  FutureResult<CatalogFilters> getFilters();

  FutureResult<ReviewPage> getReviews(String restaurantId, {int page = 1});

  FutureResult<SearchResults> search(
    String query, {
    RestaurantFilter filter = const RestaurantFilter(),
  });

  FutureResult<List<String>> searchSuggestions(String query);
}
