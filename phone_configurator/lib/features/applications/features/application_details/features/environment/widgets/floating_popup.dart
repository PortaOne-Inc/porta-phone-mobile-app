import 'package:flutter/material.dart';

class FloatingPopupController {
  VoidCallback? _show;
  VoidCallback? _hide;

  void attach(VoidCallback show, VoidCallback hide) {
    _show = show;
    _hide = hide;
  }

  void show() => _show?.call();

  void hide() => _hide?.call();
}

class FloatingPopup extends StatefulWidget {
  const FloatingPopup({
    required this.trigger,
    required this.floatingContent,
    super.key,
    this.constraints,
    this.padding,
    this.controller,
  });

  final Widget trigger;
  final Widget floatingContent;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final FloatingPopupController? controller;

  @override
  _FloatingPopupState createState() => _FloatingPopupState();
}

class _FloatingPopupState extends State<FloatingPopup> {
  final GlobalKey _targetKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  static const double screenPadding = 16;

  @override
  void initState() {
    super.initState();
    widget.controller?.attach(_showOverlay, _hideOverlay);
  }

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  void _showOverlay() {
    _hideOverlay();

    final renderBox =
        _targetKey.currentContext!.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenWidth = MediaQuery.of(context).size.width;

    final popupWidth = widget.constraints?.maxWidth ?? 300;
    var leftPosition = offset.dx;

    if (leftPosition + popupWidth > screenWidth - screenPadding) {
      leftPosition = screenWidth - popupWidth - screenPadding;
    }

    if (leftPosition < screenPadding) {
      leftPosition = screenPadding;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _hideOverlay,
              ),
            ),
            Positioned(
              left: leftPosition,
              top: offset.dy + size.height + 8,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 8),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: ConstrainedBox(
                    constraints:
                        widget.constraints ??
                        BoxConstraints(
                          minWidth: 150,
                          minHeight: 40,
                          maxWidth: popupWidth,
                          maxHeight: 200,
                        ),
                    child: Container(
                      padding: widget.padding ?? const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                      ),
                      child: widget.floatingContent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_overlayEntry!);
    });
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showOverlay,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Container(key: _targetKey, child: widget.trigger),
      ),
    );
  }
}
