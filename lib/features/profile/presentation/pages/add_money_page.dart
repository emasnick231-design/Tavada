import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/haptics.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/account_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/add_money_bloc.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Wallet top-up with an in-app number pad.
class AddMoneyPage extends StatelessWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddMoneyBloc(sl()),
      child: const _AddMoneyView(),
    );
  }
}

class _AddMoneyView extends StatelessWidget {
  const _AddMoneyView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final account = sl<AccountBloc>();
    return BlocConsumer<AddMoneyBloc, AddMoneyState>(
      listenWhen: (a, b) => a.status != b.status,
      listener: (context, state) {
        if (state.status.isSuccess && state.result != null) {
          account.add(AccountOverviewChanged(state.result!));
          AppToast.show(
            context,
            l10n.addMoneySuccess(state.amount.format()),
            type: ToastType.success,
          );
          context.pop();
        } else if (state.status.isFailure) {
          AppToast.show(
            context,
            state.failure!.localizedMessage(l10n),
            type: ToastType.error,
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<AddMoneyBloc>();
        final balance = account.state.overview?.walletBalance;
        return AppScaffold(
          appBar: AppTopBar(title: l10n.addMoneyTitle, alwaysShowDivider: true),
          body: Column(
            children: [
              // Figma: just the amount (black, even at £0.00) and the
              // balance. Scales down instead of overflowing on small
              // screens / large text.
              Expanded(
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: AppInsets.pageAll,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                                state.amount.format(),
                                style: AppTypography.displayLarge.copyWith(
                                  color: colors.textPrimary,
                                ),
                              )
                              .animate(key: ValueKey(state.rejectedInputs))
                              .shakeX(
                                hz: 6,
                                amount: state.rejectedInputs > 0 ? 4 : 0,
                              ),
                          // Where the money comes from + the minimum.
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            l10n.addMoneyMinimum(
                              AddMoneyBloc.minAmount.formatCompact(),
                              AddMoneyBloc.cardLabel,
                            ),
                            style: AppTypography.bodySmall.copyWith(
                              color:
                                  state.belowMinimum && state.amount.isPositive
                                  ? colors.error
                                  : colors.textTertiary,
                            ),
                          ),
                          if (balance != null) ...[
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              l10n.addMoneyBalance(balance.format()),
                              style: AppTypography.bodyMedium.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: AppButton(
                  label: l10n.addMoneySecurely,
                  isLoading: state.status.isSubmitting,
                  onPressed: state.canSubmit
                      ? () => bloc.add(const AddMoneySubmitted())
                      : null,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _NumberPad(
                enabled: !state.isLocked,
                onDigit: (d) => bloc.add(AddMoneyDigitPressed(d)),
                onBackspace: () => bloc.add(const AddMoneyBackspacePressed()),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NumberPad extends StatelessWidget {
  const _NumberPad({
    required this.enabled,
    required this.onDigit,
    required this.onBackspace,
  });

  final bool enabled;
  final ValueChanged<int> onDigit;
  final VoidCallback onBackspace;

  static const _letters = [
    '',
    '',
    'ABC',
    'DEF',
    'GHI',
    'JKL',
    'MNO',
    'PQRS',
    'TUV',
    'WXYZ',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    Widget key(Widget child, VoidCallback? onTap, {bool plain = false}) =>
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(3),
            // iOS-style keys: white, no outline, on a grey tray.
            child: Material(
              color: plain ? Colors.transparent : colors.surface,
              borderRadius: AppRadii.smAll,
              child: InkWell(
                borderRadius: AppRadii.smAll,
                onTap: enabled && onTap != null
                    ? () {
                        Haptics.selection();
                        onTap();
                      }
                    : null,
                child: SizedBox(
                  height: 46,
                  child: Center(
                    child: FittedBox(fit: BoxFit.scaleDown, child: child),
                  ),
                ),
              ),
            ),
          ),
        );
    Widget digit(int d) => key(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$d',
            style: AppTypography.headlineLarge.copyWith(
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
          if (_letters[d].isNotEmpty)
            Text(
              _letters[d],
              style: AppTypography.labelSmall.copyWith(
                letterSpacing: 2,
                height: 1.2,
              ),
            ),
        ],
      ),
      () => onDigit(d),
    );
    return Container(
      color: AppColors.gray200,
      padding: EdgeInsets.fromLTRB(
        3,
        6,
        3,
        MediaQuery.paddingOf(context).bottom + 6,
      ),
      child: Column(
        children: [
          for (final row in const [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
          ])
            Row(children: [for (final d in row) digit(d)]),
          Row(
            children: [
              key(const SizedBox.shrink(), null, plain: true),
              digit(0),
              key(
                const Icon(Icons.backspace_outlined),
                onBackspace,
                plain: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
