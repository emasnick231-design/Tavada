import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/auth/domain/entities/auth_session.dart';
import 'package:tavada_eats/features/auth/presentation/bloc/login_bloc.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Welcome back!" — log in with email + password or a phone code.
class LoginPage extends StatelessWidget {
  const LoginPage({required this.args, super.key});

  final AuthFlowArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Prefilled when coming from sign-up ("email already exists").
      create: (_) {
        final bloc = sl<LoginBloc>();
        if (args.draft.email.isNotEmpty) {
          bloc.add(LoginEmailChanged(args.draft.email));
        }
        return bloc;
      },
      child: _LoginView(args: args),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({required this.args});

  final AuthFlowArgs args;

  Future<void> _onSuccess(BuildContext context, LoginState state) async {
    final session = state.session;
    if (session != null) {
      AppToast.show(
        context,
        context.l10n.authWelcomeToast(session.user.firstName),
        type: ToastType.success,
      );
      await completeAuthentication(context, session, from: args.from);
      return;
    }
    final dispatch = state.dispatch;
    if (dispatch != null) {
      unawaited(
        pushVerifyOtp(
          context,
          OtpArgs(
            purpose: OtpPurpose.phoneLogin,
            destination: state.phone,
            flow: args,
            resendInSeconds: dispatch.resendInSeconds,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (a, b) => a.status != b.status && b.status.isSuccess,
      listener: (context, state) => unawaited(_onSuccess(context, state)),
      builder: (context, state) {
        final bloc = context.read<LoginBloc>();
        final isPhone = state.mode == LoginMode.phone;
        void submit() => bloc.add(const LoginSubmitted());
        void toggle() => bloc.add(const LoginModeToggled());
        final error = state.failure == null
            ? null
            : authErrorMessage(state.failure!, l10n, phoneLogin: isPhone);

        return AuthScaffold(
          // Rebuild the form (and replay its entrance) when switching modes.
          key: ValueKey(state.mode),
          title: l10n.authWelcomeBackTitle,
          subtitle: l10n.authWelcomeBackSubtitle,
          topAction: AppLinkButton(
            label: isPhone ? l10n.authUseEmail : l10n.authUsePhone,
            underline: true,
            color: context.colors.textPrimary,
            onPressed: toggle,
          ),
          children: [
            if (isPhone) ...[
              PhoneNumberField(
                autofocus: true,
                countryPickerTitle: l10n.authSelectCountry,
                searchHint: l10n.authSearchCountry,
                errorText: error,
                onChanged: (phone) => bloc.add(
                  LoginPhoneChanged(e164: phone.e164, isValid: phone.isValid),
                ),
                onSubmitted: (_) => submit(),
              ),
              const SizedBox(height: AppSpacing.lg),
              Align(
                alignment: Alignment.centerLeft,
                child: AppLinkButton(
                  label: l10n.authUseEmail,
                  onPressed: toggle,
                ),
              ),
            ] else ...[
              AppTextField(
                initialValue: state.email.isEmpty
                    ? args.draft.email
                    : state.email,
                hint: l10n.authEmailHint,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                onChanged: (v) => bloc.add(LoginEmailChanged(v)),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppTextField(
                hint: l10n.authPasswordHint,
                obscureText: true,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.password],
                errorText: error,
                onChanged: (v) => bloc.add(LoginPasswordChanged(v)),
                onSubmitted: (_) => submit(),
              ),
              const SizedBox(height: AppSpacing.xl),
              Align(
                alignment: Alignment.centerLeft,
                child: AppLinkButton(
                  label: l10n.authForgotPasswordLink,
                  // Carries the typed email over.
                  onPressed: () => context.push(
                    args.withFrom(AppRoutes.forgotPassword),
                    extra: args.copyWith(
                      draft: args.draft.copyWith(email: state.email),
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.xl),
            AppButton(
              label: l10n.commonContinue,
              isLoading: state.status.isSubmitting,
              onPressed: state.canSubmit ? submit : null,
            ),
            AuthFooterLink(
              prompt: l10n.authNoAccount,
              action: l10n.authSignUp,
              onPressed: () => context.pushReplacement(
                args.withFrom(AppRoutes.signUpEmail),
                extra: args,
              ),
            ),
            if (!isPhone) DevTip(l10n.authLoginDemoTip),
          ],
        );
      },
    );
  }
}
