import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/forgot_password_cubit.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Requests a password reset code by email.
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({required this.args, super.key});

  final AuthFlowArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ForgotPasswordCubit>()..emailChanged(args.draft.email),
      child: _ForgotPasswordView(args: args),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  const _ForgotPasswordView({required this.args});

  final AuthFlowArgs args;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (a, b) => a.status != b.status && b.status.isSuccess,
      listener: (context, state) => pushVerifyOtp(
        context,
        OtpArgs(
          purpose: OtpPurpose.resetPassword,
          destination: state.email,
          flow: args,
          resendInSeconds: state.dispatch?.resendInSeconds ?? 30,
        ),
      ),
      builder: (context, state) {
        final cubit = context.read<ForgotPasswordCubit>();
        return AuthScaffold(
          title: l10n.authForgotTitle,
          subtitle: l10n.authForgotSubtitle,
          children: [
            AppTextField(
              initialValue: args.draft.email,
              hint: l10n.authEmailHint,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.email],
              errorText: state.failure == null
                  ? null
                  : authErrorMessage(state.failure!, l10n),
              onChanged: cubit.emailChanged,
              onSubmitted: (_) => cubit.submit(),
            ),
            const SizedBox(height: 24),
            AppButton(
              label: l10n.commonContinue,
              isLoading: state.status.isSubmitting,
              onPressed: state.isValid ? cubit.submit : null,
            ),
          ],
        );
      },
    );
  }
}
