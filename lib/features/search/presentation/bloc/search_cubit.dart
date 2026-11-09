import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/storage/local_storage.dart';
import 'package:tavada_eats/features/catalog/domain/entities/discovery.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant_filter.dart';
import 'package:tavada_eats/features/catalog/domain/repositories/catalog_repository.dart';

part 'search_cubit.freezed.dart';

/// idle: recent searches + discovery · typing: suggestions · results.
enum SearchPhase { idle, typing, results }

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchPhase.idle) SearchPhase phase,
    @Default('') String query,
    @Default([]) List<String> recent,
    @Default([]) List<String> suggestions,
    @Default([]) List<Category> categories,
    @Default(CatalogFilters()) CatalogFilters options,
    @Default(RestaurantFilter()) RestaurantFilter filter,
    @Default(ViewStatus.initial) ViewStatus status,
    SearchResults? results,
    Failure? failure,
  }) = _SearchState;
}

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._repository, this._storage)
    : super(
        SearchState(recent: _storage.getStringList(StorageKeys.recentSearches)),
      );

  final CatalogRepository _repository;
  final LocalStorage _storage;
  Timer? _debounce;
  int _request = 0;
  Future<void>? _discovery;

  static const _maxRecent = 8;

  Future<void> loadDiscovery() => _discovery ??= _loadDiscovery();

  Future<void> _loadDiscovery() async {
    final (categories, options) = await (
      _repository.getCategories(),
      _repository.getFilters(),
    ).wait;
    if (isClosed) return;
    emit(
      state.copyWith(
        categories: categories.getOrElse((_) => const []),
        options: options.getOrElse((_) => const CatalogFilters()),
      ),
    );
  }

  void queryChanged(String value) {
    final q = value.trim();
    _debounce?.cancel();
    if (q.isEmpty) {
      _request++;
      emit(
        state.copyWith(
          phase: SearchPhase.idle,
          query: '',
          suggestions: const [],
        ),
      );
      return;
    }
    emit(state.copyWith(phase: SearchPhase.typing, query: q));
    _debounce = Timer(const Duration(milliseconds: 250), () async {
      final request = ++_request;
      final result = await _repository.searchSuggestions(q);
      if (isClosed || request != _request) return;
      emit(state.copyWith(suggestions: result.getOrElse((_) => const [])));
    });
  }

  /// Runs the full search and remembers the query.
  ///
  /// A free-text search (no [filter]) drops the hidden category of a previous
  /// category-tile search and, when the text names a cuisine ("Nigerian",
  /// "nigerian food"), selects that cuisine's tab.
  Future<void> submit(String value, {RestaurantFilter? filter}) async {
    final q = value.trim();
    if (q.isEmpty) return;
    _debounce?.cancel();
    final recent = [
      q,
      ...state.recent.where((r) => r != q),
    ].take(_maxRecent);
    unawaited(_storage.setStringList(StorageKeys.recentSearches, [...recent]));
    var next = filter;
    if (next == null) {
      // Show the results phase immediately; cuisines may still be loading.
      emit(
        state.copyWith(
          phase: SearchPhase.results,
          query: q,
          status: ViewStatus.loading,
        ),
      );
      await (_discovery ?? Future<void>.value());
      if (isClosed) return;
      final cuisine = _cuisineNamedBy(q);
      next = state.filter.copyWith(
        categoryId: null,
        cuisineIds: cuisine != null ? {cuisine} : state.filter.cuisineIds,
      );
    }
    emit(
      state.copyWith(
        phase: SearchPhase.results,
        query: q,
        recent: [...recent],
        filter: next,
      ),
    );
    await _search(adoptCuisine: filter == null);
  }

  /// The cuisine whose name (or id) the query contains, e.g. "Nigerian food".
  String? _cuisineNamedBy(String query) {
    final words = _words(query);
    for (final c in state.options.cuisines) {
      for (final alias in [c.name, c.id.replaceAll('_', ' ')]) {
        final aliasWords = _words(alias);
        if (aliasWords.isNotEmpty && aliasWords.every(words.contains)) {
          return c.id;
        }
      }
    }
    return null;
  }

  static Set<String> _words(String text) => text
      .toLowerCase()
      .split(RegExp(r'[^\p{L}\p{N}]+', unicode: true))
      .where((w) => w.isNotEmpty)
      .toSet();

  void setFilter(RestaurantFilter filter) {
    emit(state.copyWith(filter: filter));
    unawaited(_search());
  }

  Future<void> retry() => _search();

  Future<void> _search({bool adoptCuisine = false}) async {
    final request = ++_request;
    emit(state.copyWith(status: ViewStatus.loading, failure: null));
    final result = await _repository.search(state.query, filter: state.filter);
    if (isClosed || request != _request) return;
    emit(
      result.fold(
        (f) => state.copyWith(status: ViewStatus.failure, failure: f),
        (r) => state.copyWith(
          status: ViewStatus.success,
          results: r,
          // The server recognised a cuisine the client couldn't (cuisines
          // not loaded yet): select its tab so the chips match the results.
          filter:
              adoptCuisine &&
                  state.filter.cuisineIds.isEmpty &&
                  r.cuisineId != null
              ? state.filter.copyWith(cuisineIds: {r.cuisineId!})
              : state.filter,
        ),
      ),
    );
  }

  void clearRecent() {
    unawaited(_storage.setStringList(StorageKeys.recentSearches, const []));
    emit(state.copyWith(recent: const []));
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
