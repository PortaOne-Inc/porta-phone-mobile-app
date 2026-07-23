import 'package:flutter/material.dart';

class EmptyHolder extends StatelessWidget {
  const EmptyHolder({
    required this.visibility,
    required this.onPressed,
    required this.title,
    required this.description,
    required this.button,
    super.key,
  });

  final bool visibility;
  final void Function() onPressed;

  final String title;
  final String description;
  final String button;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
            ),
            onPressed: onPressed,
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: Center(child: Text(button)),
            ),
          ),
        ],
      ),
    );
  }
}
