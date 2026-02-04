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
    // required this.watchEmbedsUsecase,
    required this.getApplicationEmbedsUsecase,
  }) : super(
          UpdateThemeState(
              status: ThemePropertyStatus.progress,
              appConfig: const AppConfig(),
              colorSchemeConfig: const ColorSchemeConfig(),
              themeWidgetConfig: const ThemeWidgetConfig(),
              themePageConfig: const ThemePageConfig()),
        ) {
    on<UpdateLocalConfigEvent>(_onUpdateLocalConfigEvent, transformer: restartable());
    on<InitializeEvent>(_initializeEditing, transformer: droppable());
    on<SyncConfigEvent>(_syncConfigWithServer, transformer: droppable());
    on<UpdateColorSchemeEvent>(_onChangeColorEvent, transformer: restartable());
    on<AppConfigEvent>(_onAppConfigEvent, transformer: concurrent());
    on<ThemePageEvent>(_onThemePageEvent, transformer: concurrent());
    on<ThemeWidgetEvent>(_onThemeWidgetEvent, transformer: concurrent());
    on<UpdateVariantEvent>(_onUpdateVariantEvent, transformer: droppable());
    on<ResourcesEvent>(_onResourcesEvent, transformer: concurrent());
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

  // final WatchEmbedsUsecase watchEmbedsUsecase;
  final GetApplicationEmbedsUsecase getApplicationEmbedsUsecase;

  final ThemePageEditor _pageEditor = ThemePageEditor();
  final FeatureAccessEditor _featureAccessEditor = FeatureAccessEditor();
  final ColorSchemeEditor _colorSchemeEditor = ColorSchemeEditor();
  final ThemeWidgetEditor _widgetEditor = ThemeWidgetEditor();

  StreamSubscription<ThemePageConfig>? _pageEditorSub;
  StreamSubscription<AppConfig>? _featureAccessSub;
  StreamSubscription<ColorSchemeConfig>? _colorSchemeEditorSub;
  StreamSubscription<ThemeWidgetConfig>? _widgetEditorSub;
  StreamSubscription<List<AssetModel>>? _assetsSub;
  StreamSubscription<List<EmbeddedResourceModel>>? _embedssSub;

  void _init(String applicationId, String themeId) {
    _assetsSub = watchApplicationAssetsUsecase.execute(applicationId).listen(
          (assets) => add(ResourcesEvent.assetsUpdated(assets)),
          onError: (Object error) => add(ResourcesEvent.streamFailed(source: 'assets', error: error)),
        );

    // _embedssSub = watchEmbedsUsecase.execute(applicationId).listen(
    //       (embeds) => add(ResourcesEvent.embedsUpdated(embeds)),
    //       onError: (Object error) => add(ResourcesEvent.streamFailed(source: 'embeds', error: error)),
    //     );

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

  Future<void> _onUpdateVariantEvent(
    UpdateVariantEvent event,
    Emitter<UpdateThemeState> emit,
  ) async {
    final v = event.variant;
    emit(state.copyWith(selectedVariant: v, status: ThemePropertyStatus.progress));

    await Future.wait([
      _initializeColorScheme(applicationId, themeId, v),
      _initializePageConfig(applicationId, themeId, v),
      _initializeWidgetsConfig(applicationId, themeId, v),
    ]);

    emit(state.copyWith(status: ThemePropertyStatus.success));
  }

  Future<void> _onResourcesEvent(
    ResourcesEvent event,
    Emitter<UpdateThemeState> emit,
  ) async {
    event.map(
      assetsUpdated: (e) => emit(state.copyWith(assets: e.assets)),
      embedsUpdated: (e) => _onEmbedsUpdated(e, emit),
      streamFailed: (e) => _logger.warning('Resources stream "${e.source}" error', e.error),
    );
  }

  Future<void> _onEmbedsUpdated(
    _EmbedsUpdated e,
    Emitter<UpdateThemeState> emit,
  ) async {
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

  Future<void> _onUpdateLocalConfigEvent(UpdateLocalConfigEvent event, Emitter<UpdateThemeState> emit) async {
    event.map(
      colorScheme: (_UpdateThemeSchemeColorEvent value) => emit(state.copyWith(colorSchemeConfig: value.scheme)),
      page: (_UpdateThemePageEvent value) => emit(state.copyWith(themePageConfig: value.page)),
      widget: (_UpdateThemeWidgetEvent value) => emit(state.copyWith(themeWidgetConfig: value.widget)),
      featureAccess: (_UpdateAppConfigEvent value) => emit(state.copyWith(appConfig: value.config)),
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
        setSupportedFeatures: (e) => _featureAccessEditor.setSupportedFeatures(e.features));
  }

  Future<void> _onThemeWidgetEvent(ThemeWidgetEvent event, Emitter<UpdateThemeState> emit) async {
    event.map(
      setFonts: (e) => _widgetEditor.setFonts(e.fonts),
      setGlobalFontFamily: (e) => _widgetEditor.setGlobalFontFamily(e.fontFamily),
      setButton: (e) => _widgetEditor.setButton(e.button),
      setPEButton: (e) => _widgetEditor.setPrimaryElevatedButton(e.cfg),
      setPEButtonBackground: (e) => _widgetEditor.setPrimaryElevatedButtonBackground(e.color),
      setPEButtonForeground: (e) => _widgetEditor.setPrimaryElevatedButtonForeground(e.color),
      setPEButtonTextColor: (e) => _widgetEditor.setPrimaryElevatedButtonTextColor(e.color),
      setPEButtonIconColor: (e) => _widgetEditor.setPrimaryElevatedButtonIconColor(e.color),
      setPEButtonDisabledIconColor: (e) => _widgetEditor.setPrimaryElevatedButtonDisabledIconColor(e.color),
      setGroup: (e) => _widgetEditor.setGroup(e.group),
      setGroupTitleListTile: (e) => _widgetEditor.setGroupTitleListTile(e.cfg),
      setGroupTitleListTileBackground: (e) => _widgetEditor.setGroupTitleListTileBackground(e.color),
      // setGroupTitleListTileTextColor: (e) => _widgetEditor.setGroupTitleListTileTextColor(e.color),
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
      setActionPad: (e) => _widgetEditor.setActionPad(e.cfg),
      setActionPadCallStart: (e) => _widgetEditor.setActionPadCallStart(e.cfg),
      setActionPadTransfer: (e) => _widgetEditor.setActionPadTransfer(e.cfg),
      setActionPadBackspacePressed: (e) => _widgetEditor.setActionPadBackspacePressed(e.cfg),
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
    );
  }

  /// Handles theme page configuration events by delegating to the page editor.
  Future<void> _onThemePageEvent(
    ThemePageEvent event,
    Emitter<UpdateThemeState> emit,
  ) async {
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
    );
  }

  /// Maps asset metadata to an image source for the about page.
  void _onSetAboutPicture(_SetAboutPicture e) => _pageEditor.setAboutPicture(
        ImageSource(id: e.asset.id, uri: e.asset.downloadUrl),
      );

  Future<void> _onChangeColorEvent(UpdateColorSchemeEvent event, Emitter<UpdateThemeState> emit) {
    return event.map(
        chane: (_UpdateColorSchemeEvent value) async =>
            _colorSchemeEditor.patchOverride({value.key: value.color?.toHex()}));
  }

  Future<void> _syncConfigWithServer(SyncConfigEvent event, Emitter<UpdateThemeState> emit) async {
    try {
      emit(state.copyWith(status: ThemePropertyStatus.progress));
      emit(state.copyWith(status: ThemePropertyStatus.progress));

      final featureAccess = _featureAccessEditor.buildFull();
      final colorScheme = _colorSchemeEditor.buildFull();
      final pageConfig = _pageEditor.buildFull();
      final themeWidget = _widgetEditor.buildFull();

      await Future.wait([
        updateFeatureAccessUsecase.execute(
          applicationId: applicationId,
          themeId: themeId,
          status: FeatureAccessStatus.draft,
          config: featureAccess.toJson(),
        ),
        upsertColorSchemeByThemeVariantUsecase.execute(
          applicationId: applicationId,
          themeId: themeId,
          variant: state.selectedVariant,
          config: colorScheme.toJson(),
        ),
        upsertPageConfigByVariantUsecase.execute(
          applicationId: applicationId,
          themeId: themeId,
          variant: state.selectedVariant,
          config: pageConfig.toJson(),
        ),
        upsertWidgetConfig.execute(
          applicationId,
          themeId,
          state.selectedVariant,
          themeWidget.toJson(),
        ),
      ]);

      emit(state.copyWith(status: ThemePropertyStatus.success));
    } on Exception catch (e) {
      _logger.severe('Failed to sync config with server: $e');
      emit(state.copyWith(status: ThemePropertyStatus.error, error: e));
    }
  }

  Future<void> _initializeEditing(InitializeEvent event, Emitter<UpdateThemeState> emit) async {
    add(const LoadingEvent.reset(status: ThemePropertyStatus.progress));

    await _initializeEmbeddedResourceModel(applicationId);
    await _initializeColorScheme(applicationId, themeId, state.selectedVariant);
    await _initializeFeatureAccess(applicationId, themeId);
    await _initializePageConfig(applicationId, themeId, state.selectedVariant);
    await _initializeWidgetsConfig(applicationId, themeId, state.selectedVariant);

    add(const LoadingEvent.setStatus(ThemePropertyStatus.success));
  }

  Future<void> _initializeWidgetsConfig(String applicationId, String themeId, BrightnessVariant variant) async {
    try {
      final widgetConfig = await getWidgetConfigUsecase.execute(
        applicationId,
        themeId,
        variant,
      );
      _widgetEditor.setInitial(ThemeWidgetConfig.fromJson(widgetConfig.config));
    } catch (e) {
      _logger.warning('Failed to load widget config: $e');
      _widgetEditor.setInitial(const ThemeWidgetConfig());
    } finally {
      add(const LoadingEvent.markLoaded(ThemeComponents.widgets));
    }
  }

  Future<void> _initializePageConfig(String applicationId, String themeId, BrightnessVariant variant) async {
    try {
      final loadTheme = await getPageConfigByVariantUsecase.execute(
        applicationId: applicationId,
        themeId: themeId,
        variant: variant,
      );
      _pageEditor.setInitial(ThemePageConfig.fromJson(loadTheme.config));
    } catch (e) {
      _logger.warning('Failed to load page config: $e');
      _pageEditor.setInitial(const ThemePageConfig());
    } finally {
      add(const LoadingEvent.markLoaded(ThemeComponents.pages));
    }
  }

  Future<void> _initializeFeatureAccess(String applicationId, String themeId) async {
    try {
      final featureAccess = await getFeatureAccessUsecase.execute(applicationId, themeId);

      final navigation = AppConfig.fromJson(featureAccess.config).copyWith();

      _featureAccessEditor.setInitial(navigation);
    } catch (e) {
      _logger.warning('Failed to load feature access: $e');
      _featureAccessEditor.setInitial(const AppConfig());
    } finally {
      add(const LoadingEvent.markLoaded(ThemeComponents.navigation));
    }
  }

  Future<void> _initializeColorScheme(String applicationId, String themeId, BrightnessVariant variant) async {
    try {
      final colorScheme = await getColorSchemeByThemeVariantUsecase.execute(
        applicationId: applicationId,
        themeId: themeId,
        variant: variant,
      );
      _colorSchemeEditor.setInitial(ColorSchemeConfig.fromJson(colorScheme.config));
    } catch (e) {
      _logger.warning('Failed to load color scheme: $e');
      _colorSchemeEditor.setInitial(const ColorSchemeConfig());
    } finally {
      add(const LoadingEvent.markLoaded(ThemeComponents.colors));
    }
  }

  Future<void> _initializeEmbeddedResourceModel(String applicationId) async {
    try {
      final embeds = await getApplicationEmbedsUsecase.execute(applicationId);
      add(ResourcesEvent.embedsUpdated(embeds));
    } catch (e) {
      _logger.warning('Failed to load color scheme: $e');
      _colorSchemeEditor.setInitial(const ColorSchemeConfig());
    } finally {
      add(const LoadingEvent.markLoaded(ThemeComponents.embeds));
    }
  }

  @override
  Future<void> close() async {
    await _pageEditorSub?.cancel();
    await _featureAccessSub?.cancel();
    await _colorSchemeEditorSub?.cancel();
    await _widgetEditorSub?.cancel();
    await _assetsSub?.cancel();
    await _embedssSub?.cancel();

    await _pageEditor.dispose();
    await _featureAccessEditor.dispose();
    await _colorSchemeEditor.dispose();
    await _widgetEditor.dispose();

    return super.close();
  }
}
