import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/reset_password_cubit.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/password_rules.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Sets a new password after the reset code was verified.
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({required this.args, super.key});

  /// `null` when the route was opened without its flow (e.g. deep link).
  final ResetPasswordArgs? args;

  @override
  Widget build(BuildContext context) {
    final resetArgs = args;
    if (resetArgs == null) {
      return AppScaffold(
        appBar: const AppTopBar(),
        body: ErrorStateView(
          message: context.l10n.authFlowExpired,
          onRetry: () => context.go(AppRoutes.login),
        ),
      );
    }
    return BlocProvider(
      create: (_) => sl<ResetPasswordCubit>(),
      child: _ResetPasswordView(args: resetArgs),
    );
  }
}

class _ResetPasswordView extends StatelessWidget {
  const _ResetPasswordView({required this.args});

  final ResetPasswordArgs args;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (a, b) => a.status != b.status && b.status.isSuccess,
      listener: (context, state) {
        AppToast.show(
          context,
          l10n.authPasswordUpdated,
          type: ToastType.success,
        );
        context.go(args.flow.withFrom(AppRoutes.login), extra: args.flow);
      },
      builder: (context, state) {
        final cubit = context.read<ResetPasswordCubit>();
        void submit() =>
            cubit.submit(email: args.email, resetToken: args.resetToken);
        return AuthScaffold(
          title: l10n.authResetTitle,
          subtitle: l10n.authResetSubtitle,
          children: [
            AppTextField(
              hint: l10n.authPasswordHint,
              obscureText: true,
              autofocus: true,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.newPassword],
              onChanged: cubit.passwordChanged,
            ),
            const SizedBox(height: 16),
            AppTextField(
              hint: l10n.authConfirmPasswordHint,
              obscureText: true,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.newPassword],
              errorText: state.mismatch
                  ? l10n.authPasswordsMismatch
                  : state.failure?.localizedMessage(l10n),
              onChanged: cubit.confirmationChanged,
              onSubmitted: (_) => submit(),
            ),
            const SizedBox(height: 16),
            PasswordRulesList(rules: state.rules),
            const SizedBox(height: 24),
            AppButton(
              label: l10n.authCompleteChanges,
              isLoading: state.status.isSubmitting,
              onPressed: state.isValid ? submit : null,
            ),
          ],
        );
      },
    );
  }
}
