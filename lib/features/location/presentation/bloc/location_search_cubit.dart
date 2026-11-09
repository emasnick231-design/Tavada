import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/location/domain/entities/place.dart';
import 'package:tavada_eats/features/location/domain/repositories/location_repository.dart';

part 'location_search_cubit.freezed.dart';

@freezed
abstract class LocationSearchState with _$LocationSearchState {
  const factory LocationSearchState({
    @Default('') String query,
    @Default(ViewStatus.initial) ViewStatus status,
    @Default([]) List<Place> results,
    Failure? failure,
  }) = _LocationSearchState;
}

/// Address search-as-you-type.
class LocationSearchCubit extends Cubit<LocationSearchState> {
  LocationSearchCubit(this._repository) : super(const LocationSearchState());

  final LocationRepository _repository;
  Timer? _debounce;
  int _request = 0;

  void queryChanged(String query) {
    final q = query.trim();
    _debounce?.cancel();
    if (q.isEmpty) {
      _request++;
      emit(const LocationSearchState());
      return;
    }
    emit(state.copyWith(query: q, status: ViewStatus.loading));
    _debounce = Timer(
      const Duration(milliseconds: 300),
      () => unawaited(_search(q)),
    );
  }

  Future<void> _search(String query) async {
    final request = ++_request;
    final result = await _repository.search(query);
    if (isClosed || request != _request) return;
    emit(
      result.fold(
        (f) => state.copyWith(status: ViewStatus.failure, failure: f),
        (places) => state.copyWith(
          status: ViewStatus.success,
          results: places,
          failure: null,
        ),
      ),
    );
  }

  void retry() => unawaited(_search(state.query));

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
