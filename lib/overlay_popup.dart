library overlay_popup; 

import 'dart:ui'; // Import 'dart:ui' to use `ImageFilter` for blurring effects.
import 'package:flutter/material.dart'; // Import Flutter's material library for UI components.

class OverlayPopup extends StatefulWidget { // Define a `StatefulWidget` to handle dynamic state.
  final Widget child; // The widget that triggers the popup, e.g., a button.
  final Widget Function(VoidCallback) content; // A function that returns the popup content, which includes a callback to close it.
  final Color? backgroundColor; // Optional background color for the popup.
  final int? horizontalPadding; // Optional padding on the horizontal axis for the popup positioning.
  final int? verticalPadding; // Optional padding on the vertical axis for the popup positioning.
  final VoidCallback? onOpened; // Optional callback that fires when the popup is opened.
  final bool blurBackground; // Determines whether the background should be blurred.
  final double? blurOpacity; // Optional blur opacity when `blurBackground` is true.

  const OverlayPopup({
    super.key, // Pass the key to the superclass constructor.
    required this.child, // Initialize required `child` widget.
    required this.content, // Initialize required popup content function.
    this.backgroundColor, // Initialize optional background color.
    this.horizontalPadding, // Initialize optional horizontal padding.
    this.verticalPadding, // Initialize optional vertical padding.
    this.onOpened, // Initialize optional onOpened callback.
    this.blurBackground = false, // Default blur is set to false.
    this.blurOpacity, // Initialize optional blur opacity.
  });

  @override
  _OverlayPopupState createState() => _OverlayPopupState(); // Create the mutable state for the widget.
}

class _OverlayPopupState extends State<OverlayPopup> {
  OverlayEntry? _overlayEntry; // A variable to hold the overlay entry, used to show/hide the popup.

  @override
  Widget build(BuildContext context) {
    return InkWell( // Detect taps on the `child` widget.
      hoverColor: Colors.transparent, // Disable hover color.
      splashColor: Colors.transparent, // Disable splash color when tapped.
      onTap: () { // Define what happens when the `child` is tapped.
        if (_overlayEntry == null) { // If no overlay is currently shown:
          widget.onOpened?.call(); // Call `onOpened` callback if it exists.
          Future.delayed(Duration(milliseconds: 100), () => _showOverlay()); // Delay before showing the popup.
        } else {
          _removeOverlay(); // Remove the overlay if it is already displayed.
        }
      },
      child: widget.child, // Render the child widget (the trigger for the popup).
    );
  }

  void _showOverlay() {
    final overlay = Overlay.of(context); // Get the overlay state from the current context.
    final renderBox = context.findRenderObject() as RenderBox?; // Get the render box of the widget for positioning.
    final offset = renderBox?.localToGlobal(Offset.zero); // Get the widget's position on the screen.
    final horizontalPadding = widget.horizontalPadding ?? 0; // Set horizontal padding (default 0).
    final verticalPadding = widget.verticalPadding ?? 0; // Set vertical padding (default 0).

    _overlayEntry = OverlayEntry( // Create an overlay entry to display the popup.
      builder: (context) => Stack( // Use a Stack to layer elements in the overlay.
        children: [
          // Modal barrier to prevent interactions with the background.
          Positioned.fill(
            child: GestureDetector(
              onTap: () => _removeOverlay(), // Tapping on the background closes the popup.
              behavior: HitTestBehavior.opaque, // Capture all taps to prevent background interactions.
              child: widget.blurBackground // If background blur is enabled:
                  ? BackdropFilter( // Apply a backdrop filter to blur the background.
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Define blur strength.
                      child: Container(
                        color: Colors.black.withOpacity(widget.blurOpacity ?? 0.2), // Apply a semi-transparent overlay to darken the background.
                      ),
                    )
                  : Container( // If blur is not enabled, show a transparent background.
                      color: Colors.transparent,
                    ),
            ),
          ),
          // Popup content
          Positioned(
            left: offset!.dx - horizontalPadding, // Position the popup horizontally based on child widget's position and padding.
            top: offset.dy - verticalPadding, // Position the popup vertically based on child widget's position and padding.
            child: GestureDetector(
              onTap: () {}, // Disable tap on the popup content to avoid closing it unintentionally.
              child: Material( // Material widget for proper styling and shadows.
                color: widget.backgroundColor ?? Colors.transparent, // Use the specified background color or make it transparent.
                child: widget.content(_removeOverlay), // Build the popup content, passing the `_removeOverlay` function to allow it to close the popup.
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_overlayEntry!); // Insert the overlay into the widget tree.
  }

  void _removeOverlay() {
    _overlayEntry?.remove(); // Remove the overlay from the widget tree.
    _overlayEntry = null; // Reset the overlay entry to null, indicating it's no longer displayed.
  }

  @override
  void dispose() {
    _removeOverlay(); // Ensure the overlay is removed when the widget is disposed.
    super.dispose(); // Call the superclass dispose method.
  }
}
