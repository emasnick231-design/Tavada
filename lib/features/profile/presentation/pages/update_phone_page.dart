import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/session/session_cubit.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/update_phone_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Update your phone number?" — the new number is saved only after the
/// one-time code sent to it is entered.
class UpdatePhonePage extends StatelessWidget {
  const UpdatePhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = context.read<SessionCubit>().state.user?.phone;
    return BlocProvider(
      create: (_) => UpdatePhoneBloc(sl(), initialPhone: phone),
      child: const _UpdatePhoneView(),
    );
  }
}

class _UpdatePhoneView extends StatefulWidget {
  const _UpdatePhoneView();

  @override
  State<_UpdatePhoneView> createState() => _UpdatePhoneViewState();
}

class _UpdatePhoneViewState extends State<_UpdatePhoneView> {
  final _code = TextEditingController();

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<UpdatePhoneBloc, UpdatePhoneState>(
      listenWhen: (a, b) =>
          (a.status != b.status && b.status.isSuccess) ||
          a.codeErrors != b.codeErrors,
      listener: (context, state) {
        if (!state.status.isSuccess) {
          _code.clear();
          return;
        }
        final user = state.updatedUser;
        if (user != null) context.read<SessionCubit>().updateUser(user);
        AppToast.show(context, l10n.updatePhoneSaved, type: ToastType.success);
        context.pop();
      },
      builder: (context, state) {
        final bloc = context.read<UpdatePhoneBloc>();
        if (state.awaitingCode) {
          return AccountFormScaffold(
            title: l10n.updatePhoneCodeTitle,
            subtitle: l10n.updatePhoneCodeSubtitle(state.phone),
            children: [
              OtpField(
                key: ValueKey('code-${state.codeErrors}'),
                controller: _code,
                hasError: state.failure != null,
                onChanged: (c) => bloc.add(UpdatePhoneCodeChanged(c)),
                onCompleted: (c) => bloc
                  ..add(UpdatePhoneCodeChanged(c))
                  ..add(const UpdatePhoneCodeSubmitted()),
              ),
              AuthErrorText(state.failure?.localizedMessage(l10n)),
              const SizedBox(height: 16),
              Row(
                children: [
                  AppLinkButton(
                    label: l10n.authChangePhone,
                    underline: true,
                    onPressed: () => bloc.add(const UpdatePhoneEditNumber()),
                  ),
                  const Spacer(),
                  AppLinkButton(
                    label: l10n.authResendCode,
                    onPressed: () {
                      bloc.add(const UpdatePhoneSubmitted());
                      AppToast.show(context, l10n.authCodeResent);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              AppButton(
                label: l10n.updatePhoneVerify,
                isLoading: state.status.isSubmitting,
                onPressed: state.canVerify
                    ? () => bloc.add(const UpdatePhoneCodeSubmitted())
                    : null,
              ),
              DevTip(l10n.authOtpDevTip),
            ],
          );
        }
        final initial = state.initialPhone ?? '';
        final country = Country.fromE164(initial) ?? Country.gb;
        void submit() => bloc.add(const UpdatePhoneSubmitted());
        return AccountFormScaffold(
          title: l10n.updatePhoneTitle,
          subtitle: l10n.updatePhoneSubtitle,
          children: [
            PhoneNumberField(
              autofocus: true,
              initialCountry: country,
              initialNumber: initial.isEmpty
                  ? null
                  : initial.replaceFirst('+${country.dialCode}', ''),
              countryPickerTitle: l10n.authSelectCountry,
              searchHint: l10n.authSearchCountry,
              errorText: state.failure?.localizedMessage(l10n),
              onChanged: (p) => bloc.add(
                UpdatePhoneChanged(e164: p.e164, isValid: p.isValid),
              ),
              onSubmitted: (_) => submit(),
            ),
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
