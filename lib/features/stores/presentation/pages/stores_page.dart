import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/features/home/presentation/pages/home_page.dart';

/// Stores tab: categories, featured stores, then the rest of the feed.
/// Shares the home feed UI (header, filters, rails) without the promos.
class StoresPage extends StatelessWidget {
  const StoresPage({super.key});

  @override
  Widget build(BuildContext context) => const HomePage(storesMode: true);
}
