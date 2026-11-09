import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tavada_eats/core/models/user_profile.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/core/storage/secure_storage.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';

import '../../helpers/helpers.dart';

class _MockSecureStorage extends Mock implements SecureStorage {}

/// Stands in for checkout: state that must survive logging in.
class _Checkout extends StatefulWidget {
  const _Checkout();

  @override
  State<_Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<_Checkout> {
  var _choice = 'delivery';

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        Text('mode: $_choice'),
        TextButton(
          onPressed: () => setState(() => _choice = 'pickup'),
          child: const Text('pickup'),
        ),
        TextButton(
          onPressed: () => context.push('/auth/login?from=/checkout/x'),
          child: const Text('pay'),
        ),
      ],
    ),
  );
}

void main() {
  // UX review #1: logging in from checkout must return to the SAME checkout
  // (choices intact) instead of rebuilding it with `go`.
  testWidgets('completing auth pops back to the live `from` screen', (
    tester,
  ) async {
    buildTestHydratedStorage();
    final secure = _MockSecureStorage();
    when(
      () => secure.writeTokens(
        accessToken: any(named: 'accessToken'),
        refreshToken: any(named: 'refreshToken'),
      ),
    ).thenAnswer((_) async {});
    final session = SessionCubit(secure)..continueAsGuest();
    final router = GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, _) => Scaffold(
            body: TextButton(
              onPressed: () => context.push('/checkout/x'),
              child: const Text('checkout'),
            ),
          ),
        ),
        GoRoute(path: '/checkout/:id', builder: (_, _) => const _Checkout()),
        GoRoute(
          path: '/auth/login',
          builder: (context, state) => Scaffold(
            body: TextButton(
              onPressed: () => completeAuthentication(
                context,
                const AuthSession(
                  user: UserProfile(
                    id: 'u1',
                    firstName: 'Ada',
                    lastName: 'Obi',
                    email: 'ada@mail.com',
                  ),
                  accessToken: 'tk_u1_1',
                ),
                from: state.uri.queryParameters['from'],
              ),
              child: const Text('log in'),
            ),
          ),
        ),
      ],
    );
    await tester.pumpWidget(
      BlocProvider.value(
        value: session,
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.tap(find.text('checkout'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('pickup'));
    await tester.tap(find.text('pay'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('log in'));
    await tester.pumpAndSettle();

    expect(find.text('mode: pickup'), findsOneWidget);
    expect(router.canPop(), isTrue, reason: 'home is still underneath');
    expect(session.state.isAuthenticated, isTrue);
  });
}
