import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/catalog/data/datasources/catalog_remote_data_source.dart';
import 'package:tavada_eats/features/catalog/domain/entities/discovery.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant_filter.dart';
import 'package:tavada_eats/features/catalog/domain/entities/review.dart';
import 'package:tavada_eats/features/catalog/domain/repositories/catalog_repository.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl(this._remote);

  final CatalogRemoteDataSource _remote;

  /// Restaurants rarely change during a session; cache detail lookups so
  /// navigating card → details is instant (the hero image already flew in).
  final Map<String, Restaurant> _restaurantCache = {};

  void _remember(Iterable<Restaurant> items) {
    for (final r in items) {
      _restaurantCache[r.id] = r;
    }
  }

  @override
  FutureResult<HomeFeed> getHomeFeed() => guard(() async {
    final feed = await _remote.fetchHomeFeed();
    for (final s in feed.sections) {
      _remember(s.restaurants);
    }
    return feed;
  });

  @override
  FutureResult<List<Restaurant>> getRestaurants({
    RestaurantFilter filter = const RestaurantFilter(),
  }) => guard(() async {
    final items = await _remote.fetchRestaurants(filter);
    _remember(items);
    return items;
  });

  @override
  FutureResult<List<Restaurant>> getFeaturedStores() => guard(() async {
    final items = await _remote.fetchFeatured();
    _remember(items);
    return items;
  });

  @override
  FutureResult<Restaurant> getRestaurant(String id) => guard(() async {
    final restaurant = await _remote.fetchRestaurant(id);
    _restaurantCache[id] = restaurant;
    return restaurant;
  });

  /// Synchronous peek used to paint headers immediately while the full
  /// record loads.
  Restaurant? cachedRestaurant(String id) => _restaurantCache[id];

  @override
  FutureResult<List<MenuSection>> getMenu(String restaurantId) =>
      guard(() => _remote.fetchMenu(restaurantId));

  @override
  FutureResult<MenuItem> getMenuItem({
    required String restaurantId,
    required String itemId,
  }) => guard(() => _remote.fetchMenuItem(restaurantId, itemId));

  @override
  FutureResult<List<MenuItem>> getPopularItems({
    String? restaurantId,
    int limit = 8,
  }) => guard(
    () => _remote.fetchPopularItems(restaurantId: restaurantId, limit: limit),
  );

  @override
  FutureResult<List<Category>> getCategories() =>
      guard(_remote.fetchCategories);

  @override
  FutureResult<CatalogFilters> getFilters() => guard(_remote.fetchFilters);

  @override
  FutureResult<ReviewPage> getReviews(String restaurantId, {int page = 1}) =>
      guard(() => _remote.fetchReviews(restaurantId, page: page));

  @override
  FutureResult<SearchResults> search(
    String query, {
    RestaurantFilter filter = const RestaurantFilter(),
  }) => guard(() async {
    final results = await _remote.search(query, filter);
    _remember(results.hits.map((h) => h.restaurant));
    return results;
  });

  @override
  FutureResult<List<String>> searchSuggestions(String query) =>
      guard(() => _remote.suggestions(query));
}
