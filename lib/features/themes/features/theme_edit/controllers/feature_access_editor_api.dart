import 'dart:async';
import 'package:collection/collection.dart';

import 'package:webtrit_configurator/exports/exports.dart';

abstract class FeatureAccessEditorApi {
  AppConfig get initial;

  AppConfig? get initialOrNull;

  AppConfig get current;

  void setInitial(AppConfig initial);

  void resetToInitial();

  void resetTo(AppConfig model, {bool setAsInitial = false});

  AppConfig buildFull();
}

class FeatureAccessEditor implements FeatureAccessEditorApi {
  FeatureAccessEditor({AppConfig? initial}) {
    if (initial != null) {
      setInitial(initial);
    }
  }

  final DeepCollectionEquality _eq = const DeepCollectionEquality();

  AppConfig? _initial;
  AppConfig? _current;

  final _controller = StreamController<AppConfig>.broadcast();

  /// Публічний стрім змін (опційно користуйся або ігноруй)
  Stream<AppConfig> get stream => _controller.stream;

  /// Прапорець «брудності» (зручно мати)
  bool get isDirty {
    final i = _initial;
    final c = _current;
    if (i == null || c == null) return false;
    return !_eq.equals(i.toJson(), c.toJson());
  }

  void _emit() {
    final c = _current;
    if (c != null && !_controller.isClosed) _controller.add(c);
  }

  // ==== FeatureAccessEditorApi ====

  @override
  AppConfig get initial {
    final i = _initial;
    if (i == null) {
      throw StateError('FeatureAccessEditor not initialized. Call setInitial() first.');
    }
    return i;
  }

  @override
  AppConfig? get initialOrNull => _initial;

  @override
  AppConfig get current {
    final c = _current;
    if (c == null) {
      throw StateError('FeatureAccessEditor not initialized. Call setInitial() first.');
    }
    return c;
  }

  @override
  void setInitial(AppConfig initial) {
    _initial = initial;
    _current = initial;
    _emit();
  }

  @override
  void resetToInitial() {
    _current = _initial;
    _emit();
  }

  @override
  void resetTo(AppConfig model, {bool setAsInitial = false}) {
    _current = model;
    if (setAsInitial) _initial = model;
    _emit();
  }

  void setAppConfig(AppConfig app) {
    _current = app;
    _emit();
  }

  void setLoginConfig(AppConfigLogin login) {
    _current = current.copyWith(loginConfig: login);
    _emit();
  }

  void setMainConfig(AppConfigMain main) {
    _current = current.copyWith(mainConfig: main);
    _emit();
  }

  void setMainSystemNotificationsEnabled(bool enabled) {
    _current = current.copyWith(
      mainConfig: current.mainConfig.copyWith(systemNotificationsEnabled: enabled),
    );
    _emit();
  }

  void setBottomMenu(AppConfigBottomMenu bottomMenu) {
    _current = current.copyWith(
      mainConfig: current.mainConfig.copyWith(bottomMenu: bottomMenu),
    );
    _emit();
  }

  void setBottomMenuCacheSelectedTab(bool cache) {
    _current = current.copyWith(
      mainConfig: current.mainConfig.copyWith(
        bottomMenu: current.mainConfig.bottomMenu.copyWith(cacheSelectedTab: cache),
      ),
    );
    _emit();
  }

  void setBottomMenuTabs(List<BottomMenuTabScheme> tabs) {
    _current = current.copyWith(
      mainConfig: current.mainConfig.copyWith(
        bottomMenu: current.mainConfig.bottomMenu.copyWith(tabs: tabs),
      ),
    );
    _emit();
  }

  void updateBottomMenuTab(int index, BottomMenuTabScheme tab) {
    final list = [...current.mainConfig.bottomMenu.tabs];
    if (index < 0 || index >= list.length) throw RangeError.index(index, list, 'tabs');
    list[index] = tab;
    setBottomMenuTabs(list);
  }

  void insertBottomMenuTab(int index, BottomMenuTabScheme tab) {
    final list = [...current.mainConfig.bottomMenu.tabs];
    if (index < 0 || index > list.length) throw RangeError.index(index, list, 'tabs');
    list.insert(index, tab);
    setBottomMenuTabs(list);
  }

  void removeBottomMenuTabAt(int index) {
    final list = [...current.mainConfig.bottomMenu.tabs];
    if (index < 0 || index >= list.length) throw RangeError.index(index, list, 'tabs');
    list.removeAt(index);
    setBottomMenuTabs(list);
  }

  void setSettingsConfig(AppConfigSettings settings) {
    _current = current.copyWith(settingsConfig: settings);
    _emit();
  }

  void setSettingsSections(List<AppConfigSettingsSection> sections) {
    _current = current.copyWith(
      settingsConfig: current.settingsConfig.copyWith(sections: sections),
    );
    _emit();
  }

  void setCallConfig(AppConfigCall call) {
    _current = current.copyWith(callConfig: call);
    _emit();
  }

  void setCallVideoEnabled(bool enabled) {
    _current = current.copyWith(
      callConfig: current.callConfig.copyWith(videoEnabled: enabled),
    );
    _emit();
  }

  void setCallTransfer(AppConfigTransfer transfer) {
    _current = current.copyWith(
      callConfig: current.callConfig.copyWith(transfer: transfer),
    );
    _emit();
  }

  void setCallEncoding(AppConfigEncoding encoding) {
    _current = current.copyWith(
      callConfig: current.callConfig.copyWith(encoding: encoding),
    );
    _emit();
  }

  void setCallPeerConnection(AppConfigPeerConnection pc) {
    _current = current.copyWith(
      callConfig: current.callConfig.copyWith(peerConnection: pc),
    );
    _emit();
  }

  void setNegotiationOverride(AppConfigNegotiationSettingsOverride negotiation) {
    _current = current.copyWith(
      callConfig: current.callConfig.copyWith(
        peerConnection: current.callConfig.peerConnection.copyWith(negotiation: negotiation),
      ),
    );
    _emit();
  }

  Future<void> dispose() async {
    await _controller.close();
  }

  @override
  AppConfig buildFull() => current;
}
