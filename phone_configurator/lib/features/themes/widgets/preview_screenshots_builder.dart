import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/constants/constants.dart';
import 'package:webtrit_configurator/mocks/mocks.dart';
import 'package:webtrit_phone/blocs/blocs.dart';
import 'package:webtrit_phone/data/app_metadata_provider.dart';
import 'package:webtrit_phone/data/feature_access.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/utils/utils.dart';

/// Builds the ordered list of phone-preview screenshots shared by the theme
/// editor preview and the public shared-link preview.
///
/// When [interactive] is true the duplicate login/main/call snapshots collapse
/// into single switchable screens whose controls react to pointer input;
/// otherwise a snapshot is emitted per variant. Capability-specific screens are
/// gated by the adapter capabilities exposed through [featureAccess], so the two
/// previews always show the same set of screens for a given theme.
List<Widget> buildPreviewScreenshots({
  required FeatureAccess? featureAccess,
  required ThemeMode themeMode,
  required ThemeSettings themeSettings,
  required bool interactive,
  Locale locale = const Locale('en'),
}) {
  final appBloc = MockAppBloc.allScreen(themeMode: themeMode, locale: locale);

  final loginFeature = featureAccess?.loginConfig;
  final bottomMenuFeature = featureAccess?.bottomMenuConfig;
  final loginLabel = loginFeature?.titleL10n;

  final isCustomSignupPreview = loginFeature?.hasEmbeddedPage ?? false;
  final isFavoritePreview = bottomMenuFeature?.getTabEnabled<FavoritesBottomMenuTab>() != null;
  final isContactPreview = bottomMenuFeature?.getTabEnabled<ContactsBottomMenuTab>() != null;
  final isRecentsPreview = bottomMenuFeature?.getTabEnabled<RecentsBottomMenuTab>() != null;
  final isKeypadPreview = bottomMenuFeature?.getTabEnabled<KeypadBottomMenuTab>() != null;
  final isMessagingPreview = bottomMenuFeature?.getTabEnabled<MessagingBottomMenuTab>() != null;
  final isEmbeddedPreview = bottomMenuFeature?.getTabEnabled<EmbeddedBottomMenuTab>() != null;

  final hasAnyMainTab =
      isFavoritePreview ||
      isRecentsPreview ||
      isContactPreview ||
      isKeypadPreview ||
      isMessagingPreview ||
      isEmbeddedPreview;
  // First enabled tab — used as the initial flavor for the single interactive main screen.
  final firstMainFlavor = isFavoritePreview
      ? MainFlavor.favorites
      : isRecentsPreview
      ? MainFlavor.recents
      : isContactPreview
      ? MainFlavor.contacts
      : isKeypadPreview
      ? MainFlavor.keypad
      : isMessagingPreview
      ? MainFlavor.messaging
      : MainFlavor.embedded;

  // Adapter capabilities gate the capability-specific preview screens, so toggling
  // a capability immediately adds/removes the matching screenshot.
  final coreSupport = featureAccess?.coreSupport;
  final supportsCallHistory = coreSupport?.supportsCallHistory ?? false;
  final supportsVoicemail = coreSupport?.supportsVoicemail ?? false;
  final supportsSms = coreSupport?.supportsSms ?? false;
  final supportsChats = coreSupport?.supportsChats ?? false;

  final bottomMenuKey = ValueKey(bottomMenuFeature);

  final rawScreens = <Widget>[
    // Login
    const LoginModeSelectScreenScreenshot(),
    const LoginCoreUrlAssignScreenScreenshot(),
    // Login request: when interactive, collapse the otp/password/signup tab duplicates
    // into a single switchable screen; otherwise keep a snapshot per tab.
    if (isCustomSignupPreview) const LoginSignUpScreenshot(supportedLoginTypes: [LoginType.otpSignin]),
    if (!isCustomSignupPreview && interactive) const LoginScreenshot(),
    if (!isCustomSignupPreview && !interactive) const LoginOtpSignInScreenshot(),
    if (!isCustomSignupPreview && !interactive) const LoginPasswordSignInScreenshot(),
    // Verify steps and the switch-screen demo reuse the same login chrome; they read as
    // duplicates next to the interactive login, so keep them only in snapshot mode.
    if (!isCustomSignupPreview && !interactive) const LoginOtpVerifyInScreenshot(),
    if (!isCustomSignupPreview && !interactive) const LoginSignUpVerifyScreenshot(),
    if (!interactive) const LoginSwitchScreenScreenshot(),
    const UserAgreementScreenScreenshot(),

    // Main tabs: when interactive, a single screen whose bottom menu switches the body;
    // otherwise a snapshot per enabled tab (plus the dialed-keypad variant).
    if (interactive && hasAnyMainTab)
      MainScreenScreenshot(
        key: bottomMenuKey,
        firstMainFlavor,
        loginLabel != null ? Text(loginLabel) : null,
        interactive: true,
      ),
    if (!interactive) ...[
      if (isFavoritePreview)
        MainScreenScreenshot(key: bottomMenuKey, MainFlavor.favorites, loginLabel != null ? Text(loginLabel) : null),
      if (isRecentsPreview)
        MainScreenScreenshot(key: bottomMenuKey, MainFlavor.recents, loginLabel != null ? Text(loginLabel) : null),
      if (isContactPreview)
        MainScreenScreenshot(key: bottomMenuKey, MainFlavor.contacts, loginLabel != null ? Text(loginLabel) : null),
      if (isKeypadPreview)
        MainScreenScreenshot(key: bottomMenuKey, MainFlavor.keypad, loginLabel != null ? Text(loginLabel) : null),
      if (isKeypadPreview)
        MainScreenScreenshot(
          key: ValueKey((bottomMenuFeature, 'keypad_dialing')),
          MainFlavor.keypad,
          loginLabel != null ? Text(loginLabel) : null,
          keypadDialing: true,
        ),
      if (isMessagingPreview)
        MainScreenScreenshot(key: bottomMenuKey, MainFlavor.messaging, loginLabel != null ? Text(loginLabel) : null),
      if (isEmbeddedPreview)
        MainScreenScreenshot(key: bottomMenuKey, MainFlavor.embedded, loginLabel != null ? Text(loginLabel) : null),
    ],

    // Calls: the audio/video variants render the same call chrome, so collapse to one
    // when interactive (and make its mute/hold buttons reactive); keep both as snapshots otherwise.
    CallScreenScreenshot(false, interactive: interactive),
    if (!interactive)
      const CallScreenScreenshot(
        true,
        localePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef1,
        remotePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef2,
      ),

    // Contact & messaging
    const ContactScreenScreenshot(),
    if (supportsChats) const ChatConversationScreenScreenshot(),
    if (supportsSms) const SmsConversationScreenScreenshot(),
    const SystemNotificationsScreenScreenshot(),

    // CDRs & call log
    const CallLogScreenScreenshot(),
    if (supportsCallHistory) const RecentCdrsScreenScreenshot(),
    if (supportsCallHistory) const NumberCdrsScreenScreenshot(),

    // Settings
    const SettingScreenScreenshot(),
    // Dialog theme catalog (all confirm/alert variants on one page).
    const DialogsShowcaseScreenshot(),
    const MediaSettingsScreenScreenshot(key: ValueKey('MediaSettingsScreenScreenshot')),
    const NetworkScreenScreenshot(),
    const LanguageScreenScreenshot(),
    const DiagnosticScreenScreenshot(),
    const CallerIdSettingsScreenScreenshot(),
    const PresenceSettingsScreenScreenshot(),
    const ThemeModeScreenScreenshot(),
    if (supportsVoicemail) const VoicemailScreenScreenshot(),

    // Utility
    const PrivacyScreenScreenshot(),
    const AboutScreenshot(),
    const PermissionsScreenScreenshot(),
    const ContactsAgreementScreenScreenshot(),
    const TeardownScreenScreenshot(),
    const LogRecordsConsoleScreenScreenshot(),
    const EmbeddedErrorDialogScreenshot(),
  ];

  return rawScreens
      .map((screen) => _wrapWithPreviewEnvironment(screen, appBloc, featureAccess, themeSettings))
      .toList();
}

Widget _wrapWithPreviewEnvironment(
  Widget screen,
  AppBloc appBloc,
  FeatureAccess? featureAccess,
  ThemeSettings themeSettings,
) {
  // UniqueKey forces full element recreation when the screenshot list is
  // regenerated (i.e. when theme settings change). Without it, Flutter
  // reuses existing elements and some StatefulWidget screenshots that push
  // routes in initState never re-initialise with the new theme config.
  return Provider<AppMetadataProvider>(
    key: UniqueKey(),
    create: (context) => const MockAppMetadataProvider(),
    child: PresenceViewParams(
      hybridPresenceSupport: featureAccess?.sipPresenceConfig.hybridPresenceSupport ?? false,
      blfViaSipSupport: featureAccess?.sipPresenceConfig.dialogsViaSipBlfSupport ?? false,
      presenceViaSipSupport: featureAccess?.sipPresenceConfig.presenceViaSipSupport ?? false,
      // Pointer handling is decided per surface by TypePreview/DrawerPreview
      // (focused preview is toggleable, thumbnails stay tap-to-focus), so the
      // screenshot itself must not swallow pointers here.
      // The theme is provided as an inherited value (ScreenshotApp reads it),
      // since it no longer lives in AppState.
      child: Provider<ThemeSettings>.value(
        value: themeSettings,
        child: ScreenshotApp(appBloc: appBloc, ignorePointer: false, child: screen),
      ),
    ),
  );
}
