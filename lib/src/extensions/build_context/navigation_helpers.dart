import 'package:flutter/material.dart';

extension NavigationHelpers on BuildContext {
  /// Push the given page onto the navigator.
  Future<void> pushPage<T extends Object?>(
    Widget page, {
    bool dismissKeyboard = true,
    bool avoidDuplicatePage = true,
  }) async {
    await pushRoute<T>(
      MaterialPageRoute<T>(builder: (context) => page),
      dismissKeyboard: dismissKeyboard,
      avoidDuplicateRoute: avoidDuplicatePage,
    );
  }

  /// Push the given route onto the navigator.
  Future<void> pushRoute<T extends Object?>(
    Route<T> route, {
    bool dismissKeyboard = true,
    bool avoidDuplicateRoute = true,
  }) async {
    if (dismissKeyboard) this.dismissKeyboard();

    if (avoidDuplicateRoute && route.isCurrent) {
      debugPrint(
          'INFO: New route is not pushed because it is already the current route!');
    } else {
      await Navigator.of(this).push<T>(route);
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
