import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/utils/validators.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// The three live checks under password fields.
class PasswordRulesList extends StatelessWidget {
  const PasswordRulesList({required this.rules, super.key});

  final PasswordRules rules;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RuleCheckRow(label: l10n.authRuleLength, passed: rules.hasMinLength),
        // Same rule as `PasswordRules.isValid` and the server.
        RuleCheckRow(
          label: l10n.authRuleSpecial,
          passed: rules.hasDigit || rules.hasSpecialCharacter,
        ),
        RuleCheckRow(label: l10n.authRuleLetter, passed: rules.hasLetter),
      ],
    );
  }
}
