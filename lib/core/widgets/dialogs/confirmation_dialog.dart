import 'package:flutter/cupertino.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.description,
    required this.visibility,
    required this.onConfirm,
    required this.onDecline,
  });

  final Function() onConfirm;
  final Function() onDecline;

  final String title;
  final String description;

  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: visibility
          ? CupertinoAlertDialog(
              key: const ValueKey('ConfirmationDialogVisible'),
              title: Text(title),
              content: Text(description),
              actions: [
                CupertinoDialogAction(
                  onPressed: onConfirm,
                  isDefaultAction: true,
                  isDestructiveAction: true,
                  child: const Text('Yes'),
                ),
                CupertinoDialogAction(
                  onPressed: onDecline,
                  isDefaultAction: false,
                  isDestructiveAction: false,
                  child: const Text('No'),
                )
              ],
            )
          : const SizedBox(
              key: ValueKey('ConfirmationDialogInVisible'),
            ),
    );
  }
}
