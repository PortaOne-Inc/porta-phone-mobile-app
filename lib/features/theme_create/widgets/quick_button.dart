import 'package:flutter/material.dart';

class WelcomeQuickButton extends StatelessWidget {
  const WelcomeQuickButton({
    super.key,
    required this.title,
    required this.onClick,
  });

  final String title;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: TextButton(
            onPressed: () => onClick(),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
