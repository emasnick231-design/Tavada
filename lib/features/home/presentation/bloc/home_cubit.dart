import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/catalog/domain/entities/discovery.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant.dart';
import 'package:tavada_eats/features/catalog/domain/entities/restaurant_filter.dart';
import 'package:tavada_eats/features/catalog/domain/repositories/catalog_repository.dart';

part 'home_cubit.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(ViewStatus.initial) ViewStatus status,
    @Default(HomeFeed()) HomeFeed feed,
    Failure? failure,

    /// Options for the cuisine / dietary / delivery fee sheets.
    @Default(CatalogFilters()) CatalogFilters filterOptions,

    /// Shows the filter chip row under the search bar.
    @Default(false) bool showFilters,
    @Default(RestaurantFilter()) RestaurantFilter filter,
    @Default(ViewStatus.initial) ViewStatus resultsStatus,
    @Default([]) List<Restaurant> results,
    Failure? resultsFailure,
  }) = _HomeState;

  const HomeState._();

  /// Filtered list replaces the curated sections.
  bool get isFiltering => filter.isActive;
}

/// Home feed (banners, categories, curated rails) + quick filters.
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(const HomeState());

  final CatalogRepository _repository;
  int _resultsRequest = 0;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading, failure: null));
    final (feed, options) = await (
      _repository.getHomeFeed(),
      _repository.getFilters(),
    ).wait;
    if (isClosed) return;
    emit(
      feed.fold(
        (f) => state.copyWith(status: ViewStatus.failure, failure: f),
        (feed) => state.copyWith(
          status: ViewStatus.success,
          feed: feed,
          filterOptions: options.getOrElse((_) => state.filterOptions),
        ),
      ),
    );
    if (state.isFiltering) await _loadResults();
  }

  void toggleFilters() => emit(state.copyWith(showFilters: !state.showFilters));

  void setFilter(RestaurantFilter filter) {
    emit(state.copyWith(filter: filter));
    unawaited(_loadResults());
  }

  void toggleCategory(String id) => setFilter(
    state.filter.copyWith(
      categoryId: state.filter.categoryId == id ? null : id,
    ),
  );

  void resetFilter() {
    _resultsRequest++;
    emit(
      state.copyWith(
        filter: const RestaurantFilter(),
        results: const [],
        resultsStatus: ViewStatus.initial,
      ),
    );
  }

  Future<void> _loadResults() async {
    if (!state.isFiltering) return resetFilter();
    final request = ++_resultsRequest;
    emit(state.copyWith(resultsStatus: ViewStatus.loading));
    final result = await _repository.getRestaurants(filter: state.filter);
    if (isClosed || request != _resultsRequest) return;
    emit(
      result.fold(
        (f) => state.copyWith(
          resultsStatus: ViewStatus.failure,
          resultsFailure: f,
        ),
        (list) => state.copyWith(
          resultsStatus: ViewStatus.success,
          results: list,
          resultsFailure: null,
        ),
      ),
    );
  }

  Future<void> retryResults() => _loadResults();
}
