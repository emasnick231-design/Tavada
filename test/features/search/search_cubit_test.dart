import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/storage/local_storage.dart';
import 'package:tavada_eats/features/catalog/catalog.dart';
import 'package:tavada_eats/features/search/presentation/bloc/search_cubit.dart';

class _MockCatalogRepository extends Mock implements CatalogRepository {}

void main() {
  late _MockCatalogRepository repository;
  late LocalStorage storage;

  setUpAll(() => registerFallbackValue(const RestaurantFilter()));

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    storage = LocalStorage(await SharedPreferences.getInstance());
    repository = _MockCatalogRepository();
    when(repository.getCategories).thenAnswer(
      (_) async => const Right([
        Category(id: 'breakfast', name: 'Breakfast', imageUrl: ''),
      ]),
    );
    when(repository.getFilters).thenAnswer(
      (_) async => const Right(
        CatalogFilters(
          cuisines: [
            Cuisine(id: 'nigerian', name: 'Nigerian', imageUrl: ''),
            Cuisine(id: 'south_african', name: 'South African', imageUrl: ''),
          ],
        ),
      ),
    );
    when(
      () => repository.search(any(), filter: any(named: 'filter')),
    ).thenAnswer(
      (i) async =>
          Right(SearchResults(query: '${i.positionalArguments.first}')),
    );
  });

  // Client report U3: typing a cuisine selects its tab.
  test('typing a cuisine name selects that cuisine', () async {
    final cubit = SearchCubit(repository, storage);
    await cubit.loadDiscovery();
    await cubit.submit('nigerian food');
    expect(cubit.state.filter.cuisineIds, {'nigerian'});
    verify(
      () => repository.search(
        'nigerian food',
        filter: const RestaurantFilter(cuisineIds: {'nigerian'}),
      ),
    ).called(1);
    await cubit.close();
  });

  // UX review #22: a free-text search drops a hidden category filter.
  test('free text after a category tile drops the category', () async {
    final cubit = SearchCubit(repository, storage);
    await cubit.loadDiscovery();
    await cubit.submit(
      'Breakfast',
      filter: const RestaurantFilter(categoryId: 'breakfast'),
    );
    expect(cubit.state.filter.categoryId, 'breakfast');
    await cubit.submit('jollof');
    expect(cubit.state.filter.categoryId, isNull);
    expect(cubit.state.filter.cuisineIds, isEmpty);
    await cubit.close();
  });
}
