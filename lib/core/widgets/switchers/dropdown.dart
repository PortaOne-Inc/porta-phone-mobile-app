import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../toolbars/toolbars.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;
  final Function(int position) onSelect;

  const Dropdown({
    super.key,
    required this.items,
    required this.onSelect,
  });

  @override
  State<Dropdown> createState() => _DropDownState();
}

class _DropDownState extends State<Dropdown> {
  int _selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      constraints: const BoxConstraints(maxWidth: 64),
      elevation: 1,
      offset: const Offset(8, kToolbarHeight),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      onSelected: (value) {
        widget.onSelect(value);
        _selectedPosition = value;
      },
      itemBuilder: (context) => widget.items
          .mapIndexed(
            (index, value) => PopupMenuItem(
              height: menuItemHeight,
              value: index,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          )
          .toList(),
      child: SizedBox(
        height: kToolbarHeight - 8,
        child: TextButton(
          onPressed: null,
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, textStyle: Theme.of(context).textTheme.labelSmall),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              widget.items[_selectedPosition],
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
