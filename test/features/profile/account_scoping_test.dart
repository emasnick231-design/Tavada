import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tavada_eats/app/flavor/flavor_config.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/core/network/mock/mock_api_interceptor.dart';
import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:tavada_eats/features/auth/data/mock/auth_mock_api.dart';
import 'package:tavada_eats/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';
import 'package:tavada_eats/features/checkout/data/checkout_mock_api.dart';
import 'package:tavada_eats/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:tavada_eats/features/orders/data/mock/orders_mock_api.dart';
import 'package:tavada_eats/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/features/orders/domain/entities/place_order_request.dart';
import 'package:tavada_eats/features/orders/domain/repositories/orders_repository.dart';
import 'package:tavada_eats/features/profile/data/datasources/profile_remote_data_sources.dart';
import 'package:tavada_eats/features/profile/data/mock/profile_mock_api.dart';
import 'package:tavada_eats/features/profile/data/repositories/profile_repositories_impl.dart';

import '../../helpers/helpers.dart';

/// Real repositories → ApiClient → MockServer, with a switchable session
/// token, to check that account data is per user (UX review #7–#14).
class _Backend {
  _Backend._(this.auth, this.wallet, this.settings, this.orders);

  static String? token;

  static Future<_Backend> create() async {
    SharedPreferences.setMockInitialValues({});
    token = null;
    final db = MockDatabase(
      bundle: rootBundle,
      prefs: await SharedPreferences.getInstance(),
    );
    final server = MockServer(FlavorConfig.prod())
      ..addApi(AuthMockApi(db))
      ..addApi(ProfileMockApi(db))
      ..addApi(OrdersMockApi(db))
      ..addApi(CheckoutMockApi(db));
    final dio = Dio(BaseOptions(baseUrl: 'https://api.test/v1'))
      ..interceptors.addAll([
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            handler.next(options);
          },
        ),
        MockApiInterceptor(server),
      ]);
    final client = ApiClient(dio);
    return _Backend._(
      AuthRepositoryImpl(AuthRemoteDataSource(client)),
      WalletRepositoryImpl(WalletRemoteDataSource(client)),
      AccountSettingsRepositoryImpl(AccountSettingsRemoteDataSource(client)),
      OrdersRepositoryImpl(OrdersRemoteDataSource(client)),
    );
  }

  final AuthRepository auth;
  final WalletRepositoryImpl wallet;
  final AccountSettingsRepositoryImpl settings;
  final OrdersRepository orders;

  Future<void> login(String email, String password) async {
    final session = (await auth.loginWithEmail(
      email: email,
      password: password,
    )).requireValue;
    token = session.accessToken;
  }

  Future<void> signUp(String email) async {
    final session = (await auth.signUp(
      email: email,
      phone: '+447700900999',
      password: 'Secret123',
      code: AuthMockApi.validCode,
      firstName: 'Ada',
      lastName: 'Obi',
    )).requireValue;
    expect(session.user.firstName, 'Ada');
    expect(session.user.lastName, 'Obi');
    token = session.accessToken;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('guests get no orders or wallet', () async {
    final backend = await _Backend.create();
    final orders = await backend.orders.getOrders(OrderListType.completed);
    expect(orders.isLeft(), isTrue);
    final wallet = await backend.wallet.getOverview();
    expect(wallet.fold((f) => f, (_) => null), isA<UnauthorizedFailure>());
  });

  test('a new account has its own empty wallet, rewards and orders', () async {
    final backend = await _Backend.create();
    await backend.signUp('ada@mail.com');
    final overview = (await backend.wallet.getOverview()).requireValue;
    expect(overview.walletBalance, Money.zero);
    expect(overview.rewards.points, 0);
    expect(overview.rewards.referralCode, isNot('TAVADA-VANESSA'));
    expect(overview.rewards.referralCode, startsWith('TAVADA-ADA'));
    final orders = (await backend.orders.getOrders(
      OrderListType.completed,
    )).requireValue;
    expect(orders, isEmpty);

    // The demo customer still has hers.
    await backend.login('emasnick231@gmail.com', 'Password1!');
    final vanessa = (await backend.orders.getOrders(
      OrderListType.completed,
    )).requireValue;
    expect(vanessa, isNotEmpty);
  });

  test('change password needs the current one and really changes it', () async {
    final backend = await _Backend.create();
    await backend.login('emasnick231@gmail.com', 'Password1!');
    final wrong = await backend.settings.changePassword(
      currentPassword: 'nope',
      newPassword: 'Brandnew9!',
    );
    expect(
      wrong.fold((f) => (f as ValidationFailure).code, (_) => null),
      'wrong_password',
    );
    final ok = await backend.settings.changePassword(
      currentPassword: 'Password1!',
      newPassword: 'Brandnew9!',
    );
    expect(ok.isRight(), isTrue);
    final old = await backend.auth.loginWithEmail(
      email: 'emasnick231@gmail.com',
      password: 'Password1!',
    );
    expect(old.isLeft(), isTrue);
    await backend.login('emasnick231@gmail.com', 'Brandnew9!');
  });

  test('phone changes only with a code and then works for login', () async {
    final backend = await _Backend.create();
    await backend.login('emasnick231@gmail.com', 'Password1!');
    // Tunde's number belongs to another account.
    final taken = await backend.settings.requestPhoneCode('+2348031234567');
    expect(taken.isLeft(), isTrue);
    expect(
      (await backend.settings.requestPhoneCode('+447700900555')).isRight(),
      isTrue,
    );
    final badCode = await backend.settings.updatePhone(
      phone: '+447700900555',
      code: '0000',
    );
    expect(badCode.isLeft(), isTrue);
    final user = (await backend.settings.updatePhone(
      phone: '+447700900555',
      code: AuthMockApi.validCode,
    )).requireValue;
    expect(user.phone, '+447700900555');
    expect(
      (await backend.auth.requestPhoneLogin('+447700900555')).isRight(),
      isTrue,
    );
  });

  test('orders earn 10 points per £1 and delete removes the account', () async {
    final backend = await _Backend.create();
    await backend.login('emasnick231@gmail.com', 'Password1!');
    final before = (await backend.wallet.getOverview()).requireValue;
    final order = (await backend.orders.placeOrder(
      const PlaceOrderRequest(
        restaurantId: 'mide-lagos',
        deliveryMode: DeliveryMode.pickup,
        items: [
          OrderLine(
            id: 'l1',
            menuItemId: 'jollof-haven',
            name: 'Jollof haven',
            imageUrl: '',
            quantity: 1,
            basePrice: Money(2000),
          ),
        ],
      ),
    )).requireValue;
    final after = (await backend.wallet.getOverview()).requireValue;
    expect(
      after.rewards.points - before.rewards.points,
      (order.total.major * 10).floor(),
    );

    await backend.signUp('gone@mail.com');
    expect((await backend.settings.deleteAccount()).isRight(), isTrue);
    final login = await backend.auth.loginWithEmail(
      email: 'gone@mail.com',
      password: 'Secret123',
    );
    expect(login.isLeft(), isTrue);
  });
}
