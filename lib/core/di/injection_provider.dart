import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class InjectionProvider extends InheritedWidget {
  const InjectionProvider({
    super.key,
    required this.getIt,
    required super.child,
  }) : super();

  final GetIt getIt;

  static InjectionProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InjectionProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant InjectionProvider oldWidget) {
    return oldWidget.getIt != getIt;
  }
}
