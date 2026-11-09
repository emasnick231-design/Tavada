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
import 'package:tavada_eats/features/auth/presentation/bloc/otp_bloc.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/resend_code_row.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Shared "We sent a code…" step for sign up, phone login and password reset.
class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({required this.args, super.key});

  /// `null` when the route was opened without its flow (e.g. deep link).
  final OtpArgs? args;

  @override
  Widget build(BuildContext context) {
    final otpArgs = args;
    if (otpArgs == null) {
      return AppScaffold(
        appBar: const AppTopBar(),
        body: ErrorStateView(
          message: context.l10n.authFlowExpired,
          onRetry: () => context.go(AppRoutes.welcome),
        ),
      );
    }
    return BlocProvider(
      create: (_) => sl<OtpBloc>(param1: otpArgs),
      child: _VerifyOtpView(args: otpArgs),
    );
  }
}

class _VerifyOtpView extends StatefulWidget {
  const _VerifyOtpView({required this.args});

  final OtpArgs args;

  @override
  State<_VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<_VerifyOtpView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onStateChanged(BuildContext context, OtpState state) async {
    final l10n = context.l10n;
    // Wrong code or a fresh code was sent: empty the boxes.
    if (state.code.isEmpty && _controller.text.isNotEmpty) _controller.clear();
    final session = state.session;
    if (session != null) {
      AppToast.show(
        context,
        l10n.authWelcomeToast(session.user.firstName),
        type: ToastType.success,
      );
      await completeAuthentication(
        context,
        session,
        from: widget.args.flow.from,
      );
      return;
    }
    final token = state.resetToken;
    if (token != null) {
      unawaited(
        context.push(
          AppRoutes.resetPassword,
          extra: ResetPasswordArgs(
            email: widget.args.destination,
            resetToken: token,
            flow: widget.args.flow,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final args = widget.args;
    final isPhone = args.purpose == OtpPurpose.phoneLogin;
    return BlocConsumer<OtpBloc, OtpState>(
      listenWhen: (a, b) =>
          a.session != b.session ||
          a.resetToken != b.resetToken ||
          a.errorCount != b.errorCount ||
          (a.isResending && !b.isResending && b.failure == null),
      listener: (context, state) {
        if (state.session == null &&
            state.resetToken == null &&
            state.failure == null &&
            !state.isResending) {
          AppToast.show(context, l10n.authCodeResent);
        }
        unawaited(_onStateChanged(context, state));
      },
      builder: (context, state) {
        final bloc = context.read<OtpBloc>();
        final error = state.failure == null
            ? null
            : authErrorMessage(state.failure!, l10n);
        return AuthScaffold(
          title: isPhone ? l10n.authOtpTitlePhone : l10n.authOtpTitleEmail,
          children: [
            Text(
              l10n.authOtpSentTo(args.destination),
              style: AppTypography.paragraph,
            ),
            if (args.purpose != OtpPurpose.resetPassword)
              Align(
                alignment: Alignment.centerLeft,
                child: AppLinkButton(
                  label: isPhone ? l10n.authChangePhone : l10n.authChangeEmail,
                  underline: true,
                  onPressed: () => context.pop(),
                ),
              ),
            const SizedBox(height: AppSpacing.lg),
            OtpField(
              key: ValueKey('otp-${state.errorCount}'),
              controller: _controller,
              hasError: state.errorCount > 0 && state.failure != null,
              onChanged: (code) => bloc.add(OtpCodeChanged(code)),
              onCompleted: (code) => bloc
                ..add(OtpCodeChanged(code))
                ..add(const OtpSubmitted()),
            ),
            AuthErrorText(error),
            const SizedBox(height: AppSpacing.lg),
            ResendCodeRow(
              secondsLeft: state.secondsLeft,
              isResending: state.isResending,
              onResend: () => bloc.add(const OtpResendRequested()),
            ),
            const SizedBox(height: AppSpacing.xxl),
            AppButton(
              label: l10n.commonContinue,
              isLoading: state.status.isSubmitting,
              onPressed: state.isComplete
                  ? () => bloc.add(const OtpSubmitted())
                  : null,
            ),
            DevTip(l10n.authOtpDevTip),
            SizedBox(height: context.keyboardHeight > 0 ? 0 : AppSpacing.xl),
          ],
        );
      },
    );
  }
}
