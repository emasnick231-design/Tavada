import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/features/location/domain/entities/place.dart';
import 'package:tavada_eats/features/location/domain/repositories/location_repository.dart';
import 'package:tavada_eats/features/location/presentation/bloc/location_picker_cubit.dart';

class _MockLocationRepository extends Mock implements LocationRepository {}

void main() {
  const center = GeoPoint(latitude: 51.47, longitude: -0.07);
  setUpAll(() => registerFallbackValue(center));

  // UX review #15: a failed reverse-geocode used to leave the card on
  // "Finding address…" with the button disabled forever.
  test('a failed lookup is reported and can be retried', () async {
    final repository = _MockLocationRepository();
    when(() => repository.reverseGeocode(any())).thenAnswer(
      (_) async => const Left(NetworkFailure()),
    );
    final cubit = LocationPickerCubit(repository, center: center);
    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.isResolving, isFalse);
    expect(cubit.state.resolveFailed, isTrue);

    const place = Place(id: 'p', title: '23, Fredrick Avenue', location: center);
    when(
      () => repository.reverseGeocode(any()),
    ).thenAnswer((_) async => const Right(place));
    await cubit.retry();
    expect(cubit.state.resolveFailed, isFalse);
    expect(cubit.state.place, place);
    await cubit.close();
  });
}
