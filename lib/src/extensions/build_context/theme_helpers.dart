import 'package:flutter/material.dart';

extension ThemeHelpers on BuildContext {
  /// The data from the closest Theme instance that encloses the given context.
  ThemeData get theme => Theme.of(this);

  /// Whether the theme brightness is dark.
  bool get isDarkTheme => theme.brightness == Brightness.dark;

  /// Whether the theme brightness is light.
  bool get isLightTheme => theme.brightness == Brightness.light;
}
