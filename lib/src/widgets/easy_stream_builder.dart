import 'package:flutter/material.dart';

import 'snapshot_state_info.dart';

/// A wrapper around [StreamBuilder] which makes it easy to display
/// the various states of streaming data from the given [Stream].
///
/// There are 4 possible states:
/// 1. Snapshot is loading:
/// --> shows the [loadingIndicator].
///
/// 2. Snapshot has data:
/// --> shows the widget returned by the [dataBuilder].
///
/// 3. Snapshot is empty (data == null or data.isEmpty() on Map & Iterable):
/// --> shows [SnapshotStateInfo] with the [isEmptyText] and [isEmptyIcon].
///
/// 4. Snapshot has an error:
/// --> shows [SnapshotStateInfo] with the [errorText], [errorIcon] and the error message.
/// NOTE: For safety reasons the snapshots error message is only shown in debug mode.
///
/// Have a look at the [example](https://github.com/devj3ns/fleasy/blob/main/example/lib/main.dart) to see this widget in action.
class EasyStreamBuilder<T> extends StatelessWidget {
  /// Creates an [EasyStreamBuilder] which is a wrapper around [StreamBuilder]
  /// that makes it easy to display the various states of loading
  /// data from the given [Stream].
  const EasyStreamBuilder({
    required this.stream,
    required this.dataBuilder,
    this.errorText = 'Oops, something went wrong.',
    this.errorIcon = Icons.error_rounded,
    this.isEmptyText = 'There is nothing to display.',
    this.isEmptyIcon = Icons.close_rounded,
    this.textStyle,
    this.iconStyle,
    this.loadingIndicator = const CircularProgressIndicator(),
  });

  /// The asynchronous computation to which this builder is currently connected.
  final Stream<T> stream;

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
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SnapshotStateInfo(
            text: errorText,
            textStyle: textStyle,
            icon: errorIcon,
            iconStyle: iconStyle,
            errorMessage: snapshot.error.toString(),
          );
        } else if (!snapshot.hasData) {
          return snapshot.connectionState == ConnectionState.waiting
              ? loadingIndicator
              : snapshot.data == null
                  ? SnapshotStateInfo(
                      text: isEmptyText,
                      textStyle: textStyle,
                      icon: isEmptyIcon,
                      iconStyle: iconStyle,
                    )
                  : SnapshotStateInfo(
                      text: errorText,
                      textStyle: textStyle,
                      icon: errorIcon,
                      iconStyle: iconStyle,
                      errorMessage: snapshot.error?.toString() ?? '',
                    );
        } else {
          var dataIsEmpty = false;

          if (snapshot.data is Iterable) {
            dataIsEmpty = (snapshot.data as Iterable).isEmpty;
          } else if (snapshot.data is Map) {
            dataIsEmpty = (snapshot.data as Map).isEmpty;
          }

          return dataIsEmpty
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
