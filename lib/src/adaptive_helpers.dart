import 'package:universal_platform/universal_platform.dart';

/// Class whose attributes help to detect the current device type.
///
/// This uses the awesome [universal_platform](https://pub.dev/packages/universal_platform) package.
class DeviceType {
  /// Whether the app is running on iOS.
  static bool isIOS = UniversalPlatform.isIOS;

  /// Whether the app is running on android.
  static bool isAndroid = UniversalPlatform.isAndroid;

  /// Whether the app is running on macOS.
  static bool isMacOS = UniversalPlatform.isMacOS;

  /// Whether the app is running on linux.
  static bool isLinux = UniversalPlatform.isLinux;

  /// Whether the app is running on windows.
  static bool isWindows = UniversalPlatform.isWindows;

  /// Whether the app is running on the web.
  static bool isWeb = UniversalPlatform.isWeb;

  /// Whether the app is running on desktop (windows, macOS or linux).
  static bool isDesktop = isWindows || isMacOS || isLinux;

  /// Whether the app is running on mobile (android or iOS).
  static bool isMobile = isAndroid || isIOS;

  /// Whether the app is running on desktop or web.
  static bool isDesktopOrWeb = isDesktop || isWeb;

  /// Whether the app is running on mobile or web.
  static bool isMobileOrWeb = isMobile || isWeb;
}

/// A single source of truth for styling values like padding, spacing, corner shape, font sizes, and so on.
///
/// These constants can then be used in place of hard-coded numeric values.
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
