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
