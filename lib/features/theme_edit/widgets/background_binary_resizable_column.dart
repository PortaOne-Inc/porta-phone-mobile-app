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
  final double _columnMargin = 2;

  double _screenWidth = 0;
  double _leftColumnWidth = 0;
  double _rightColumnWidth = 0;
  double _verticalDividerPosition = 0;

  @override
  void didChangeDependencies() {
    _screenWidth = MediaQuery.of(context).size.width - _columnMargin;
    _leftColumnWidth = _calculateLeftContainerWidth(0);
    _rightColumnWidth = _calculateRightContainerWidth(0);
    super.didChangeDependencies();
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
              color: Colors.black38,
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
    _verticalDividerPosition += details.delta.dx;
    _leftColumnWidth = _calculateLeftContainerWidth(_verticalDividerPosition);
    _rightColumnWidth = _calculateRightContainerWidth(_verticalDividerPosition);

    setState(() {});
  }
}
