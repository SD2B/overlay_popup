/// A Flutter package that provides an easy way to display popups as overlays.
/// The `OverlayPopup` widget allows you to show customizable popups with
/// optional background blur and color, triggered by a child widget.
library overlay_popup;

import 'dart:ui';

import 'package:flutter/material.dart';

/// A widget that shows a popup as an overlay, triggered by the child widget.
/// The popup can include optional features such as background blur,
/// customizable content, and padding for fine-tuned positioning.
class OverlayPopup extends StatefulWidget {
  /// The widget that triggers the popup when tapped.
  final Widget child;

  /// A function that returns the content to be displayed inside the popup.
  /// The content receives a callback function that can be used to close the popup.
  final Widget Function(VoidCallback) content;

  /// The optional background color of the popup. If not provided, the background is transparent.
  final Color? backgroundColor;

  /// Optional padding on the horizontal axis, used for adjusting the position of the popup.
  final int? horizontalPadding;

  /// Optional padding on the vertical axis, used for adjusting the position of the popup.
  final int? verticalPadding;

  /// Optional callback that is fired when the popup is opened.
  final VoidCallback? onOpened;

  /// If true, the background behind the popup will be blurred.
  final bool blurBackground;

  /// The opacity of the blurred background, used only when `blurBackground` is true.
  /// The default opacity is 0.2.
  final double? blurOpacity;

  /// Creates an `OverlayPopup` widget.
  ///
  /// [child] is required and acts as the widget that triggers the popup.
  /// [content] is a required function that provides the content for the popup.
  /// Optional parameters include [backgroundColor], [horizontalPadding], [verticalPadding],
  /// [onOpened], [blurBackground], and [blurOpacity].
  const OverlayPopup({
    super.key,
    required this.child,
    required this.content,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.onOpened,
    this.blurBackground = false,
    this.blurOpacity,
  });

  @override
  _OverlayPopupState createState() => _OverlayPopupState();
}

/// The mutable state class for the `OverlayPopup` widget.
/// Handles showing and hiding the popup as an overlay.
class _OverlayPopupState extends State<OverlayPopup> {
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        if (_overlayEntry == null) {
          widget.onOpened?.call();
          Future.delayed(const Duration(milliseconds: 100), _showOverlay);
        } else {
          _removeOverlay();
        }
      },
      child: widget.child,
    );
  }

  /// Displays the popup overlay with the specified content and background options.
  void _showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox?;
    final offset = renderBox?.localToGlobal(Offset.zero);
    final horizontalPadding = widget.horizontalPadding ?? 0;
    final verticalPadding = widget.verticalPadding ?? 0;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _removeOverlay,
              behavior: HitTestBehavior.opaque,
              child: widget.blurBackground
                  ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color:
                            Colors.black.withOpacity(widget.blurOpacity ?? 0.2),
                      ),
                    )
                  : Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            left: offset!.dx - horizontalPadding,
            top: offset.dy - verticalPadding,
            child: GestureDetector(
              onTap: () {},
              child: Material(
                color: widget.backgroundColor ?? Colors.transparent,
                child: widget.content(_removeOverlay),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  /// Removes the currently displayed popup overlay.
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }
}
