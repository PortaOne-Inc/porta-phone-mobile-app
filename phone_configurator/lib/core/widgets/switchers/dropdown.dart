import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({
    required this.items,
    required this.onSelect,
    this.constraints, // applied to the menu, not the button
    this.icon,
    this.position = 0,
    super.key,
  });

  final List<String> items;
  final int position;
  final Icon? icon;
  final BoxConstraints? constraints; // for menu popup
  final void Function(int position) onSelect;

  @override
  State<Dropdown> createState() => _DropDownState();
}

class _DropDownState extends State<Dropdown> {
  late int _selectedPosition;

  @override
  void initState() {
    super.initState();
    _selectedPosition = widget.position;
  }

  @override
  Widget build(BuildContext context) {
    final label =
        (widget.items.isNotEmpty && _selectedPosition < widget.items.length)
        ? widget.items[_selectedPosition]
        : '';

    return ConstrainedBox(
      // guard against zero width in tricky containers (ListTile.trailing, scroll, etc.)
      constraints: const BoxConstraints(minWidth: 96),
      child: PopupMenuButton<int>(
        padding: EdgeInsets.zero,
        elevation: 1,
        constraints: widget.constraints ?? const BoxConstraints(minWidth: 160),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        onSelected: (value) {
          setState(() => _selectedPosition = value);
          widget.onSelect(value);
        },
        itemBuilder: (context) => widget.items
            .mapIndexed(
              (index, value) => PopupMenuItem<int>(
                // do not set too small a height here — keep the default or a fixed size
                value: index,
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        child: IntrinsicWidth(
          // fits the content, but respects minWidth from above
          child: SizedBox(
            height: kToolbarHeight - 8,
            child: Row(
              mainAxisSize: MainAxisSize.min, // key to "shrink to content"
              children: [
                if (widget.icon != null) ...[
                  widget.icon!,
                  const SizedBox(width: 4),
                ],
                Flexible(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
