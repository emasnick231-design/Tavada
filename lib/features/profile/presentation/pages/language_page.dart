import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/settings/settings_cubit.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// App language: system default, English or Turkish.
class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final current = context.select<SettingsCubit, String?>(
      (c) => c.state.languageCode,
    );
    final options = <(String?, String)>[
      (null, l10n.languageSystem),
      ('en', l10n.languageEnglish),
      ('tr', l10n.languageTurkish),
    ];
    return AccountFormScaffold(
      title: l10n.languageTitle,
      subtitle: l10n.languageSubtitle,
      children: [
        for (final (code, label) in options)
          AppSelectionTile(
            title: label,
            isRadio: true,
            selected: current == code,
            padding: const EdgeInsets.symmetric(vertical: 14),
            onTap: () => context.read<SettingsCubit>().setLanguage(code),
          ),
      ],
    );
  }
}
