import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/extensions/context_x.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/buttons/pressable_scale.dart';
import 'package:tavada_eats/shared/widgets/inputs/app_search_field.dart';
import 'package:tavada_eats/shared/widgets/inputs/app_text_field.dart';
import 'package:tavada_eats/shared/widgets/inputs/country.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';
import 'package:tavada_eats/shared/widgets/sheets/app_bottom_sheet.dart';

export 'country.dart';

/// Country selector + national number input (auth, profile, gift sheet).
class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    super.key,
    this.initialCountry = Country.gb,
    this.initialNumber,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.errorText,
    this.textInputAction = TextInputAction.done,
    this.countryPickerTitle = 'Select country',
    this.searchHint = 'Search country',
  });

  final Country initialCountry;
  final String? initialNumber;
  final ValueChanged<PhoneNumber>? onChanged;
  final ValueChanged<PhoneNumber>? onSubmitted;
  final bool autofocus;
  final String? errorText;
  final TextInputAction textInputAction;
  final String countryPickerTitle;
  final String searchHint;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  late Country _country = widget.initialCountry;
  late final _controller = TextEditingController(text: widget.initialNumber);

  PhoneNumber get _value =>
      PhoneNumber(country: _country, nationalNumber: _controller.text);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickCountry() async {
    final picked = await showAppBottomSheet<Country>(
      context: context,
      title: widget.countryPickerTitle,
      expand: true,
      builder: (_) => _CountryPicker(
        selected: _country,
        searchHint: widget.searchHint,
      ),
    );
    if (picked != null && mounted) {
      setState(() => _country = picked);
      widget.onChanged?.call(_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PressableScale(
              onTap: _pickCountry,
              semanticLabel: _country.name,
              child: Container(
                height: AppSizes.inputHeight,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                decoration: BoxDecoration(
                  color: colors.surfaceMuted,
                  borderRadius: AppRadii.mdAll,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: AppDurations.fast,
                      transitionBuilder: (c, a) =>
                          ScaleTransition(scale: a, child: c),
                      child: SvgPicture.asset(
                        _country.flagAsset,
                        key: ValueKey(_country.code),
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    AppIcon(
                      Assets.icons.altArrowDownLinear,
                      size: AppSizes.iconMd,
                      color: colors.textPrimary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: AppTextField(
                controller: _controller,
                autofocus: widget.autofocus,
                hint: _country.dialPrefix,
                prefixText: _controller.text.isEmpty
                    ? null
                    : '${_country.dialPrefix} ',
                keyboardType: TextInputType.phone,
                textInputAction: widget.textInputAction,
                autofillHints: const [AutofillHints.telephoneNumberNational],
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d ]')),
                  LengthLimitingTextInputFormatter(16),
                ],
                errorText: widget.errorText,
                onChanged: (_) {
                  setState(() {});
                  widget.onChanged?.call(_value);
                },
                onSubmitted: (_) => widget.onSubmitted?.call(_value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CountryPicker extends StatefulWidget {
  const _CountryPicker({required this.selected, required this.searchHint});

  final Country selected;
  final String searchHint;

  @override
  State<_CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<_CountryPicker> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final q = _query.toLowerCase();
    final countries = Country.all
        .where(
          (c) =>
              q.isEmpty ||
              c.name.toLowerCase().contains(q) ||
              c.dialCode.contains(q.replaceAll('+', '')),
        )
        .toList();
    return Column(
      children: [
        Padding(
          padding: AppInsets.page,
          child: AppSearchField(
            heroTag: null,
            hint: widget.searchHint,
            textInputAction: TextInputAction.done,
            onChanged: (v) => setState(() => _query = v),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
            itemCount: countries.length,
            separatorBuilder: (_, _) =>
                const Divider(indent: AppSpacing.gutter),
            itemBuilder: (context, i) {
              final c = countries[i];
              final selected = c == widget.selected;
              return PressableScale(
                scale: 0.99,
                onTap: () => Navigator.of(context).pop(c),
                child: Padding(
                  padding: AppInsets.listItem,
                  child: Row(
                    children: [
                      SvgPicture.asset(c.flagAsset, width: 24, height: 24),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Text(c.name, style: AppTypography.bodyMedium),
                      ),
                      Text(
                        c.dialPrefix,
                        style: AppTypography.bodyMedium.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                      if (selected) ...[
                        const SizedBox(width: AppSpacing.sm),
                        AppIcon(
                          Assets.icons.checkCircleBold,
                          size: AppSizes.iconMd,
                          color: colors.brand,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
