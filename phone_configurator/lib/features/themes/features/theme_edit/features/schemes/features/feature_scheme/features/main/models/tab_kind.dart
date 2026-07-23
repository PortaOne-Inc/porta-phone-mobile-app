import 'package:webtrit_configurator/exports/exports.dart';

enum BottomMenuTabKind {
  favorites,
  recents,
  contacts,
  keypad,
  messaging,
  embedded,
}

extension BottomMenuTabKindX on BottomMenuTabKind {
  String get label => name;
}

BottomMenuTabKind kindOf(BottomMenuTabScheme s) => s.map(
  favorites: (_) => BottomMenuTabKind.favorites,
  recents: (_) => BottomMenuTabKind.recents,
  contacts: (_) => BottomMenuTabKind.contacts,
  keypad: (_) => BottomMenuTabKind.keypad,
  messaging: (_) => BottomMenuTabKind.messaging,
  embedded: (_) => BottomMenuTabKind.embedded,
);
