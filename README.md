# Overlay Popup

A customizable overlay popup widget for Flutter that allows displaying any content on top of the UI with an optional blurred background effect. This widget is useful for creating modal popups, tooltips, and more with interactive content.

## Features
- Easily configurable overlay popup with child and custom content.
- Optional blurred background with adjustable opacity.
- Customizable padding for positioning the popup relative to the child widget.
- Built-in functionality to handle popup opening and closing, including callbacks when the popup is opened.

## Installation

Add the following dependency in your `pubspec.yaml`:

```yaml
dependencies:
  overlay_popup: <latest_version>
```

## Usage

Wrap your widget with the `OverlayPopup` to display a popup on tap. You can customize the popup's content, background blur, and padding.

Minimal example:

```dart
import 'package:flutter/material.dart'; // Import Flutter's material library for UI components.
import 'package:overlay_popup/overlay_popup.dart'; // Import your custom `OverlayPopup` widget.

void main() {
  runApp(const MyApp()); // Start the app by calling `runApp()` and passing the root widget `MyApp`.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for the `MyApp` widget, which is stateless.

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Create a `MaterialApp` widget, which sets up the app's theme and navigation.
      home: Scaffold( // The main layout structure of the app.
        appBar: AppBar(title: const Text('Overlay Popup Example')), // Create an app bar with a title.
        body: Center( // Center the child widget on the screen.
          child: OverlayPopup( // Use the `OverlayPopup` widget you created earlier.
            child: const Icon(Icons.info, size: 50), // The widget (an info icon) that triggers the popup.
            
            content: (closePopup) => Container( // The content to show in the popup, passed as a function.
              padding: const EdgeInsets.all(16), // Add padding around the content inside the popup.
              color: Colors.white, // Set the background color of the popup to white.
              child: Column( // Display multiple widgets in a vertical column.
                mainAxisSize: MainAxisSize.min, // Minimize the size of the column to fit its children.
                children: [
                  const Text('This is a popup!'), // Display a simple text message in the popup.
                  const SizedBox(height: 10), // Add vertical space between the text and the button.
                  ElevatedButton( // Create a button in the popup.
                    onPressed: closePopup, // When the button is pressed, close the popup.
                    child: const Text('Close'), // The label of the button.
                  ),
                ],
              ),
            ),

            blurBackground: true, // Enable background blurring when the popup is shown.
            blurOpacity: 0.3, // Set the opacity for the blurred background.
            backgroundColor: Colors.white, // Set the background color of the popup content to white.
            horizontalPadding: 10, // Add 10 pixels of horizontal padding to the popup positioning.
            verticalPadding: 20, // Add 20 pixels of vertical padding to the popup positioning.
            
            onOpened: () { // Callback function that runs when the popup is opened.
              print('Popup opened'); // Print "Popup opened" to the console when the popup is shown.
            },
          ),
        ),
      ),
    );
  }
}

```

## Parameters

| Parameter          | Type                        | Description                                                                                                                                         |
|--------------------|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| `child`            | `Widget`                    | The widget that, when tapped, triggers the display of the popup.                                                                                     |
| `content`          | `Widget Function(VoidCallback)` | The content to be displayed in the popup. The `VoidCallback` is used to close the popup from within the content widget.                               |
| `backgroundColor`  | `Color?`                    | Optional background color for the popup. Defaults to transparent.                                                                                   |
| `horizontalPadding`| `int?`                      | Optional padding to adjust the horizontal position of the popup relative to the child widget.                                                        |
| `verticalPadding`  | `int?`                      | Optional padding to adjust the vertical position of the popup relative to the child widget.                                                         |
| `onOpened`         | `VoidCallback?`             | Optional callback invoked when the popup is opened.                                                                                                 |
| `blurBackground`   | `bool`                      | If true, blurs the background behind the popup. Defaults to false.                                                                                  |
| `blurOpacity`      | `double?`                   | Opacity level of the blurred background (if `blurBackground` is enabled). Defaults to 0.2.                                                          |


## Notes
- **Positioning**: You can control the exact position of the popup by providing values for `horizontalPadding` and `verticalPadding`.
- **Blur Effect**: The `blurBackground` feature can enhance user experience by adding focus to the popup while dimming the rest of the UI.


---


## Author

Developed with ❤️ by [Sanoop Das](https://codelife.in). Connect with me on [LinkedIn](https://www.linkedin.com/in/sd2b/).

---

## Support

If you like this package, please give it a ⭐ on [pub.dev](https://pub.dev/packages/custom_overlay_popup) and share it with the Flutter community!

---

Happy Coding!

