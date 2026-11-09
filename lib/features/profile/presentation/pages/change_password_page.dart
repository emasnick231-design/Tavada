import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/utils/validators.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/password_rules.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/change_password_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Change password from the account settings.
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangePasswordBloc(sl()),
      child: const _ChangePasswordView(),
    );
  }
}

class _ChangePasswordView extends StatelessWidget {
  const _ChangePasswordView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
      listenWhen: (a, b) => a.status != b.status && b.status.isSuccess,
      listener: (context, state) {
        AppToast.show(
          context,
          l10n.changePasswordSaved,
          type: ToastType.success,
        );
        context.pop();
      },
      builder: (context, state) {
        final bloc = context.read<ChangePasswordBloc>();
        void submit() => bloc.add(const ChangePasswordSubmitted());
        return AccountFormScaffold(
          title: l10n.changePasswordTitle,
          subtitle: l10n.changePasswordSubtitle,
          children: [
            AppTextField(
              hint: l10n.changePasswordCurrentHint,
              obscureText: true,
              autofocus: true,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.password],
              errorText: state.wrongCurrent
                  ? state.failure?.localizedMessage(l10n)
                  : null,
              onChanged: (v) => bloc.add(ChangePasswordCurrentChanged(v)),
            ),
            const SizedBox(height: 16),
            AppTextField(
              hint: l10n.changePasswordNewHint,
              obscureText: true,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.newPassword],
              onChanged: (v) => bloc.add(ChangePasswordPasswordChanged(v)),
            ),
            const SizedBox(height: 16),
            AppTextField(
              hint: l10n.authConfirmPasswordHint,
              obscureText: true,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.newPassword],
              errorText: state.showMismatch
                  ? l10n.authPasswordsMismatch
                  : state.wrongCurrent
                  ? null
                  : state.failure?.localizedMessage(l10n),
              onChanged: (v) => bloc.add(ChangePasswordConfirmationChanged(v)),
              onSubmitted: (_) => submit(),
            ),
            const SizedBox(height: 16),
            PasswordRulesList(rules: Validators.passwordRules(state.password)),
            const SizedBox(height: 24),
            AppButton(
              label: l10n.commonSaveChanges,
              isLoading: state.status.isSubmitting,
              onPressed: state.canSubmit ? submit : null,
            ),
          ],
        );
      },
    );
  }
}
