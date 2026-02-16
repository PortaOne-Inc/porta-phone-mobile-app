part of 'manage_setting_item_cubit.dart';

@freezed
sealed class ManageSettingItemState with _$ManageSettingItemState {
  factory ManageSettingItemState({
    @Default(true) bool enable,
    String? titleL10n,
    String? settingItemIcon,
    String? settingItemColor,
    EmbeddedResourceModel? selectedEmbeddedResource,
    SettingsFlavor? type,
    AppConfigSettingsItem? resultSettingItem,
  }) = _Initial;

  ManageSettingItemState._();

  bool get isFormValid => titleL10n != null && settingItemIcon != null && type != null;
}
