import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/features/auth/presentation/flow/auth_flow.dart';
import 'package:tavada_eats/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Sign up · step 2 — phone number. Pure local form state: nothing is sent
/// until the code is verified, so no bloc is needed here.
class SignUpPhonePage extends StatefulWidget {
  const SignUpPhonePage({required this.args, super.key});

  final AuthFlowArgs args;

  @override
  State<SignUpPhonePage> createState() => _SignUpPhonePageState();
}

class _SignUpPhonePageState extends State<SignUpPhonePage> {
  PhoneNumber? _phone;

  void _continue() {
    final phone = _phone;
    if (phone == null || !phone.isValid) return;
    final args = widget.args;
    unawaited(
      context.push(
        AppRoutes.signUpPassword,
        extra: args.copyWith(
          draft: args.draft.copyWith(phone: phone.e164),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final initial = widget.args.draft.phone;
    final initialCountry = Country.fromE164(initial) ?? Country.gb;
    return AuthScaffold(
      title: l10n.authPhoneTitle,
      subtitle: l10n.authPhoneSubtitle,
      children: [
        PhoneNumberField(
          autofocus: true,
          initialCountry: initialCountry,
          initialNumber: initial.isEmpty
              ? null
              : initial.replaceFirst('+${initialCountry.dialCode}', ''),
          countryPickerTitle: l10n.authSelectCountry,
          searchHint: l10n.authSearchCountry,
          onChanged: (value) => setState(() => _phone = value),
          onSubmitted: (_) => _continue(),
        ),
        const SizedBox(height: 24),
        AppButton(
          label: l10n.commonContinue,
          onPressed: (_phone?.isValid ?? false) ? _continue : null,
        ),
      ],
    );
  }
}
