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