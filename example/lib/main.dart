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
          // OverlayPopup on Icon
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
          ),
          const SizedBox(height: 20),

          // OverlayPopup with blur background
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
            horizontalPadding: -10, // to align with the widget horizontally
            verticalPadding: -50, // to align with the widget vertically
            onOpened: () {
              print('Overlay popup opened');
            },
            blurBackground: true,
            blurOpacity: 0.5,
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
              ),
              child: const Center(
                  child: Text('Overlay Popup With Blur Background')),
            ),
          ),
          const SizedBox(height: 20),

          // OverlayPopup without blur background
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
            horizontalPadding: -10, // to align with the widget horizontally
            verticalPadding: -50, // to align with the widget vertically
            onOpened: () {
              print('Overlay popup opened');
            },
            blurBackground: false,
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
              ),
              child: const Center(
                  child: Text('Overlay Popup Without Blur Background')),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
