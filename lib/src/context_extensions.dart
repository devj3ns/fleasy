import 'package:flutter/material.dart';

/// Class which defines the form factor breakpoints.
class FormFactorBreakpoints {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

/// Enum which defines the possible form factors.
enum FormFactor { desktop, tablet, handset, watch }

extension ContextExtensions on BuildContext {
  /// The [MediaQueryData] from the closest instance of this class that encloses the given context.
  ///
  /// You can use this getter to query the size and orientation of the screen, as well as other media parameters.
  /// When that information changes, your widget will be scheduled to be rebuilt, keeping your widget up-to-date.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// The size of the media in logical pixels (e.g, the size of the screen).
  Size get screenSize => mediaQuery.size;

  /// The horizontal extent of this size.
  double get screenWidth => screenSize.width;

  /// The vertical extent of this size.
  double get screenHeight => screenSize.height;

  /// The orientation of the media (e.g., whether the device is in landscape or portrait mode).
  Orientation get screenOrientation => mediaQuery.orientation;

  /// Whether the device is in landscape mode.
  bool get screenIsLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Whether the device is in portrait mode.
  bool get screenIsPortrait => mediaQuery.orientation == Orientation.portrait;

  /// Returns the correct [FormFactor] based on the [FormFactorBreakpoints].
  FormFactor get formFactor {
    // Use .shortestSide to detect device type regardless of orientation
    final deviceWidth = screenSize.shortestSide;

    if (deviceWidth > FormFactorBreakpoints.desktop) return FormFactor.desktop;
    if (deviceWidth > FormFactorBreakpoints.tablet) return FormFactor.tablet;
    if (deviceWidth > FormFactorBreakpoints.handset) return FormFactor.handset;

    return FormFactor.watch;
  }

  /// Closes the keyboard by removing the focus on this node by moving
  /// the primary focus to another node.
  void closeKeyboard() => FocusScope.of(this).unfocus();

  /// Push the given route onto the navigator.
  void pushRoute(
    Route route, {
    bool closeKeyboard = true,
    bool avoidDuplicateRoute = true,
  }) {
    if (closeKeyboard) this.closeKeyboard();

    if (avoidDuplicateRoute && route.isCurrent) {
      debugPrint(
          'INFO: New route is not pushed because it is already the current route!');
    } else {
      Navigator.of(this).push<void>(route);
    }
  }

  /// Push the given page onto the navigator.
  void pushPage(
    Widget page, {
    bool closeKeyboard = true,
    bool avoidDuplicatePage = true,
  }) {
    pushRoute(
      MaterialPageRoute<Widget>(builder: (context) => page),
      closeKeyboard: closeKeyboard,
      avoidDuplicateRoute: avoidDuplicatePage,
    );
  }

  /// Pop the top-most route off the navigator and close the keyboard.
  void popPage() {
    closeKeyboard();
    Navigator.of(this).pop();
  }

  /// Whether the navigator can be popped.
  bool canPopPage() => Navigator.of(this).canPop();
}
