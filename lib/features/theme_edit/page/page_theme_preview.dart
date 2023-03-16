import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/utility/utility.dart';
import 'package:webtrit_configurator/share/entity/entity.dart';

import 'package:screenshots/mocks/mocks.dart';
import 'package:screenshots/screenshots/screenshots.dart';
import 'package:screenshots/widgets/widgets.dart';

import 'package:webtrit_phone/features/features.dart';
import 'package:webtrit_phone/theme/theme.dart';

import '../bloc/configurator/configurator_cubit.dart';
import '../bloc/focus/focus_group_cubit.dart';
import '../model/models.dart';
import '../widgets/widgets.dart';

class PageThemePreview extends StatefulWidget {
  const PageThemePreview({
    super.key,
  });

  @override
  State<PageThemePreview> createState() => _PageThemePreviewState();
}

class _PageThemePreviewState extends State<PageThemePreview> {
  var _isVisibleInfoConsole = false;

  late final FocusGroupCubit _focusGroup = BlocProvider.of(context);
  final ScrollController _eventLogScrollController = ScrollController();

  List<CustomColor> primaryGradientColors(ThemePropertyState state) => state.gradientTabColor
      .map((color) => CustomColor(
            color: color,
            blend: false,
          ))
      .toList();

  ColorSchemeOverride getColorSchemeOverride(ColorsModel? colorSetting) => ColorSchemeOverride(
        primary: UtilityColor.tryParseColorFromHex(colorSetting?.primary ?? ''),
        onPrimary: UtilityColor.tryParseColorFromHex(colorSetting?.onPrimary ?? ''),
        secondary: UtilityColor.tryParseColorFromHex(colorSetting?.secondary ?? ''),
        secondaryContainer: UtilityColor.tryParseColorFromHex(colorSetting?.secondaryContainer ?? ''),
        onSecondaryContainer: UtilityColor.tryParseColorFromHex(colorSetting?.onSecondaryContainer ?? ''),
        tertiary: UtilityColor.tryParseColorFromHex(colorSetting?.tertiary ?? ''),
        error: UtilityColor.tryParseColorFromHex(colorSetting?.error ?? ''),
        outline: UtilityColor.tryParseColorFromHex(colorSetting?.outline ?? ''),
        background: UtilityColor.tryParseColorFromHex(colorSetting?.background ?? ''),
        onBackground: UtilityColor.tryParseColorFromHex(colorSetting?.onBackground ?? ''),
        surface: UtilityColor.tryParseColorFromHex(colorSetting?.surface ?? ''),
        onSurface: UtilityColor.tryParseColorFromHex(colorSetting?.onSurface ?? ''),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemePropertyCubit, ThemePropertyState>(
      builder: (BuildContext context, state) {
        final appBloc = MockAppBloc.allScreen(
          themeSettings: ThemeSettings(
              seedColor: state.colorPrimary ?? Colors.transparent,
              lightColorSchemeOverride: getColorSchemeOverride(state.theme?.colors),
              primaryGradientColors: primaryGradientColors(state),
              fontFamily: state.theme?.fontModel.fontFamily),
          themeMode: ThemeMode.light,
          locale: const Locale('en'),
        );

        return BlocConsumer<FocusGroupCubit, FocusGroupState>(
          listener: (BuildContext context, focus) {
            _eventLogScrollController.animateTo(_eventLogScrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
          },
          builder: (BuildContext context, focus) {
            return Scaffold(
              endDrawer: Drawer(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                  child: ListView(
                    padding: const EdgeInsets.only(right: 8),
                    children: _wrapPreviewScreensInCard(
                      appBloc,
                      focus.focusGroup,
                      focus.currentScreen,
                    ),
                  ),
                ),
              ),
              body: Column(
                children: [
                  MenuSpace(
                    isTopPosition: true,
                    background: const Color(0xfffafafa),
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => _openDrawer(context),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Icon(
                              Icons.menu,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            child: BlocBuilder<ThemePropertyCubit, ThemePropertyState>(
                              builder: (BuildContext context, state) {
                                return MockDevice(
                                  child: _previewScreens(appBloc, focus.focusGroup)[focus.currentScreen]!,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    color: const Color(0xfff6f6f6),
                    height: _isVisibleInfoConsole ? MediaQuery.of(context).size.height / 2 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_isVisibleInfoConsole)
                          MenuSpace(
                            isTopPosition: false,
                            borderWidth: 0.2,
                            background: Colors.black.withOpacity(0.04),
                            children: [
                              LogEventClose(
                                onClick: () {
                                  setState(
                                    () {
                                      _isVisibleInfoConsole = false;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        Expanded(
                          child: ListView.builder(
                            reverse: true,
                            controller: _eventLogScrollController,
                            itemCount: focus.messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return LogEventMessage(
                                model: focus.messages[index],
                                onClick: (ScreenEnum screen) {
                                  _focusGroup.updateCurrentScreen(screen);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  MenuSpace(
                    isTopPosition: false,
                    borderWidth: 0.2,
                    children: [
                      LogEvent(
                        onClick: (isSelected) {
                          setState(
                            () {
                              _isVisibleInfoConsole = isSelected;
                            },
                          );
                        },
                        isSelected: _isVisibleInfoConsole,
                        messages: focus.messages,
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _openDrawer(BuildContext context) => Scaffold.of(context).openEndDrawer();

  void _closeDrawer() => Scaffold.of(context).closeEndDrawer();

  void _onSelectPreview(ScreenEnum screen) {
    _focusGroup.updateCurrentScreen(screen);
    _closeDrawer();
    setState(() {});
  }

  Map<ScreenEnum, Widget> _previewScreens(MockAppBloc appBloc, FocusModel focusGroup) {
    return {
      ScreenEnum.auth: ScreenshotApp(
        appBloc: appBloc,
        child: const LoginScreenScreenshot(LoginStep.modeSelect),
      ),
      ScreenEnum.main: ScreenshotApp(
        appBloc: appBloc,
        child: const MainScreenScreenshot(MainFlavor.favorites),
      ),
      ScreenEnum.setting: ScreenshotApp(
        appBloc: appBloc,
        child: const MainScreenScreenshot(MainFlavor.recents),
      ),
    };
  }

  List<Widget> _wrapPreviewScreensInCard(MockAppBloc appBloc, FocusModel focusGroup, ScreenEnum screenEnum) {
    final screens = _previewScreens(appBloc, focusGroup).entries;
    final cards = screens.map((it) {
      final isActive = it.key == screenEnum;
      return MockSmallPreviewCard(onTap: () => _onSelectPreview(it.key), isActive: isActive, child: it.value);
    });
    return cards.toList();
  }
}
