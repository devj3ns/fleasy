<p align="center">
<a href="https://pub.dev/packages/fleasy" target="_blank"><img src="https://raw.githubusercontent.com/devj3ns/fleasy/main/resources/logo.png" alt="Fleasy Logo" height="120px"></a>
<br>
<a href="https://pub.dev/packages/fleasy"><img src="https://img.shields.io/pub/v/fleasy?color=green" alt="pub.dev badge"></a>
<a href="https://github.com/devj3ns/fleasy/actions/workflows/ci.yml"><img alt="GitHub actions" src="https://github.com/devj3ns/fleasy/actions/workflows/ci.yml/badge.svg"></a>
<a href="https://github.com/devj3ns/fleasy/commits/main"><img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/devj3ns/fleasy?color=blue&label=commits"></a>
<br>
<a href="https://www.buymeacoffee.com/devj3ns" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-blue.png" alt="Buy Me A Coffee" height="42px"></a>
</p>


Fleasy helps create Flutter apps easier by providing **useful and easy to use extensions, helper classes and widgets**.

The goal is that by using this package you have to write less (repeating) and more clean and readable code.

## Overview


- [Extensions on `String` and `String?`](#extensions-on-string-and-string)
- [Extensions on `BuildContext` (Adaptive helpers)](#extensions-on-buildcontext-adaptive-helpers)
- [Extensions on `BuildContext` (Theme helpers)](#extensions-on-buildcontext-theme-helpers)
- [Extensions on `BuildContext` (Navigation helpers)](#extensions-on-buildcontext-navigation-helpers)
- [Extensions on `BuildContext` (Flashbars)](#extensions-on-buildcontext-flashbars)
- [Extensions on `List?`](#extensions-on-list)
- [Extensions on `List`](#extensions-on-list-1)
- [Extensions on `DateTime`](#extensions-on-datetime)
- [`Date` helper class](#date-helper-class)
- [`DeviceType` helper class](#devicetype-helper-class)
- [`Insets` helper class](#insets-helper-class)
- [Flutter Widgets](#flutter-widgets)
- [Analysis Options](#analysis-options)

## Features

All features with links to their page in the documentation:

- ### Extensions on `String` and `String?`:
    Note: All getters also do a null check if used on `String?`.
    - #### [isNotBlank](https://pub.dev/documentation/fleasy/latest/fleasy/StringBlankHelpers/isNotBlank.html)
      Whether the string contains characters except of whitespace characters.
    - #### [isBlank](https://pub.dev/documentation/fleasy/latest/fleasy/StringBlankHelpers/isBlank.html)
      Whether the string is either empty or solely made of whitespace characters.
    - #### [toNullIfBlank()](https://pub.dev/documentation/fleasy/latest/fleasy/NullableStringExtensions/toNullIfBlank.html)
      Returns null if the string `isBlank` or it's text if it `isNotBlank`.
    - #### [isEmail](https://pub.dev/documentation/fleasy/latest/fleasy/StringValidators/isEmail.html)
      Whether the string is a valid email.
    - #### [isUrl](https://pub.dev/documentation/fleasy/latest/fleasy/StringValidators/isUrl.html)
      Whether the string is a valid url.
    - #### [isEasyPassword](https://pub.dev/documentation/fleasy/latest/fleasy/StringValidators/isEasyPassword.html)
      Whether the string is a valid easy password.
    - #### [isMediumPassword](https://pub.dev/documentation/fleasy/latest/fleasy/StringValidators/isMediumPassword.html)
      Whether the string is a valid medium password.
    - #### [isStrongPassword](https://pub.dev/documentation/fleasy/latest/fleasy/StringExtensions/isStrongPassword.html)
      Whether the string is a valid strong password.
    - #### [addHttps()](https://pub.dev/documentation/fleasy/latest/fleasy/StringValidators/addHttps.html)
        Adds https:// to the link if it does not contain https:// or http:// already. This is helpful to make a link openable when using the [url_launcher](https://pub.dev/packages/url_launcher) package for example.
  
  
- ### Extensions on `BuildContext` (Adaptive helpers):
    - #### [mediaQuery](https://pub.dev/documentation/fleasy/latest/fleasy/AdaptiveHelpers/mediaQuery.html)
      The `MediaQueryData` from the closest instance of this class that encloses the given context.
    - #### [screenWidth](https://pub.dev/documentation/fleasy/latest/fleasy/AdaptiveHelpers/screenWidth.html)
      The horizontal extent of the screen size.
    - #### [screenHeight](https://pub.dev/documentation/fleasy/latest/fleasy/AdaptiveHelpers/screenHeight.html)
      The vertical extent of the screen size.
    - #### [screenIsLandscape](https://pub.dev/documentation/fleasy/latest/fleasy/AdaptiveHelpers/screenIsLandscape.html)
      Whether the device is in landscape mode.
    - #### [screenIsPortrait](https://pub.dev/documentation/fleasy/latest/fleasy/AdaptiveHelpers/screenIsPortrait.html)
      Whether the device is in portrait mode.
    - #### [formFactor](https://pub.dev/documentation/fleasy/latest/fleasy/AdaptiveHelpers/formFactor.html)
      Returns the correct [FormFactor](https://pub.dev/documentation/fleasy/latest/fleasy/FormFactor-class.html) based on the [FormFactorBreakpoints](https://pub.dev/documentation/fleasy/latest/fleasy/FormFactorBreakpoints-class.html).
    - #### [screenSize](https://pub.dev/documentation/fleasy/latest/fleasy/AdaptiveHelpers/screenSize.html)
      Returns the correct [ScreenSize](https://pub.dev/documentation/fleasy/latest/fleasy/ScreenSize-class.html) based on the [FormFactorBreakpoints](https://pub.dev/documentation/fleasy/latest/fleasy/FormFactorBreakpoints-class.html). 
    - #### [byFormFactor<T>(...)](https://pub.dev/documentation/fleasy/latest/fleasy/AdaptiveHelpers/byFormFactor.html)
      Returns the given onWatch, onHandset, onTablet or onDesktop depending on the current [formFactor](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/formFactor.html).
      Example:
      ```dart
      int columns = context.byFormFactor<int>(onHandset: 1, onTablet: 2, onDesktop: 4);
      ```   

- ### Extensions on `BuildContext` (Theme helpers):
    - #### [theme](https://pub.dev/documentation/fleasy/latest/fleasy/ThemeHelpers/theme.html)
      The data from the closest Theme instance that encloses the given context.
    - #### [isDarkTheme](https://pub.dev/documentation/fleasy/latest/fleasy/ThemeHelpers/isDarkTheme.html)
      Whether the theme brightness is dark.
    - #### [isLightTheme](https://pub.dev/documentation/fleasy/latest/fleasy/ThemeHelpers/isLightTheme.html)
      Whether the theme brightness is light.
 
- ### Extensions on `BuildContext` (Navigation helpers):
    - #### [pushPage(...)](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationHelpers/pushPage.html)
      Push the given page onto the navigator.
    - #### [pushRoute(...)](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationHelpers/pushRoute.html)
      Push the given route onto the navigator.
    - #### [popPage(...)](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationHelpers/popPage.html)
      Pop the top-most route off the navigator and dismiss the keyboard.
    - #### [canPopPage()](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationHelpers/canPopPage.html)
      Whether the navigator can be popped.
    - #### [dismissKeyboard()](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationHelpers/dismissKeyboard.html)
      Dismisses the keyboard.
      
- ### Extensions on `BuildContext` (Flashbars):
    The extensions use the awesome [flash](https://pub.dev/packages/flash) package:
    - #### [showSuccessFlashbar(...)](https://pub.dev/documentation/fleasy/latest/fleasy/FlashbarHelpers/showSuccessFlashbar.html)
      Shows a success flashbar/toast with a customizable text.
    - #### [showInfoFlashbar(...)](https://pub.dev/documentation/fleasy/latest/fleasy/FlashbarHelpers/showInfoFlashbar.html)
      Shows an info flashbar/toast with a customizable text.
    - #### [showErrorFlashbar(...)](https://pub.dev/documentation/fleasy/latest/fleasy/FlashbarHelpers/showErrorFlashbar.html)
      Shows an error flashbar/toast with a customizable text (optional).
    - #### [showNoConnectionFlashbar()](https://pub.dev/documentation/fleasy/latest/fleasy/FlashbarHelpers/showNoConnectionFlashbar.html)
      Shows a no connection flashbar/toast with a customizable text (optional).
      
  
- ### Extensions on `List?`:
    - #### [isNotBlank](https://pub.dev/documentation/fleasy/latest/fleasy/ListBlankHelpers/isNotBlank.html)
      Whether the list is not empty nor null.
    - #### [isBlank](https://pub.dev/documentation/fleasy/latest/fleasy/ListBlankHelpers/isBlank.html)
      Whether the list is empty or null.
  
  
- ### Extensions on `List`:
    - #### [find(...)](https://pub.dev/documentation/fleasy/latest/fleasy/ListFindHelper/find.html)
      Returns either the first element of the list which satisfies the provided test or null if there is none.


- ### Extensions on `DateTime`:
    - #### [copyWith(...)](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeHelpers/copyWith.html)
      Returns a copy with the overridden (given) attributes.
    - #### [format(...)](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeHelpers/format.html)
      Returns a String which represents the date formatted by the given pattern.
    - #### [isToday](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeHelpers/isToday.html)
      Whether the date is today.
    - #### [isYesterday](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeHelpers/isYesterday.html)
      Whether the date is yesterday.
    - #### [isTomorrow](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeHelpers/isTomorrow.html)
      Whether the date is tomorrow.
    - #### [isFutureDay](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeHelpers/isFutureDay.html)
      Whether the date is a day in the future.
    - #### [isSameDay(...)](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeHelpers/isSameDay.html)
      Whether the date is on the same day (regardless of the time) as the given date.
    - #### [timeIsZero](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeHelpers/timeIsZero.html)
      Whether the time of the date is zero/empty.
    - #### [copyWithEmptyTime()](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeHelpers/copyWithEmptyTime.html)
      Returns a copy with time set to zero/empty.

- ### `Date` helper class: 
    - #### [today()](https://pub.dev/documentation/fleasy/latest/fleasy/Date/today.html)
      `DateTime.now()` without time (time set to zero).
    - #### [tomorrow()](https://pub.dev/documentation/fleasy/latest/fleasy/Date/tomorrow.html)
      The `DateTime` of tomorrow (without time (time set to zero)).
    - #### [yesterday()](https://pub.dev/documentation/fleasy/latest/fleasy/Date/yesterday.html)
      The `DateTime` of yesterday (without time (time set to zero)).
  
  
- ### `DeviceType` helper class: 
    With the help of this class you can easily find out on which platform the app is currently running
    and most importantly: in a web-safe way! It uses the awesome [universal_platform](https://pub.dev/packages/universal_platform) package.
    - #### [isIOS](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isIOS.html)
      Whether the app is running on iOS.
    - #### [isAndroid](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isAndroid.html)
      Whether the app is running on android.
    - #### [isMacOS](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isMacOS.html)
      Whether the app is running on macOS.
    - #### [isLinux](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isLinux.html)
      Whether the app is running on linux.
    - #### [isWindows](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isWindows.html)
      Whether the app is running on windows.
    - #### [isWeb](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isWeb.html)
      Whether the app is running on the web.
    - #### [isDesktop](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isDesktop.html)
      Whether the app is running on desktop (windows, macOS or linux).
    - #### [isMobile](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isMobile.html)
      Whether the app is running on mobile (android or iOS).
    - #### [isDesktopOrWeb](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isDesktopOrWeb.html)
      Whether the app is running on desktop or web.
    - #### [isMobileOrWeb](https://pub.dev/documentation/fleasy/latest/fleasy/DeviceType/isMobileOrWeb.html)
      Whether the app is running on mobile or web.
 

- ### `Insets` helper class: 
    A single source of truth for styling values like padding, spacing, corner shape, font sizes, and so on.
    These constants can then be used in place of hard-coded numeric values.
    - #### [xxs](https://pub.dev/documentation/fleasy/latest/fleasy/Insets/xxs-constant.html)
      An extra extra small inset of 2.0.
    - #### [xs](https://pub.dev/documentation/fleasy/latest/fleasy/Insets/xs-constant.html)
      An extra small inset of 4.0.
    - #### [s](https://pub.dev/documentation/fleasy/latest/fleasy/Insets/s-constant.html)
      A small inset of 6.0.
    - #### [m](https://pub.dev/documentation/fleasy/latest/fleasy/Insets/m-constant.html)
      A medium inset of 8.0.
    - #### [l](https://pub.dev/documentation/fleasy/latest/fleasy/Insets/l-constant.html)
      A large inset of 10.0.
    - #### [xl](https://pub.dev/documentation/fleasy/latest/fleasy/Insets/xl-constant.html)
      An extra large inset of 12.0.
    - #### [xxl](https://pub.dev/documentation/fleasy/latest/fleasy/Insets/xxl-constant.html)
      An extra extra large inset of 16.0.
  
    
- ### Flutter Widgets: 
    - #### [EasyFutureBuilder<T>](https://pub.dev/documentation/fleasy/latest/fleasy/EasyFutureBuilder-class.html)
      A wrapper around `FutureBuilder` which makes it easy to display the various states of fetching data from the given `Future`. See [example](https://github.com/devj3ns/fleasy/blob/main/example/lib/main.dart).
    - #### [EasyStreamBuilder<T>](https://pub.dev/documentation/fleasy/latest/fleasy/EasyStreamBuilder-class.html)
      A wrapper around `StreamBuilder` which makes it easy to display the various states of streaming data from the given `Stream`. See [example](https://github.com/devj3ns/fleasy/blob/main/example/lib/main.dart).

- ### Analysis options: 
    You can use the same analysis options which this package uses by simply including them in your `analysis_options.yaml` file:
    ```yaml
    include: package:fleasy/analysis_options.yaml
    ```
   They are based on:
    - [package:flutter_lints](https://pub.dev/packages/flutter_lints) (therefore also [package:lints](https://pub.dev/packages/lints))
    - my favorite rules from [package:dart_code_metrics](https://pub.dev/packages/dart_code_metrics)
    - my favorite lint rules which are not present in [package:flutter_lints](https://pub.dev/packages/flutter_lints)
      
   For more details, have a look at the `analysis_options.yaml` file [here](https://github.com/devj3ns/fleasy/blob/main/lib/analysis_options.yaml).
 
## Note:
**This package is still in early stages**. If you notice any bugs not present in issues, please file a [new issue](https://github.com/devj3ns/fleasy/issues). If you are willing to fix or enhance things yourself, **you are very welcome to make a [pull request](https://github.com/devj3ns/fleasy/pulls)**.  

Also: **Feedback and suggestions are very welcome**. Just [open an issue](https://github.com/devj3ns/fleasy/issues) or write an email to [info@jensbecker.dev](mailto:info@jensbecker.dev).