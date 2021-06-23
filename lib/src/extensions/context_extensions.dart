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

/// Alternative to [FormFactor], which is more abstract and defines it in terms of small to large.
enum ScreenSize { small, normal, large, extraLarge }

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
