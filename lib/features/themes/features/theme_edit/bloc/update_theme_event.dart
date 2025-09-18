part of 'update_theme_cubit.dart';

abstract class ConfiguratorEvent {
  const ConfiguratorEvent();
}

@Freezed(copyWith: false)
class InitializeEvent with _$InitializeEvent implements ConfiguratorEvent {
  const factory InitializeEvent() = _InitializeEvent;
}

@Freezed(copyWith: false)
class SyncConfigEvent with _$SyncConfigEvent implements ConfiguratorEvent {
  const factory SyncConfigEvent() = _SyncConfigEvent;
}

@Freezed(copyWith: false)
class UpdateLocalConfigEvent with _$UpdateLocalConfigEvent implements ConfiguratorEvent {
  const factory UpdateLocalConfigEvent.colorScheme(ColorSchemeConfig scheme) = _UpdateThemeSchemeColorEvent;

  const factory UpdateLocalConfigEvent.page(ThemePageConfig page) = _UpdateThemePageEvent;

  const factory UpdateLocalConfigEvent.widget(ThemeWidgetConfig widget) = _UpdateThemeWidgetEvent;

  const factory UpdateLocalConfigEvent.featureAccess(AppConfig config) = _UpdateAppConfigEvent;
}

@Freezed(copyWith: false)
class UpdateColorSchemeEvent with _$UpdateColorSchemeEvent implements ConfiguratorEvent {
  const factory UpdateColorSchemeEvent.chane(String key, Color? color) = _UpdateColorSchemeEvent;
}

@freezed
class AppConfigEvent with _$AppConfigEvent implements ConfiguratorEvent {
  // loginConfig
  const factory AppConfigEvent.setLoginConfig(AppConfigLogin login) = _SetLoginConfig;

  const factory AppConfigEvent.setLoginGreeting(String? greetingL10n) = _SetLoginGreeting;

  const factory AppConfigEvent.setLoginModeSelectActions(List<AppConfigModeSelectAction> actions) =
      _SetLoginModeSelectActions;

  const factory AppConfigEvent.setMainConfig(AppConfigMain main) = _SetMainConfig;

  const factory AppConfigEvent.setMainSystemNotificationsEnabled(bool enabled) = _SetMainSystemNotificationsEnabled;

  const factory AppConfigEvent.setBottomMenu(AppConfigBottomMenu bottomMenu) = _SetBottomMenu;

  const factory AppConfigEvent.setBottomMenuCacheSelectedTab(bool cache) = _SetBottomMenuCacheSelectedTab;

  const factory AppConfigEvent.setBottomMenuTabs(List<BottomMenuTabScheme> tabs) = _SetBottomMenuTabs;

  const factory AppConfigEvent.updateBottomMenuTab({required int index, required BottomMenuTabScheme tab}) =
      _UpdateBottomMenuTab;

  const factory AppConfigEvent.insertBottomMenuTab({required int index, required BottomMenuTabScheme tab}) =
      _InsertBottomMenuTab;

  const factory AppConfigEvent.removeBottomMenuTabAt(int index) = _RemoveBottomMenuTabAt;

  // settingsConfig
  const factory AppConfigEvent.setSettingsConfig(AppConfigSettings settings) = _SetSettingsConfig;

  const factory AppConfigEvent.setSettingsSections(List<AppConfigSettingsSection> sections) = _SetSettingsSections;

  // callConfig
  const factory AppConfigEvent.setCallConfig(AppConfigCall callConfig) = _SetCallConfig;

  const factory AppConfigEvent.setCallVideoEnabled(bool enabled) = _SetCallVideoEnabled;

  const factory AppConfigEvent.setCallTransfer(AppConfigTransfer transfer) = _SetCallTransfer;

  const factory AppConfigEvent.setCallEncoding(AppConfigEncoding encoding) = _SetCallEncoding;

  const factory AppConfigEvent.setCallPeerConnection(AppConfigPeerConnection pc) = _SetCallPeerConnection;

  const factory AppConfigEvent.setNegotiationOverride(AppConfigNegotiationSettingsOverride negotiation) =
      _SetNegotiationOverride;

// // embeddedResources
// const factory AppConfigEvent.setEmbeddedResources(List<EmbeddedResource> list) = _SetEmbeddedResources;
}

@freezed
sealed class ThemePageEvent with _$ThemePageEvent implements ConfiguratorEvent {
  // Login page
  const factory ThemePageEvent.setLoginPage(LoginPageConfig login) = _SetLoginPage;

  const factory ThemePageEvent.setLoginPicture(AssetModel asset) = _SetLoginPicture;

  const factory ThemePageEvent.setLoginScale(double? scale) = _SetLoginScale;

  const factory ThemePageEvent.setLoginLabelColor(String? color) = _SetLoginLabelColor;

  const factory ThemePageEvent.setLoginModeSelect(LoginModeSelectPageConfig modeSelect) = _SetLoginModeSelect;

  const factory ThemePageEvent.setLoginModeSelectButtonLoginStyle(ElevatedButtonStyleType type) =
      _SetLoginModeSelectButtonLoginStyle;

  const factory ThemePageEvent.setLoginModeSelectButtonSignupStyle(ElevatedButtonStyleType type) =
      _SetLoginModeSelectButtonSignupStyle;

  // About page
  const factory ThemePageEvent.setAboutPage(AboutPageConfig about) = _SetAboutPage;

  const factory ThemePageEvent.setAboutPicture(AssetModel asset) = _SetAboutPicture;

  const factory ThemePageEvent.setAboutMetadata(Metadata metadata) = _SetAboutMetadata;

  const factory ThemePageEvent.setDialingPage(CallPageConfig dialingPage) = _SetDialingPage;

  const factory ThemePageEvent.setDialingSystemUiOverlay(OverlayStyleModel? style) = _SetDialingSystemUiOverlay;

  const factory ThemePageEvent.setDialingAppBarStyle(AppBarStyleConfig? appBarStyle) = _SetDialingAppBarStyle;

  const factory ThemePageEvent.setDialingInfo(CallPageInfoConfig? info) = _SetDialingInfo;

  // Dialing info fields
  const factory ThemePageEvent.setDialingInfoUsernameStyle(TextStyleConfig? style) = _SetDialingInfoUsernameStyle;

  const factory ThemePageEvent.setDialingInfoNumberStyle(TextStyleConfig? style) = _SetDialingInfoNumberStyle;

  const factory ThemePageEvent.setDialingInfoCallStatusStyle(TextStyleConfig? style) = _SetDialingInfoCallStatusStyle;

  const factory ThemePageEvent.setDialingInfoProcessingStatusStyle(TextStyleConfig? style) =
      _SetDialingInfoProcessingStatusStyle;

  const factory ThemePageEvent.setKeypadPage(KeypadPageConfig keypad) = _SetKeypadPage;

  /// OTP Sign-in verify countdown (seconds, 0 disables)
  const factory ThemePageEvent.setLoginOtpSigninVerifyCountdown(int seconds) = _SetLoginOtpSigninVerifyCountdown;

  /// Sign-up verify countdown (seconds, 0 disables)
  const factory ThemePageEvent.setLoginSignupVerifyCountdown(int seconds) = _SetLoginSignupVerifyCountdown;
}

@freezed
sealed class ThemeWidgetEvent with _$ThemeWidgetEvent implements ConfiguratorEvent {
  // Fonts
  const factory ThemeWidgetEvent.setFonts(FontsConfig fonts) = _SetFonts;

  const factory ThemeWidgetEvent.setGlobalFontFamily(String? fontFamily) = _SetGlobalFontFamily;

  // Button
  const factory ThemeWidgetEvent.setButton(ButtonWidgetConfig button) = _SetButton;

  const factory ThemeWidgetEvent.setPEButton(ElevatedButtonWidgetConfig cfg) = _SetPrimaryElevatedButton;

  const factory ThemeWidgetEvent.setPEButtonBackground(String? color) = _SetPEBBackground;

  const factory ThemeWidgetEvent.setPEButtonForeground(String? color) = _SetPEBForeground;

  const factory ThemeWidgetEvent.setPEButtonTextColor(String? color) = _SetPEBTextColor;

  const factory ThemeWidgetEvent.setPEButtonIconColor(String? color) = _SetPEBIconColor;

  const factory ThemeWidgetEvent.setPEButtonDisabledIconColor(String? color) = _SetPEBDisabledIconColor;

  // Group
  const factory ThemeWidgetEvent.setGroup(GroupWidgetConfig group) = _SetGroup;

  const factory ThemeWidgetEvent.setGroupTitleListTile(GroupTitleListTileWidgetConfig cfg) = _SetGroupTitleListTile;

  const factory ThemeWidgetEvent.setGroupTitleListTileBackground(String? color) = _SetGroupTitleListTileBackground;

  const factory ThemeWidgetEvent.setGroupTitleListTileTextColor(String? color) = _SetGroupTitleListTileTextColor;

  const factory ThemeWidgetEvent.setCallActions(CallActionsWidgetConfig cfg) = _SetCallActions;

  // Bar
  const factory ThemeWidgetEvent.setBar(BarWidgetConfig bar) = _SetBar;

  const factory ThemeWidgetEvent.setBottomNavigationBar(BottomNavigationBarWidgetConfig cfg) = _SetBottomNavBar;

  const factory ThemeWidgetEvent.setBottomNavBarBackground(String? color) = _SetBottomNavBarBackground;

  const factory ThemeWidgetEvent.setBottomNavBarSelected(String? color) = _SetBottomNavBarSelected;

  const factory ThemeWidgetEvent.setBottomNavBarUnselected(String? color) = _SetBottomNavBarUnselected;

  const factory ThemeWidgetEvent.setExtTabBar(ExtTabBarWidgetConfig cfg) = _SetExtTabBar;

  const factory ThemeWidgetEvent.setExtTabBarForeground(String? color) = _SetExtTabBarForeground;

  const factory ThemeWidgetEvent.setExtTabBarBackground(String? color) = _SetExtTabBarBackground;

  const factory ThemeWidgetEvent.setExtTabBarSelected(String? color) = _SetExtTabBarSelected;

  const factory ThemeWidgetEvent.setExtTabBarUnselected(String? color) = _SetExtTabBarUnselected;

  // Image assets
  const factory ThemeWidgetEvent.setImageAssets(ImageAssetsConfig cfg) = _SetImageAssets;

  const factory ThemeWidgetEvent.setPrimaryOnboardingLogo(ImageAssetConfig cfg) = _SetPrimaryOnboardingLogo;

  const factory ThemeWidgetEvent.setSecondaryOnboardingLogo(ImageAssetConfig cfg) = _SetSecondaryOnboardingLogo;

  const factory ThemeWidgetEvent.setAppIcon(AppIconWidgetConfig cfg) = _SetAppIcon;

  const factory ThemeWidgetEvent.setLeadingAvatarStyle(LeadingAvatarStyleConfig cfg) = _SetLeadingAvatarStyle;

  // Input
  const factory ThemeWidgetEvent.setInput(InputWidgetConfig cfg) = _SetInput;

  const factory ThemeWidgetEvent.setTextFormField(TextFormFieldWidgetConfig cfg) = _SetTextFormField;

  const factory ThemeWidgetEvent.setInputLabelColor(String? color) = _SetInputLabelColor;

  const factory ThemeWidgetEvent.setInputBorder(InputBorderWidgetConfig cfg) = _SetInputBorder;

  const factory ThemeWidgetEvent.setInputBorderDisabled(BorderWidgetConfig cfg) = _SetInputBorderDisabled;

  const factory ThemeWidgetEvent.setInputBorderFocused(BorderWidgetConfig cfg) = _SetInputBorderFocused;

  const factory ThemeWidgetEvent.setInputBorderAny(BorderWidgetConfig cfg) = _SetInputBorderAny;

  // Text
  const factory ThemeWidgetEvent.setText(TextWidgetConfig cfg) = _SetText;

  const factory ThemeWidgetEvent.setTextSelection(TextSelectionWidgetConfig cfg) = _SetTextSelection;

  const factory ThemeWidgetEvent.setTextCursorColor(String? color) = _SetTextCursorColor;

  const factory ThemeWidgetEvent.setTextSelectionColor(String? color) = _SetTextSelectionColor;

  const factory ThemeWidgetEvent.setTextSelectionHandleColor(String? color) = _SetTextSelectionHandleColor;

  const factory ThemeWidgetEvent.setLinkify(LinkifyWidgetConfig cfg) = _SetLinkify;

  const factory ThemeWidgetEvent.setLinkifyStyleColor(String? color) = _SetLinkifyStyleColor;

  const factory ThemeWidgetEvent.setLinkifyLinkColor(String? color) = _SetLinkifyLinkColor;

  // Dialog
  const factory ThemeWidgetEvent.setDialog(DialogWidgetConfig cfg) = _SetDialog;

  const factory ThemeWidgetEvent.setConfirmDialog(ConfirmDialogWidgetConfig cfg) = _SetConfirmDialog;

  const factory ThemeWidgetEvent.setConfirmDialogActive1(String? color) = _SetConfirmDialogActive1;

  const factory ThemeWidgetEvent.setConfirmDialogActive2(String? color) = _SetConfirmDialogActive2;

  const factory ThemeWidgetEvent.setConfirmDialogDefault(String? color) = _SetConfirmDialogDefault;

  const factory ThemeWidgetEvent.setSnackBar(SnackBarWidgetConfig cfg) = _SetSnackBar;

  // ActionPad
  const factory ThemeWidgetEvent.setActionPad(ActionPadWidgetConfig cfg) = _SetActionPad;

  const factory ThemeWidgetEvent.setActionPadCallStart(ElevatedButtonWidgetConfig cfg) = _SetActionPadCallStart;

  const factory ThemeWidgetEvent.setActionPadTransfer(ElevatedButtonWidgetConfig cfg) = _SetActionPadTransfer;

  const factory ThemeWidgetEvent.setActionPadBackspacePressed(ElevatedButtonWidgetConfig cfg) = _SetActionPadBackspace;

  // Statuses
  const factory ThemeWidgetEvent.setStatuses(StatusesWidgetConfig cfg) = _SetStatuses;

  const factory ThemeWidgetEvent.setRegistrationStatuses(RegistrationStatusesWidgetConfig cfg) =
      _SetRegistrationStatuses;

  const factory ThemeWidgetEvent.setRegistrationOnline(String color) = _SetRegistrationOnline;

  const factory ThemeWidgetEvent.setRegistrationOffline(String color) = _SetRegistrationOffline;

  const factory ThemeWidgetEvent.setCallStatuses(CallStatusesWidgetConfig cfg) = _SetCallStatuses;

  const factory ThemeWidgetEvent.setCallStatusesConnectivityNone(String color) = _SetCallStatusesConnectivityNone;

  const factory ThemeWidgetEvent.setCallStatusesConnectError(String color) = _SetCallStatusesConnectError;

  const factory ThemeWidgetEvent.setCallStatusesAppUnregistered(String color) = _SetCallStatusesAppUnregistered;

  const factory ThemeWidgetEvent.setCallStatusesConnectIssue(String color) = _SetCallStatusesConnectIssue;

  const factory ThemeWidgetEvent.setCallStatusesInProgress(String color) = _SetCallStatusesInProgress;

  const factory ThemeWidgetEvent.setCallStatusesReady(String color) = _SetCallStatusesReady;

  // Decoration
  const factory ThemeWidgetEvent.setDecoration(DecorationConfig cfg) = _SetDecoration;

  const factory ThemeWidgetEvent.setPrimaryGradient(GradientColorsConfig cfg) = _SetPrimaryGradient;

  const factory ThemeWidgetEvent.setPrimaryGradientColors(List<CustomColor> colors) = _SetPrimaryGradientColors;
}

@Freezed(copyWith: false)
class UpdateVariantEvent with _$UpdateVariantEvent implements ConfiguratorEvent {
  const factory UpdateVariantEvent(BrightnessVariant variant) = _UpdateVariantEvent;
}

@freezed
sealed class ResourcesEvent with _$ResourcesEvent implements ConfiguratorEvent {
  /// Application storage assets list updated
  const factory ResourcesEvent.assetsUpdated(List<AssetModel> assets) = _AssetsUpdated;

  /// Embedded resources list updated (and mirror into appConfig.embeddedResources)
  const factory ResourcesEvent.embedsUpdated(List<EmbeddedResourceModel> embeds) = _EmbedsUpdated;

  /// Optional: stream failed (for centralized logging/telemetry)
  const factory ResourcesEvent.streamFailed({
    required String source, // 'assets' | 'embeds' | etc.
    required Object error,
    StackTrace? stackTrace,
  }) = _ResourcesStreamFailed;
}

@freezed
class LoadingEvent with _$LoadingEvent implements ConfiguratorEvent {
  const factory LoadingEvent.setStatus(ThemePropertyStatus? status) = _LoadingSetStatus;

  const factory LoadingEvent.markLoaded(ThemeComponents component) = _LoadingMarkLoaded;

  const factory LoadingEvent.setLoaded(List<ThemeComponents> components) = _LoadingSetLoaded;

  const factory LoadingEvent.reset({ThemePropertyStatus? status}) = _LoadingReset;
}
