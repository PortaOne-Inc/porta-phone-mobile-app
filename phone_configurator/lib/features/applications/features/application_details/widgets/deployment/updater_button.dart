import 'package:flutter/material.dart';

class UpdaterButton extends StatelessWidget {
  const UpdaterButton({
    required this.progress,
    required this.onPressed,
    super.key,
  });

  final bool progress;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: progress ? null : onPressed,
      child: progress
          ? const SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(strokeWidth: 1),
            )
          : const Icon(Icons.add),
    );
  }
}
