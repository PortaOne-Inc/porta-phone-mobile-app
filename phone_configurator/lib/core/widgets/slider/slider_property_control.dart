import 'package:flutter/material.dart';

class SliderPropertyControl extends StatefulWidget {
  const SliderPropertyControl(
    this.value,
    this.onValueChanged, {
    required this.label,
    super.key,
    this.min = 0.0,
    this.max = 112.0,
    this.maxWidth,
    this.showDivisions = true,
    this.vertical = false,
    this.margin = EdgeInsets.zero,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final double? maxWidth;
  final bool showDivisions;
  final bool vertical;
  final ValueChanged<double> onValueChanged;
  final EdgeInsets margin;

  @override
  SliderPropertyControlState createState() {
    return SliderPropertyControlState();
  }
}

class SliderPropertyControlState extends State<SliderPropertyControl> {
  double updatedValue = 0;

  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    updatedValue = widget.value;
    textController = TextEditingController(text: '$updatedValue');
  }

  @override
  Widget build(BuildContext context) {
    textController.text = '$updatedValue';
    return Card(
      margin: widget.margin,
      child: Flex(
        direction: widget.vertical ? Axis.vertical : Axis.horizontal,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              child: RichText(
                text: TextSpan(
                  text: '${widget.label} : ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: updatedValue.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Slider(
              value: updatedValue,
              min: widget.min,
              max: widget.max,
              divisions: widget.showDivisions
                  ? (widget.max - widget.min) ~/ 4
                  : null,
              onChangeEnd: widget.onValueChanged,
              onChanged: (value) {
                updatedValue = value;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
