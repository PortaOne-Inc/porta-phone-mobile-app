import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    required this.density,
    super.key,
  });

  final int density;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background.withOpacity(0.5),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: density,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                width: .5,
              ),
            ),
          );
        },
        itemCount: density * density,
      ),
    );
  }
}
