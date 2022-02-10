import 'package:flutter/material.dart';

/// Class which defines the screen width breakpoints
class ScreenWidthBreakpoints {
  /// Devices with a width greater than 900.
  static double desktop = 900;

  /// Devices with a width greater than 600.
  static double tablet = 600;

  /// Devices with a width greater than 300.
  static double mobile = 300;
}

/// The possible form factors a device can have.
enum FormFactor { desktop, tablet, mobile }

extension FormFactorHelpers on FormFactor {
  /// Whether `context.formFactor()` is equal to `FormFactor.desktop`.
  bool get isDesktop => this == FormFactor.desktop;

  /// Whether `context.formFactor()` is equal to `FormFactor.tablet`.
  bool get isTablet => this == FormFactor.tablet;

  /// Whether `context.formFactor()` is equal to `FormFactor.mobile`.
  bool get isMobile => this == FormFactor.mobile;
}

extension AdaptiveHelpers on BuildContext {
  /// The [MediaQueryData] from the closest instance of this class that encloses the given context.
  ///
  /// You can use this getter to query the size and orientation of the screen, as well as other media parameters.
  /// When that information changes, your widget will be scheduled to be rebuilt, keeping your widget up-to-date.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// The horizontal extent of the screen size.
  double get screenWidth => mediaQuery.size.width;

  /// The vertical extent of the screen size.
  double get screenHeight => mediaQuery.size.height;

  /// Whether the device is in landscape mode.
  bool get screenIsLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Whether the device is in portrait mode.
  bool get screenIsPortrait => mediaQuery.orientation == Orientation.portrait;

  /// Returns the correct [FormFactor] based on the [ScreenWidthBreakpoints].
  ///
  /// If [followDeviceOrientation] is true (default) the devices screen width
  /// is compared with the [ScreenWidthBreakpoints]. This means the [FormFactor]
  /// changes when the device orientation changes.
  ///
  ///
  /// If [followDeviceOrientation] is false the devices shortest side
  /// is compared with the [ScreenWidthBreakpoints]. This means the [FormFactor]
  /// does not change when the device orientation changes.
  FormFactor formFactor({bool followDeviceOrientation = true}) {
    final width = followDeviceOrientation
        ? mediaQuery.size.width
        : mediaQuery.size.shortestSide;

    return width > ScreenWidthBreakpoints.desktop
        ? FormFactor.desktop
        : width > ScreenWidthBreakpoints.tablet
            ? FormFactor.tablet
            : FormFactor.mobile;
  }

  /// Returns either onMobile, onTablet or onDesktop depending on the current [formFactor].
  ///
  /// For notes on [followDeviceOrientation] see [formFactor].
  ///
  /// Example:
  /// ```dart
  /// int columns = context.byFormFactor<int>(onMobile: 1, onTablet: 2, onDesktop: 4);
  /// ```
  T byFormFactor<T>({
    required T onMobile,
    required T onTablet,
    required T onDesktop,
    bool followDeviceOrientation = true,
  }) {
    final formFactor =
        this.formFactor(followDeviceOrientation: followDeviceOrientation);

    return formFactor.isMobile
        ? onMobile
        : formFactor.isTablet
            ? onTablet
            : onDesktop;
  }
}
