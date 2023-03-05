import 'package:flutter/material.dart';

import 'mock_device.dart';

class MockSmallPreviewCard extends StatelessWidget {
  const MockSmallPreviewCard({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.child,
  });

  final Function() onTap;
  final bool isActive;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        elevation: isActive ? 0.4 : 2,
        color: isActive ? const Color(0xFFECECEC) : null,
        shadowColor: isActive ? Colors.green : null,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(48),
              child: MockDevice(child: child),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Icon(
                isActive ? Icons.center_focus_strong_rounded : Icons.center_focus_strong_outlined,
                color: isActive ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
