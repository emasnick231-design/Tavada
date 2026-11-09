import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/di/injection.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/network/network_info.dart';
import 'package:tavada_eats/core/theme/theme.dart';
import 'package:tavada_eats/gen/assets.gen.dart';
import 'package:tavada_eats/shared/widgets/media/app_icon.dart';

/// App-wide connectivity banner (mounted in `MaterialApp.builder`).
/// Slides down when offline; flashes "Back online" when connectivity returns.
class OfflineBanner extends StatefulWidget {
  const OfflineBanner({required this.child, super.key});

  final Widget child;

  @override
  State<OfflineBanner> createState() => _OfflineBannerState();
}

class _OfflineBannerState extends State<OfflineBanner> {
  StreamSubscription<bool>? _sub;
  bool _online = true;
  bool _showBackOnline = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _sub = sl<NetworkInfo>().onStatusChange.listen((online) {
      if (!mounted) return;
      setState(() {
        _showBackOnline = online && !_online;
        _online = online;
      });
      _timer?.cancel();
      if (_showBackOnline) {
        _timer = Timer(const Duration(seconds: 2), () {
          if (mounted) setState(() => _showBackOnline = false);
        });
      }
    });
  }

  @override
  void dispose() {
    unawaited(_sub?.cancel());
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visible = !_online || _showBackOnline;
    final top = MediaQuery.viewPaddingOf(context).top;
    return Stack(
      children: [
        widget.child,
        AnimatedPositioned(
          duration: AppDurations.slow,
          curve: AppCurves.emphasized,
          top: visible ? top + AppSpacing.xs : -80,
          left: AppSpacing.gutter,
          right: AppSpacing.gutter,
          child: IgnorePointer(
            child: AnimatedContainer(
              duration: AppDurations.normal,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm + 2,
              ),
              decoration: BoxDecoration(
                color: _online ? AppColors.success600 : AppColors.gray950,
                borderRadius: AppRadii.pillAll,
                boxShadow: AppShadows.lg,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcon(
                    _online
                        ? Assets.icons.checkCircleBold
                        : Assets.icons.cloudCrossLinear,
                    size: AppSizes.iconSm,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Flexible(
                    child: Text(
                      _online
                          ? context.l10n.backOnlineBanner
                          : context.l10n.offlineBanner,
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
