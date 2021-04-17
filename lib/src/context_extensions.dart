import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  Orientation get screenOrientation => mediaQuery.orientation;

  bool get screenIsLandscape => mediaQuery.orientation == Orientation.landscape;

  bool get screenIsPortrait => mediaQuery.orientation == Orientation.portrait;

  bool get isDesktop => screenWidth > 1000;

  void closeKeyboard() => FocusScope.of(this).requestFocus(FocusNode());

  /// Push the given route onto the navigator and close the keyboard.
  ///
  /// If cancelIfCurrent is set to true, it will only push the route
  /// if the given route is different from the current route.
  void pushPage(Route route, {bool cancelIfCurrent = false}) {
    closeKeyboard();

    if (cancelIfCurrent && route.isCurrent) {
      print(
          'INFO: New route is not pushed because it is already the current route!');
    } else {
      Navigator.of(this).push<void>(route);
    }
  }

  /// Pop the top-most route off the navigator and close the keyboard.
  void popPage() {
    closeKeyboard();
    Navigator.of(this).pop();
  }

  /// Whether the navigator can be popped.
  bool canPopPage() => Navigator.of(this).canPop();
}
