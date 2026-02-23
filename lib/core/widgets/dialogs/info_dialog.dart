import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({required this.title, required this.message, super.key});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Text(message)],
      ),
      actions: <Widget>[
        Button(
          onPressed: () {
            Navigator.of(context).pop();
          },
          title: 'OK',
        ),
      ],
    );
  }
}
