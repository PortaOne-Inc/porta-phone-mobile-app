import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class PhoneContext extends StatelessWidget {
  const PhoneContext({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Theme(
        data: ThemeProvider.of(context).light()!,
        child: child,
      ),
    );
  }
}
