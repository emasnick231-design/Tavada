import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tavada_eats/core/models/delivery_address.dart';
import 'package:tavada_eats/core/models/geo_point.dart';
import 'package:tavada_eats/core/models/user_profile.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/storage/secure_storage.dart';

import '../helpers/helpers.dart';

void main() {
  const address = DeliveryAddress(
    id: 'demo',
    line1: '23, Fredrick Avenue',
    city: 'London',
    location: GeoPoint(latitude: 51.474, longitude: -0.069),
  );

  late SessionCubit cubit;

  setUp(() {
    buildTestHydratedStorage();
    cubit = SessionCubit(SecureStorage(const FlutterSecureStorage()));
  });

  tearDown(() => cubit.close());

  group('restoring the session on launch', () {
    test('a guest starts on the welcome screen again, keeping the address', () {
      final saved = const SessionState(
        hasCompletedWelcome: true,
        address: address,
      ).toJson();

      final restored = cubit.fromJson(saved)!;

      expect(restored.hasCompletedWelcome, isFalse);
      expect(restored.address, address);
    });

    test('a signed-in customer goes straight into the app', () {
      final saved = const SessionState(
        hasCompletedWelcome: true,
        address: address,
        user: UserProfile(
          id: 'u1',
          firstName: 'Vanessa',
          lastName: 'Emas',
          email: 'emasv58@yahoo.com',
        ),
      ).toJson();

      final restored = cubit.fromJson(saved)!;

      expect(restored.hasCompletedWelcome, isTrue);
      expect(restored.isAuthenticated, isTrue);
    });
  });
}
