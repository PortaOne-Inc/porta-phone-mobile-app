import 'package:flutter/material.dart';

class LogEventClose extends StatelessWidget {
  const LogEventClose({
    super.key,
    required this.onClick,
  });

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onClick(),
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          child: const Icon(
            Icons.close,
            size: 18,
            color: Colors.black54,
          ),
        ));
  }
}
