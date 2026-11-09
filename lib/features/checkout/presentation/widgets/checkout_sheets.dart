import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/features/orders/domain/entities/order.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/widgets.dart';

/// "Delivery instructions" note for the rider. Pops with the text ('' to
/// clear) or `null` when dismissed.
Future<String?> showDeliveryInstructionsSheet(
  BuildContext context, {
  String? initial,
}) {
  return showAppBottomSheet<String>(
    context: context,
    title: context.l10n.checkoutDeliveryInstructions,
    plainHeader: true,
    builder: (_) => _InstructionsSheet(initial: initial ?? ''),
  );
}

class _InstructionsSheet extends StatefulWidget {
  const _InstructionsSheet({required this.initial});

  final String initial;

  @override
  State<_InstructionsSheet> createState() => _InstructionsSheetState();
}

class _InstructionsSheetState extends State<_InstructionsSheet> {
  late String _text = widget.initial;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.lg,
        AppSpacing.gutter,
        MediaQuery.viewInsetsOf(context).bottom +
            MediaQuery.paddingOf(context).bottom +
            AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            initialValue: widget.initial,
            hint: l10n.checkoutInstructionsHint,
            autofocus: widget.initial.isEmpty,
            maxLines: 5,
            minLines: 5,
            maxLength: 300,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (v) => setState(() => _text = v),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: l10n.checkoutAddNote,
            size: AppButtonSize.lg,
            onPressed: _text.trim().isEmpty && widget.initial.isEmpty
                ? null
                : () => Navigator.pop(context, _text.trim()),
          ),
        ],
      ),
    );
  }
}

/// "Customize your gift". Pops with the gift, a `GiftDetails` with an empty
/// sender to remove it, or `null` when dismissed.
Future<GiftDetails?> showGiftSheet(
  BuildContext context, {
  GiftDetails? initial,
  String? senderName,
}) {
  return showAppBottomSheet<GiftDetails>(
    context: context,
    title: context.l10n.checkoutGiftTitle,
    showHandle: false,
    headerIllustration: Assets.images.illustrations.giftBox.image(height: 64),
    builder: (_) => _GiftSheet(initial: initial, senderName: senderName),
  );
}

class _GiftSheet extends StatefulWidget {
  const _GiftSheet({required this.initial, required this.senderName});

  final GiftDetails? initial;
  final String? senderName;

  @override
  State<_GiftSheet> createState() => _GiftSheetState();
}

class _GiftSheetState extends State<_GiftSheet> {
  late String _sender = widget.initial?.senderName ?? widget.senderName ?? '';
  late String _recipient = widget.initial?.recipientName ?? '';
  late String _phone = widget.initial?.recipientPhone ?? '';
  late bool _phoneValid = _phone.isNotEmpty;
  late String _note = widget.initial?.note ?? '';

  bool get _valid =>
      _sender.trim().isNotEmpty && _recipient.trim().isNotEmpty && _phoneValid;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final initialCountry = Country.fromE164(_phone) ?? Country.gb;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        AppSpacing.lg,
        AppSpacing.gutter,
        MediaQuery.viewInsetsOf(context).bottom +
            MediaQuery.paddingOf(context).bottom +
            AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            label: l10n.checkoutGiftSender,
            isRequired: true,
            initialValue: _sender,
            textCapitalization: TextCapitalization.words,
            onChanged: (v) => setState(() => _sender = v),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppTextField(
            label: l10n.checkoutGiftRecipient,
            hint: l10n.checkoutGiftRecipientHint,
            isRequired: true,
            initialValue: _recipient,
            textCapitalization: TextCapitalization.words,
            onChanged: (v) => setState(() => _recipient = v),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            '${l10n.checkoutGiftPhone} *',
            style: AppTypography.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          PhoneNumberField(
            initialCountry: initialCountry,
            initialNumber: _phone.isEmpty
                ? null
                : _phone.replaceFirst('+${initialCountry.dialCode}', ''),
            countryPickerTitle: l10n.checkoutCountryPicker,
            searchHint: l10n.checkoutCountrySearch,
            onChanged: (p) => setState(() {
              _phone = p.e164;
              _phoneValid = p.isValid;
            }),
          ),
          const SizedBox(height: AppSpacing.md),
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton.tonal(
              label: l10n.checkoutGiftFindContacts,
              size: AppButtonSize.xs,
              leading: AppIcon(
                Assets.icons.notificationUnreadLinear,
                size: AppSizes.iconSm,
              ),
              onPressed: () => AppToast.show(
                context,
                l10n.commonComingSoonMessage(l10n.checkoutContactsTitle),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppTextField(
            label: l10n.checkoutGiftNote,
            hint: l10n.checkoutInstructionsHint,
            initialValue: _note,
            maxLines: 4,
            minLines: 4,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (v) => _note = v,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: l10n.checkoutGiftSave,
            size: AppButtonSize.lg,
            onPressed: _valid
                ? () => Navigator.pop(
                    context,
                    GiftDetails(
                      senderName: _sender.trim(),
                      recipientName: _recipient.trim(),
                      recipientPhone: _phone,
                      note: _note.trim().isEmpty ? null : _note.trim(),
                    ),
                  )
                : null,
          ),
          if (widget.initial != null) ...[
            const SizedBox(height: AppSpacing.sm),
            AppButton.ghost(
              label: l10n.checkoutGiftRemove,
              onPressed: () => Navigator.pop(
                context,
                const GiftDetails(
                  senderName: '',
                  recipientName: '',
                  recipientPhone: '',
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
