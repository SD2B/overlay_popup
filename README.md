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
import 'package:flutter/material.dart';
import 'package:overlay_popup/overlay_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Overlay Popup Example')),
        body: Center(
          child: OverlayPopup(
            child: const Icon(Icons.info, size: 50),
            content: (closePopup) => Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('This is a popup!'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: closePopup,
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
            blurBackground: true,
            blurOpacity: 0.3,
            backgroundColor: Colors.white,
            horizontalPadding: 10,
            verticalPadding: 20,
            onOpened: () {
              print('Popup opened');
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



