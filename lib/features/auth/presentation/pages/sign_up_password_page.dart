import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/password_step_cubit.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/password_rules.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Sign up · step 3 — password with live rule checks, then sends the code.
class SignUpPasswordPage extends StatelessWidget {
  const SignUpPasswordPage({required this.args, super.key});

  final AuthFlowArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PasswordStepCubit>(),
      child: _SignUpPasswordView(args: args),
    );
  }
}

class _SignUpPasswordView extends StatelessWidget {
  const _SignUpPasswordView({required this.args});

  final AuthFlowArgs args;

  void _onSent(BuildContext context, PasswordStepState state) {
    final draft = args.draft.copyWith(password: state.password);
    unawaited(
      pushVerifyOtp(
        context,
        OtpArgs(
          purpose: OtpPurpose.signUp,
          destination: draft.email,
          flow: args.copyWith(draft: draft),
          resendInSeconds: state.dispatch?.resendInSeconds ?? 30,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<PasswordStepCubit, PasswordStepState>(
      listenWhen: (a, b) => a.status != b.status && b.status.isSuccess,
      listener: _onSent,
      builder: (context, state) {
        final cubit = context.read<PasswordStepCubit>();
        void submit() => cubit.submit(email: args.draft.email);
        return AuthScaffold(
          title: l10n.authPasswordTitle,
          subtitle: l10n.authPasswordSubtitle,
          children: [
            AppTextField(
              hint: l10n.authPasswordHint,
              obscureText: true,
              autofocus: true,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.newPassword],
              errorText: state.failure?.localizedMessage(l10n),
              onChanged: cubit.passwordChanged,
              onSubmitted: (_) => submit(),
            ),
            const SizedBox(height: 16),
            PasswordRulesList(rules: state.rules),
            const SizedBox(height: 24),
            AppButton(
              label: l10n.commonContinue,
              isLoading: state.status.isSubmitting,
              onPressed: state.isValid ? submit : null,
            ),
          ],
        );
      },
    );
  }
}
