import 'dart:math' as math;

import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_delivery_area.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';

/// Fake backend for the catalog domain.
///
/// Fixtures (assets/mock):
/// * `catalog_restaurants.json` — stores
/// * `catalog_menu.json`        — menu template shared by stores
/// * `catalog_categories.json`, `catalog_cuisines.json`, `catalog_dietary.json`
/// * `catalog_banners.json`, `catalog_home_sections.json`
/// * `catalog_reviews.json`
///
/// Localizable fixture strings are `{ "en": …, "tr": … }` maps resolved from
/// the `Accept-Language` header, exactly like a real API would.
class CatalogMockApi implements MockApi {
  CatalogMockApi(this._db);

  final MockDatabase _db;

  @override
  List<MockRoute> get routes => [
    MockRoute.get('/home/feed', _homeFeed),
    // Order matters: the literal path must win over `/restaurants/:id`.
    MockRoute.get('/restaurants/featured', _featured),
    MockRoute.get('/restaurants', _restaurants),
    MockRoute.get('/restaurants/:id', _restaurant),
    MockRoute.get('/restaurants/:id/menu', _menu),
    MockRoute.get('/restaurants/:id/menu/:itemId', _menuItem),
    MockRoute.get('/restaurants/:id/reviews', _reviews),
    MockRoute.get('/menu-items/popular', _popularItems),
    MockRoute.get('/categories', _categories),
    MockRoute.get('/catalog/filters', _filters),
    MockRoute.get('/search/suggestions', _suggestions),
    MockRoute.get('/search', _search),
  ];

  // ── Helpers ───────────────────────────────────────────────────────────────

  static String _lang(MockRequest r) {
    final header = r.headers['Accept-Language'] ?? r.headers['accept-language'];
    final code = '${header ?? 'en'}'.split(RegExp('[-_,]')).first.toLowerCase();
    return code.isEmpty ? 'en' : code;
  }

  /// Resolves `{ "en": …, "tr": … }` maps recursively for [lang].
  static Object? _localize(Object? value, String lang) {
    if (value is Map<String, dynamic>) {
      final isTranslation =
          value.isNotEmpty &&
          value.keys.every((k) => k.length == 2) &&
          value.containsKey('en');
      if (isTranslation) return value[lang] ?? value['en'];
      return value.map((k, v) => MapEntry(k, _localize(v, lang)));
    }
    if (value is List) return value.map((v) => _localize(v, lang)).toList();
    return value;
  }

  Future<List<Map<String, dynamic>>> _allRestaurants(String lang) async {
    final reviews =
        ((await _db.document('catalog_reviews'))['reviews'] as List?)?.length ??
        0;
    return [
      for (final r
          in (_localize(await _db.collection('catalog_restaurants'), lang)!
                  as List)
              .cast<Map<String, dynamic>>())
        {...r, 'review_count': reviews},
    ];
  }

  /// Stores that deliver to the request's address, with distance / ETA
  /// computed from it (all stores when the app sent no address).
  Future<List<Map<String, dynamic>>> _nearby(MockRequest req) async {
    final from = req.deliveryLocation;
    return [
      for (final r in await _allRestaurants(_lang(req)))
        if (MockDeliveryArea.delivers(r, from))
          MockDeliveryArea.adjust(r, from),
    ];
  }

  Future<Map<String, dynamic>?> _findRestaurant(String id, String lang) async {
    for (final r in await _allRestaurants(lang)) {
      if (r['id'] == id) return r;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> _menuFor(
    Map<String, dynamic> restaurant,
    String lang,
  ) async {
    final template =
        (_localize(await _db.collection('catalog_menu'), lang)! as List)
            .cast<Map<String, dynamic>>();
    final include = (restaurant['menu_sections'] as List?)?.cast<String>();
    // Each store sells its own subset of the template (`menu_items`) and has
    // its own best sellers (`popular_items`), so menus and search rails differ
    // from store to store.
    final sells = (restaurant['menu_items'] as List?)?.cast<String>();
    final popular = (restaurant['popular_items'] as List?)?.cast<String>();
    return [
      for (final section in template)
        if (include == null || include.contains(section['id']))
          {
            'id': section['id'],
            'name': section['name'],
            'items': [
              for (final item
                  in (section['items'] as List).cast<Map<String, dynamic>>())
                if (sells == null || sells.contains(item['id']))
                  {
                    ...item,
                    if (popular != null)
                      'is_popular': popular.contains(item['id']),
                    'restaurant_id': restaurant['id'],
                    'restaurant_name': restaurant['name'],
                    'section_id': section['id'],
                  },
            ],
          },
    ].where((s) => (s['items']! as List).isNotEmpty).toList();
  }

  /// The store's representative dishes: best sellers first (in the store's
  /// own order), then the rest of its menu.
  static List<Map<String, dynamic>> _representative(
    Map<String, dynamic> restaurant,
    List<Map<String, dynamic>> items,
  ) {
    final order = [
      ...?(restaurant['popular_items'] as List?)?.cast<String>(),
      ...?(restaurant['menu_items'] as List?)?.cast<String>(),
    ];
    int rank(Map<String, dynamic> i) {
      final index = order.indexOf(i['id'] as String);
      if (index >= 0) return index;
      return order.length + (i['is_popular'] == true ? 0 : 100);
    }

    return [...items]..sort((a, b) => rank(a).compareTo(rank(b)));
  }

  /// Dish tags that belong to a meal category (search "Breakfast" → dishes
  /// tagged `breakfast` lead the store's rail).
  static const _categoryDishTags = <String, List<String>>{
    'breakfast': ['breakfast'],
    'brunch': ['breakfast', 'snack'],
    'snacks': ['snack'],
    'pastries': ['snack'],
    'drinks': ['drink'],
    'rice_grains': ['rice'],
    'seafood': ['seafood'],
    'soup_stews': ['soup', 'stew', 'swallow'],
    'vegetarian': ['vegetarian', 'vegan'],
    'grilled_bbq': ['grill'],
  };

  static const _stopWords = {
    'food',
    'foods',
    'cuisine',
    'meal',
    'meals',
    'restaurant',
    'restaurants',
    'the',
    'and',
    'yemek',
    'yemekleri',
    'mutfağı',
  };

  static List<String> _tokens(String text) => text
      .toLowerCase()
      .split(RegExp(r'[^\p{L}\p{N}]+', unicode: true))
      .where((t) => t.isNotEmpty && !_stopWords.contains(t))
      .toList();

  static bool _matchesFilter(
    Map<String, dynamic> r,
    MockRequest req, {
    bool ignoreQuery = false,
  }) {
    final category = req.queryString('category');
    if (category != null &&
        !((r['category_ids'] as List?) ?? const []).contains(category)) {
      return false;
    }
    final cuisines = req.queryList('cuisines');
    if (cuisines.isNotEmpty &&
        !cuisines.any(((r['cuisine_ids'] as List?) ?? const []).contains)) {
      return false;
    }
    final dietary = req.queryList('dietary');
    if (dietary.isNotEmpty &&
        !dietary.every(((r['dietary_ids'] as List?) ?? const []).contains)) {
      return false;
    }
    if (req.queryBool('discounts') && r['promo_label'] == null) return false;
    if (req.queryBool('offers') &&
        ((r['offers'] as List?) ?? const []).isEmpty) {
      return false;
    }
    if (req.queryBool('top_rated') && (r['rating'] as num) < 4.5) return false;
    final maxEta = req.queryInt('max_eta');
    if (maxEta != null && (r['eta_minutes'] as num) > maxEta) return false;
    final maxFee = req.queryDouble('max_delivery_fee');
    if (maxFee != null && (r['delivery_fee'] as num) > maxFee) return false;
    final q = ignoreQuery ? null : req.queryString('q')?.toLowerCase();
    if (q != null && q.isNotEmpty) {
      final haystack = [
        r['name'],
        r['cuisine'],
        ...((r['tags'] as List?) ?? const []),
      ].join(' ').toLowerCase();
      if (!haystack.contains(q)) return false;
    }
    return true;
  }

  static List<Map<String, dynamic>> _applySection(
    List<Map<String, dynamic>> all,
    String? section,
  ) {
    final items = [...all];
    switch (section) {
      case 'places_near_you':
        items.sort(
          (a, b) => (a['distance_miles'] as num).compareTo(
            b['distance_miles'] as num,
          ),
        );
        return items.where((r) => r['is_alcohol'] != true).toList();
      case 'featured_stores':
        return items.where((r) => r['is_featured'] == true).toList();
      case 'recently_viewed':
        return items.where((r) => r['recently_viewed'] == true).toList();
      case 'special_discounts':
        return items.where((r) => r['promo_label'] != null).toList();
      case 'under_1_delivery':
        return items.where((r) => (r['delivery_fee'] as num) < 1).toList();
      case 'under_10_minutes':
        return items.where((r) => (r['eta_minutes'] as num) <= 10).toList();
      case 'alcohol_near_you':
        return items.where((r) => r['is_alcohol'] == true).toList();
      default:
        return items;
    }
  }

  // ── Handlers ──────────────────────────────────────────────────────────────

  Future<MockResponse> _homeFeed(MockRequest req) async {
    final lang = _lang(req);
    final restaurants = await _nearby(req);
    final sections =
        (_localize(await _db.collection('catalog_home_sections'), lang)!
                as List)
            .cast<Map<String, dynamic>>();
    return MockResponse.ok({
      'banners': _localize(await _db.collection('catalog_banners'), lang),
      'categories': _localize(await _db.collection('catalog_categories'), lang),
      'sections': [
        for (final s in sections)
          {
            ...s,
            'restaurants': _applySection(
              restaurants,
              s['id'] as String,
            ).take(8).toList(),
          },
      ],
    });
  }

  Future<MockResponse> _restaurants(MockRequest req) async {
    final all = await _nearby(req);
    final scoped = _applySection(all, req.queryString('section'));
    final filtered = scoped.where((r) => _matchesFilter(r, req)).toList();
    if (req.queryBool('top_rated')) {
      filtered.sort(
        (a, b) => (b['rating'] as num).compareTo(a['rating'] as num),
      );
    }
    return MockResponse.ok(filtered, meta: {'total': filtered.length});
  }

  Future<MockResponse> _featured(MockRequest req) async {
    final all = await _nearby(req);
    return MockResponse.ok(all.where((r) => r['is_featured'] == true).toList());
  }

  Future<MockResponse> _restaurant(MockRequest req) async {
    final r = await _findRestaurant(req.param('id')!, _lang(req));
    return r == null
        ? MockResponse.notFound('This store is no longer available.')
        : MockResponse.ok(MockDeliveryArea.adjust(r, req.deliveryLocation));
  }

  Future<MockResponse> _menu(MockRequest req) async {
    final lang = _lang(req);
    final r = await _findRestaurant(req.param('id')!, lang);
    if (r == null) return MockResponse.notFound();
    return MockResponse.ok(await _menuFor(r, lang));
  }

  Future<MockResponse> _menuItem(MockRequest req) async {
    final lang = _lang(req);
    final r = await _findRestaurant(req.param('id')!, lang);
    if (r == null) return MockResponse.notFound();
    for (final section in await _menuFor(r, lang)) {
      for (final item
          in (section['items']! as List).cast<Map<String, dynamic>>()) {
        if (item['id'] == req.param('itemId')) return MockResponse.ok(item);
      }
    }
    return MockResponse.notFound('This dish is no longer available.');
  }

  Future<MockResponse> _reviews(MockRequest req) async {
    final lang = _lang(req);
    final r = await _findRestaurant(req.param('id')!, lang);
    if (r == null) return MockResponse.notFound();
    final doc =
        _localize(await _db.document('catalog_reviews'), lang)!
            as Map<String, dynamic>;
    final all = (doc['reviews'] as List).cast<Map<String, dynamic>>();
    const pageSize = 5;
    final page = req.queryInt('page') ?? 1;
    final start = (page - 1) * pageSize;
    final slice = all.skip(start).take(pageSize).toList();
    return MockResponse.ok({
      'summary': {
        ...(doc['summary'] as Map<String, dynamic>),
        'average': r['rating'],
        'total': r['rating_count'],
        'ai_summary': r['ai_summary'] ?? (doc['summary'] as Map)['ai_summary'],
      },
      'reviews': slice,
      'page': page,
      'has_more': start + pageSize < all.length,
    });
  }

  Future<MockResponse> _popularItems(MockRequest req) async {
    final lang = _lang(req);
    final restaurants = await _nearby(req);
    final id = req.queryString('restaurant_id');
    final limit = req.queryInt('limit') ?? 8;
    final source = id == null
        ? restaurants.where((r) => r['is_alcohol'] != true).take(4)
        : restaurants.where((r) => r['id'] == id);
    final items = <Map<String, dynamic>>[];
    for (final r in source) {
      for (final section in await _menuFor(r, lang)) {
        items.addAll(
          (section['items']! as List).cast<Map<String, dynamic>>().where(
            (i) => i['is_popular'] == true,
          ),
        );
      }
    }
    // De-duplicate by name so rails don't repeat the same dish.
    final seen = <String>{};
    final unique = items
        .where((i) => seen.add(i['name'] as String))
        .take(limit)
        .toList();
    return MockResponse.ok(unique);
  }

  Future<MockResponse> _categories(MockRequest req) async => MockResponse.ok(
    _localize(await _db.collection('catalog_categories'), _lang(req)),
  );

  Future<MockResponse> _filters(MockRequest req) async {
    final lang = _lang(req);
    return MockResponse.ok({
      'cuisines': _localize(await _db.collection('catalog_cuisines'), lang),
      'dietary': _localize(await _db.collection('catalog_dietary'), lang),
      'max_delivery_fee': 10,
    });
  }

  /// Search groups results by store: each hit is a store plus a rail of ITS
  /// OWN dishes — the dishes that match the text first, then the store's
  /// representative dishes (category-relevant ones first) so every rail shows
  /// several distinct dishes.
  ///
  /// A query that names a cuisine or meal category ("Nigerian", "nigerian
  /// food", "Breakfast") describes stores rather than dishes: it matches the
  /// stores of that cuisine/category, and only the remaining words ("jollof"
  /// in "Nigerian jollof") are matched against dishes.
  Future<MockResponse> _search(MockRequest req) async {
    final lang = _lang(req);
    final raw = (req.queryString('q') ?? '').trim();
    final tokens = _tokens(raw);
    final restaurants = await _nearby(req);
    final cuisines =
        (_localize(await _db.collection('catalog_cuisines'), lang)! as List)
            .cast<Map<String, dynamic>>();
    final categories =
        (_localize(await _db.collection('catalog_categories'), lang)! as List)
            .cast<Map<String, dynamic>>();

    // Cuisines / categories the query names (localized name or id alias).
    final consumed = <String>{};
    Set<String> named(List<Map<String, dynamic>> options) {
      final ids = <String>{};
      for (final o in options) {
        for (final alias in [
          '${o['name']}',
          '${o['id']}'.replaceAll('_', ' '),
        ]) {
          final words = _tokens(alias);
          if (words.isNotEmpty && words.every(tokens.contains)) {
            ids.add(o['id'] as String);
            consumed.addAll(words);
          }
        }
      }
      return ids;
    }

    final namedCuisines = named(cuisines);
    final namedCategories = named(categories);
    final dishTokens = tokens.where((t) => !consumed.contains(t)).toList();
    final categoryId =
        req.queryString('category') ?? namedCategories.firstOrNull;
    final relevantTags = _categoryDishTags[categoryId] ?? const <String>[];
    final cuisineNames = {
      for (final c in cuisines) c['id'] as String: '${c['name']}',
    };

    final scored = <(int, Map<String, dynamic>)>[];
    for (final r in restaurants) {
      if (!_matchesFilter(r, req, ignoreQuery: true)) continue;
      final cuisineIds = ((r['cuisine_ids'] as List?) ?? const [])
          .cast<String>();
      final categoryIds = ((r['category_ids'] as List?) ?? const [])
          .cast<String>();
      // "Nigerian jollof" → jollof at Nigerian stores only.
      if (namedCuisines.isNotEmpty && !namedCuisines.any(cuisineIds.contains)) {
        continue;
      }
      final restaurantText = [
        r['name'],
        r['cuisine'],
        ...((r['tags'] as List?) ?? const []),
        for (final id in cuisineIds) cuisineNames[id] ?? id,
      ].join(' ').toLowerCase();
      final describesStore =
          namedCuisines.any(cuisineIds.contains) ||
          namedCategories.any(categoryIds.contains) ||
          (tokens.isNotEmpty && tokens.every(restaurantText.contains));

      final items = [
        for (final section in await _menuFor(r, lang))
          for (final item
              in (section['items']! as List).cast<Map<String, dynamic>>())
            {...item, '_section': section['name']},
      ];
      // Name/tag/section matches are strong; description-only matches are
      // weak and only used when the store itself doesn't match the query,
      // so "Nigerian" doesn't put the same cocktail at the top of every store.
      final strong = <Map<String, dynamic>>[];
      final weak = <Map<String, dynamic>>[];
      if (dishTokens.isNotEmpty) {
        for (final item in items) {
          final title =
              '${item['name']} ${item['_section']} '
                      '${((item['tags'] as List?) ?? const []).join(' ')}'
                  .toLowerCase();
          final full = '$title ${item['description']}'.toLowerCase();
          if (dishTokens.every(title.contains)) {
            strong.add(item);
          } else if (dishTokens.every(full.contains)) {
            weak.add(item);
          }
        }
      }
      final representative = _representative(r, items);
      // Matching dishes in the store's own order (its signature dish first).
      final matched = (describesStore ? strong : [...strong, ...weak])
        ..sort(
          (a, b) =>
              representative.indexOf(a).compareTo(representative.indexOf(b)),
        );

      final include = dishTokens.isEmpty
          ? raw.isEmpty || describesStore
          : matched.isNotEmpty ||
                (describesStore && dishTokens.every(restaurantText.contains));
      if (!include) continue;

      final seen = <String>{};
      final dishes =
          [
                ...matched,
                ...representative.where(
                  (i) => ((i['tags'] as List?) ?? const []).any(
                    relevantTags.contains,
                  ),
                ),
                ...representative,
              ]
              .where((i) => seen.add(i['id'] as String))
              .take(8)
              .map((i) => {...i}..remove('_section'))
              .toList();
      if (dishes.isEmpty) continue;
      final score = matched.length * 10 + (describesStore ? 5 : 0);
      scored.add((score, {'restaurant': r, 'dishes': dishes}));
    }

    scored.sort((a, b) {
      final byScore = b.$1.compareTo(a.$1);
      if (byScore != 0) return byScore;
      return ((b.$2['restaurant']! as Map)['rating'] as num).compareTo(
        (a.$2['restaurant']! as Map)['rating'] as num,
      );
    });
    final hits = scored.map((s) => s.$2).toList();

    return MockResponse.ok({
      'query': raw,
      'hits': hits.take(20).toList(),
      'total': hits.length,
      if (namedCuisines.length == 1) 'cuisine_id': namedCuisines.first,
    });
  }

  Future<MockResponse> _suggestions(MockRequest req) async {
    final lang = _lang(req);
    final q = (req.queryString('q') ?? '').trim().toLowerCase();
    if (q.isEmpty) return MockResponse.ok(const <String>[]);
    final pool = <String>{
      'Nigerian food',
      'Nigerian jollof',
      'Nigerian egusi and semolina',
      'Suya',
      'Puff puff',
      'Pepper soup',
      'Zobo drink',
    };
    for (final c
        in (_localize(await _db.collection('catalog_cuisines'), lang)!
            as List)) {
      pool.add('${(c as Map)['name']}');
    }
    for (final section
        in (_localize(await _db.collection('catalog_menu'), lang)! as List)) {
      for (final item in ((section as Map)['items'] as List)) {
        pool.add('${(item as Map)['name']}');
      }
    }
    final matches = pool.where((s) => s.toLowerCase().contains(q)).toList()
      ..sort((a, b) {
        final ap = a.toLowerCase().startsWith(q) ? 0 : 1;
        final bp = b.toLowerCase().startsWith(q) ? 0 : 1;
        return ap != bp ? ap - bp : a.length - b.length;
      });
    return MockResponse.ok(matches.take(math.min(5, matches.length)).toList());
  }
}
