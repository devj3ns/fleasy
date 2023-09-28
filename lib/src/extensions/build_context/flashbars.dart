import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../../helper_classes/helper_classes.dart';

extension FlashbarHelpers on BuildContext {
  Future<void> _showFlashbar(
    String message, {
    Color? iconColor,
    required IconData icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    return showFlash(
      context: this,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          content: Text(
            message,
            style: Theme.of(this).textTheme.bodyMedium,
          ),
          icon: Icon(
            icon,
            color: iconColor,
            size: Theme.of(this).iconTheme.size ?? 25,
          ),
          controller: controller,
          backgroundColor: Theme.of(this).dialogBackgroundColor,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Insets.l),
          ),
          margin: const EdgeInsets.all(Insets.l),
        );
      },
    );
  }

  /// Shows a success flashbar/toast with a customizable info message.
  ///
  /// It uses the following theme values for styling:
  /// - dialogBackgroundColor
  /// - textTheme.bodyText2
  /// - iconTheme.size
  Future<void> showSuccessFlashbar({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    return _showFlashbar(
      message,
      duration: duration,
      icon: Icons.check_rounded,
      iconColor: Colors.green.shade400,
    );
  }

  /// Shows an info flashbar/toast with a customizable info message.
  ///
  /// It uses the following theme values for styling:
  /// - dialogBackgroundColor
  /// - textTheme.bodyText2
  /// - iconTheme.size
  Future<void> showInfoFlashbar({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    return _showFlashbar(
      message,
      duration: duration,
      icon: Icons.info_outline_rounded,
      iconColor: Colors.blue.shade400,
    );
  }

  /// Shows an error flashbar/toast with a customizable info message (optional).
  ///
  /// It uses the following theme values for styling:
  /// - dialogBackgroundColor
  /// - textTheme.bodyText2
  /// - iconTheme.size
  Future<void> showErrorFlashbar({
    String message = 'Oops, something went wrong.',
    Duration duration = const Duration(seconds: 3),
  }) {
    return _showFlashbar(
      message,
      duration: duration,
      icon: Icons.error_outline_rounded,
      iconColor: Colors.red.shade400,
    );
  }

  /// Shows a no connection flashbar/toast with a customizable info message (optional).
  ///
  /// It uses the following theme values for styling:
  /// - dialogBackgroundColor
  /// - textTheme.bodyText2
  /// - iconTheme.size
  Future<void> showNoConnectionFlashbar({
    String message =
        'No internet connection. Please turn on Wi-Fi or cellular data.',
    Duration duration = const Duration(seconds: 3),
  }) {
    return _showFlashbar(
      message,
      duration: duration,
      icon: Icons.wifi_off_rounded,
      iconColor: Colors.red.shade400,
    );
  }
}
