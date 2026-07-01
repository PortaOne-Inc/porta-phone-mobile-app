import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

import '../widgets/widgets.dart';

mixin MixinMessages {
  void showTopSnakeMessageSuccess(
    BuildContext context,
    String message, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    final snakeBar = SnackBar(
      content: Text(message, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      duration: duration,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      ),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - kToolbarHeight - kMinInteractiveDimension),
    );

    ScaffoldMessenger.of(context).showSnackBar(snakeBar);
  }

  void showFailureMessage(BuildContext context, Object error) {
    if (error is UnauthorizedException) {
      return;
    }

    final dialog = FailureDialog(error: error);
    showDialog<void>(context: context, builder: (BuildContext context) => dialog);
  }
}
