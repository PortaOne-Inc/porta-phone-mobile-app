import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/constants/constants.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
import 'package:webtrit_configurator/mocks/mocks.dart';
import 'package:webtrit_configurator/widgets/screen_error_boundary.dart';
import 'package:webtrit_phone/blocs/blocs.dart';

import 'package:webtrit_phone/data/app_metadata_provider.dart';
import 'package:webtrit_phone/data/feature_access.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/utils/utils.dart';

/// A widget that provides a split-view layout for previewing app screens.
///
/// It displays a detailed interactive preview (TypePreview) on one side and
/// a drawer of available screenshots (DrawerPreview) on the other.
class PreviewLayoutView extends StatefulWidget {
  const PreviewLayoutView({
    required this.frameVisibility,
    super.key,
  });

  /// Controls the visibility of the device frame around the preview.
  final bool frameVisibility;

  @override
  State<PreviewLayoutView> createState() => _PreviewLayoutViewState();
}

class _PreviewLayoutViewState extends State<PreviewLayoutView> {
  // Constants for layout configuration
  static const _initialColumnProportions = [0.75, 0.25];
  static const _dividerThickness = 4.0;

  var _focusScreenPosition = 0;
  ErrorWidgetBuilder? _defaultErrorBuilder;

  @override
  void initState() {
    super.initState();
    // Temporarily override the global ErrorWidget builder to show a custom placeholder
    // within the preview area if a mock screen crashes.
    _defaultErrorBuilder = ErrorWidget.builder;
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return ErrorScreenPlaceholder(details: details);
    };
  }

  @override
  void dispose() {
    // Restore the original ErrorWidget builder when leaving this view
    if (_defaultErrorBuilder != null) {
      ErrorWidget.builder = _defaultErrorBuilder!;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final featureAccess = context.watch<FeatureAccess?>();
    final screenshots = _generatePhoneScreenshots(featureAccess);

    return ResizableColumns(
      initialProportions: _initialColumnProportions,
      dividerColor: Theme.of(context).colorScheme.surfaceContainerLow,
      dividerThickness: _dividerThickness,
      orientation: ResizableOrientation.vertical,
      children: [
        // Main Preview Area
        (_) => Align(
              child: TypePreview(
                screens: screenshots,
                screenFocus: _focusScreenPosition,
                isFrameVisible: widget.frameVisibility,
                onFocusPosition: _setFocusedScreen,
              ),
            ),
        // Sidebar/Drawer Area
        (_) => DrawerPreview(
              screenshots: screenshots,
              focusScreenPosition: _focusScreenPosition,
              onTapScreen: _setFocusedScreen,
            ),
      ],
    );
  }

  /// Generates the list of mocked screens based on the current [FeatureAccess] configuration.
  List<Widget> _generatePhoneScreenshots(FeatureAccess? featureAccess) {
    // Setup Mock AppBloc
    final appBloc = MockAppBloc.allScreen(
      themeSettings: ThemeProvider.of(context).settings,
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
    );

    // Extract Features
    final loginFeature = featureAccess?.loginConfig;
    final bottomMenuFeature = featureAccess?.bottomMenuConfig;
    final loginLabel = loginFeature?.titleL10n;

    // Determine Feature Availability
    final isCustomSignupPreview = loginFeature?.hasEmbeddedPage ?? false;
    final isFavoritePreview = bottomMenuFeature?.getTabEnabled<FavoritesBottomMenuTab>() != null;
    final isContactPreview = bottomMenuFeature?.getTabEnabled<ContactsBottomMenuTab>() != null;
    final isRecentsPreview = bottomMenuFeature?.getTabEnabled<RecentsBottomMenuTab>() != null;
    final isKeypadPreview = bottomMenuFeature?.getTabEnabled<KeypadBottomMenuTab>() != null;

    final bottomMenuKey = ValueKey(bottomMenuFeature);

    // Build List of Screens
    final rawScreens = <Widget>[
      const LoginModeSelectScreenScreenshot(),

      // Authentication Flow
      if (!isCustomSignupPreview) const LoginOtpSignInScreenshot(),
      if (!isCustomSignupPreview) const LoginOtpVerifyInScreenshot(),
      if (!isCustomSignupPreview) const LoginPasswordSignInScreenshot(),
      if (isCustomSignupPreview) const LoginSignUpScreenshot(supportedLoginTypes: [LoginType.otpSignin]),
      if (!isCustomSignupPreview) const LoginSignUpVerifyScreenshot(),

      // Main Tabs
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

      // Other Screens
      const SettingScreenScreenshot(),
      const CallScreenScreenshot(false),
      const CallScreenScreenshot(
        true,
        localePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef1,
        remotePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef2,
      ),
      const PrivacyScreenScreenshot(),
      const AboutScreenshot(),
      const EmbeddedErrorDialogScreenshot(),
    ];

    // Wrap screens with necessary providers and environment widgets
    return rawScreens.map((screen) => _wrapWithPreviewEnvironment(screen, appBloc)).toList();
  }

  /// Wraps a raw screen widget with the necessary Providers and Mock logic
  /// required for the preview to render correctly.
  Widget _wrapWithPreviewEnvironment(Widget screen, AppBloc appBloc) {
    return Provider<AppMetadataProvider>(
      create: (context) => const MockAppMetadataProvider(),
      child: PresenceViewParams(
        viewSource: PresenceViewSource.contactInfo,
        child: ScreenshotApp(
          appBloc: appBloc,
          child: screen,
        ),
      ),
    );
  }

  void _setFocusedScreen(int position) {
    setState(() {
      _focusScreenPosition = position;
    });
  }
}
