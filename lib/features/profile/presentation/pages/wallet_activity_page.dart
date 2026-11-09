import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/router/app_routes.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/models/money.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/core/utils/formatters.dart';
import 'package:tavada_eats/features/profile/domain/entities/wallet_transaction.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/account_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/bloc/wallet_activity_bloc.dart';
import 'package:tavada_eats/features/profile/presentation/widgets/profile_widgets.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// Wallet card + top-ups, payments, refunds and rewards.
class WalletActivityPage extends StatelessWidget {
  const WalletActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          WalletActivityBloc(sl())..add(const WalletActivityStarted()),
      child: const _WalletActivityView(),
    );
  }
}

class _WalletActivityView extends StatelessWidget {
  const _WalletActivityView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final bloc = context.read<WalletActivityBloc>();
    return AppScaffold(
      appBar: AppTopBar(title: l10n.walletActivityTitle),
      body: BlocBuilder<WalletActivityBloc, WalletActivityState>(
        builder: (context, state) {
          final overview = sl<AccountBloc>().state.overview;
          return RefreshIndicator(
            onRefresh: () async {
              bloc.add(const WalletActivityRefreshed());
              await bloc.stream.firstWhere((s) => !s.isRefreshing);
            },
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.gutter,
                AppSpacing.sm,
                AppSpacing.gutter,
                MediaQuery.paddingOf(context).bottom + AppSpacing.xl,
              ),
              children: [
                if (overview != null) ...[
                  WalletCard(balance: overview.walletBalance),
                  const SizedBox(height: AppSpacing.lg),
                ],
                if (state.status.isFailure)
                  ErrorStateView(
                    failure: state.failure,
                    compact: true,
                    onRetry: () => bloc.add(const WalletActivityStarted()),
                  )
                else if (state.status.isSuccess && state.transactions.isEmpty)
                  EmptyState(
                    title: l10n.walletEmptyTitle,
                    message: l10n.walletEmptyMessage,
                    illustration: AppIcon(
                      Assets.icons.walletLinear,
                      size: 48,
                      color: colors.textDisabled,
                    ),
                    compact: true,
                  )
                else
                  AppSkeleton(
                    enabled: !state.status.isSuccess,
                    child: Column(
                      children: [
                        for (final (i, t)
                            in (state.status.isSuccess
                                    ? state.transactions
                                    : _placeholders)
                                .indexed)
                          _TransactionRow(transaction: t).entrance(index: i),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  static final List<WalletTransaction> _placeholders = List.generate(
    5,
    (i) => WalletTransaction(
      id: '$i',
      type: WalletTransactionType.payment,
      amount: const Money(1250),
      description: 'Mide Lagos',
      createdAt: DateTime(2026),
    ),
  );
}

class _TransactionRow extends StatelessWidget {
  const _TransactionRow({required this.transaction});

  final WalletTransaction transaction;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final t = transaction;
    final (icon, label) = switch (t.type) {
      WalletTransactionType.topUp => (
        Assets.icons.addCircleLinear,
        l10n.walletTopUp,
      ),
      WalletTransactionType.payment => (
        Assets.icons.bagCheckLinear,
        l10n.walletPayment,
      ),
      WalletTransactionType.refund => (
        Assets.icons.repeatLinear,
        l10n.walletRefund,
      ),
      WalletTransactionType.reward => (
        Assets.icons.giftLinear,
        l10n.walletReward,
      ),
    };
    return InkWell(
      onTap: t.orderId == null
          ? null
          : () => context.push(AppRoutes.orderTimeline(t.orderId!)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colors.divider)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: t.isCredit ? colors.successSubtle : colors.surfaceMuted,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: AppIcon(
                icon,
                size: AppSizes.iconMd,
                color: t.isCredit ? colors.success : colors.textSecondary,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.description.isEmpty ? label : t.description,
                    style: AppTypography.titleSmall,
                  ),
                  Text(
                    '$label · ${Formatters.relative(t.createdAt, l10n)}',
                    style: AppTypography.bodySmall.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${t.isCredit ? '+' : '-'}${t.amount.format()}',
              style: AppTypography.labelLarge.copyWith(
                color: t.isCredit ? colors.success : colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
