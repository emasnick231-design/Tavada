import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/email_step_cubit.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Sign up · step 1 — email address.
class SignUpEmailPage extends StatelessWidget {
  const SignUpEmailPage({required this.args, super.key});

  final AuthFlowArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Seeded from the draft so going back keeps what was typed.
      create: (_) => sl<EmailStepCubit>()
        ..firstNameChanged(args.draft.firstName)
        ..lastNameChanged(args.draft.lastName)
        ..emailChanged(args.draft.email),
      child: _SignUpEmailView(args: args),
    );
  }
}

class _SignUpEmailView extends StatelessWidget {
  const _SignUpEmailView({required this.args});

  final AuthFlowArgs args;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<EmailStepCubit, EmailStepState>(
      listenWhen: (a, b) => a.status != b.status && b.status.isSuccess,
      listener: (context, state) => context.push(
        AppRoutes.signUpPhone,
        extra: args.copyWith(
          draft: args.draft.copyWith(
            email: state.email,
            firstName: state.firstName.trim(),
            lastName: state.lastName.trim(),
          ),
        ),
      ),
      builder: (context, state) {
        final cubit = context.read<EmailStepCubit>();
        final error = state.failure == null
            ? null
            : authErrorMessage(state.failure!, l10n);
        return AuthScaffold(
          title: l10n.authEmailTitle,
          subtitle: l10n.authEmailSubtitle,
          children: [
            AppTextField(
              initialValue: args.draft.firstName,
              hint: l10n.authFirstNameHint,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.givenName],
              onChanged: cubit.firstNameChanged,
            ),
            const SizedBox(height: 16),
            AppTextField(
              initialValue: args.draft.lastName,
              hint: l10n.authLastNameHint,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.familyName],
              onChanged: cubit.lastNameChanged,
            ),
            const SizedBox(height: 16),
            AppTextField(
              initialValue: args.draft.email,
              hint: l10n.authEmailHint,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.email],
              errorText: error,
              onChanged: cubit.emailChanged,
              onSubmitted: (_) => cubit.submit(),
            ),
            const SizedBox(height: 24),
            AppButton(
              label: l10n.commonContinue,
              isLoading: state.status.isSubmitting,
              onPressed: state.isValid ? cubit.submit : null,
            ),
            // "An account with this email already exists": one tap to log
            // in with that email.
            if (state.failure case ValidationFailure(code: 'email_taken'))
              Align(
                alignment: Alignment.centerLeft,
                child: AppLinkButton(
                  label: l10n.authLogIn,
                  underline: true,
                  onPressed: () => context.pushReplacement(
                    args.withFrom(AppRoutes.login),
                    extra: args.copyWith(
                      draft: args.draft.copyWith(email: state.email),
                    ),
                  ),
                ),
              ),
            AuthFooterLink(
              prompt: l10n.authHaveAccount,
              action: l10n.authLogIn,
              // Replace (like Login → Sign up) so bouncing doesn't stack.
              onPressed: () => context.pushReplacement(
                args.withFrom(AppRoutes.login),
                extra: args,
              ),
            ),
          ],
        );
      },
    );
  }
}
