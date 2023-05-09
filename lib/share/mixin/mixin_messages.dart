import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

mixin MixinMessages {
  void showTopSnakeMessageSuccess(
    BuildContext context,
    String message, {
    Color color = Colors.lightGreen,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    final snakeBar = SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        dismissDirection: DismissDirection.up,
        duration: duration,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - kToolbarHeight, right: 8, left: 8));

    ScaffoldMessenger.of(context).showSnackBar(snakeBar);
  }

  void showTopSnakeMessageInfo(BuildContext context, String message, {Color color = Colors.lightGreen}) {
    showTopSnakeMessageSuccess(context, message, color: Colors.grey);
  }

  void showFailureMessage(BuildContext context, String message) {
    final dialog = FailureDialog(message: message);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
