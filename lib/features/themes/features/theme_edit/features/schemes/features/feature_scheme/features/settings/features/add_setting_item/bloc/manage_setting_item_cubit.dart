import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:data/dto/dto.dart';

import 'package:webtrit_phone/extensions/iterable.dart';

part 'manage_setting_item_state.dart';

part 'manage_setting_item_cubit.freezed.dart';

class ManageSettingItemCubit extends Cubit<ManageSettingItemState> {
  ManageSettingItemCubit({
    required this.embedded,
    this.item,
  }) : super(ManageSettingItemState()) {
    assignEmbeddedPage(embedded.firstWhereOrNull((it) => it.id == item?.embeddedResourceId));
    changeTitleL10n(item?.titleL10n);
    chaneSettingItemIcon(item?.icon);
    changeType(item?.type ?? 'embedded');
    changeEnable(item?.enabled ?? false);
  }

  final AppConfigSettingsItem? item;
  final List<EmbeddedResource> embedded;

  void assignEmbeddedPage(EmbeddedResource? embeddedResource) {
    emit(state.copyWith(selectedEmbeddedResource: embeddedResource));
  }

  void changeTitleL10n(String? value) {
    emit(state.copyWith(titleL10n: value));
  }

  void chaneSettingItemIcon(String? value) {
    emit(state.copyWith(settingItemIcon: value));
  }

  void changeType(String value) {
    emit(state.copyWith(type: value));
  }

  void changeEnable(bool value) {
    emit(state.copyWith(enable: value));
  }

  void apply() {
    final embedded = AppConfigSettingsItem(
      enabled: state.enable,
      type: state.type!,
      titleL10n: state.titleL10n!,
      icon: state.settingItemIcon!,
      embeddedResourceId: state.selectedEmbeddedResource?.id,
    );

    emit(state.copyWith(resultSettingItem: embedded));
  }
}
