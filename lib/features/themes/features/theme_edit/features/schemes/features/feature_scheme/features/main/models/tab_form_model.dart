import 'package:webtrit_configurator/exports/exports.dart';

import '../utils/utils.dart';
import 'tab_kind.dart';

class TabFormModel {
  factory TabFormModel.fromScheme(BottomMenuTabScheme? s) {
    if (s == null) {
      return TabFormModel(
        kind: BottomMenuTabKind.favorites,
        title: '',
        icon: '0xe5fd',
        enabled: true,
        initial: false,
      );
    }

    final model = TabFormModel(
      kind: kindOf(s),
      title: readTitle(s),
      icon: readIcon(s),
      enabled: readEnabled(s),
      initial: readInitial(s),
    );

    s.maybeWhen(
      recents: (_, __, ___, ____, useCdrs) => model.useCdrs = useCdrs,
      contacts: (_, __, ___, ____, types) {
        model..contactsLocal = types.contains('local')
        ..contactsExternal = types.contains('external');
      },
      embedded: (_, __, ___, ____, id) => model.embeddedResourceId = id,
      orElse: () {},
    );
    return model;
  }

  TabFormModel({
    required this.kind,
    required this.title,
    required this.icon,
    required this.enabled,
    required this.initial,
    this.useCdrs = false,
    this.contactsLocal = true,
    this.contactsExternal = true,
    this.embeddedResourceId,
  });

  BottomMenuTabKind kind;
  String title;
  String icon;
  bool enabled;
  bool initial;

  bool useCdrs;
  bool contactsLocal;
  bool contactsExternal;

  String? embeddedResourceId;
}
