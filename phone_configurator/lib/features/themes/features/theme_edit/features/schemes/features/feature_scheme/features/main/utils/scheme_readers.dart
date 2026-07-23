import 'package:webtrit_configurator/exports/exports.dart';

String readTitle(BottomMenuTabScheme s) => s.map(
  favorites: (t) => t.titleL10n,
  recents: (t) => t.titleL10n,
  contacts: (t) => t.titleL10n,
  keypad: (t) => t.titleL10n,
  messaging: (t) => t.titleL10n,
  embedded: (t) => t.titleL10n,
);

String readIcon(BottomMenuTabScheme s) => s.map(
  favorites: (t) => t.icon,
  recents: (t) => t.icon,
  contacts: (t) => t.icon,
  keypad: (t) => t.icon,
  messaging: (t) => t.icon,
  embedded: (t) => t.icon,
);

bool readEnabled(BottomMenuTabScheme s) => s.map(
  favorites: (t) => t.enabled,
  recents: (t) => t.enabled,
  contacts: (t) => t.enabled,
  keypad: (t) => t.enabled,
  messaging: (t) => t.enabled,
  embedded: (t) => t.enabled,
);

bool readInitial(BottomMenuTabScheme s) => s.map(
  favorites: (t) => t.initial,
  recents: (t) => t.initial,
  contacts: (t) => t.initial,
  keypad: (t) => t.initial,
  messaging: (t) => t.initial,
  embedded: (t) => t.initial,
);
