import 'package:flutter/foundation.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Widget used by the [EasyFutureBuilder] and [EasyStreamBuilder] to show
/// that the [Future]/[Stream]'s data is empty or has an error.
///
/// It shows an icon, a text and an error message
/// (if one is defined and the app runs in debug mode).
class SnapshotStateInfo extends StatelessWidget {
  const SnapshotStateInfo({
    required this.text,
    this.textStyle,
    required this.icon,
    this.iconStyle,
    this.errorMessage,
  });

  /// The text shown under the [icon].
  final String text;

  /// The [TextStyle] for the [text].
  ///
  /// By default the bodyText2 text style of your [TextTheme] is used.
  final TextStyle? textStyle;

  /// The icon shown above the [text].
  final IconData icon;

  /// The [IconThemeData] for the [icon].
  ///
  /// By default the [IconThemeData] of your [ThemeData] is used
  /// (with an overwritten size value of 40).
  final IconThemeData? iconStyle;

  /// The error message shown under the [text].
  ///
  /// NOTE: For safety reasons the error message is only shown in debug mode.
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Insets.m),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: iconStyle?.color,
              size: iconStyle?.size ?? 40,
            ),
            const SizedBox(height: Insets.m),
            SelectableText(
              text,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
            if (kDebugMode && errorMessage.isNotBlank) ...[
              const SizedBox(height: Insets.m),
              SelectableText(
                errorMessage!,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
