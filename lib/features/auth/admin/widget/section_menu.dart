import 'package:flutter/material.dart';

class SectionMenu extends StatelessWidget {
  final String title;
  final Function() onUpdate;

  const SectionMenu({Key? key, required this.title, required this.onUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(onPressed: onUpdate, child: const Text('Update'))
          ],
        ));
  }
}
