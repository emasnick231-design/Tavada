import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/core/theme/app_color_scheme.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  /// Semantic colours: `context.colors.textSecondary`.
  AppColorScheme get colors =>
      Theme.of(this).extension<AppColorScheme>() ?? AppColorScheme.light;

  /// Material text theme mapped to the app type scale.
  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  double get keyboardHeight => MediaQuery.viewInsetsOf(this).bottom;
  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;

  /// Whether the user asked the OS to reduce motion.
  bool get reduceMotion => MediaQuery.disableAnimationsOf(this);

  void unfocus() => FocusManager.instance.primaryFocus?.unfocus();
}
