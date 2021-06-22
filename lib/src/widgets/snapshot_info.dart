import 'package:flutter/foundation.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SnapshotIsEmptyInfo extends StatelessWidget {
  const SnapshotIsEmptyInfo({
    required this.text,
    required this.icon,
  });

  final String text;
  final FaIcon icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Insets.m),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: Insets.m),
            SelectableText(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SnapshotHasErrorInfo extends StatelessWidget {
  const SnapshotHasErrorInfo({
    required this.text,
    required this.errorMessage,
    required this.icon,
  });

  final String text;
  final String errorMessage;
  final FaIcon icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Insets.m),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: Insets.m),
            SelectableText(
              text,
              textAlign: TextAlign.center,
            ),
            if (kDebugMode && errorMessage.isNotEmpty) ...[
              const SizedBox(height: Insets.m),
              SelectableText(
                errorMessage,
                textAlign: TextAlign.center,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
