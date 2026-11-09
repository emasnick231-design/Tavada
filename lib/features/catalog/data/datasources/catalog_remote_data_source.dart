import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/features/catalog/domain/entities/discovery.dart';
import 'package:tavada_eats/features/catalog/domain/entities/menu.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant_filter.dart';
import 'package:tavada_eats/features/catalog/domain/entities/review.dart';

/// Endpoints owned by the catalog domain.
abstract final class CatalogEndpoints {
  static const homeFeed = '/home/feed';
  static const restaurants = '/restaurants';
  static const featured = '/restaurants/featured';
  static String restaurant(String id) => '/restaurants/$id';
  static String menu(String id) => '/restaurants/$id/menu';
  static String menuItem(String id, String itemId) =>
      '/restaurants/$id/menu/$itemId';
  static String reviews(String id) => '/restaurants/$id/reviews';
  static const popularItems = '/menu-items/popular';
  static const categories = '/categories';
  static const filters = '/catalog/filters';
  static const search = '/search';
  static const suggestions = '/search/suggestions';
}

/// Talks to the catalog API and parses JSON into entities.
class CatalogRemoteDataSource {
  CatalogRemoteDataSource(this._client);

  final ApiClient _client;

  List<T> _list<T>(Object? json, T Function(Map<String, dynamic>) parse) =>
      (json! as List<dynamic>)
          .map((e) => parse(e as Map<String, dynamic>))
          .toList();

  Future<HomeFeed> fetchHomeFeed() async => HomeFeed.fromJson(
    await _client.get<Map<String, dynamic>>(CatalogEndpoints.homeFeed),
  );

  Future<List<Restaurant>> fetchRestaurants(RestaurantFilter filter) async =>
      _list(
        await _client.get<List<dynamic>>(
          CatalogEndpoints.restaurants,
          query: filter.toQuery(),
        ),
        Restaurant.fromJson,
      );

  Future<List<Restaurant>> fetchFeatured() async => _list(
    await _client.get<List<dynamic>>(CatalogEndpoints.featured),
    Restaurant.fromJson,
  );

  Future<Restaurant> fetchRestaurant(String id) async => Restaurant.fromJson(
    await _client.get<Map<String, dynamic>>(CatalogEndpoints.restaurant(id)),
  );

  Future<List<MenuSection>> fetchMenu(String id) async => _list(
    await _client.get<List<dynamic>>(CatalogEndpoints.menu(id)),
    MenuSection.fromJson,
  );

  Future<MenuItem> fetchMenuItem(String id, String itemId) async =>
      MenuItem.fromJson(
        await _client.get<Map<String, dynamic>>(
          CatalogEndpoints.menuItem(id, itemId),
        ),
      );

  Future<List<MenuItem>> fetchPopularItems({
    String? restaurantId,
    int limit = 8,
  }) async => _list(
    await _client.get<List<dynamic>>(
      CatalogEndpoints.popularItems,
      query: {'restaurant_id': restaurantId, 'limit': limit},
    ),
    MenuItem.fromJson,
  );

  Future<List<Category>> fetchCategories() async => _list(
    await _client.get<List<dynamic>>(CatalogEndpoints.categories),
    Category.fromJson,
  );

  Future<CatalogFilters> fetchFilters() async => CatalogFilters.fromJson(
    await _client.get<Map<String, dynamic>>(CatalogEndpoints.filters),
  );

  Future<ReviewPage> fetchReviews(String id, {int page = 1}) async =>
      ReviewPage.fromJson(
        await _client.get<Map<String, dynamic>>(
          CatalogEndpoints.reviews(id),
          query: {'page': page},
        ),
      );

  Future<SearchResults> search(String query, RestaurantFilter filter) async =>
      SearchResults.fromJson(
        await _client.get<Map<String, dynamic>>(
          CatalogEndpoints.search,
          query: {...filter.toQuery(), 'q': query},
        ),
      );

  Future<List<String>> suggestions(String query) async =>
      (await _client.get<List<dynamic>>(
        CatalogEndpoints.suggestions,
        query: {'q': query},
      )).cast<String>();
}
