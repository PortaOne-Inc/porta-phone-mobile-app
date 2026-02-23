import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:webtrit_configurator/exports/exports.dart';

import 'package:webtrit_phone/extensions/iterable.dart';
import 'package:webtrit_phone/models/models.dart';

part 'manage_setting_item_state.dart';

part 'manage_setting_item_cubit.freezed.dart';

class ManageSettingItemCubit extends Cubit<ManageSettingItemState> {
  ManageSettingItemCubit({required this.embedded, this.item})
    : super(ManageSettingItemState()) {
    assignEmbeddedPage(
      embedded.firstWhereOrNull((it) => it.id == item?.embeddedResourceId),
    );
    changeTitleL10n(item?.titleL10n);
    chaneSettingItemIcon(item?.icon);
    changeEnable(item?.enabled ?? false);
    changeType(
      SettingsFlavor.values.firstWhereOrNull((it) => it.name == item?.type),
    );
  }

  final AppConfigSettingsItem? item;
  final List<EmbeddedResourceModel> embedded;

  void assignEmbeddedPage(EmbeddedResourceModel? embeddedResource) {
    emit(state.copyWith(selectedEmbeddedResource: embeddedResource));
  }

  void changeTitleL10n(String? value) {
    emit(state.copyWith(titleL10n: value));
  }

  void chaneSettingItemIcon(String? value) {
    emit(state.copyWith(settingItemIcon: value));
  }

  void changeIconColor(String? value) {
    emit(state.copyWith(settingItemColor: value));
  }

  void changeType(SettingsFlavor? value) {
    emit(state.copyWith(type: value));
  }

  void changeEnable(bool value) {
    emit(state.copyWith(enable: value));
  }

  void apply() {
    final embedded = AppConfigSettingsItem(
      enabled: state.enable,
      type: state.type!.name,
      titleL10n: state.titleL10n!,
      icon: state.settingItemIcon!,
      iconColor: state.settingItemColor,
      embeddedResourceId: state.selectedEmbeddedResource?.id,
    );

    emit(state.copyWith(resultSettingItem: embedded));
  }
}
