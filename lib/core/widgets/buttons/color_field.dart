import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webtrit_configurator/core/core.dart';

class ColorField extends StatelessWidget {
  const ColorField({
    required this.title,
    required this.constraints,
    this.color = Colors.white,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    super.key,
  });

  final String title;
  final Color? color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxConstraints constraints;
  final void Function(Color color)? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final effectiveColor = color ?? colorScheme.primary.withOpacity(0.5);
    final inverseColor = _getTextColorForBackground(effectiveColor);

    return GestureDetector(
      onTap: () => onTap?.call(effectiveColor),
      child: Card(
        color: color,
        clipBehavior: Clip.antiAlias,
        margin: margin,
        elevation: 1,
        child: ConstrainedBox(
          constraints: constraints,
          child: Stack(
            children: [
              if (color == null)
                Positioned.fill(
                  child: CustomPaint(
                    painter: _PatternPainter(primaryColor: effectiveColor),
                  ),
                ),
              Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTitle(textTheme, inverseColor),
                    const SizedBox(height: 8),
                    _buildColorDisplay(context, effectiveColor, inverseColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(TextTheme textTheme, Color textColor) {
    return Text(
      title,
      style: textTheme.labelLarge?.copyWith(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildColorDisplay(BuildContext context, Color effectiveColor, Color textColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          color != null ? effectiveColor.toHex() : 'Not defined.',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: textColor),
        ),
        if (color != null)
          IconButton(
            icon: Icon(Icons.copy, size: 16, color: textColor),
            tooltip: 'Copy color',
            onPressed: () => _copyColorToClipboard(context, effectiveColor),
          ),
      ],
    );
  }

  void _copyColorToClipboard(BuildContext context, Color color) {
    final hexValue = color.toHex();
    Clipboard.setData(ClipboardData(text: hexValue));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied "$hexValue" to clipboard')),
    );
  }

  /// Determines the appropriate text color based on the brightness of the background.
  Color _getTextColorForBackground(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}

class _PatternPainter extends CustomPainter {
  _PatternPainter({required this.primaryColor});

  final Color primaryColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    const cellSize = 20.0;

    for (var row = 0; row < (size.height / cellSize).ceil(); row++) {
      for (var col = 0; col < (size.width / cellSize).ceil(); col++) {
        paint.color = (row + col).isEven ? primaryColor.withOpacity(0.85) : primaryColor.withOpacity(0.65);

        final rect = Rect.fromLTWH(col * cellSize, row * cellSize, cellSize, cellSize);
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
