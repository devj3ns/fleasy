import 'package:flutter/material.dart';

class FormFactorBreakpoints {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

enum FormFactor { desktop, tablet, handset, watch }

extension ContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  Orientation get screenOrientation => mediaQuery.orientation;

  bool get screenIsLandscape => mediaQuery.orientation == Orientation.landscape;

  bool get screenIsPortrait => mediaQuery.orientation == Orientation.portrait;

  FormFactor get formFactor {
    // Use .shortestSide to detect device type regardless of orientation
    final deviceWidth = MediaQuery.of(this).size.shortestSide;
    if (deviceWidth > FormFactorBreakpoints.desktop) return FormFactor.desktop;
    if (deviceWidth > FormFactorBreakpoints.tablet) return FormFactor.tablet;
    if (deviceWidth > FormFactorBreakpoints.handset) return FormFactor.handset;

    return FormFactor.watch;
  }

  void closeKeyboard() => FocusScope.of(this).requestFocus(FocusNode());

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
