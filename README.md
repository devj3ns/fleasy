# Fleasy

This package helps creating Flutter apps easier by providing useful and easy to use extensions, helper classes and widgets.

The goal is that by using this package you have to write less (repeating) and more clean and readable code.

This package contains the following features:

### Extensions:
- #### `BuildContext`
    - `mediaQuery`
    - `screenSize`
    - `screenWidth`
    - `screenHeight`
    - `screenOrientation`
    - `screenIsLandscape`
    - `screenIsPortrait`
    - `formFactor`
    - `closeKeyboard()`
    - `pushRoute(...)`
    - `pushPage(...)`
    - `popPage()`
    - `canPopPage()`
    
- #### `String`
    - `addHttps()`
    - `isValidEmail`
    - `isInvalidEmail`
    
- #### `String?`
    - `isNotBlank`
    - `isBlank`
    - `isValidEmail`
    - `isInvalidEmail`
    - `toNullIfBlank()`

- #### `DateTime`
    - `copyWith(...)`
    - `isToday`
    - `isYesterday`
    - `isTomorrow`
    - `isFutureDay`
    - `isSameDay(...)`
    - `timeIsZero`
    - `copyWithEmptyTime()`
    - `format(...)`
    
- #### `List<DateTime>`
    - `containsDate(...)`
    - `indexOfDate(...)`
    
- #### `List?`
    - `isNotBlank`
    - `isBlank`

- #### `List<T>`
    - `find(...)`
        
        
### Helper Classes: 
- #### `Date`
    - `Date.today()`
    - `Date.tomorrow()`
    - `Date.yesterday()`
    
- #### `DeviceType`
    - `DeviceType.isIOS`
    - `DeviceType.isAndroid`
    - `DeviceType.isMacOS`
    - `DeviceType.isLinux`
    - `DeviceType.isWindows`
    - `DeviceType.isWeb`
    - `DeviceType.isDesktop`
    - `DeviceType.isMobile`
    - `DeviceType.isDesktopOrWeb`
    - `DeviceType.isMobileOrWeb`
    
- #### `Insets`
    - `xxs`
    - `xs`
    - `s`
    - `m`
    - `l`
    - `xl`
    - `xxl`
    
### Flutter Widgets: 
    - EasyStreamBuilder(...)
    - EasyFutureBuilder(...)
    
------

### To-Do's:
 - [ ] Add more tests
 - [ ] Document the complete code
 - [ ] Create example app
 
### Note:
This package is still in early stages.
If you notice any bugs not present in issues, please file a new issue. If you are willing to fix or enhance things yourself, you are very welcome to make a pull request.