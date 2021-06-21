# Fleasy

<p align="center">
<a href="https://pub.dev/packages/fleasy"><img src="https://img.shields.io/pub/v/fleasy?color=green" alt="pub.dev badge"></a>
<a href="https://github.com/devj3ns/fleasy/commits/main"><img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/devj3ns/fleasy?color=blue&label=commits"></a>
<br>
<a href="https://www.buymeacoffee.com/devj3ns" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-blue.png" alt="Buy Me A Coffee" height="42px"></a>
</p>


This package helps create Flutter apps easier by providing **useful and easy to use extensions, helper classes and widgets**.

The goal is that by using this package you have to write less (repeating) and more clean and readable code.

## Overview

This package contains the following features:

- [Extensions on `String` and `String?`](#extensions-on-string-and-string)
- [Extensions on `String?`](#extensions-on-string)
- [Extensions on `DateTime`](#extensions-on-datetime)
- [Extensions on `List<DateTime>`](#extensions-on-listdatetime)
- [Extensions on `BuildContext` (Adaptive helpers)](#extensions-on-buildcontext-adaptive-helpers)
- [Extensions on `BuildContext` (Navigation helpers)](#extensions-on-buildcontext-navigation-helpers)
- [Extensions on `List?`](#extensions-on-list)
- [Extensions on `List`](#extensions-on-list)
- [`Date` helper class](#date-helper-class)
- [`DeviceType` helper class](#devicetype-helper-class)
- [`Insets` helper class](#insets-helper-class)
- [Flutter Widgets](#flutter-widgets)

## Features

- ### Extensions on `String` and `String?`:
    - #### [isEmail](https://pub.dev/documentation/fleasy/latest/fleasy/StringExtensions/isEmail.html)
      Whether the string is a valid email.
    - #### [isUrl](https://pub.dev/documentation/fleasy/latest/fleasy/StringExtensions/isUrl.html)
      Whether the string is a valid url.
    - #### [isEasyPassword](https://pub.dev/documentation/fleasy/latest/fleasy/StringExtensions/isEasyPassword.html)
      Whether the string is a valid easy password.
    - #### [isMediumPassword](https://pub.dev/documentation/fleasy/latest/fleasy/StringExtensions/isMediumPassword.html)
      Whether the string is a valid medium password.
    - #### [isStrongPassword](https://pub.dev/documentation/fleasy/latest/fleasy/StringExtensions/isStrongPassword.html)
      Whether the string is a valid strong password.
  
  
- ### Extensions on `String?`:
    - #### [isNotBlank](https://pub.dev/documentation/fleasy/latest/fleasy/NullableStringExtensions/isNotBlank.html)
      Whether the string is not null nor empty.
    - #### [isBlank](https://pub.dev/documentation/fleasy/latest/fleasy/NullableStringExtensions/isBlank.html)
      Whether the string is null or empty.
    - #### [toNullIfBlank()](https://pub.dev/documentation/fleasy/latest/fleasy/NullableStringExtensions/toNullIfBlank.html)
      Returns null if the string is blank (empty or null) or it's text if not.
  
  
- ### Extensions on `DateTime`:
    - #### [copyWith(...)](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeExtensions/copyWith.html)
      Returns a copy with the overridden (given) attributes.
    - #### [format(...)](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeExtensions/format.html)
      Returns a String which represents the date formatted by the given pattern.
    - #### [isToday](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeExtensions/isToday.html)
      Whether this is today.
    - #### [isYesterday](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeExtensions/isYesterday.html)
      Whether this is yesterday.
    - #### [isTomorrow](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeExtensions/isTomorrow.html)
      Whether this is tomorrow.
    - #### [isFutureDay](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeExtensions/isFutureDay.html)
      Whether this is a day in the future.
    - #### [isSameDay(...)](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeExtensions/isSameDay.html)
      Whether this is the same date (not time!) as the given date.
    - #### [timeIsZero](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeExtensions/timeIsZero.html)
      Whether the time of this is zero.
    - #### [copyWithEmptyTime()](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeExtensions/copyWithEmptyTime.html)
      Returns a copy with time set to zero.
  
  
- ### Extensions on `List<DateTime>`:
    - #### [containsDate(...)](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeListExtensions/containsDate.html)
      Whether the list contains the given date (regardless of the time).
    - #### [indexOfDate(...)](https://pub.dev/documentation/fleasy/latest/fleasy/DateTimeListExtensions/indexOfDate.html)
      Returns the index of the given date (regardless of the time).
  
  
- ### Extensions on `BuildContext` (Adaptive helpers):
    - #### [mediaQuery](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/mediaQuery.html)
      The `MediaQueryData` from the closest instance of this class that encloses the given context.
    - #### [screenWidth](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/screenWidth.html)
      The horizontal extent of the screen size.
    - #### [screenHeight](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/screenHeight.html)
      The vertical extent of the screen size.
    - #### [shortestScreenSide](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/shortestScreenSide.html)
      The lesser of the magnitudes of the screen width and height.
    - #### [longestScreenSide](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/longestScreenSide.html)
      The greater of the magnitudes of the screen width and height.
    - #### [screenIsLandscape](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/screenIsLandscape.html)
      Whether the device is in landscape mode.
    - #### [screenIsPortrait](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/screenIsPortrait.html)
      Whether the device is in portrait mode.
    - #### [formFactor](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/formFactor.html)
      Returns the correct [FormFactor](https://pub.dev/documentation/fleasy/latest/fleasy/FormFactor-class.html) based on the [FormFactorBreakpoints](https://pub.dev/documentation/fleasy/latest/fleasy/FormFactorBreakpoints-class.html).
    - #### [screenSize](https://pub.dev/documentation/fleasy/latest/fleasy/AdpativeContextExtensions/screenSize.html)
      Returns the correct [ScreenSize](https://pub.dev/documentation/fleasy/latest/fleasy/ScreenSize-class.html) based on the [FormFactorBreakpoints](https://pub.dev/documentation/fleasy/latest/fleasy/FormFactorBreakpoints-class.html). 
     
 
- ### Extensions on `BuildContext` (Navigation helpers):
    - #### [pushPage(...)](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationContextExtensions/pushPage.html)
      Push the given page onto the navigator.
    - #### [pushRoute(...)](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationContextExtensions/pushRoute.html)
      Push the given route onto the navigator.
    - #### [popPage(...)](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationContextExtensions/popPage.html)
      Pop the top-most route off the navigator and dismiss the keyboard.
    - #### [canPopPage()](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationContextExtensions/canPopPage.html)
      Whether the navigator can be popped.
    - #### [dismissKeyboard()](https://pub.dev/documentation/fleasy/latest/fleasy/NavigationContextExtensions/dismissKeyboard.html)
      Dismisses the keyboard (by removing the focus on this node by moving the primary focus to another node).
      
  
- ### Extensions on `List?`:
    - #### [isNotBlank](https://pub.dev/documentation/fleasy/latest/fleasy/NullableListExtensions/isNotBlank.html)
      Whether the list is not empty nor null.
    - #### [isBlank](https://pub.dev/documentation/fleasy/latest/fleasy/NullableListExtensions/isBlank.html)
      Whether the list is empty or null.
  
  
- ### Extensions on `List`:
    - #### [find(...)](https://pub.dev/documentation/fleasy/latest/fleasy/ListExtensions/find.html)
      Returns either the first element of the list which satisfies the provided test or null if there is none.


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
    - #### [s](https://pub.dev/documentation/fleasy/latest/fleasy/Insets/s-constant.html)
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
        

## To-Do's:
 - [x] Improve README
 - [x] Document the complete code
 - [x] Create example app
 - [ ] Add more tests (feel free to contribute ;)
 
## Note:
This package is still in early stages.
If you notice any bugs not present in issues, please file a new issue. If you are willing to fix or enhance things yourself, you are very welcome to make a pull request.