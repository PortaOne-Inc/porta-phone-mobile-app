import 'dart:async';

import 'package:webtrit_configurator/exports/exports.dart';

abstract class ThemePageEditorApi {
  ThemePageConfig get initial;

  ThemePageConfig? get initialOrNull;

  ThemePageConfig get current;

  void setInitial(ThemePageConfig initial, {int? version});

  void resetToInitial();

  void resetTo(ThemePageConfig model, {bool setAsInitial = false});

  ThemePageConfig buildFull();

  void setThemePageConfig(ThemePageConfig config);

  void updateSwitchScreenConfig(LoginSwitchPageConfig config);

  void setLoginPage(LoginPageConfig login);

  void setLoginPicture(ImageSource? imageSource);

  void setLoginModeSelect(LoginModeSelectPageConfig modeSelect);

  void setLoginModeSelectButtonLoginStyle(ElevatedButtonStyleType type);

  void setLoginModeSelectButtonSignupStyle(ElevatedButtonStyleType type);

  void setAboutPage(AboutPageConfig about);

  void setAboutPicture(ImageSource? imageSource);

  void setAboutMetadata(Metadata metadata);

  void setDialingPage(CallPageConfig dialingPage);

  void setSettingsPage(SettingsPageConfig settingsPage);

  void setDialingSystemUiOverlay(OverlayStyleModel? style);

  void setDialingAppBarStyle(AppBarConfig? appBarStyle);

  void setDialingInfo(CallPageInfoConfig? info);

  void setDialingInfoUsernameStyle(TextStyleConfig? style);

  void setDialingInfoNumberStyle(TextStyleConfig? style);

  void setDialingInfoCallStatusStyle(TextStyleConfig? style);

  void setDialingInfoProcessingStatusStyle(TextStyleConfig? style);

  void setKeypadStyle(KeypadPageConfig style);

  void setLoginOtpSigninVerify(LoginOtpSigninVerifyScreenPageConfig cfg);

  void setLoginSignupVerify(LoginSignupVerifyScreenPageConfig cfg);

  void setLoginOtpSigninVerifyCountdown(int seconds);

  void setLoginSignupVerifyCountdown(int seconds);

  void setContactsPage(ContactsPageConfig config);

  void setRecentsPage(RecentsPageConfig config);

  void setFavoritesPage(FavoritesPageConfig config);

  void setConversationsPage(ConversationsPageConfig config);

  void setEmbeddedPage(EmbeddedPageConfig config);
}

class ThemePageEditor implements ThemePageEditorApi {
  ThemePageEditor({ThemePageConfig? initial}) {
    if (initial != null) setInitial(initial);
  }

  ThemePageConfig? _initial;
  ThemePageConfig? _current;
  int? version;

  final _controller = StreamController<ThemePageConfig>.broadcast();

  Stream<ThemePageConfig> get stream => _controller.stream;

  bool get isDirty {
    final i = _initial;
    final c = _current;
    if (i == null || c == null) return false;
    return i != c;
  }

  void _emit() {
    final c = _current;
    if (c == null || _controller.isClosed) return;
    try {
      _controller.add(c);
    } catch (_) {
      // Controller closed between check and add
    }
  }

  @override
  ThemePageConfig get initial {
    final i = _initial;
    if (i == null) {
      throw StateError(
        'ThemePageEditor not initialized. Call setInitial() first.',
      );
    }
    return i;
  }

  @override
  ThemePageConfig? get initialOrNull => _initial;

  @override
  ThemePageConfig get current {
    final c = _current;
    if (c == null) {
      throw StateError(
        'ThemePageEditor not initialized. Call setInitial() first.',
      );
    }
    return c;
  }

  @override
  void setInitial(ThemePageConfig initial, {int? version}) {
    _initial = initial;
    _current = initial;
    this.version = version;
    _emit();
  }

  @override
  void resetToInitial() {
    _current = _initial;
    _emit();
  }

  @override
  void resetTo(ThemePageConfig model, {bool setAsInitial = false}) {
    _current = model;
    if (setAsInitial) _initial = model;
    _emit();
  }

  @override
  ThemePageConfig buildFull() => current;

  @override
  void setThemePageConfig(ThemePageConfig config) {
    _current = config;
    _emit();
  }

  @override
  void setLoginPage(LoginPageConfig login) {
    _current = current.copyWith(login: login);
    _emit();
  }

  @override
  void setLoginPicture(ImageSource? imageSource) {
    _current = current.copyWith(
      login: current.login.copyWith(
        modeSelect: current.login.modeSelect.copyWith(mainLogo: imageSource),
      ),
    );
    _emit();
  }

  @override
  void setLoginModeSelect(LoginModeSelectPageConfig modeSelect) {
    _current = current.copyWith(
      login: current.login.copyWith(modeSelect: modeSelect),
    );
    _emit();
  }

  @override
  void setLoginModeSelectButtonLoginStyle(ElevatedButtonStyleType type) {
    _current = current.copyWith(
      login: current.login.copyWith(
        modeSelect: current.login.modeSelect.copyWith(
          buttonLoginStyleType: type,
        ),
      ),
    );
    _emit();
  }

  @override
  void setLoginModeSelectButtonSignupStyle(ElevatedButtonStyleType type) {
    _current = current.copyWith(
      login: current.login.copyWith(
        modeSelect: current.login.modeSelect.copyWith(
          buttonSignupStyleType: type,
        ),
      ),
    );
    _emit();
  }

  @override
  void setAboutPage(AboutPageConfig about) {
    _current = current.copyWith(about: about);
    _emit();
  }

  @override
  void setAboutPicture(ImageSource? imageSource) {
    _current = current.copyWith(
      about: current.about.copyWith(mainLogo: imageSource),
    );
    _emit();
  }

  @override
  void setAboutMetadata(Metadata metadata) {
    _current = current.copyWith(
      about: current.about.copyWith(metadata: metadata),
    );
    _emit();
  }

  @override
  void setDialingPage(CallPageConfig dialingPage) {
    _current = current.copyWith(dialing: dialingPage);
    _emit();
  }

  @override
  void setDialingSystemUiOverlay(OverlayStyleModel? style) {
    _current = current.copyWith(
      dialing: current.dialing.copyWith(systemUiOverlayStyle: style),
    );
    _emit();
  }

  @override
  void setDialingAppBarStyle(AppBarConfig? appBarStyle) {
    _current = current.copyWith(
      dialing: current.dialing.copyWith(appBarStyle: appBarStyle),
    );
    _emit();
  }

  @override
  void setDialingInfo(CallPageInfoConfig? info) {
    _current = current.copyWith(
      dialing: current.dialing.copyWith(callInfo: info),
    );
    _emit();
  }

  @override
  void setDialingInfoUsernameStyle(TextStyleConfig? style) {
    _current = current.copyWith(
      dialing: current.dialing.copyWith(
        callInfo: (current.dialing.callInfo ?? const CallPageInfoConfig())
            .copyWith(usernameTextStyle: style),
      ),
    );
    _emit();
  }

  @override
  void setDialingInfoNumberStyle(TextStyleConfig? style) {
    _current = current.copyWith(
      dialing: current.dialing.copyWith(
        callInfo: (current.dialing.callInfo ?? const CallPageInfoConfig())
            .copyWith(numberTextStyle: style),
      ),
    );
    _emit();
  }

  @override
  void setDialingInfoCallStatusStyle(TextStyleConfig? style) {
    _current = current.copyWith(
      dialing: current.dialing.copyWith(
        callInfo: (current.dialing.callInfo ?? const CallPageInfoConfig())
            .copyWith(callStatusTextStyle: style),
      ),
    );
    _emit();
  }

  @override
  void setDialingInfoProcessingStatusStyle(TextStyleConfig? style) {
    _current = current.copyWith(
      dialing: current.dialing.copyWith(
        callInfo: (current.dialing.callInfo ?? const CallPageInfoConfig())
            .copyWith(processingStatusTextStyle: style),
      ),
    );
    _emit();
  }

  Future<void> dispose() async {
    await _controller.close();
  }

  @override
  void setKeypadStyle(KeypadPageConfig style) {
    _current = current.copyWith(keypad: style);
    _emit();
  }

  @override
  void setLoginOtpSigninVerify(LoginOtpSigninVerifyScreenPageConfig cfg) {
    _current = current.copyWith(
      login: current.login.copyWith(otpSigninVerify: cfg),
    );
    _emit();
  }

  @override
  void setLoginOtpSigninVerifyCountdown(int seconds) {
    final safe = seconds.clamp(0, 600);
    final cur = current.login;
    _current = current.copyWith(
      login: cur.copyWith(
        otpSigninVerify: cur.otpSigninVerify.copyWith(
          countdownRepeatIntervalSeconds: safe,
        ),
      ),
    );
    _emit();
  }

  @override
  void setLoginSignupVerify(LoginSignupVerifyScreenPageConfig cfg) {
    _current = current.copyWith(
      login: current.login.copyWith(signupVerify: cfg),
    );
    _emit();
  }

  @override
  void setLoginSignupVerifyCountdown(int seconds) {
    final safe = seconds.clamp(0, 600);
    final cur = current.login;
    _current = current.copyWith(
      login: cur.copyWith(
        signupVerify: cur.signupVerify.copyWith(
          countdownRepeatIntervalSeconds: safe,
        ),
      ),
    );
    _emit();
  }

  @override
  void updateSwitchScreenConfig(LoginSwitchPageConfig config) {
    _current = current.copyWith(
      login: current.login.copyWith(switchPage: config),
    );
    _emit();
  }

  @override
  void setSettingsPage(SettingsPageConfig settingsPage) {
    _current = current.copyWith(settings: settingsPage);
    _emit();
  }

  @override
  void setContactsPage(ContactsPageConfig config) {
    _current = current.copyWith(contacts: config);
    _emit();
  }

  @override
  void setRecentsPage(RecentsPageConfig config) {
    _current = current.copyWith(recents: config);
    _emit();
  }

  @override
  void setFavoritesPage(FavoritesPageConfig config) {
    _current = current.copyWith(favorites: config);
    _emit();
  }

  @override
  void setConversationsPage(ConversationsPageConfig config) {
    _current = current.copyWith(conversations: config);
    _emit();
  }

  @override
  void setEmbeddedPage(EmbeddedPageConfig config) {
    _current = current.copyWith(embedded: config);
    _emit();
  }
}
