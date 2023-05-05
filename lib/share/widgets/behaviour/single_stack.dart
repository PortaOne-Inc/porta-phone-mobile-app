import 'package:flutter/material.dart';

class SingleStack extends StatelessWidget {
  final Widget child;

  const SingleStack({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (routeSettings) {
        return PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return child;
          },
        );
      },
    );
  }
}
