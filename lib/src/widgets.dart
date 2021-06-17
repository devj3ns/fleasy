import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'adaptive_helpers.dart';

/// This widget makes it easy to display the various states of getting data via a [Stream].
///
/// Currently the snapshot data has to be of type iterable or map.
class EasyStreamBuilder<T> extends StatelessWidget {
  const EasyStreamBuilder({
    required this.stream,
    required this.errorText,
    required this.noDataText,
    this.noDataIcon,
    required this.builder,
    this.loadingIndicator = const CircularProgressIndicator(),
    this.color = Colors.black,
  });

  final Stream<T> stream;
  final String errorText;
  final String noDataText;
  final IconData? noDataIcon;
  final Widget Function(BuildContext context, T data) builder;
  final Widget loadingIndicator;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SnapshotHasError(
            text: errorText,
            errorMessage: snapshot.error.toString(),
            color: color,
          );
        } else if (!snapshot.hasData) {
          return snapshot.connectionState == ConnectionState.waiting
              ? loadingIndicator
              : SnapshotHasError(
                  text: errorText,
                  errorMessage: snapshot.error?.toString() ?? '',
                  color: color,
                );
        } else {
          assert(
            snapshot.data is Iterable || snapshot.data is Map,
            'The stream must be of type Iterable or Map!',
          );

          try {
            late final bool noData;

            if (snapshot.data is Iterable) {
              noData = (snapshot.data as Iterable).isEmpty;
            } else if (snapshot.data is Map) {
              noData = (snapshot.data as Map).isEmpty;
            }

            return noData
                ? SnapshotHasNoData(
                    text: noDataText,
                    iconData: noDataIcon,
                    color: color,
                  )
                : builder(context, snapshot.data as T);
          } catch (e) {
            return SnapshotHasError(
              text: errorText,
              errorMessage: e.toString(),
              color: color,
            );
          }
        }
      },
    );
  }
}

/// This widget makes it easy to display the various states of getting data via a [Future].
///
/// Currently the snapshot data has to be of type iterable or map.
class EasyFutureBuilder<T> extends StatelessWidget {
  const EasyFutureBuilder({
    required this.future,
    required this.errorText,
    required this.noDataText,
    required this.noDataIcon,
    required this.builder,
    this.loadingIndicator = const CircularProgressIndicator(),
    this.color = Colors.black,
  });

  final Future<T> future;
  final String errorText;
  final String noDataText;
  final IconData noDataIcon;
  final Widget Function(BuildContext context, T data) builder;
  final Widget loadingIndicator;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SnapshotHasError(
            text: errorText,
            errorMessage: snapshot.error.toString(),
            color: color,
          );
        } else if (!snapshot.hasData) {
          return snapshot.connectionState == ConnectionState.waiting
              ? loadingIndicator
              : SnapshotHasError(
                  text: errorText,
                  errorMessage: snapshot.error?.toString() ?? '',
                  color: color,
                );
        } else {
          assert(
            snapshot.data is Iterable || snapshot.data is Map,
            'The future must be of type Iterable or Map!',
          );

          try {
            late final bool noData;

            if (snapshot.data is Iterable) {
              noData = (snapshot.data as Iterable).isEmpty;
            } else if (snapshot.data is Map) {
              noData = (snapshot.data as Map).isEmpty;
            }

            return noData
                ? SnapshotHasNoData(
                    text: noDataText,
                    iconData: noDataIcon,
                    color: color,
                  )
                : builder(context, snapshot.data as T);
          } catch (e) {
            return SnapshotHasError(
              text: errorText,
              errorMessage: e.toString(),
              color: color,
            );
          }
        }
      },
    );
  }
}

/// This widget can be used to show that there is an error.
class SnapshotHasError extends StatelessWidget {
  const SnapshotHasError({
    required this.text,
    required this.errorMessage,
    this.color = Colors.black,
  });

  final String text;
  final String errorMessage;
  final Color color;

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
              FontAwesomeIcons.exclamationCircle,
              size: 55,
              color: color,
            ),
            const SizedBox(height: Insets.m),
            SelectableText(
              text,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(color: color),
              textAlign: TextAlign.center,
            ),
            if (kDebugMode)
              Padding(
                padding: const EdgeInsets.all(Insets.m),
                child: SelectableText(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: color),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// This widget can be used to show that there is no data.
class SnapshotHasNoData extends StatelessWidget {
  const SnapshotHasNoData({
    required this.text,
    this.iconData,
    this.color = Colors.black,
  });

  final String text;
  final IconData? iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.m),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null) ...[
              Padding(
                padding: const EdgeInsets.all(Insets.xxl),
                child: FaIcon(
                  iconData,
                  size: 50,
                  color: color,
                ),
              ),
            ],
            SelectableText(
              text,
              style: TextStyle(color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
