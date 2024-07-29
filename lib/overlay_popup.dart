library overlay_popup;

import 'dart:ui';

import 'package:flutter/material.dart';

class OverlayPopup extends StatefulWidget {
  final Widget child;
  final Widget Function(VoidCallback) content;
  final Color? backgroundColor;
  final int? horizontalPadding;
  final int? verticalPadding;
  final VoidCallback? onOpened;
  final bool blurBackground;
  final double? blurOpacity;
  const OverlayPopup({super.key, 
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
          Future.delayed(Duration(milliseconds: 100), () => _showOverlay());
        } else {
          _removeOverlay();
        }
      },
      child: widget.child,
    );
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox?;
    final offset = renderBox?.localToGlobal(Offset.zero);
    final horizontalPadding = widget.horizontalPadding ?? 0;
    final verticalPadding = widget.verticalPadding ?? 0;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Modal barrier to prevent interactions with the background
          Positioned.fill(
            child: GestureDetector(
              onTap: () => _removeOverlay(),
              behavior: HitTestBehavior.opaque,
              child: widget.blurBackground
                  ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.black.withOpacity(widget.blurOpacity ?? 0.2), // Adjust opacity as needed
                      ),
                    )
                  : Container(
                      color: Colors.transparent,
                    ),
            ),
          ),
          // Popup content
          Positioned(
            left: offset!.dx - horizontalPadding,
            top: offset.dy - verticalPadding,
            child: GestureDetector(
              onTap: () {}, // Prevent tap from closing the popup
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