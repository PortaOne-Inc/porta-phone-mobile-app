import 'package:flutter/material.dart';

class SingleStack extends StatelessWidget {
  const SingleStack({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: key,
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
