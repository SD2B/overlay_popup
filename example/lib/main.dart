import 'package:flutter/material.dart';
import 'package:overlay_popup/overlay_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OverlayPopupExample(),
    );
  }
}

class OverlayPopupExample extends StatelessWidget {
  const OverlayPopupExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay Popup Example'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Click the Widgets below to show the overlay popup'),
          const SizedBox(height: 20),

          // OverlayPopup with an Icon as trigger
          OverlayPopup(
            content: (closeOverlay) => Container(
              padding:
                  const EdgeInsets.all(20), // Adds padding to the popup content
              color: Colors.white, // Background color of the popup
              child: Column(
                children: [
                  const Text('This is an overlay popup'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: closeOverlay, // Closes the popup when pressed
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
            horizontalPadding:
                0, // Aligns the popup with the triggering widget horizontally
            verticalPadding: -25, // Adjusts vertical position of the popup
            onOpened: () {
              print(
                  'Overlay popup opened'); // Prints message when popup is opened
            },
            blurBackground: false, // No blur effect in the background
            child: const Icon(Icons.info), // The Icon that triggers the popup
          ),

          const SizedBox(height: 20),

          // OverlayPopup with a blurred background
          OverlayPopup(
            content: (closeOverlay) => Container(
              padding: const EdgeInsets.all(20), // Padding around popup content
              color: Colors.white, // Background color of the popup
              child: Column(
                children: [
                  const Text('This is an overlay popup'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: closeOverlay, // Close button for popup
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
            horizontalPadding: -10, // Adjusts the popup position horizontally
            verticalPadding: -50, // Adjusts the popup position vertically
            onOpened: () {
              print('Overlay popup opened'); // Prints when the popup is opened
            },
            blurBackground: true, // Enables blurred background behind the popup
            blurOpacity: 0.5, // Sets the opacity of the blur effect
            child: Container(
              height: 50, // Height of the triggering widget
              width: 300, // Width of the triggering widget
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(10), // Rounded corners for the widget
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Shadow color with opacity
                    spreadRadius: 5, // Spread of the shadow
                    blurRadius: 7, // Blur radius for the shadow
                    offset: const Offset(0, 3), // Shadow offset
                  ),
                ],
                border: Border.all(
                    color: Colors.grey
                        .withOpacity(0.5)), // Border around the widget
              ),
              child: const Center(
                  child: Text('Overlay Popup With Blur Background')),
            ),
          ),

          const SizedBox(height: 20),

          // OverlayPopup without a blurred background
          OverlayPopup(
            content: (closeOverlay) => Container(
              padding:
                  const EdgeInsets.all(20), // Adds padding to popup content
              color: Colors.white, // Popup background color
              child: Column(
                children: [
                  const Text('This is an overlay popup'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: closeOverlay, // Button to close the popup
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
            horizontalPadding: -10, // Aligns the popup horizontally
            verticalPadding: -50, // Aligns the popup vertically
            onOpened: () {
              print('Overlay popup opened'); // Logs popup opened event
            },
            blurBackground: false, // No background blur
            child: Container(
              height: 50, // Height of the triggering widget
              width: 300, // Width of the triggering widget
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow with opacity
                    spreadRadius: 5, // Shadow spread radius
                    blurRadius: 7, // Shadow blur radius
                    offset: const Offset(0, 3), // Shadow offset
                  ),
                ],
                border: Border.all(
                    color:
                        Colors.grey.withOpacity(0.5)), // Border around widget
              ),
              child: const Center(
                  child: Text('Overlay Popup Without Blur Background')),
            ),
          ),
        ],
      ),
    );
  }
}
