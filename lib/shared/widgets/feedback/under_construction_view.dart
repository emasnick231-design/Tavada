import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/feedback/empty_state.dart';
import 'package:tavada_eats/shared/widgets/layout/app_scaffold.dart';
import 'package:tavada_eats/shared/widgets/layout/app_top_bar.dart';

/// Temporary page body for routes whose screen is still being built.
class UnderConstructionView extends StatelessWidget {
  const UnderConstructionView({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppTopBar(title: title),
      body: EmptyState(
        image: Assets.images.categories.lunch.path,
        title: title,
        message: 'This screen is being cooked up.',
        imageSize: AppSizes.avatarLg,
      ),
    );
  }
}
