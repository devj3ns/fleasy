import 'package:flutter/material.dart';

/// Class which defines the form factor breakpoints:
///
/// Desktop = 900
/// Tablet = 600
/// Handset = 300
class FormFactorBreakpoints {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

/// Enum which defines the possible form factors.
enum FormFactor { desktop, tablet, handset, watch }

extension FormFactorExtensions on FormFactor {
  /// Whether `context.formFactor` is equal to `FormFactor.desktop`.
  bool get isDesktop => this == FormFactor.desktop;

  /// Whether `context.formFactor` is equal to `FormFactor.tablet`.
  bool get isTablet => this == FormFactor.tablet;

  /// Whether `context.formFactor` is equal to `FormFactor.handset`.
  bool get isHandset => this == FormFactor.handset;

  /// Whether `context.formFactor` is equal to `FormFactor.watch`.
  bool get isWatch => this == FormFactor.watch;
}

/// Alternative to [FormFactor], which is more abstract and defines it in terms of small to large.
enum ScreenSize { small, normal, large, extraLarge }

extension ScreenSizeExtensions on ScreenSize {
  /// Whether `context.screenSize` is equal to `ScreenSize.small`.
  bool get isSmall => this == ScreenSize.small;

  /// Whether `context.screenSize` is equal to `ScreenSize.normal`.
  bool get isNormal => this == ScreenSize.normal;

  /// Whether `context.screenSize` is equal to `ScreenSize.large`.
  bool get isLarge => this == ScreenSize.large;

  /// Whether `context.screenSize` is equal to `ScreenSize.extraLarge`.
  bool get isExtraLarge => this == ScreenSize.extraLarge;
}

extension BuildContextExtensions on BuildContext {
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

  /// Returns the correct [FormFactor] based on the [FormFactorBreakpoints].
  FormFactor get formFactor {
    // Use shortestScreenSide to detect device type regardless of orientation
    final deviceWidth = mediaQuery.size.shortestSide;

    return deviceWidth > FormFactorBreakpoints.desktop
        ? FormFactor.desktop
        : deviceWidth > FormFactorBreakpoints.tablet
            ? FormFactor.tablet
            : deviceWidth > FormFactorBreakpoints.handset
                ? FormFactor.handset
                : FormFactor.watch;
  }

  /// Returns the correct [ScreenSize] based on the [FormFactorBreakpoints].
  ScreenSize get screenSize {
    // Use .shortestScreenSide to detect device type regardless of orientation
    final deviceWidth = mediaQuery.size.shortestSide;

    return deviceWidth > FormFactorBreakpoints.desktop
        ? ScreenSize.extraLarge
        : deviceWidth > FormFactorBreakpoints.tablet
            ? ScreenSize.large
            : deviceWidth > FormFactorBreakpoints.handset
                ? ScreenSize.normal
                : ScreenSize.small;
  }

  /// Returns the given onWatch, onHandset, onTablet or onDesktop depending on the current [formFactor].
  ///
  /// Example:
  /// ```dart
  /// int width = context.byFormFactor<int>(onHandset: 10, onTablet: 25, onDesktop: 50);
  /// ```
  T byFormFactor<T>({
    T? onWatch,
    required T onHandset,
    required T onTablet,
    required T onDesktop,
  }) {
    return formFactor.isWatch
        ? onWatch ?? onHandset
        : formFactor.isHandset
            ? onHandset
            : formFactor.isTablet
                ? onTablet
                : onDesktop;
  }
}
