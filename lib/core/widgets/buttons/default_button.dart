import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.title,
    required this.onPressed,
    this.isEnable = true,
    super.key,
  });

  final String title;
  final void Function() onPressed;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
