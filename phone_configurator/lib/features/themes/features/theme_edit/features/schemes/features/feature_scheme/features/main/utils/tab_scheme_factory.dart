import 'package:webtrit_configurator/exports/exports.dart';

import '../models/models.dart';

BottomMenuTabScheme buildSchemeFromForm(TabFormModel f) {
  final icon = f.icon.isNotEmpty ? f.icon : '0xe5fd';

  switch (f.kind) {
    case BottomMenuTabKind.favorites:
      return FavoritesTabScheme(enabled: f.enabled, initial: f.initial, titleL10n: f.title, icon: icon);
    case BottomMenuTabKind.recents:
      return RecentsTabScheme(
        enabled: f.enabled,
        initial: f.initial,
        titleL10n: f.title,
        icon: icon,
        supportsCallHistory: f.supportsCallHistory,
      );
    case BottomMenuTabKind.contacts:
      return ContactsTabScheme(
        enabled: f.enabled,
        initial: f.initial,
        titleL10n: f.title,
        icon: icon,
        contactSourceTypes: [if (f.contactsLocal) 'local', if (f.contactsExternal) 'external'],
      );
    case BottomMenuTabKind.keypad:
      return KeypadTabScheme(enabled: f.enabled, initial: f.initial, titleL10n: f.title, icon: icon);
    case BottomMenuTabKind.messaging:
      return MessagingTabScheme(enabled: f.enabled, initial: f.initial, titleL10n: f.title, icon: icon);
    case BottomMenuTabKind.embedded:
      if ((f.embeddedResourceId ?? '').isEmpty) {
        throw StateError('Embedded resource is required for embedded tab.');
      }
      return EmbeddedTabScheme(
        enabled: f.enabled,
        initial: f.initial,
        titleL10n: f.title,
        icon: icon.isNotEmpty ? icon : '0xe556',
        embeddedResourceId: f.embeddedResourceId!,
      );
  }
}
