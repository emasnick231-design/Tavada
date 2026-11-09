import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/core/network/mock/mock_api_interceptor.dart';
import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/catalog/catalog.dart';
import 'package:tavada_eats/features/catalog/data/datasources/catalog_remote_data_source.dart';
import 'package:tavada_eats/features/catalog/data/mock/catalog_mock_api.dart';
import 'package:tavada_eats/features/catalog/data/repositories/catalog_repository_impl.dart';

import '../../helpers/helpers.dart';

/// Wires the real repository → ApiClient → Dio → MockServer → fixtures chain,
/// so fixture/entity mismatches fail here instead of at runtime.
Future<CatalogRepository> buildRepository({
  String language = 'en',
  String? deliveryLocation,
}) async {
  SharedPreferences.setMockInitialValues({});
  final db = MockDatabase(
    bundle: rootBundle,
    prefs: await SharedPreferences.getInstance(),
  );
  final server = MockServer(FlavorConfig.prod())..addApi(CatalogMockApi(db));
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.test/v1',
      headers: {
        'Accept-Language': language,
        'X-Delivery-Location': ?deliveryLocation,
      },
    ),
  )..interceptors.add(MockApiInterceptor(server));
  return CatalogRepositoryImpl(CatalogRemoteDataSource(ApiClient(dio)));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('home feed parses banners, categories and populated sections', () async {
    final repo = await buildRepository();
    final feed = (await repo.getHomeFeed()).requireValue;
    expect(feed.banners, isNotEmpty);
    expect(feed.categories, hasLength(12));
    final places = feed.sections.firstWhere((s) => s.id == 'places_near_you');
    expect(places.restaurants, isNotEmpty);
    expect(
      feed.sections.firstWhere((s) => s.id == 'featured_stores').layout,
      HomeSectionLayout.storeGrid,
    );
  });

  test('a far-away address (Lagos) still sees every demo store', () async {
    final london = (await (await buildRepository()).getHomeFeed()).requireValue;
    final lagos = (await (await buildRepository(
      deliveryLocation: '6.4474,3.4723',
    )).getHomeFeed()).requireValue;
    List<String> ids(HomeFeed f) => [
      for (final s in f.sections) ...s.restaurants.map((r) => r.id),
    ];
    expect(ids(lagos), isNotEmpty);
    expect(ids(lagos), ids(london));
    // Design distances / ETAs are kept instead of thousands of miles.
    final places = lagos.sections.firstWhere((s) => s.id == 'places_near_you');
    expect(places.restaurants.every((r) => r.distanceMiles < 10), isTrue);
  });

  test('filters restaurants (discounts + top rated)', () async {
    final repo = await buildRepository();
    final result = await repo.getRestaurants(
      filter: const RestaurantFilter(discountsOnly: true, topRated: true),
    );
    final list = result.requireValue;
    expect(list, isNotEmpty);
    expect(list.every((r) => r.promoLabel != null && r.rating >= 4.5), isTrue);
  });

  test('restaurant, menu with option groups and menu item', () async {
    final repo = await buildRepository();
    final restaurant = (await repo.getRestaurant('mide-lagos')).requireValue;
    expect(restaurant.offers.first.type, OfferType.freeDelivery);
    final menu = (await repo.getMenu('mide-lagos')).requireValue;
    expect(menu.length, 6);
    final item = (await repo.getMenuItem(
      restaurantId: 'mide-lagos',
      itemId: 'jollof-haven',
    )).requireValue;
    expect(item.hasDiscount, isTrue);
    expect(item.optionGroups.first.isRequired, isTrue);
  });

  test('search groups matching dishes by restaurant', () async {
    final repo = await buildRepository();
    final results = (await repo.search('suya')).requireValue;
    expect(results.hits, isNotEmpty);
    expect(results.hits.first.dishes, isNotEmpty);
    final suggestions = (await repo.searchSuggestions('nigeri')).requireValue;
    expect(suggestions.first.toLowerCase(), startsWith('nigeri'));
  });

  group('search (client report U3)', () {
    test(
      'a cuisine query lists stores with rails of their own dishes',
      () async {
        final repo = await buildRepository();
        final results = (await repo.search('Nigerian')).requireValue;
        expect(results.cuisineId, 'nigerian');
        expect(results.hits.length, greaterThan(3));
        for (final hit in results.hits) {
          expect(hit.restaurant.cuisineIds, contains('nigerian'));
          expect(
            hit.dishes.length,
            greaterThanOrEqualTo(2),
            reason: hit.restaurant.name,
          );
          expect(
            hit.dishes.every((d) => d.restaurantId == hit.restaurant.id),
            isTrue,
          );
          expect(
            hit.dishes.map((d) => d.id).toSet(),
            hasLength(hit.dishes.length),
          );
        }
        final food = results.hits.where((h) => !h.restaurant.isAlcohol);
        expect(food.every((h) => h.dishes.length >= 3), isTrue);
        // Stores don't all lead with the same dish (was "Chapman classic").
        final leads = results.hits.map((h) => h.dishes.first.id).toSet();
        expect(leads.length, greaterThan(results.hits.length ~/ 2));
        expect(results.hits.first.dishes.first.id, isNot('chapman'));
      },
    );

    test('menus differ per store', () async {
      final repo = await buildRepository();
      final suya = (await repo.getMenu('suya-palace')).requireValue;
      final papa = (await repo.getMenu('papa-johns')).requireValue;
      Set<String> ids(List<MenuSection> m) => {
        for (final s in m) ...s.items.map((i) => i.id),
      };
      expect(ids(suya), contains('garnished-beef-suya'));
      expect(ids(papa), isNot(contains('garnished-beef-suya')));
    });

    test('dish text puts the matching dishes first', () async {
      final repo = await buildRepository();
      final results = (await repo.search('jollof')).requireValue;
      expect(results.hits, isNotEmpty);
      for (final hit in results.hits) {
        expect(hit.dishes.first.name.toLowerCase(), contains('jollof'));
      }
    });

    test('a meal category query leads with relevant dishes', () async {
      final repo = await buildRepository();
      final results = (await repo.search('Breakfast')).requireValue;
      expect(results.hits, isNotEmpty);
      for (final hit in results.hits) {
        expect(hit.restaurant.categoryIds, contains('breakfast'));
      }
      expect(results.hits.first.dishes.first.tags, contains('breakfast'));
    });

    test('"Nigerian jollof" = jollof at Nigerian stores', () async {
      final repo = await buildRepository();
      final results = (await repo.search('Nigerian jollof')).requireValue;
      expect(results.hits, isNotEmpty);
      for (final hit in results.hits) {
        expect(hit.restaurant.cuisineIds, contains('nigerian'));
        expect(hit.dishes.first.name.toLowerCase(), contains('jollof'));
      }
    });
  });

  test('reviews paginate and localization follows Accept-Language', () async {
    final repo = await buildRepository(language: 'tr');
    final page = (await repo.getReviews('mide-lagos')).requireValue;
    expect(page.reviews, hasLength(5));
    expect(page.hasMore, isTrue);
    final categories = (await repo.getCategories()).requireValue;
    expect(categories.first.name, 'Kahvaltı');
  });

  test('unknown restaurant surfaces a NotFound failure', () async {
    final repo = await buildRepository();
    final result = await repo.getRestaurant('nope');
    expect(result.isLeft(), isTrue);
  });
}
