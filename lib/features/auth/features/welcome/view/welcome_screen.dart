import 'package:flutter/material.dart';

import 'package:webtrit_configurator/features/auth/auth.dart';
import 'package:webtrit_configurator/core/core.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: child),
    );
  }
}
