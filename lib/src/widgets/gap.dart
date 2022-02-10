import 'package:flutter/material.dart';

/// A wrapper around SizedBox for making consistent gaps.
///
/// By using [Gap] instead of [SizedBox] you have to write less code and your UI
/// looks more consistent because you have a strict set of values to choose from.
///
/// Examples:
/// Gap.w4() = SizedBox(width: 4.0)
/// Gap.h8() = SizedBox(height: 8.0)
class Gap extends StatelessWidget {
  /// A gap with a width of 2
  const Gap.w2({Key? key})
      : width = 2,
        height = 0,
        super(key: key);

  /// A gap with a width of 4
  const Gap.w4({Key? key})
      : width = 4,
        height = 0,
        super(key: key);

  /// A gap with a width of 8
  const Gap.w8({Key? key})
      : width = 8,
        height = 0,
        super(key: key);

  /// A gap with a width of 12
  const Gap.w12({Key? key})
      : width = 12,
        height = 0,
        super(key: key);

  /// A gap with a width of 16
  const Gap.w16({Key? key})
      : width = 16,
        height = 0,
        super(key: key);

  /// A gap with a width of 32
  const Gap.w32({Key? key})
      : width = 32,
        height = 0,
        super(key: key);

  /// A gap with a height of 2
  const Gap.h2({Key? key})
      : width = 0,
        height = 2,
        super(key: key);

  /// A gap with a height of 4
  const Gap.h4({Key? key})
      : width = 0,
        height = 4,
        super(key: key);

  /// A gap with a height of 8
  const Gap.h8({Key? key})
      : width = 0,
        height = 8,
        super(key: key);

  /// A gap with a height of 12
  const Gap.h12({Key? key})
      : width = 0,
        height = 12,
        super(key: key);

  /// A gap with a height of 16
  const Gap.h16({Key? key})
      : width = 0,
        height = 16,
        super(key: key);

  /// A gap with a height of 32
  const Gap.h32({Key? key})
      : width = 0,
        height = 32,
        super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
