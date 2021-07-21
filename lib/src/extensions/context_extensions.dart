import 'package:flash/flash.dart';
import 'package:fleasy/fleasy.dart';
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

extension AdpativeContextExtensions on BuildContext {
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

  /// Returns onWatch, onHandset, onTablet or onDesktop depending on the current [formFactor].
  ///
  /// Example:
  /// ```dart
  /// double width = context.byFormFactor<double>(onHandset: 10, onTablet: 25, onDesktop: 50);
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

extension NavigationContextExtensions on BuildContext {
  /// Push the given page onto the navigator.
  void pushPage(
    Widget page, {
    bool dismissKeyboard = true,
    bool avoidDuplicatePage = true,
  }) {
    pushRoute(
      MaterialPageRoute<Widget>(builder: (context) => page),
      dismissKeyboard: dismissKeyboard,
      avoidDuplicateRoute: avoidDuplicatePage,
    );
  }

  /// Push the given route onto the navigator.
  void pushRoute(
    Route route, {
    bool dismissKeyboard = true,
    bool avoidDuplicateRoute = true,
  }) {
    if (dismissKeyboard) this.dismissKeyboard();

    if (avoidDuplicateRoute && route.isCurrent) {
      debugPrint(
          'INFO: New route is not pushed because it is already the current route!');
    } else {
      Navigator.of(this).push<void>(route);
    }
  }

  /// Pop the top-most route off the navigator and dismiss the keyboard.
  void popPage({bool dismissKeyboard = true}) {
    if (dismissKeyboard) this.dismissKeyboard();
    Navigator.of(this).pop();
  }

  /// Whether the navigator can be popped.
  bool canPopPage() => Navigator.of(this).canPop();

  /// Dismisses the keyboard
  /// (by removing the focus on this node by moving the primary focus to another node).
  void dismissKeyboard() => FocusScope.of(this).unfocus();
}

extension FlashbarContextExtensions on BuildContext {
  void _showFlashbar(
    String message, {
    required Color iconColor,
    required IconData icon,
    int duration = 3,
  }) {
    showFlash<Flash>(
      context: this,
      duration: Duration(seconds: duration),
      transitionDuration: const Duration(milliseconds: 750),
      builder: (context, controller) {
        return Flash<Flash>.bar(
          controller: controller,
          backgroundColor: const Color(0xFF303030),
          borderRadius: BorderRadius.circular(10),
          margin: const EdgeInsets.all(Insets.l),
          child: FlashBar(
            content: Text(
              message,
              style: const TextStyle(fontSize: 14.0, color: Colors.white),
            ),
            icon: Icon(
              icon,
              color: iconColor,
              size: 28,
            ),
          ),
        );
      },
    );
  }

  /// Shows a success flashbar/toast with a customizable text.
  ///
  /// It uses [flash](https://pub.dev/packages/flash).
  void showSuccessFlashbar({
    required String message,
    int duration = 3,
  }) {
    _showFlashbar(
      message,
      duration: duration,
      icon: Icons.check_rounded,
      iconColor: Colors.green[400]!,
    );
  }

  /// Shows an info flashbar/toast with a customizable text.
  ///
  /// It uses [flash](https://pub.dev/packages/flash).
  void showInfoFlashbar({
    required String message,
    int duration = 3,
  }) {
    _showFlashbar(
      message,
      duration: duration,
      icon: Icons.info_outline_rounded,
      iconColor: Colors.blue[400]!,
    );
  }

  /// Shows an error flashbar/toast with a customizable text (optional).
  ///
  /// It uses [flash](https://pub.dev/packages/flash).
  void showErrorFlashbar({
    String message = 'Oops, something went wrong.',
    int duration = 3,
  }) {
    _showFlashbar(
      message,
      duration: duration,
      icon: Icons.error_outline_rounded,
      iconColor: Colors.red[400]!,
    );
  }

  /// Shows a no connection flashbar/toast with a customizable text (optional).
  ///
  /// It uses [flash](https://pub.dev/packages/flash).
  void showNoConnectionFlashbar({
    String message =
        'A connection to the server cannot be established. Are you connected to the internet?',
    int duration = 3,
  }) {
    _showFlashbar(
      message,
      duration: duration,
      icon: Icons.wifi_off_rounded,
      iconColor: Colors.red[400]!,
    );
  }
}
