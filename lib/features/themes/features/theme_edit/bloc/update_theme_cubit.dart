import 'dart:async';

import 'package:flutter/material.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/features/themes/themes.dart';

import '../../../../../extensions/color_extension.dart';
import '../controllers/feature_access_editor_api.dart';
import '../controllers/theme_page_editor_api.dart';
import '../controllers/theme_widget_editor_api.dart';
import '../controllers/color_scheme_editor_api.dart';

part 'update_theme_state.dart';

part 'update_theme_event.dart';

part 'update_theme_cubit.freezed.dart';

final _logger = Logger('UpdateThemeCubit');

class UpdateThemCubit extends Bloc<ConfiguratorEvent, UpdateThemeState> {
  UpdateThemCubit({
    required this.applicationId,
    required this.themeId,
    required this.updateThemeUseCase,
    required this.getThemeUseCase,
    required this.getApplicationUseCase,
    required this.getFeatureAccessUsecase,
    required this.updateFeatureAccessUsecase,
    required this.getColorSchemeByThemeVariantUsecase,
    required this.upsertColorSchemeByThemeVariantUsecase,
    required this.getWidgetConfigUsecase,
    required this.upsertWidgetConfig,
    required this.upsertPageConfigByVariantUsecase,
    required this.getPageConfigByVariantUsecase,
    required this.watchApplicationAssetsUsecase,
    required this.getApplicationEmbedsUsecase,
  }) : assert(applicationId.isNotEmpty, 'applicationId must not be empty'),
       assert(themeId.isNotEmpty, 'themeId must not be empty'),
       super(
         UpdateThemeState(
           status: ThemePropertyStatus.progress,
           appConfig: const AppConfig(),
           colorSchemeConfig: const ColorSchemeConfig(),
           themeWidgetConfig: const ThemeWidgetConfig(),
           themePageConfig: const ThemePageConfig(),
         ),
       ) {
    on<UpdateLocalConfigEvent>(_onUpdateLocalConfigEvent, transformer: sequential());

    on<InitializeEvent>(_initializeEditing, transformer: droppable());
    on<SyncConfigEvent>(_syncConfigWithServer, transformer: droppable());
    on<UpdateColorSchemeEvent>(_onChangeColorEvent, transformer: restartable());
    on<AppConfigEvent>(_onAppConfigEvent, transformer: sequential());
    on<ThemePageEvent>(_onThemePageEvent, transformer: sequential());
    on<ThemeWidgetEvent>(_onThemeWidgetEvent, transformer: sequential());
    on<UpdateVariantEvent>(_onUpdateVariantEvent, transformer: droppable());
    on<ResourcesEvent>(_onResourcesEvent, transformer: sequential());
    on<LoadingEvent>(_onLoadingEvent, transformer: droppable());

    _init(applicationId, themeId);
    _bindEditors();
  }

  final String applicationId;
  final String themeId;

  final UsecaseThemeUpdate updateThemeUseCase;
  final UsecaseThemeGet getThemeUseCase;
  final UsecaseApplicationGet getApplicationUseCase;
  final GetFeatureAccessUsecase getFeatureAccessUsecase;
  final UpdateFeatureAccessUsecase updateFeatureAccessUsecase;
  final GetColorSchemeByThemeVariantUsecase getColorSchemeByThemeVariantUsecase;
  final UpsertColorSchemeByThemeVariantUsecase upsertColorSchemeByThemeVariantUsecase;
  final GetWidgetConfigUsecase getWidgetConfigUsecase;
  final UpsertWidgetConfigUsecase upsertWidgetConfig;
  final UpsertPageConfigByVariantUsecase upsertPageConfigByVariantUsecase;
  final GetPageConfigByVariantUsecase getPageConfigByVariantUsecase;
  final WatchApplicationAssetsUsecase watchApplicationAssetsUsecase;
  final GetApplicationEmbedsUsecase getApplicationEmbedsUsecase;

  final ThemePageEditor _pageEditor = ThemePageEditor();
  final FeatureAccessEditor _featureAccessEditor = FeatureAccessEditor();
  final ColorSchemeEditor _colorSchemeEditor = ColorSchemeEditor();
  final ThemeWidgetEditor _widgetEditor = ThemeWidgetEditor();

  /// Monotonic counter that invalidates in-flight init/variant-switch work
  /// when a newer initialization starts.
  int _initEpoch = 0;

  StreamSubscription<ThemePageConfig>? _pageEditorSub;
  StreamSubscription<AppConfig>? _featureAccessSub;
  StreamSubscription<ColorSchemeConfig>? _colorSchemeEditorSub;
  StreamSubscription<ThemeWidgetConfig>? _widgetEditorSub;
  StreamSubscription<List<AssetModel>>? _assetsSub;

  void _init(String applicationId, String themeId) {
    _assetsSub = watchApplicationAssetsUsecase
        .execute(applicationId)
        .listen(
          (assets) => add(ResourcesEvent.assetsUpdated(assets)),
          onError: (Object error) => add(ResourcesEvent.streamFailed(source: 'assets', error: error)),
        );

    add(const InitializeEvent());
  }

  Future<void> _onLoadingEvent(LoadingEvent event, Emitter<UpdateThemeState> emit) async {
    event.map(
      setStatus: (e) => emit(state.copyWith(status: e.status)),
      markLoaded: (e) {
        final already = state.loadedComponents.contains(e.component);
        if (!already) {
          emit(state.copyWith(loadedComponents: [...state.loadedComponents, e.component]));
        }
      },
      setLoaded: (e) => emit(state.copyWith(loadedComponents: List.unmodifiable(e.components))),
      reset: (e) => emit(state.copyWith(loadedComponents: const <ThemeComponents>[], status: e.status)),
    );
  }

  Future<void> _onUpdateVariantEvent(UpdateVariantEvent event, Emitter<UpdateThemeState> emit) async {
    if (state.selectedVariant == event.variant) return;

    final epoch = ++_initEpoch;

    _pauseEditorSubscriptions();

    // Keep only shared components
    final preservedComponents = state.loadedComponents
        .where((c) => c == ThemeComponents.navigation || c == ThemeComponents.embeds)
        .toList();

    emit(
      state.copyWith(
        selectedVariant: event.variant,
        status: ThemePropertyStatus.progress,
        error: null,
        // Important: clear old configs so the UI does not display data from the previous theme
        colorSchemeConfig: const ColorSchemeConfig(),
        themePageConfig: const ThemePageConfig(),
        themeWidgetConfig: const ThemeWidgetConfig(),
        loadedComponents: preservedComponents,
      ),
    );

    final results = await Future.wait([
      _initializeColorScheme(applicationId, themeId, event.variant, epoch),
      _initializePageConfig(applicationId, themeId, event.variant, epoch),
      _initializeWidgetsConfig(applicationId, themeId, event.variant, epoch),
    ]);

    if (_initEpoch != epoch) {
      return; // Superseded by newer init — next switch resumes
    }

    _resumeEditorSubscriptions();

    final allSucceeded = results.every((ok) => ok);
    emit(
      state.copyWith(
        status: allSucceeded ? ThemePropertyStatus.success : ThemePropertyStatus.error,
        error: allSucceeded ? null : Exception('Some configs failed to load for variant'),
      ),
    );
  }

  Future<void> _syncConfigWithServer(SyncConfigEvent event, Emitter<UpdateThemeState> emit) async {
    final retryOnly = event.retryOnly;
    final isPartialRetry = retryOnly != null && retryOnly.isNotEmpty;

    // For partial retry, start from previous detail; otherwise reset all to pending
    var detail = isPartialRetry ? state.syncDetail : const SyncDetail();

    emit(state.copyWith(syncStatus: SyncStatus.syncing, error: null, syncDetail: detail));

    final featureAccess = _featureAccessEditor.buildFull();
    final colorScheme = _colorSchemeEditor.buildFull();
    final pageConfig = _pageEditor.buildFull();
    final themeWidget = _widgetEditor.buildFull();

    final results = <String, ConfigSyncResult>{};

    bool shouldSync(String name) => !isPartialRetry || retryOnly.contains(name);

    await Future.wait([
      if (shouldSync('Feature access'))
        _guardSyncResult('Feature access', results, () async {
          final result = await updateFeatureAccessUsecase.execute(
            applicationId: applicationId,
            themeId: themeId,
            config: featureAccess.toJson(),
            expectedVersion: _featureAccessEditor.version,
          );
          _featureAccessEditor.version = result.version;
        }),
      if (shouldSync('Color scheme'))
        _guardSyncResult('Color scheme', results, () async {
          final result = await upsertColorSchemeByThemeVariantUsecase.execute(
            applicationId: applicationId,
            themeId: themeId,
            variant: state.selectedVariant,
            config: colorScheme.toJson(),
            expectedVersion: _colorSchemeEditor.version,
          );
          _colorSchemeEditor.version = result.version;
        }),
      if (shouldSync('Page config'))
        _guardSyncResult('Page config', results, () async {
          final result = await upsertPageConfigByVariantUsecase.execute(
            applicationId: applicationId,
            themeId: themeId,
            variant: state.selectedVariant,
            config: pageConfig.toJson(),
            expectedVersion: _pageEditor.version,
          );
          _pageEditor.version = result.version;
        }),
      if (shouldSync('Widget config'))
        _guardSyncResult('Widget config', results, () async {
          final result = await upsertWidgetConfig.execute(
            applicationId,
            themeId,
            state.selectedVariant,
            themeWidget.toJson(),
            expectedVersion: _widgetEditor.version,
          );
          _widgetEditor.version = result.version;
        }),
    ]);

    // Merge results into detail
    detail = detail.copyWith(
      featureAccess: results['Feature access'] ?? detail.featureAccess,
      colorScheme: results['Color scheme'] ?? detail.colorScheme,
      pageConfig: results['Page config'] ?? detail.pageConfig,
      widgetConfig: results['Widget config'] ?? detail.widgetConfig,
    );

    final SyncStatus overallStatus;
    if (detail.hasConflicts) {
      overallStatus = SyncStatus.conflict;
    } else if (detail.allSucceeded) {
      overallStatus = SyncStatus.synced;
    } else if (detail.hasFailures) {
      // Some succeeded, some failed
      final anySuccess = [
        detail.featureAccess,
        detail.colorScheme,
        detail.pageConfig,
        detail.widgetConfig,
      ].any((r) => r == ConfigSyncResult.success);
      overallStatus = anySuccess ? SyncStatus.partiallyFailed : SyncStatus.failed;
    } else {
      overallStatus = SyncStatus.synced;
    }

    if (overallStatus == SyncStatus.failed || overallStatus == SyncStatus.partiallyFailed) {
      final message = 'Failed to save: ${detail.failedNames.join(', ')}';
      _logger.severe(message);
      emit(state.copyWith(syncStatus: overallStatus, syncDetail: detail, error: Exception(message)));
    } else if (overallStatus == SyncStatus.conflict) {
      _logger.warning('Version conflict: ${detail.conflictNames.join(', ')}');
      emit(state.copyWith(syncStatus: overallStatus, syncDetail: detail));
    } else {
      emit(state.copyWith(syncStatus: overallStatus, syncDetail: detail));
    }
  }

  Future<void> _guardSyncResult(
    String name,
    Map<String, ConfigSyncResult> results,
    Future<void> Function() action,
  ) async {
    try {
      await action();
      results[name] = ConfigSyncResult.success;
    } on VersionConflictException {
      results[name] = ConfigSyncResult.conflict;
    } catch (e, stackTrace) {
      _logger.severe('Sync failed for $name', e, stackTrace);
      results[name] = ConfigSyncResult.failed;
    }
  }

  Future<void> _onResourcesEvent(ResourcesEvent event, Emitter<UpdateThemeState> emit) async {
    event.map(
      assetsUpdated: (e) => emit(state.copyWith(assets: e.assets)),
      embedsUpdated: (e) => _onEmbedsUpdated(e, emit),
      streamFailed: (e) {
        _logger.warning('Resources stream "${e.source}" error', e.error);
        emit(
          state.copyWith(
            status: ThemePropertyStatus.error,
            errorSource: e.source,
            error: e.error is Exception ? e.error as Exception : Exception('${e.source} stream failed: ${e.error}'),
          ),
        );
      },
      retryStream: (e) => _onRetryStream(e, emit),
    );
  }

  Future<void> _onRetryStream(_RetryStream e, Emitter<UpdateThemeState> emit) async {
    emit(state.copyWith(status: ThemePropertyStatus.progress, error: null, errorSource: null));

    if (e.source == 'assets') {
      await _assetsSub?.cancel();
      _assetsSub = watchApplicationAssetsUsecase
          .execute(applicationId)
          .listen(
            (assets) => add(ResourcesEvent.assetsUpdated(assets)),
            onError: (Object error) => add(ResourcesEvent.streamFailed(source: 'assets', error: error)),
          );
    } else if (e.source == 'embeds') {
      await _initializeEmbeddedResourceModel(applicationId, _initEpoch);
    }

    // Restore status unless loading was already in progress
    if (state.status == ThemePropertyStatus.progress && !state.isProgress) {
      emit(state.copyWith(status: ThemePropertyStatus.success));
    }
  }

  Future<void> _onEmbedsUpdated(_EmbedsUpdated e, Emitter<UpdateThemeState> emit) async {
    final appConfig = state.appConfig.copyWith();
    emit(state.copyWith(embeddedResources: e.embeds, appConfig: appConfig));
  }

  void _bindEditors() {
    _pageEditorSub ??= _pageEditor.stream.listen((config) {
      add(UpdateLocalConfigEvent.page(config));
    });

    _featureAccessSub ??= _featureAccessEditor.stream.listen((config) {
      add(UpdateLocalConfigEvent.featureAccess(config));
    });

    _colorSchemeEditorSub ??= _colorSchemeEditor.stream.listen((config) {
      add(UpdateLocalConfigEvent.colorScheme(config));
    });

    _widgetEditorSub ??= _widgetEditor.stream.listen((config) {
      add(UpdateLocalConfigEvent.widget(config));
    });
  }

  void _pauseEditorSubscriptions() {
    _pageEditorSub?.pause();
    _featureAccessSub?.pause();
    _colorSchemeEditorSub?.pause();
    _widgetEditorSub?.pause();
  }

  void _resumeEditorSubscriptions() {
    _pageEditorSub?.resume();
    _featureAccessSub?.resume();
    _colorSchemeEditorSub?.resume();
    _widgetEditorSub?.resume();
  }

  Future<void> _onUpdateLocalConfigEvent(UpdateLocalConfigEvent event, Emitter<UpdateThemeState> emit) async {
    if (state.status == ThemePropertyStatus.progress) return;

    event.map(
      colorScheme: (_UpdateThemeSchemeColorEvent value) =>
          emit(state.copyWith(colorSchemeConfig: value.scheme, syncStatus: SyncStatus.idle)),
      page: (_UpdateThemePageEvent value) =>
          emit(state.copyWith(themePageConfig: value.page, syncStatus: SyncStatus.idle)),
      widget: (_UpdateThemeWidgetEvent value) =>
          emit(state.copyWith(themeWidgetConfig: value.widget, syncStatus: SyncStatus.idle)),
      featureAccess: (_UpdateAppConfigEvent value) =>
          emit(state.copyWith(appConfig: value.config, syncStatus: SyncStatus.idle)),
    );
  }

  Future<void> _onAppConfigEvent(AppConfigEvent event, Emitter<UpdateThemeState> emit) async {
    event.map(
      setLoginConfig: (e) => _featureAccessEditor.setLoginConfig(e.login),
      setMainConfig: (e) => _featureAccessEditor.setMainConfig(e.main),
      setMainSystemNotificationsEnabled: (e) => _featureAccessEditor.setMainSystemNotificationsEnabled(e.enabled),
      setBottomMenu: (e) => _featureAccessEditor.setBottomMenu(e.bottomMenu),
      setBottomMenuCacheSelectedTab: (e) => _featureAccessEditor.setBottomMenuCacheSelectedTab(e.cache),
      setBottomMenuTabs: (e) => _featureAccessEditor.setBottomMenuTabs(e.tabs),
      updateBottomMenuTab: (e) => _featureAccessEditor.updateBottomMenuTab(e.index, e.tab),
      insertBottomMenuTab: (e) => _featureAccessEditor.insertBottomMenuTab(e.index, e.tab),
      removeBottomMenuTabAt: (e) => _featureAccessEditor.removeBottomMenuTabAt(e.index),
      setSettingsConfig: (e) => _featureAccessEditor.setSettingsConfig(e.settings),
      setSettingsSections: (e) => _featureAccessEditor.setSettingsSections(e.sections),
      setCallConfig: (e) => _featureAccessEditor.setCallConfig(e.callConfig),
      setCallVideoEnabled: (e) => _featureAccessEditor.setCallVideoEnabled(e.enabled),
      setCallTransfer: (e) => _featureAccessEditor.setCallTransfer(e.transfer),
      setCallEncoding: (e) => _featureAccessEditor.setCallEncoding(e.encoding),
      setCallPeerConnection: (e) => _featureAccessEditor.setCallPeerConnection(e.pc),
      setNegotiationOverride: (e) => _featureAccessEditor.setNegotiationOverride(e.negotiation),
      setSupportedFeatures: (e) => _featureAccessEditor.setSupportedFeatures(e.features),
      importJson: (e) => _onImportFeatureAccessJson(e.json),
    );
  }

  void _onImportFeatureAccessJson(Map<String, dynamic> json) {
    try {
      final config = AppConfig.fromJson(json);
      _featureAccessEditor.setAppConfig(config);
    } catch (e) {
      _logger.warning('Failed to parse AppConfig from JSON', e);
    }
  }

  Future<void> _onThemeWidgetEvent(ThemeWidgetEvent event, Emitter<UpdateThemeState> emit) async {
    event.map(
      setFonts: (e) => _widgetEditor.setFonts(e.fonts),
      setGlobalFontFamily: (e) => _widgetEditor.setGlobalFontFamily(e.fontFamily),
      setButton: (e) => _widgetEditor.setButton(e.button),
      setPEButton: (e) => _widgetEditor.setPrimaryElevatedButton(e.cfg),
      setGroup: (e) => _widgetEditor.setGroup(e.group),
      setGroupTitleListTile: (e) => _widgetEditor.setGroupTitleListTile(e.cfg),
      setGroupTitleListTileBackground: (e) => _widgetEditor.setGroupTitleListTileBackground(e.color),
      setBar: (e) => _widgetEditor.setBar(e.bar),
      setBottomNavigationBar: (e) => _widgetEditor.setBottomNavigationBar(e.cfg),
      setBottomNavBarBackground: (e) => _widgetEditor.setBottomNavBarBackground(e.color),
      setBottomNavBarSelected: (e) => _widgetEditor.setBottomNavBarSelected(e.color),
      setBottomNavBarUnselected: (e) => _widgetEditor.setBottomNavBarUnselected(e.color),
      setExtTabBar: (e) => _widgetEditor.setExtTabBar(e.cfg),
      setTabBarConfig: (_SetTabBarConfig value) => _widgetEditor.setTabBar(value.cfg),
      setImageAssets: (e) => _widgetEditor.setImageAssets(e.cfg),
      setAppIcon: (e) => _widgetEditor.setAppIcon(e.cfg),
      setLeadingAvatarStyle: (e) => _widgetEditor.setLeadingAvatarStyle(e.cfg),
      setInput: (e) => _widgetEditor.setInput(e.cfg),
      setTextFormField: (e) => _widgetEditor.setTextFormField(e.cfg),
      setInputLabelColor: (e) => _widgetEditor.setInputLabelColor(e.color),
      setInputBorder: (e) => _widgetEditor.setInputBorder(e.cfg),
      setInputBorderDisabled: (e) => _widgetEditor.setInputBorderDisabled(e.cfg),
      setInputBorderFocused: (e) => _widgetEditor.setInputBorderFocused(e.cfg),
      setInputBorderAny: (e) => _widgetEditor.setInputBorderAny(e.cfg),
      setText: (e) => _widgetEditor.setText(e.cfg),
      setTextSelection: (e) => _widgetEditor.setTextSelection(e.cfg),
      setTextCursorColor: (e) => _widgetEditor.setTextCursorColor(e.color),
      setTextSelectionColor: (e) => _widgetEditor.setTextSelectionColor(e.color),
      setTextSelectionHandleColor: (e) => _widgetEditor.setTextSelectionHandleColor(e.color),
      setLinkify: (e) => _widgetEditor.setLinkify(e.cfg),
      setLinkifyStyleColor: (e) => _widgetEditor.setLinkifyStyleColor(e.color),
      setLinkifyLinkColor: (e) => _widgetEditor.setLinkifyLinkColor(e.color),
      setDialog: (e) => _widgetEditor.setDialog(e.cfg),
      setConfirmDialog: (e) => _widgetEditor.setConfirmDialog(e.cfg),
      setConfirmDialogActive1: (e) => _widgetEditor.setConfirmDialogActive1(e.color),
      setConfirmDialogActive2: (e) => _widgetEditor.setConfirmDialogActive2(e.color),
      setConfirmDialogDefault: (e) => _widgetEditor.setConfirmDialogDefault(e.color),
      setSnackBar: (e) => _widgetEditor.setSnackBar(e.cfg),
      setStatuses: (e) => _widgetEditor.setStatuses(e.cfg),
      setRegistrationStatuses: (e) => _widgetEditor.setRegistrationStatuses(e.cfg),
      setRegistrationOnline: (e) => _widgetEditor.setRegistrationOnline(e.color),
      setRegistrationOffline: (e) => _widgetEditor.setRegistrationOffline(e.color),
      setCallStatuses: (e) => _widgetEditor.setCallStatuses(e.cfg),
      setCallStatusesConnectivityNone: (e) => _widgetEditor.setCallStatusesConnectivityNone(e.color),
      setCallStatusesConnectError: (e) => _widgetEditor.setCallStatusesConnectError(e.color),
      setCallStatusesAppUnregistered: (e) => _widgetEditor.setCallStatusesAppUnregistered(e.color),
      setCallStatusesConnectIssue: (e) => _widgetEditor.setCallStatusesConnectIssue(e.color),
      setCallStatusesInProgress: (e) => _widgetEditor.setCallStatusesInProgress(e.color),
      setCallStatusesReady: (e) => _widgetEditor.setCallStatusesReady(e.color),
      setDecoration: (e) => _widgetEditor.setDecoration(e.cfg),
      setPrimaryGradient: (e) => _widgetEditor.setPrimaryGradient(e.cfg),
      setPrimaryGradientColors: (e) => _widgetEditor.setPrimaryGradientColors(e.colors),
      setDefaultPlaceholderImage: (e) => _widgetEditor.setDefaultPlaceholderImage(e.imageSource),
      importJson: (e) => _onImportWidgetJson(e.json),
    );
  }

  void _onImportWidgetJson(Map<String, dynamic> json) {
    try {
      final config = ThemeWidgetConfig.fromJson(json);
      _widgetEditor.setThemeWidgetConfig(config);
    } catch (e) {
      _logger.warning('Failed to parse ThemeWidgetConfig from JSON', e);
    }
  }

  Future<void> _onThemePageEvent(ThemePageEvent event, Emitter<UpdateThemeState> emit) async {
    event.map(
      setLoginPage: (e) => _pageEditor.setLoginPage(e.login),
      updateSwitchPage: (e) => _pageEditor.updateSwitchScreenConfig(e.login),
      setLoginPicture: (e) => _pageEditor.setLoginPicture(e.imageSource),
      setLoginModeSelect: (e) => _pageEditor.setLoginModeSelect(e.modeSelect),
      setLoginModeSelectButtonLoginStyle: (e) => _pageEditor.setLoginModeSelectButtonLoginStyle(e.type),
      setLoginModeSelectButtonSignupStyle: (e) => _pageEditor.setLoginModeSelectButtonSignupStyle(e.type),
      setAboutPage: (e) => _pageEditor.setAboutPage(e.about),
      setAboutPicture: _onSetAboutPicture,
      setAboutMetadata: (e) => _pageEditor.setAboutMetadata(e.metadata),
      setDialingPage: (e) => _pageEditor.setDialingPage(e.dialingPage),
      setDialingSystemUiOverlay: (e) => _pageEditor.setDialingSystemUiOverlay(e.style),
      setDialingAppBarStyle: (e) => _pageEditor.setDialingAppBarStyle(e.appBarStyle),
      setDialingInfo: (e) => _pageEditor.setDialingInfo(e.info),
      setSettingsPage: (e) => _pageEditor.setSettingsPage(e.info),
      setDialingInfoUsernameStyle: (e) => _pageEditor.setDialingInfoUsernameStyle(e.style),
      setDialingInfoNumberStyle: (e) => _pageEditor.setDialingInfoNumberStyle(e.style),
      setDialingInfoCallStatusStyle: (e) => _pageEditor.setDialingInfoCallStatusStyle(e.style),
      setDialingInfoProcessingStatusStyle: (e) => _pageEditor.setDialingInfoProcessingStatusStyle(e.style),
      setKeypadPage: (e) => _pageEditor.setKeypadStyle(e.keypad),
      setLoginOtpSigninVerifyCountdown: (e) => _pageEditor.setLoginOtpSigninVerifyCountdown(e.seconds),
      setLoginSignupVerifyCountdown: (e) => _pageEditor.setLoginSignupVerifyCountdown(e.seconds),
      setContactsPage: (e) => _pageEditor.setContactsPage(e.config),
      setRecentsPage: (e) => _pageEditor.setRecentsPage(e.config),
      setFavoritesPage: (e) => _pageEditor.setFavoritesPage(e.config),
      setConversationsPage: (e) => _pageEditor.setConversationsPage(e.config),
      setEmbeddedPage: (e) => _pageEditor.setEmbeddedPage(e.config),
      importJson: (e) => _onImportPageJson(e.json),
    );
  }

  void _onImportPageJson(Map<String, dynamic> json) {
    try {
      final config = ThemePageConfig.fromJson(json);
      _pageEditor.setThemePageConfig(config);
    } catch (e) {
      _logger.warning('Failed to parse ThemePageConfig from JSON', e);
    }
  }

  void _onSetAboutPicture(_SetAboutPicture e) =>
      _pageEditor.setAboutPicture(ImageSource(id: e.asset.id, uri: e.asset.downloadUrl));

  Future<void> _onChangeColorEvent(UpdateColorSchemeEvent event, Emitter<UpdateThemeState> emit) {
    return event.map(
      change: (_UpdateColorSchemeEvent value) async =>
          _colorSchemeEditor.patchOverride({value.key: value.color?.toHex()}),
      importJson: (_ImportJsonColorSchemeEvent value) async => _processJsonImport(value.jsonMap),
    );
  }

  Future<void> _processJsonImport(Map<String, dynamic> jsonMap) async {
    final patchData = <String, String>{};

    for (final entry in jsonMap.entries) {
      final val = entry.value;
      if (val is String && isValidHexColor(val)) {
        patchData[entry.key] = val;
      }
    }

    if (patchData.isNotEmpty) {
      _colorSchemeEditor.patchOverride(patchData);
    }
  }

  Future<void> _initializeEditing(InitializeEvent event, Emitter<UpdateThemeState> emit) async {
    final epoch = ++_initEpoch;

    _pauseEditorSubscriptions();

    add(const LoadingEvent.reset(status: ThemePropertyStatus.progress));

    final results = await Future.wait([
      _initializeFeatureAccess(applicationId, themeId, epoch),
      _initializeEmbeddedResourceModel(applicationId, epoch),
      _initializeColorScheme(applicationId, themeId, state.selectedVariant, epoch),
      _initializePageConfig(applicationId, themeId, state.selectedVariant, epoch),
      _initializeWidgetsConfig(applicationId, themeId, state.selectedVariant, epoch),
    ]);

    if (_initEpoch != epoch) return; // Superseded — next init resumes

    _resumeEditorSubscriptions();

    final allSucceeded = results.every((ok) => ok);
    add(LoadingEvent.setStatus(allSucceeded ? ThemePropertyStatus.success : ThemePropertyStatus.error));
  }

  Future<bool> _initializeWidgetsConfig(
    String applicationId,
    String themeId,
    BrightnessVariant variant,
    int epoch,
  ) async {
    try {
      final widgetConfig = await getWidgetConfigUsecase.execute(applicationId, themeId, variant);
      if (_initEpoch != epoch) return true;
      _widgetEditor.setInitial(ThemeWidgetConfig.fromJson(widgetConfig.config), version: widgetConfig.version);
      return true;
    } catch (e, stackTrace) {
      if (_initEpoch != epoch) return true;
      _logger.severe('Failed to load widget config', e, stackTrace);
      _widgetEditor.setInitial(const ThemeWidgetConfig());
      return false;
    } finally {
      if (_initEpoch == epoch) {
        add(const LoadingEvent.markLoaded(ThemeComponents.widgets));
      }
    }
  }

  Future<bool> _initializePageConfig(String applicationId, String themeId, BrightnessVariant variant, int epoch) async {
    try {
      final loadTheme = await getPageConfigByVariantUsecase.execute(
        applicationId: applicationId,
        themeId: themeId,
        variant: variant,
      );
      if (_initEpoch != epoch) return true;
      _pageEditor.setInitial(ThemePageConfig.fromJson(loadTheme.config), version: loadTheme.version);
      return true;
    } catch (e, stackTrace) {
      if (_initEpoch != epoch) return true;
      _logger.severe('Failed to load page config', e, stackTrace);
      _pageEditor.setInitial(const ThemePageConfig());
      return false;
    } finally {
      if (_initEpoch == epoch) {
        add(const LoadingEvent.markLoaded(ThemeComponents.pages));
      }
    }
  }

  Future<bool> _initializeFeatureAccess(String applicationId, String themeId, int epoch) async {
    try {
      final featureAccess = await getFeatureAccessUsecase.execute(applicationId, themeId);
      if (_initEpoch != epoch) return true;

      final navigation = AppConfig.fromJson(featureAccess.config).copyWith();

      _featureAccessEditor.setInitial(navigation, version: featureAccess.version);
      return true;
    } catch (e, stackTrace) {
      if (_initEpoch != epoch) return true;
      _logger.severe('Failed to load feature access', e, stackTrace);
      _featureAccessEditor.setInitial(const AppConfig());
      return false;
    } finally {
      if (_initEpoch == epoch) {
        add(const LoadingEvent.markLoaded(ThemeComponents.navigation));
      }
    }
  }

  Future<bool> _initializeColorScheme(
    String applicationId,
    String themeId,
    BrightnessVariant variant,
    int epoch,
  ) async {
    try {
      final colorScheme = await getColorSchemeByThemeVariantUsecase.execute(
        applicationId: applicationId,
        themeId: themeId,
        variant: variant,
      );
      if (_initEpoch != epoch) return true;
      _colorSchemeEditor.setInitial(ColorSchemeConfig.fromJson(colorScheme.config), version: colorScheme.version);
      return true;
    } catch (e, stackTrace) {
      if (_initEpoch != epoch) return true;
      _logger.severe('Failed to load color scheme', e, stackTrace);
      _colorSchemeEditor.setInitial(const ColorSchemeConfig());
      return false;
    } finally {
      if (_initEpoch == epoch) {
        add(const LoadingEvent.markLoaded(ThemeComponents.colors));
      }
    }
  }

  Future<bool> _initializeEmbeddedResourceModel(String applicationId, int epoch) async {
    try {
      final embeds = await getApplicationEmbedsUsecase.execute(applicationId);
      if (_initEpoch != epoch) return true;
      add(ResourcesEvent.embedsUpdated(embeds));
      return true;
    } catch (e, stackTrace) {
      if (_initEpoch != epoch) return true;
      _logger.severe('Failed to load embedded resources', e, stackTrace);
      return false;
    } finally {
      if (_initEpoch == epoch) {
        add(const LoadingEvent.markLoaded(ThemeComponents.embeds));
      }
    }
  }

  @override
  Future<void> close() async {
    await _pageEditorSub?.cancel();
    await _featureAccessSub?.cancel();
    await _colorSchemeEditorSub?.cancel();
    await _widgetEditorSub?.cancel();
    await _assetsSub?.cancel();

    await _pageEditor.dispose();
    await _featureAccessEditor.dispose();
    await _colorSchemeEditor.dispose();
    await _widgetEditor.dispose();

    return super.close();
  }
}
