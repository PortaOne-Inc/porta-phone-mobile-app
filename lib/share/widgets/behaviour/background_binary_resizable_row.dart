import 'package:flutter/material.dart';

//TODO: MERGE VERTICAL and HORIZONTAL
class BackgroundBinaryResizableVertical extends StatelessWidget {
  const BackgroundBinaryResizableVertical({
    super.key,
    required this.topChild,
    required this.bottomChild,
  });

  final Widget topChild;
  final Widget? bottomChild;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BackgroundBinaryResizableRow(
        topChild: topChild,
        bottomChild: bottomChild,
        screenHeight: constraints.maxHeight,
        minColumHeight: constraints.maxHeight / 4,
        dividerPosition: constraints.maxHeight / 2,
      );
    });
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
    required this.screenHeight,
  });

  final Widget topChild;
  final Widget? bottomChild;

  final double minColumHeight;
  final double minScrollHeight;

  final double dividerPosition;

  final double screenHeight;

  @override
  State<BackgroundBinaryResizableRow> createState() => _BackgroundBinaryResizableRowState();
}

class _BackgroundBinaryResizableRowState extends State<BackgroundBinaryResizableRow> {
  final _columnMargin = 2.0;

  var _screenHeight = 0.0;
  var _topContainerHeight = 0.0;
  var _bottomContainerHeight = 0.0;
  var _horizontalDividerPosition = 0.0;

  @override
  void didChangeDependencies() {
    if (widget.bottomChild != null) _recalculateProportion();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    if (widget.bottomChild != null) _horizontalDividerPosition = widget.dividerPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isSinglePage = widget.bottomChild == null;

    return isSinglePage
        ? widget.topChild
        : LayoutBuilder(builder: (context, constraints) {
            _recalculateProportion();
            return Column(
              children: [
                SizedBox(
                  height: _topContainerHeight,
                  width: MediaQuery.of(context).size.width - 24,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: _topContainerHeight > widget.minScrollHeight
                            ? _topContainerHeight
                            : widget.minScrollHeight),
                    child: widget.topChild,
                  ),
                ),
                GestureDetector(
                  onVerticalDragUpdate: (details) => _reCalculateChildrenHeight(details),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeRow,
                    child: Container(
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      height: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: _bottomContainerHeight,
                  child: widget.bottomChild,
                ),
              ],
            );
          });
  }

  void _recalculateProportion() {
    _screenHeight = widget.screenHeight - _columnMargin;
    _topContainerHeight = _calculateContainerHeight(_horizontalDividerPosition);
    _bottomContainerHeight = _calculateContainerHeight(-_horizontalDividerPosition);
  }

  double _calculateContainerHeight(double dividerPosition) {
    final containerHeight = ((_screenHeight / 2)) + dividerPosition;

    // Set minimal size for top container
    if (containerHeight < widget.minColumHeight) return widget.minColumHeight;

    // Set maximal size botto right container
    if ((containerHeight + widget.minColumHeight) > _screenHeight) return _screenHeight - widget.minColumHeight;

    return containerHeight;
  }

  void _reCalculateChildrenHeight(DragUpdateDetails details) {
    _horizontalDividerPosition += details.delta.dy;
    _topContainerHeight = _calculateContainerHeight(_horizontalDividerPosition);
    _bottomContainerHeight = _calculateContainerHeight(-_horizontalDividerPosition);

    setState(() {});
  }
}
