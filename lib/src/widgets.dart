import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'adaptive_helpers.dart';

/// A wrapper around [StreamBuilder] which makes it easy to display
/// the various states of loading data from the given [Stream].
///
/// There are 4 possible states:
/// 1. Snapshot is loading:
/// --> shows the [loadingIndicator].
///
/// 2. Snapshot has data:
/// --> shows the widget returned by the [dataBuilder].
///
/// 3. Snapshot is empty (data == null or data.isEmpty() on Map & Iterable):
/// --> shows the [isEmptyText] and [isEmptyIcon].
///
/// 4. Snapshot has an error:
/// --> shows the [errorText] and [errorIcon] and the error message.
/// NOTE: For safety reasons the snapshots error message is only shown in debug mode.
class EasyStreamBuilder<T> extends StatelessWidget {
  /// Creates an [EasyStreamBuilder] which is an wrapper around [StreamBuilder]
  /// that makes it easy to display the various states of loading data
  /// from the given [Stream].
  const EasyStreamBuilder({
    required this.stream,
    required this.dataBuilder,
    this.errorText = 'Oops, something went wrong.',
    this.errorIcon = const FaIcon(FontAwesomeIcons.exclamationCircle),
    this.isEmptyText = 'There is nothing to display.',
    this.isEmptyIcon = const FaIcon(FontAwesomeIcons.timesCircle),
    this.loadingIndicator = const CircularProgressIndicator(),
  });

  /// The asynchronous computation to which this builder is currently connected.
  final Stream<T> stream;

  /// The widget which displays the snapshot's data when it's loaded.
  final Widget Function(BuildContext context, T data) dataBuilder;

  /// The text which is shown when the snapshot has an error.
  final String errorText;

  /// The icon which is shown when the snapshot has an error.
  final FaIcon errorIcon;

  /// The text which is shown when the snapshot has no data.
  final String isEmptyText;

  /// The icon which is shown when the snapshot has no data.
  final FaIcon isEmptyIcon;

  /// The widget which is shown while fetching the snapshots data.
  final Widget loadingIndicator;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _SnapshotHasErrorWarning(
            text: errorText,
            icon: errorIcon,
            errorMessage: snapshot.error.toString(),
          );
        } else if (!snapshot.hasData) {
          return snapshot.connectionState == ConnectionState.waiting
              ? loadingIndicator
              : snapshot.data == null
                  ? _SnapshotIsEmptyWarning(
                      text: isEmptyText,
                      icon: isEmptyIcon,
                    )
                  : _SnapshotHasErrorWarning(
                      text: errorText,
                      icon: errorIcon,
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
              ? _SnapshotIsEmptyWarning(
                  text: isEmptyText,
                  icon: isEmptyIcon,
                )
              : dataBuilder(context, snapshot.data as T);
        }
      },
    );
  }
}

/// A wrapper around [FutureBuilder] which makes it easy to display
/// the various states of loading data from the given [Future].
///
/// There are 4 possible states:
/// 1. Snapshot is loading:
/// --> shows the [loadingIndicator].
///
/// 2. Snapshot has data:
/// --> shows the widget returned by the [dataBuilder].
///
/// 3. Snapshot is empty (data == null or data.isEmpty() on Map & Iterable):
/// --> shows the [isEmptyText] and [isEmptyIcon].
///
/// 4. Snapshot has an error:
/// --> shows the [errorText] and [errorIcon] and the error message.
/// NOTE: For safety reasons the snapshots error message is only shown in debug mode.
class EasyFutureBuilder<T> extends StatelessWidget {
  /// Creates an [EasyFutureBuilder] which is an wrapper around [FutureBuilder]
  /// that makes it easy to display the various states of loading
  /// data from the given [Future].
  const EasyFutureBuilder({
    required this.future,
    required this.dataBuilder,
    this.errorText = 'Oops, something went wrong.',
    this.errorIcon = const FaIcon(FontAwesomeIcons.exclamationCircle),
    this.isEmptyText = 'There is nothing to display.',
    this.isEmptyIcon = const FaIcon(FontAwesomeIcons.timesCircle),
    this.loadingIndicator = const CircularProgressIndicator(),
  });

  /// The asynchronous computation to which this builder is currently connected.
  final Future<T> future;

  /// The widget which displays the snapshot's data when it's loaded.
  final Widget Function(BuildContext context, T data) dataBuilder;

  /// The text which is shown when the snapshot has an error.
  final String errorText;

  /// The icon which is shown when the snapshot has an error.
  final FaIcon errorIcon;

  /// The text which is shown when the snapshot has no data.
  final String isEmptyText;

  /// The icon which is shown when the snapshot has no data.
  final FaIcon isEmptyIcon;

  /// The widget which is shown while fetching the snapshots data.
  final Widget loadingIndicator;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _SnapshotHasErrorWarning(
            text: errorText,
            icon: errorIcon,
            errorMessage: snapshot.error.toString(),
          );
        } else if (!snapshot.hasData) {
          return snapshot.connectionState == ConnectionState.waiting
              ? loadingIndicator
              : snapshot.data == null
                  ? _SnapshotIsEmptyWarning(
                      text: isEmptyText,
                      icon: isEmptyIcon,
                    )
                  : _SnapshotHasErrorWarning(
                      text: errorText,
                      icon: errorIcon,
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
              ? _SnapshotIsEmptyWarning(
                  text: isEmptyText,
                  icon: isEmptyIcon,
                )
              : dataBuilder(context, snapshot.data as T);
        }
      },
    );
  }
}

class _SnapshotHasErrorWarning extends StatelessWidget {
  const _SnapshotHasErrorWarning({
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

class _SnapshotIsEmptyWarning extends StatelessWidget {
  const _SnapshotIsEmptyWarning({
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
