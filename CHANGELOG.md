# 0.14.0
- Bump dart-sdk to `>=2.17.1`
- Bump dart_code_metrics to `^4.15.2`
- Bump flutter_lints to `^2.0.1`
- New rule and lints:
  - [prefer-immediate-return](https://dartcodemetrics.dev/docs/rules/common/prefer-immediate-return)
  - [use_super_parameters](https://dart-lang.github.io/linter/lints/use_super_parameters.html)
  - [avoid_returning_this](https://dart-lang.github.io/linter/lints/avoid_returning_this.html)
  - [prefer_mixin](https://dart-lang.github.io/linter/lints/prefer_mixin.html)
  - [sized_box_shrink_expand](https://dart-lang.github.io/linter/lints/sized_box_shrink_expand.html)
  - [unnecessary_parenthesis](https://dart-lang.github.io/linter/lints/unnecessary_parenthesis.html)
  - [unnecessary_raw_strings](https://dart-lang.github.io/linter/lints/unnecessary_raw_strings.html)
  - [use_enums](https://dart-lang.github.io/linter/lints/use_enums.html)
  - [use_colored_box](https://dart-lang.github.io/linter/lints/use_colored_box.html)
  - [use_decorated_box](https://dart-lang.github.io/linter/lints/use_decorated_box.html)
  - [use_if_null_to_convert_nulls_to_bools](https://dart-lang.github.io/linter/lints/use_if_null_to_convert_nulls_to_bools.html)
  - [use_is_even_rather_than_modulo](https://dart-lang.github.io/linter/lints/use_is_even_rather_than_modulo.html)
  - [use_string_buffers](https://dart-lang.github.io/linter/lints/use_string_buffers.html)
  - [use_to_and_as_if_applicable](https://dart-lang.github.io/linter/lints/use_to_and_as_if_applicable.html)

# 0.13.0
- Disable analysis/metrics in generated files [#8](https://github.com/devj3ns/fleasy/pull/8)

# 0.12.1
- Update dependencies
- Make ScreenWidthBreakpoints constants

# 0.12.0
- **Add** more [dart_code_metrics](https://pub.dev/packages/dart_code_metrics) rules

# 0.11.0
- **Add** `Gap.w32()` and `Gap.h32()`
- **Remove** `DeviceType` class (Use [universal_platform](https://pub.dev/packages/universal_platform) instead)
- **Revise** adaptive helpers:
  - Remove `context.screenSize` (use `context.formFactor()` instead)
  - Make `context.formFactor` a function with the argument `followDeviceOrientation`
  - Rename `FormFactor.handset` to `FormFactor.mobile`
  - Remove `FormFactor.watch`
  - Rename `FormFactorBreakpoints` to `ScreenWidthBreakpoints`

# 0.10.0
- **Add** `Gap` widget

# 0.9.0
- **Improve** navigation helpers
- **Remove:** `prefer-extracting-callbacks` lint rule

# 0.8.0
- **Add:** shadow to flasbars

# 0.7.1
- **Fix:** Add `prefer_relative_imports` lint rule

# 0.7.0
- **Add** theme helpers/extensions on `BuildContext`
- **Add** `prefer_relative_imports` lint rule
- **Breaking:** remove extensions on `List<DateTime>`

# 0.6.0
- Make flashbars more customizable (via theme)
- Add more dart code metric rules

# 0.5.0
- **`EasyStreamBuilder` & `EasyFutureBuilder`:**
  - When the snapshot's data is `null` (and `T` is nullable), it will now show the widget returned by the `dataBuilder`. Before, it showed the `isEmptyText` and `isEmptyIcon`.
  - When the snapshot has an error in debug mode, it will now `throw` the error to give more insights. Before, it just displayed the error as a text.

# 0.4.1
- **Fix:** `isEmail` is now case insensitive
- **Improve** README and doc comments

# 0.4.0
- **Add** `byFormFactor<T>` to extensions on `BuildContext` (see [docs](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/byFormFactor.html))
- **Add** helper getters to `context.formFactor` & `context.screenSize` enums

# 0.3.2
- **Add** logo
- **Add** GitHub workflow for automatically publishing new versions to pub.dev on a new release

# 0.3.1
- **Improve** analysis options
- **Add** key to widget constructors
- **Export** `analysis_options.yaml` (see [new section in README](https://pub.dev/packages/fleasy#analysis-options))

# 0.3.0

- **Add** Flashbar extensions to `BuildContext`
    - `showSuccessFlashbar(...)`
    - `showInfoFlashbar(...)`
    - `showErrorFlashbar(...)`
    - `showNoConnectionFlashbar(...)`
- **Add** `addHtpps` to string extensions
- **BREAKING:** Refactor `EasyFutureBuilder` & `EasyStreamBuilder`:
    - `errorIcon` & `isEmptyIcon` now take `IconData` instead of `FaIcon`
    - new attributes: `textStyle` & `iconStyle`
- **BREAKING:** Remove `shortestScreenSide` & `longestScreenSide`
- **Improve** README

# 0.2.2

- **BREAKING:** do whitespace check on `isNotBlank` & `isBlank`
- **Add** `isNotBlank` & `isBlank` to `String` extensions too
- **Add** `isEasyPassword` to `String?` extensions too
- **Add** several tests
- **Improve** doc comments and README

# 0.2.1

- **Add** CI workflow and badge
- **Improve** date_time_test
- **Improve** README

# 0.2.0

- **BREAKING:** Refactor EasyFutureBuilder & EasyStreamBuilder
- **BREAKING:** Rename closeKeyboard() to dismissKeyboard() on BuildContext extensions
- **Add** screenSize, shortestScreenSide & longestScreenSide to BuildContext extensions
- **Add** isUrl, isEasyPassword, isMediumPassword & isStrongPassword to String extensions
- **Add** doc comments
- **Add** example
- **Improve** README

# 0.1.0

- Initial release