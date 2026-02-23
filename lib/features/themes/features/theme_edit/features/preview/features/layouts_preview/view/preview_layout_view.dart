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

  var _focusScreenPosition = 0;
  ErrorWidgetBuilder? _defaultErrorBuilder;

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

    final selectedVariant = context
        .watch<UpdateThemCubit>()
        .state
        .selectedVariant;

    final themeMode = selectedVariant == BrightnessVariant.dark
        ? ThemeMode.dark
        : ThemeMode.light;

    final screenshots = _generatePhoneScreenshots(featureAccess, themeMode);

    return ResizableColumns(
      initialProportions: _initialColumnProportions,
      dividerColor: Theme.of(context).colorScheme.surfaceContainerLow,
      dividerThickness: _dividerThickness,
      orientation: ResizableOrientation.vertical,
      children: [
        (_) => Align(
          child: TypePreview(
            screens: screenshots,
            screenFocus: _focusScreenPosition,
            isFrameVisible: widget.frameVisibility,
            onFocusPosition: _setFocusedScreen,
          ),
        ),
        (_) => DrawerPreview(
          screenshots: screenshots,
          focusScreenPosition: _focusScreenPosition,
          onTapScreen: _setFocusedScreen,
        ),
      ],
    );
  }

  List<Widget> _generatePhoneScreenshots(
    FeatureAccess? featureAccess,
    ThemeMode themeMode,
  ) {
    final appBloc = MockAppBloc.allScreen(
      themeSettings: ThemeProvider.of(context).settings,
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

    final bottomMenuKey = ValueKey(bottomMenuFeature);

    final rawScreens = <Widget>[
      const LoginModeSelectScreenScreenshot(),
      if (!isCustomSignupPreview) const LoginOtpSignInScreenshot(),
      if (!isCustomSignupPreview) const LoginOtpVerifyInScreenshot(),
      if (!isCustomSignupPreview) const LoginPasswordSignInScreenshot(),
      if (isCustomSignupPreview)
        const LoginSignUpScreenshot(supportedLoginTypes: [LoginType.otpSignin]),
      if (!isCustomSignupPreview) const LoginSignUpVerifyScreenshot(),
      // const UserAgreementScreenScreenshot(),
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
      const CallScreenScreenshot(false),
      const CallScreenScreenshot(
        true,
        localePlaceholderImageUrl:
            ImagePlaceholdersConstants.previewVideoCallRef1,
        remotePlaceholderImageUrl:
            ImagePlaceholdersConstants.previewVideoCallRef2,
      ),
      const SettingScreenScreenshot(),
      const MediaSettingsScreenScreenshot(
        key: ValueKey('MediaSettingsScreenScreenshot'),
      ),
      const PrivacyScreenScreenshot(),
      const AboutScreenshot(),
      const EmbeddedErrorDialogScreenshot(),
    ];

    return rawScreens
        .map((screen) => _wrapWithPreviewEnvironment(screen, appBloc))
        .toList();
  }

  Widget _wrapWithPreviewEnvironment(Widget screen, AppBloc appBloc) {
    return Provider<AppMetadataProvider>(
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
