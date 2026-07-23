import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class InjectionProvider extends InheritedWidget {
  const InjectionProvider({
    required this.getIt,
    required super.child,
    super.key,
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
