import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

enum ResizableOrientation {
  vertical,
  horizontal,
}

typedef WidgetBuilder = Widget Function(BuildContext context, double dimension);

class FlexibleBinaryLayout extends StatelessWidget {
  const FlexibleBinaryLayout({
    super.key,
    required this.childPrimary,
    required this.childSecondary,
    required this.orientation,
    this.dividerThickness = 2,
    this.landslide = 0,
    this.draggable = true,
  });

  final ResizableOrientation orientation;
  final WidgetBuilder childPrimary;
  final WidgetBuilder? childSecondary;

  final double landslide;
  final bool draggable;

  final double dividerThickness;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = orientation == ResizableOrientation.horizontal ? constraints.maxWidth : constraints.maxHeight;
        if (childSecondary == null) {
          return childPrimary(context, size);
        } else {
          return BackgroundBinaryResizableRow(
            topChild: childPrimary,
            bottomChild: childSecondary!,
            dimension: size + dividerThickness,
            dividerThickness: dividerThickness,
            minColumHeight: size / 4,
            dividerPosition: landslide,
            orientation: orientation,
            draggable: draggable,
          );
        }
      },
    );
  }
}

class BackgroundBinaryResizableRow extends StatefulWidget {
  const BackgroundBinaryResizableRow({
    super.key,
    required this.topChild,
    required this.bottomChild,
    this.minColumHeight = 100.0,
    this.minScrollHeight = 500.0,
    this.dividerPosition = 0,
    required this.dimension,
    required this.orientation,
    required this.dividerThickness,
    required this.draggable,
  });

  final WidgetBuilder topChild;
  final WidgetBuilder bottomChild;

  final double dividerThickness;

  final double minColumHeight;
  final double minScrollHeight;

  final double dividerPosition;

  final double dimension;
  final ResizableOrientation orientation;

  final bool draggable;

  @override
  State<BackgroundBinaryResizableRow> createState() => _BackgroundBinaryResizableRowState();
}

class _BackgroundBinaryResizableRowState extends State<BackgroundBinaryResizableRow> {
  late double _dividerPosition;

  @override
  void initState() {
    super.initState();
    _dividerPosition = widget.dividerPosition;
  }

  @override
  Widget build(BuildContext context) {
    _syncAfterResize();

    final content = [
      SizedBox(
        height: _calculateDimension(ResizableOrientation.vertical),
        width: _calculateDimension(ResizableOrientation.horizontal),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: _calculateMaxWidth(),
            maxHeight: _calculateMaxHeight(),
          ),
          child: widget.topChild(context, _deltaDividerPosition(_dividerPosition)),
        ),
      ),
      GestureDetector(
        onVerticalDragUpdate: widget.orientation == ResizableOrientation.vertical ? _moveDivider : null,
        onHorizontalDragUpdate: widget.orientation == ResizableOrientation.horizontal ? _moveDivider : null,
        child: MouseRegion(
          cursor: _getMouseCursor(),
          child: Container(
            height: widget.draggable
                ? (widget.orientation == ResizableOrientation.horizontal ? double.infinity : widget.dividerThickness)
                : null,
            width: widget.draggable
                ? (widget.orientation == ResizableOrientation.vertical ? double.infinity : widget.dividerThickness)
                : null,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      Expanded(
        child: widget.bottomChild(
          context,
          widget.dimension - _deltaDividerPosition(_dividerPosition),
        ),
      ),
    ];

    return widget.orientation == ResizableOrientation.vertical ? Column(children: content) : Row(children: content);
  }

  SystemMouseCursor _getMouseCursor() => widget.orientation == ResizableOrientation.horizontal
      ? SystemMouseCursors.resizeColumn
      : SystemMouseCursors.resizeRow;

  double _deltaDividerPosition(double delta) => (widget.dimension / 2) + delta;

  bool _isDividerInRange(double position) =>
      position > widget.minColumHeight && (position + widget.minColumHeight) < widget.dimension;

  double _calculateDimension(ResizableOrientation orientation) => widget.orientation == orientation
      ? _deltaDividerPosition(_dividerPosition)
      : MediaQuery.of(context).size.width - 24;

  double _calculateMaxWidth() => widget.orientation == ResizableOrientation.vertical
      ? _calculateDimension(ResizableOrientation.horizontal).clamp(widget.minScrollHeight, double.infinity)
      : MediaQuery.of(context).size.width;

  double _calculateMaxHeight() => widget.orientation == ResizableOrientation.vertical
      ? _calculateDimension(ResizableOrientation.vertical).clamp(widget.minScrollHeight, double.infinity)
      : MediaQuery.of(context).size.height;

  void _syncAfterResize() {
    final deltaAfterResize = _dividerPosition + widget.minColumHeight;
    if (deltaAfterResize < 0) {
      _dividerPosition -= deltaAfterResize;
    }
  }

  void _moveDivider(DragUpdateDetails details) {
    final delta =
        _dividerPosition + (widget.orientation == ResizableOrientation.vertical ? details.delta.dy : details.delta.dx);
    final newDividerPosition = _deltaDividerPosition(delta);
    if (_isDividerInRange(newDividerPosition)) {
      _dividerPosition = delta;
      setState(() {});
    }
  }
}
