import 'package:flutter/material.dart';

import 'package:webtrit_phone/data/data.dart';
import 'package:webtrit_phone/extensions/extensions.dart';
import 'package:webtrit_phone/models/models.dart';

class MockAppPreferences implements AppPreferences {
  final Map<String, dynamic> _mockData = {};

  @override
  Future<bool> clear({List<String> exclusion = const []}) async {
    final keysToRemove = _mockData.keys.where((key) => !exclusion.contains(key)).toList();
    for (final key in keysToRemove) {
      _mockData.remove(key);
    }
    return true;
  }

  @override
  bool getRegisterStatus() => true;

  @override
  Future<bool> setRegisterStatus(bool value) async {
    _mockData['register-status'] = value;
    return true;
  }

  @override
  Future<bool> removeRegisterStatus() async {
    _mockData.remove('register-status');
    return true;
  }

  @override
  ThemeMode getThemeMode() {
    final themeModeString = _mockData['theme-mode'] as String?;
    if (themeModeString != null) {
      try {
        return ThemeMode.values.byName(themeModeString);
      } catch (_) {
        return ThemeMode.system;
      }
    }
    return ThemeMode.system;
  }

  @override
  Future<bool> setThemeMode(ThemeMode value) async {
    _mockData['theme-mode'] = value.name;
    return true;
  }

  @override
  Future<bool> removeThemeMode() async {
    _mockData.remove('theme-mode');
    return true;
  }

  @override
  Locale getLocale() {
    final localeLanguageTag = _mockData['locale-language-tag'] as String?;
    if (localeLanguageTag != null) {
      try {
        return LocaleExtension.fromLanguageTag(localeLanguageTag);
      } catch (_) {
        return LocaleExtension.defaultNull;
      }
    }
    return LocaleExtension.defaultNull;
  }

  @override
  Future<bool> setLocale(Locale value) async {
    _mockData['locale-language-tag'] = value.toLanguageTag();
    return true;
  }

  @override
  Future<bool> removeLocale() async {
    _mockData.remove('locale-language-tag');
    return true;
  }

  @override
  MainFlavor getActiveMainFlavor({MainFlavor defaultValue = MainFlavor.contacts}) {
    final flavorString = _mockData['active-main-flavor'] as String?;
    if (flavorString != null) {
      try {
        return MainFlavor.values.byName(flavorString);
      } catch (_) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  @override
  Future<bool> setActiveMainFlavor(MainFlavor value) async {
    _mockData['active-main-flavor'] = value.name;
    return true;
  }

  @override
  RecentsVisibilityFilter getActiveRecentsVisibilityFilter(
      {RecentsVisibilityFilter defaultValue = RecentsVisibilityFilter.all}) {
    final filterString = _mockData['active-recents-visibility-filter'] as String?;
    if (filterString != null) {
      try {
        return RecentsVisibilityFilter.values.byName(filterString);
      } catch (_) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  @override
  Future<bool> setActiveRecentsVisibilityFilter(RecentsVisibilityFilter value) async {
    _mockData['active-recents-visibility-filter'] = value.name;
    return true;
  }

  @override
  ContactSourceType getActiveContactSourceType({ContactSourceType defaultValue = ContactSourceType.external}) {
    final sourceString = _mockData['active-contact-source-type'] as String?;
    if (sourceString != null) {
      try {
        return ContactSourceType.values.byName(sourceString);
      } catch (_) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  @override
  Future<bool> setActiveContactSourceType(ContactSourceType value) async {
    _mockData['active-contact-source-type'] = value.name;
    return true;
  }

  @override
  IncomingCallType getIncomingCallType({IncomingCallType defaultValue = IncomingCallType.pushNotification}) {
    final callTypeString = _mockData['call-incoming-type'] as String?;
    if (callTypeString != null) {
      try {
        return IncomingCallType.values.byName(callTypeString);
      } catch (_) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  @override
  Future<bool> setIncomingCallType(IncomingCallType value) async {
    _mockData['call-incoming-type'] = value.name;
    return true;
  }

  @override
  WebtritSystemInfo? getSystemInfo() {
    return null;
  }

  @override
  Future<void> setSystemInfo(WebtritSystemInfo systemInfo) async {}

  @override
  AudioCodec? getPreferedAudioCodec() {
    final codecString = _mockData['prefered-audio-codec'] as String?;
    return codecString != null ? AudioCodec.values.byName(codecString) : null;
  }

  @override
  Future<void> setPreferedAudioCodec(AudioCodec? value) async {
    if (value != null) {
      _mockData['prefered-audio-codec'] = value.name;
    } else {
      _mockData.remove('prefered-audio-codec');
    }
  }

  @override
  VideoCodec? getPreferedVideoCodec() {
    final codecString = _mockData['prefered-video-codec'] as String?;
    return codecString != null ? VideoCodec.values.byName(codecString) : null;
  }

  @override
  Future<void> setPreferedVideoCodec(VideoCodec? value) async {
    if (value != null) {
      _mockData['prefered-video-codec'] = value.name;
    } else {
      _mockData.remove('prefered-video-codec');
    }
  }

  @override
  AgreementStatus getContactsAgreementStatus({AgreementStatus defaultValue = AgreementStatus.pending}) {
    return AgreementStatus.pending;
  }

  @override
  AgreementStatus getUserAgreementStatus({AgreementStatus defaultValue = AgreementStatus.pending}) {
    return AgreementStatus.pending;
  }

  @override
  Future<bool> setContactsAgreementStatus(AgreementStatus value) {
    return Future.value(true);
  }

  @override
  Future<bool> setUserAgreementStatus(AgreementStatus value) {
    return Future.value(true);
  }
}
