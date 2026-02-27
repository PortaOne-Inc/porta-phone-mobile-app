import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/constants/constants.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart'
    hide LoginType;
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
import 'package:webtrit_configurator/mocks/mocks.dart';
import 'package:webtrit_configurator/widgets/screen_error_boundary.dart';
import 'package:webtrit_phone/blocs/blocs.dart';

import 'package:webtrit_phone/data/app_metadata_provider.dart';
import 'package:webtrit_phone/data/feature_access.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/utils/utils.dart';
import 'package:domain/domain.dart';

class PreviewLayoutView extends StatefulWidget {
  const PreviewLayoutView({required this.frameVisibility, super.key});

  final bool frameVisibility;

  @override
  State<PreviewLayoutView> createState() => _PreviewLayoutViewState();
}

class _PreviewLayoutViewState extends State<PreviewLayoutView> {
  static const _initialColumnProportions = [0.75, 0.25];
  static const _dividerThickness = 4.0;

  int _focusScreenPosition = 0;
  ErrorWidgetBuilder? _defaultErrorBuilder;

  List<Widget> _cachedScreenshots = [];
  FeatureAccess? _lastFeatureAccess;
  ThemeMode? _lastThemeMode;
  ThemeSettings? _lastThemeSettings;

  @override
  void initState() {
    super.initState();
    _defaultErrorBuilder = ErrorWidget.builder;
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return ErrorScreenPlaceholder(details: details);
    };
  }

  @override
  void dispose() {
    if (_defaultErrorBuilder != null) {
      ErrorWidget.builder = _defaultErrorBuilder!;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final featureAccess = context.watch<FeatureAccess?>();

    // Read config directly from the cubit state instead of ThemeProvider.
    // When context.watch<UpdateThemCubit>() triggers a rebuild, ThemeProvider
    // (updated by a separate BlocBuilder higher in the tree) may not have
    // propagated yet in the same frame. Reading from the cubit state
    // guarantees we always compare against the latest config values.
    final cubitState = context.watch<UpdateThemCubit>().state;
    final selectedVariant = cubitState.selectedVariant;

    final themeMode = selectedVariant == BrightnessVariant.dark
        ? ThemeMode.dark
        : ThemeMode.light;

    final themeSettings = cubitState.themeSettings;

    if (featureAccess != _lastFeatureAccess ||
        themeMode != _lastThemeMode ||
        themeSettings != _lastThemeSettings) {
      _lastFeatureAccess = featureAccess;
      _lastThemeMode = themeMode;
      _lastThemeSettings = themeSettings;
      _cachedScreenshots = _generatePhoneScreenshots(featureAccess, themeMode, themeSettings);
    }

    final screenshots = _cachedScreenshots;

    final focusPosition = screenshots.isEmpty
        ? 0
        : _focusScreenPosition.clamp(0, screenshots.length - 1);

    return ResizableColumns(
      initialProportions: _initialColumnProportions,
      dividerColor: Theme.of(context).colorScheme.surfaceContainerLow,
      dividerThickness: _dividerThickness,
      orientation: ResizableOrientation.vertical,
      children: [
        (_) => Align(
          child: TypePreview(
            screens: screenshots,
            screenFocus: focusPosition,
            isFrameVisible: widget.frameVisibility,
          ),
        ),
        (_) => DrawerPreview(
          screenshots: screenshots,
          focusScreenPosition: focusPosition,
          onTapScreen: _setFocusedScreen,
        ),
      ],
    );
  }

  List<Widget> _generatePhoneScreenshots(
    FeatureAccess? featureAccess,
    ThemeMode themeMode,
    ThemeSettings themeSettings,
  ) {
    final appBloc = MockAppBloc.allScreen(
      themeSettings: themeSettings,
      themeMode: themeMode,
      locale: const Locale('en'),
    );

    final loginFeature = featureAccess?.loginConfig;
    final bottomMenuFeature = featureAccess?.bottomMenuConfig;
    final loginLabel = loginFeature?.titleL10n;

    final isCustomSignupPreview = loginFeature?.hasEmbeddedPage ?? false;
    final isFavoritePreview =
        bottomMenuFeature?.getTabEnabled<FavoritesBottomMenuTab>() != null;
    final isContactPreview =
        bottomMenuFeature?.getTabEnabled<ContactsBottomMenuTab>() != null;
    final isRecentsPreview =
        bottomMenuFeature?.getTabEnabled<RecentsBottomMenuTab>() != null;
    final isKeypadPreview =
        bottomMenuFeature?.getTabEnabled<KeypadBottomMenuTab>() != null;
    final isMessagingPreview =
        bottomMenuFeature?.getTabEnabled<MessagingBottomMenuTab>() != null;
    final isEmbeddedPreview =
        bottomMenuFeature?.getTabEnabled<EmbeddedBottomMenuTab>() != null;

    final bottomMenuKey = ValueKey(bottomMenuFeature);

    final rawScreens = <Widget>[
      // Login
      const LoginModeSelectScreenScreenshot(),
      const LoginCoreUrlAssignScreenScreenshot(),
      if (!isCustomSignupPreview) const LoginOtpSignInScreenshot(),
      if (!isCustomSignupPreview) const LoginOtpVerifyInScreenshot(),
      if (!isCustomSignupPreview) const LoginPasswordSignInScreenshot(),
      if (isCustomSignupPreview)
        const LoginSignUpScreenshot(supportedLoginTypes: [LoginType.otpSignin]),
      if (!isCustomSignupPreview) const LoginSignUpVerifyScreenshot(),
      const LoginSwitchScreenScreenshot(),
      const UserAgreementScreenScreenshot(),

      // Main tabs
      if (isFavoritePreview)
        MainScreenScreenshot(
          key: bottomMenuKey,
          MainFlavor.favorites,
          loginLabel != null ? Text(loginLabel) : null,
        ),
      if (isRecentsPreview)
        MainScreenScreenshot(
          key: bottomMenuKey,
          MainFlavor.recents,
          loginLabel != null ? Text(loginLabel) : null,
        ),
      if (isContactPreview)
        MainScreenScreenshot(
          key: bottomMenuKey,
          MainFlavor.contacts,
          loginLabel != null ? Text(loginLabel) : null,
        ),
      if (isKeypadPreview)
        MainScreenScreenshot(
          key: bottomMenuKey,
          MainFlavor.keypad,
          loginLabel != null ? Text(loginLabel) : null,
        ),
      if (isMessagingPreview)
        MainScreenScreenshot(
          key: bottomMenuKey,
          MainFlavor.messaging,
          loginLabel != null ? Text(loginLabel) : null,
        ),
      if (isEmbeddedPreview)
        MainScreenScreenshot(
          key: bottomMenuKey,
          MainFlavor.embedded,
          loginLabel != null ? Text(loginLabel) : null,
        ),

      // Calls
      const CallScreenScreenshot(false),
      const CallScreenScreenshot(
        true,
        localePlaceholderImageUrl:
            ImagePlaceholdersConstants.previewVideoCallRef1,
        remotePlaceholderImageUrl:
            ImagePlaceholdersConstants.previewVideoCallRef2,
      ),

      // Contact & messaging
      const ContactScreenScreenshot(),
      const ChatConversationScreenScreenshot(),
      const SmsConversationScreenScreenshot(),
      const SystemNotificationsScreenScreenshot(),

      // CDRs & call log
      const CallLogScreenScreenshot(),
      const RecentCdrsScreenScreenshot(),
      const NumberCdrsScreenScreenshot(),

      // Settings
      const SettingScreenScreenshot(),
      const MediaSettingsScreenScreenshot(
        key: ValueKey('MediaSettingsScreenScreenshot'),
      ),
      const NetworkScreenScreenshot(),
      const LanguageScreenScreenshot(),
      const DiagnosticScreenScreenshot(),
      const CallerIdSettingsScreenScreenshot(),
      const PresenceSettingsScreenScreenshot(),
      const ThemeModeScreenScreenshot(),
      const VoicemailScreenScreenshot(),

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
        .map((screen) => _wrapWithPreviewEnvironment(screen, appBloc))
        .toList();
  }

  Widget _wrapWithPreviewEnvironment(Widget screen, AppBloc appBloc) {
    // UniqueKey forces full element recreation when the screenshot list is
    // regenerated (i.e. when theme settings change). Without it, Flutter
    // reuses existing elements and some StatefulWidget screenshots that push
    // routes in initState never re-initialise with the new theme config.
    return Provider<AppMetadataProvider>(
      key: UniqueKey(),
      create: (context) => const MockAppMetadataProvider(),
      child: PresenceViewParams(
        viewSource: PresenceViewSource.contactInfo,
        child: ScreenshotApp(appBloc: appBloc, child: screen),
      ),
    );
  }

  void _setFocusedScreen(int position) {
    setState(() {
      _focusScreenPosition = position;
    });
  }
}
