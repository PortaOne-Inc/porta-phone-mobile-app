import 'package:flutter/material.dart';

class SingleStack extends StatelessWidget {
  const SingleStack({
    super.key,
    this.navigator,
    required this.child,
  });

  final Widget child;
  final Key? navigator;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigator,
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
