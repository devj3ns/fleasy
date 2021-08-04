import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'snapshot_state_info.dart';

/// A wrapper around [FutureBuilder] which makes it easy to display
/// the various states of fetching data asynchronous.
///
/// There are 4 possible states:
/// 1. The snapshot is loading:
/// --> shows the [loadingIndicator].
///
/// 2. The snapshot is loaded:
/// --> shows the widget returned by the [dataBuilder].
///
/// 3. The snapshots data is loaded but empty (only works on Iterable/Map):
/// --> shows [SnapshotStateInfo] with the [isEmptyText] and [isEmptyIcon].
///
/// 4. The snapshot has an error:
/// --> shows [SnapshotStateInfo] with the [errorText], [errorIcon] and the error message.
/// NOTE: For safety reasons the snapshots error message is only shown in debug mode.
///
/// Have a look at the [example](https://github.com/devj3ns/fleasy/blob/main/example/lib/main.dart) to see this widget in action.
class EasyFutureBuilder<T> extends StatelessWidget {
  /// Creates an [EasyFutureBuilder] which is a wrapper around [FutureBuilder]
  /// that makes it easy to display the various states of fetching data asynchronous.
  ///
  /// See the [documentation page](https://pub.dev/documentation/fleasy/latest/fleasy/EasyFutureBuilder-class.html) for more details.
  const EasyFutureBuilder({
    Key? key,
    required this.future,
    required this.dataBuilder,
    this.errorText = 'Oops, something went wrong.',
    this.errorIcon = Icons.error_rounded,
    this.isEmptyText = 'There is nothing to display.',
    this.isEmptyIcon = Icons.close_rounded,
    this.textStyle,
    this.iconStyle,
    this.loadingIndicator = const CircularProgressIndicator(),
  }) : super(key: key);

  /// The asynchronous computation to which this builder is currently connected.
  final Future<T> future;

  /// The widget which displays the snapshot's data when it's loaded.
  final Widget Function(BuildContext context, T data) dataBuilder;

  /// The text which is shown when the snapshot has an error.
  ///
  /// The style is taken from the [TextTheme] (bodyText2) of your [ThemeData]
  /// or - if defined - from [textStyle].
  final String errorText;

  /// The icon which is shown when the snapshot has an error.
  ///
  /// The style is taken from the [IconThemeData] of your [ThemeData]
  /// or - if defined - from [iconStyle].
  final IconData errorIcon;

  /// The text which is shown when the snapshots data is empty.
  ///
  /// The style is taken from the [TextTheme] (bodyText2) of your [ThemeData]
  /// or - if defined - from [textStyle].
  final String isEmptyText;

  /// The icon which is shown when the snapshots data is empty.
  ///
  /// The style is taken from the [IconThemeData] of your [ThemeData]
  /// or - if defined - from [iconStyle].
  final IconData isEmptyIcon;

  /// TextStyle used for the  [isEmptyText], [errorText] and error message.
  ///
  /// By default the [TextTheme] (bodyText2) of your [ThemeData] is used.
  final TextStyle? textStyle;

  /// [IconThemeData] used for the [isEmptyIcon].
  ///
  /// By default the [IconThemeData] of your [ThemeData] is used.
  final IconThemeData? iconStyle;

  /// The widget which is shown while fetching the snapshots data.
  final Widget loadingIndicator;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          if (kDebugMode) {
            throw (snapshot.error!);
          }

          return SnapshotStateInfo(
            text: errorText,
            textStyle: textStyle,
            icon: errorIcon,
            iconStyle: iconStyle,
            errorMessage: snapshot.error.toString(),
          );
        } else if (!snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingIndicator;
          } else if (snapshot.data == null && null is T) {
            return dataBuilder(context, snapshot.data as T);
          } else {
            if (kDebugMode) {
              throw (snapshot.error!);
            }

            return SnapshotStateInfo(
              text: errorText,
              textStyle: textStyle,
              icon: errorIcon,
              iconStyle: iconStyle,
              errorMessage: snapshot.error?.toString(),
            );
          }
        } else {
          final isEmpty = snapshot.data is Iterable
              ? (snapshot.data as Iterable).isEmpty
              : snapshot.data is Map
                  ? (snapshot.data as Map).isEmpty
                  : false;

          return isEmpty
              ? SnapshotStateInfo(
                  text: isEmptyText,
                  textStyle: textStyle,
                  icon: isEmptyIcon,
                  iconStyle: iconStyle,
                )
              : dataBuilder(context, snapshot.data as T);
        }
      },
    );
  }
}
