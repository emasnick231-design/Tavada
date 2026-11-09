/// Gaussian blur sigmas for frosted surfaces (nav bar, sheets, overlays).
/// Figma "Background blur" styles map roughly to sigma = radius / 2.
abstract final class AppBlur {
  static const double sm = 6;
  static const double md = 12;
  static const double lg = 20;
  static const double xl = 32;
}
