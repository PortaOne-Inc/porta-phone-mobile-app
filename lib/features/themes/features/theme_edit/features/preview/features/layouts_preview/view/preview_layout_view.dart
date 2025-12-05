import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resizable_columns/resizable_columns.dart';

// Ваші існуючі імпорти (переконайтеся, що вони доступні у проекті)
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/constants/constants.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
import 'package:webtrit_configurator/mocks/mocks.dart';
import 'package:webtrit_configurator/widgets/screen_error_boundary.dart';

// import 'package:webtrit_configurator/widgets/screen_error_boundary.dart'; // Можна закоментувати, бо ми визначимо клас тут
import 'package:webtrit_phone/data/app_metadata_provider.dart';
import 'package:webtrit_phone/data/feature_access.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/utils/utils.dart';

class PreviewLayoutView extends StatefulWidget {
  const PreviewLayoutView({
    required this.previewType,
    required this.frameVisibility,
    super.key,
  });

  final PreviewType previewType;
  final bool frameVisibility;

  @override
  State<PreviewLayoutView> createState() => _PreviewLayoutViewState();
}

class _PreviewLayoutViewState extends State<PreviewLayoutView> {
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

    return ResizableColumns(
      initialProportions: const [0.75, 0.25],
      dividerColor: Theme.of(context).colorScheme.surfaceContainerLow,
      dividerThickness: 4,
      children: [
        (_) => Align(
              child: TypePreview(
                type: widget.previewType,
                screens: _phoneScreenshots(featureAccess),
                screenFocus: _focusScreenPosition,
                isFrameVisible: widget.frameVisibility,
                onFocusPosition: _setFocusedScreen,
              ),
            ),
        if (widget.previewType == PreviewType.single)
          (_) => DrawerPreview(
                screenshots: _phoneScreenshots(featureAccess),
                focusScreenPosition: _focusScreenPosition,
                onTapScreen: _setFocusedScreen,
              ),
      ],
      orientation: ResizableOrientation.vertical,
    );
  }

  List<Widget> _phoneScreenshots(FeatureAccess? featureAccess) {
    final appBloc = MockAppBloc.allScreen(
      themeSettings: ThemeProvider.of(context).settings,
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
    );

    final loginFeature = featureAccess?.loginFeature;
    final bottomMenuFeature = featureAccess?.bottomMenuFeature;

    final loginLabel = loginFeature?.titleL10n;

    final isCustomSignupPreview = loginFeature?.hasEmbeddedPage ?? false;
    final isFavoritePreview = bottomMenuFeature?.getTabEnabled<FavoritesBottomMenuTab>() != null;
    final isContactPreview = bottomMenuFeature?.getTabEnabled<ContactsBottomMenuTab>() != null;
    final isResentsPreview = bottomMenuFeature?.getTabEnabled<RecentsBottomMenuTab>() != null;
    final isKeypadPreview = bottomMenuFeature?.getTabEnabled<KeypadBottomMenuTab>() != null;

    final bottomMenuKey = ValueKey(bottomMenuFeature);

    return [
      const LoginModeSelectScreenScreenshot(),
      if (!isCustomSignupPreview) const LoginOtpSignInScreenshot(),
      if (!isCustomSignupPreview) const LoginOtpVerifyInScreenshot(),
      if (!isCustomSignupPreview) const LoginPasswordSignInScreenshot(),
      if (isCustomSignupPreview) const LoginSignUpScreenshot(supportedLoginTypes: [LoginType.otpSignin]),
      if (!isCustomSignupPreview) const LoginSignUpVerifyScreenshot(),
      if (isFavoritePreview)
        MainScreenScreenshot(
          key: bottomMenuKey,
          MainFlavor.favorites,
          loginLabel != null ? Text(loginLabel) : null,
        ),
      if (isResentsPreview)
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
    ]
        .map(
          (it) => Provider<AppMetadataProvider>(
            create: (context) => const MockAppMetadataProvider(),
            child: PresenceViewParams(
              viewSource: PresenceViewSource.contactInfo,
              child: ScreenshotApp(appBloc: appBloc, child: it),
            ),
          ),
        )
        .toList();
  }

  void _setFocusedScreen(int position) {
    _focusScreenPosition = position;
    setState(() {});
  }
}
