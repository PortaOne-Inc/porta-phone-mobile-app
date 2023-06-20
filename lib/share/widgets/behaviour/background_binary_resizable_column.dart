import 'package:flutter/material.dart';

class BackgroundBinaryResizableColumn extends StatefulWidget {
  const BackgroundBinaryResizableColumn({
    super.key,
    required this.leftChild,
    required this.rightChild,
    this.minColumWidth = 200.0,
    this.minScrollWidth = 500.0,
  });

  final Widget leftChild;
  final Widget rightChild;

  final double minColumWidth;
  final double minScrollWidth;

  @override
  State<BackgroundBinaryResizableColumn> createState() => _BackgroundBinaryResizableColumnState();
}

class _BackgroundBinaryResizableColumnState extends State<BackgroundBinaryResizableColumn> {
  final _columnMargin = 2.0;

  var _screenWidth = 0.0;
  var _leftColumnWidth = 0.0;
  var _rightColumnWidth = 0.0;
  var _horizontalDividerPosition = 0.0;

  @override
  void didChangeDependencies() {
    _recalculateProportion();
    super.didChangeDependencies();
  }

  double _getScreenWidth() {
    return MediaQuery.of(context).size.width - _columnMargin;
  }

  void _recalculateProportion() {
    _screenWidth = _getScreenWidth();
    _leftColumnWidth = _calculateLeftContainerWidth(_horizontalDividerPosition);
    _rightColumnWidth = _calculateRightContainerWidth(_horizontalDividerPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: _leftColumnWidth,
          height: MediaQuery.of(context).size.height - 24,
          child: Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              primary: true,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: _leftColumnWidth > widget.minScrollWidth ? _leftColumnWidth : widget.minScrollWidth),
                child: widget.leftChild,
              ),
            ),
          ),
        ),
        GestureDetector(
          onHorizontalDragUpdate: (details) => _reCalculateChildrenWidth(details),
          child: MouseRegion(
            cursor: SystemMouseCursors.resizeColumn,
            child: Container(
              width: 2,
              color: Theme.of(context).colorScheme.inversePrimary,
              height: double.infinity,
            ),
          ),
        ),
        SizedBox(
          width: _rightColumnWidth,
          child: widget.rightChild,
        ),
      ],
    );
  }

  double _calculateLeftContainerWidth(double dividerPosition) {
    final containerWidth = ((_screenWidth / 2)) + dividerPosition;

    // Set minimal size for left container
    if (containerWidth < widget.minColumWidth) return widget.minColumWidth;

    // Set maximal size for right container
    if ((containerWidth + widget.minColumWidth) > _screenWidth) return _screenWidth - widget.minColumWidth;

    return containerWidth;
  }

  double _calculateRightContainerWidth(double dividerPosition) {
    final containerWidth = ((_screenWidth / 2)) - dividerPosition;

    // Set minimal size for right container
    if (containerWidth < widget.minColumWidth) return widget.minColumWidth;

    // Set maximal size for left container
    if ((containerWidth + widget.minColumWidth) > _screenWidth) return _screenWidth - widget.minColumWidth;

    return containerWidth;
  }

  void _reCalculateChildrenWidth(DragUpdateDetails details) {
    _horizontalDividerPosition += details.delta.dx;
    _leftColumnWidth = _calculateLeftContainerWidth(_horizontalDividerPosition);
    _rightColumnWidth = _calculateRightContainerWidth(_horizontalDividerPosition);

    setState(() {});
  }
}
