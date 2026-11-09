import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/features/location/domain/entities/place.dart';
import 'package:tavada_eats/features/location/domain/repositories/location_repository.dart';

part 'location_picker_cubit.freezed.dart';

@freezed
abstract class LocationPickerState with _$LocationPickerState {
  const factory LocationPickerState({
    required GeoPoint center,

    /// Address under the pin; `null` while (re)resolving.
    Place? place,
    @Default(false) bool isDragging,
    @Default(false) bool isResolving,

    /// Reverse geocoding failed for [center]: the pin can still be used.
    @Default(false) bool resolveFailed,
  }) = _LocationPickerState;
}

/// Drives the "Choose location" map: reverse-geocodes the pin once the map
/// settles after a drag.
class LocationPickerCubit extends Cubit<LocationPickerState> {
  LocationPickerCubit(
    this._repository, {
    required GeoPoint center,
    Place? place,
  }) : super(LocationPickerState(center: center, place: place)) {
    if (place == null) unawaited(_resolve(center));
  }

  final LocationRepository _repository;
  Timer? _debounce;
  int _request = 0;

  static const _settleDelay = Duration(milliseconds: 450);

  void cameraMoved(GeoPoint center, {required bool byGesture}) {
    if (!byGesture) return;
    emit(
      state.copyWith(center: center, isDragging: true, resolveFailed: false),
    );
    _debounce?.cancel();
    _debounce = Timer(_settleDelay, () {
      emit(state.copyWith(isDragging: false));
      unawaited(_resolve(center));
    });
  }

  /// Moves the pin programmatically (search result, "recenter").
  void moveTo(GeoPoint center, {Place? place}) {
    _debounce?.cancel();
    emit(
      state.copyWith(
        center: center,
        place: place,
        isDragging: false,
        resolveFailed: false,
      ),
    );
    if (place == null) unawaited(_resolve(center));
  }

  /// "Retry" after a failed lookup.
  Future<void> retry() => _resolve(state.center);

  Future<void> _resolve(GeoPoint center) async {
    final request = ++_request;
    emit(state.copyWith(isResolving: true, resolveFailed: false));
    final result = await _repository.reverseGeocode(center);
    if (isClosed || request != _request) return;
    emit(
      state.copyWith(
        isResolving: false,
        place: result.toNullable(),
        resolveFailed: result.isLeft(),
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
