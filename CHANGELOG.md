# Changelog

## [0.0.8] 
- **Added**: Comprehensive documentation for public API elements to improve usability and score on pub.dev.
- **Improved**: Code readability by refactoring and adding comments.
- **Fixed**: Overlay positioning issues when used in multi-window applications.
- **Fixed**: A bug where the popup would remain open when navigating to a new route.

## [0.0.7] 
- **Added**: Support for custom popup transitions and animations for smoother UI interactions.
- **Improved**: Performance optimizations to reduce lag when displaying and hiding the popup.
- **Fixed**: Bug where the overlay did not respect the system's light/dark theme settings.

## [0.0.6] 
- **Added**: Background blur functionality for the popup using `ImageFilter` from `dart:ui`.
- **Added**: Customizable `blurOpacity` to adjust the level of blur and darkness applied to the background.
- **Improved**: Popup positioning with customizable `horizontalPadding` and `verticalPadding`.
- **Fixed**: Issues with tap detection on the popup's child and background.

## [0.0.5] 
- **Added**: Optional `backgroundColor` property to allow for custom popup background colors.
- **Improved**: Internal cleanup for better resource management, especially when disposing the widget.
- **Fixed**: Minor UI alignment bugs when calculating popup positioning.

## [0.0.4] 
- **Added**: `onOpened` callback to allow triggering specific actions when the popup opens.
- **Improved**: Popup animation and responsiveness for smoother user experience.
- **Fixed**: Bug where the overlay would not properly close in certain conditions.

## [0.0.3] 
- **Added**: Basic state management to handle the popup lifecycle with enhanced flexibility.
- **Improved**: Touch interaction logic on popup content, allowing more customization.
- **Fixed**: Issue with overlay not being removed when navigating away from the screen.

## [0.0.2] 
- **Improved**: Popup positioning logic for more accurate rendering relative to the trigger widget.
- **Fixed**: Performance issues when showing and removing the overlay in rapid succession.

## [0.0.1] - Initial Release 
- **Initial release** with basic popup functionality:
  - Tap-triggered popup with customizable content.
  - Automatic overlay handling with support for background click to close.
