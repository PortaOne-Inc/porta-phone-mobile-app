import 'package:flutter/material.dart';

import 'package:domain/domain.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({required this.onPressed, required this.error, super.key});

  final Object? error;

  final VoidCallback onPressed;

  bool get _isException {
    return error is BaseException;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          // TODO(SERDUN): Do correct way and common way for parse exception
          'Error: ${_isException ? (error! as BaseException).message : error}',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        ElevatedButton(onPressed: onPressed, child: const Text('Retry')),
      ],
    );
  }
}
