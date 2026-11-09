import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/domain/repositories/auth_repository.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/otp_bloc.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository repository;
  const args = OtpArgs(
    purpose: OtpPurpose.resetPassword,
    destination: 'jane@mail.com',
  );
  const wrongCode = ValidationFailure(
    "That code isn't right.",
    code: 'invalid_otp',
  );

  setUp(() {
    repository = _MockAuthRepository();
    when(
      () => repository.verifyResetCode(
        email: any(named: 'email'),
        code: any(named: 'code'),
      ),
    ).thenAnswer((_) async => const Left(wrongCode));
  });

  // UX review #6: the page empties the boxes after a wrong code, which echoes
  // back as OtpCodeChanged('') — that must not wipe the error message.
  blocTest<OtpBloc, OtpState>(
    'a wrong code keeps its error after the boxes are cleared',
    build: () => OtpBloc(repository: repository, args: args),
    act: (bloc) => bloc
      ..add(const OtpCodeChanged('0000'))
      ..add(const OtpSubmitted())
      ..add(const OtpCodeChanged('')),
    wait: const Duration(milliseconds: 50),
    verify: (bloc) {
      expect(bloc.state.failure, wrongCode);
      expect(bloc.state.errorCount, 1);
      expect(bloc.state.code, isEmpty);
    },
  );

  blocTest<OtpBloc, OtpState>(
    'typing again clears the error',
    build: () => OtpBloc(repository: repository, args: args),
    act: (bloc) async {
      bloc
        ..add(const OtpCodeChanged('0000'))
        ..add(const OtpSubmitted());
      await Future<void>.delayed(const Duration(milliseconds: 20));
      bloc.add(const OtpCodeChanged('1'));
    },
    wait: const Duration(milliseconds: 50),
    verify: (bloc) {
      expect(bloc.state.failure, isNull);
      expect(bloc.state.code, '1');
    },
  );
}
