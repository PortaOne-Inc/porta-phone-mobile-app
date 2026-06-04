import 'package:webtrit_configurator/exports/exports.dart';

import '../utils/utils.dart';
import 'tab_kind.dart';

class TabFormModel {
  TabFormModel({
    required this.kind,
    required this.title,
    required this.icon,
    required this.enabled,
    required this.initial,
    this.contactsLocal = true,
    this.contactsExternal = true,
    this.embeddedResourceId,
  });

  factory TabFormModel.fromScheme(BottomMenuTabScheme? s) {
    if (s == null) {
      return TabFormModel(kind: BottomMenuTabKind.favorites, title: '', icon: '0xe5fd', enabled: true, initial: false);
    }

    final model = TabFormModel(
      kind: kindOf(s),
      title: readTitle(s),
      icon: readIcon(s),
      enabled: readEnabled(s),
      initial: readInitial(s),
    );

    s.maybeWhen(
      contacts: (_, __, ___, ____, types) {
        model
          ..contactsLocal = types.contains('local')
          ..contactsExternal = types.contains('external');
      },
      embedded: (_, __, ___, ____, id) => model.embeddedResourceId = id,
      orElse: () {},
    );
    return model;
  }

  BottomMenuTabKind kind;
  String title;
  String icon;
  bool enabled;
  bool initial;

  bool contactsLocal;
  bool contactsExternal;

  String? embeddedResourceId;
}
