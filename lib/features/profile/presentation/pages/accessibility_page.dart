import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/settings/settings_cubit.dart';
import 'package:tavada_eats/features/profile/domain/entities/account_settings.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/accessibility_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Hearing disclosure for riders + haptic feedback.
class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccessibilityBloc(sl())..add(const AccessibilityStarted()),
      child: const _AccessibilityView(),
    );
  }
}

class _AccessibilityView extends StatelessWidget {
  const _AccessibilityView();

  String _label(AppLocalizations l10n, HearingPreference h) => switch (h) {
    HearingPreference.none => l10n.accessibilityHearingNone,
    HearingPreference.deaf => l10n.accessibilityHearingDeaf,
    HearingPreference.hardOfHearing => l10n.accessibilityHearingHard,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<AccessibilityBloc, AccessibilityState>(
      listenWhen: (a, b) => a.saveStatus != b.saveStatus,
      listener: (context, state) {
        if (state.saveStatus.isSuccess) {
          AppToast.show(
            context,
            l10n.accessibilitySaved,
            type: ToastType.success,
          );
        } else if (state.saveStatus.isFailure) {
          AppToast.show(
            context,
            state.saveFailure!.localizedMessage(l10n),
            type: ToastType.error,
          );
        }
      },
      builder: (context, state) {
        final haptics = context.select<SettingsCubit, bool>(
          (c) => c.state.hapticsEnabled,
        );
        return AccountFormScaffold(
          title: l10n.accessibilityTitle,
          subtitle: l10n.accessibilitySubtitle,
          children: [
            // A failed load gets a message + retry, not an endless skeleton.
            if (state.status.isFailure)
              ErrorStateView(
                failure: state.failure,
                compact: true,
                onRetry: () => context.read<AccessibilityBloc>().add(
                  const AccessibilityStarted(),
                ),
              )
            else
              AppSkeleton(
                enabled: !state.status.isSuccess,
                child: SettingsRow(
                  label: l10n.accessibilityHearing,
                  subtitle: _label(l10n, state.settings.hearing),
                  onTap: () async {
                    final picked = await showSelectionSheet<HearingPreference>(
                      context: context,
                      title: l10n.accessibilityHearing,
                      subtitle: l10n.accessibilityHearingBody,
                      dense: true,
                      multiSelect: false,
                      selected: {state.settings.hearing},
                      options: [
                        for (final h in HearingPreference.values)
                          SelectionOption(value: h, label: _label(l10n, h)),
                      ],
                    );
                    if (picked != null &&
                        picked.isNotEmpty &&
                        context.mounted) {
                      context.read<AccessibilityBloc>().add(
                        AccessibilityHearingChanged(picked.first),
                      );
                    }
                  },
                ),
              ),
            SettingsRow(
              label: l10n.profileHaptics,
              showDivider: false,
              trailing: Switch.adaptive(
                value: haptics,
                onChanged: (v) =>
                    context.read<SettingsCubit>().setHaptics(enabled: v),
              ),
            ),
          ],
        );
      },
    );
  }
}
