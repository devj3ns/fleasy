import 'package:universal_platform/universal_platform.dart';

class DeviceType {
  // Syntax sugar, proxy the UniversalPlatform methods so our views can reference a single API
  static bool isIOS = UniversalPlatform.isIOS;
  static bool isAndroid = UniversalPlatform.isAndroid;
  static bool isMacOS = UniversalPlatform.isMacOS;
  static bool isLinux = UniversalPlatform.isLinux;
  static bool isWindows = UniversalPlatform.isWindows;

  // Higher level device class abstractions (more syntax sugar for the views)
  static bool isWeb = UniversalPlatform.isWeb;
  static bool isDesktop = isWindows || isMacOS || isLinux;
  static bool isMobile = isAndroid || isIOS;
  static bool isDesktopOrWeb = isDesktop || isWeb;
  static bool isMobileOrWeb = isMobile || isWeb;
}

class Insets {
  /// An extra extra small inset of 2.0.
  static const double xxs = 2.0;

  /// An extra small inset of 4.0.
  static const double xs = 4.0;

  /// A small inset of 6.0.
  static const double s = 6.0;

  /// A medium inset of 8.0.
  static const double m = 8.0;

  /// A large inset of 10.0.
  static const double l = 10.0;

  /// An extra large inset of 12.0.
  static const double xl = 12.0;

  /// An extra extra large inset of 16.0.
  static const double xxl = 16.0;
}
