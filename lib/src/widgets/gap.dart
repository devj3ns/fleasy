import 'package:flutter/material.dart';

/// A wrapper around SizedBox for making consistent gaps.
///
/// By using [Gap] instead of [SizedBox] you have to write less code and your UI
/// looks more consistent because you have a strict set of values to choose from.
///
/// Examples:
/// Gap.w4() = SizedBox(width: 4.0)
/// Gap.h8() = SizedBox(height: 8.0)
class Gap extends SizedBox {
  /// A gap with a width of 2
  const Gap.w2({super.key, super.width = 2});

  /// A gap with a width of 4
  const Gap.w4({super.key, super.width = 4});

  /// A gap with a width of 8
  const Gap.w8({super.key, super.width = 8});

  /// A gap with a width of 12
  const Gap.w12({super.key, super.width = 12});

  /// A gap with a width of 16
  const Gap.w16({super.key, super.width = 16});

  /// A gap with a width of 16
  const Gap.w32({super.key, super.width = 32});

  /// A gap with a height of 2
  const Gap.h2({super.key, super.height = 2});

  /// A gap with a height of 4
  const Gap.h4({super.key, super.height = 4});

  /// A gap with a height of 8
  const Gap.h8({super.key, super.height = 8});

  /// A gap with a height of 12
  const Gap.h12({super.key, super.height = 12});

  /// A gap with a height of 16
  const Gap.h16({super.key, super.height = 16});

  /// A gap with a height of 32
  const Gap.h32({super.key, super.height = 32});
}
