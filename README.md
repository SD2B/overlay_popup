## Overlay Popup
"A widget that allows you to display a popup anywhere on the screen, particularly on any widget of your choice, except for widgets that have onPress or onTap features."

## Features

 - showing popup on the widget of your choice


## Getting started

To use this package, add overlay_popup as a dependency in your pubspec.yaml file.

## Usage

Minimal example:

```dart
       OverlayPopup(
            content: (closeOverlay) => Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  const Text('This is an overlay popup'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: closeOverlay,
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
            horizontalPadding: 0, // to align with the widget horizontally
            verticalPadding: -25, // to align with the widget vertically
            onOpened: () {
              print('Overlay popup opened');
            },
            blurBackground: false,
            child: const Icon(Icons.info),
          )
```

