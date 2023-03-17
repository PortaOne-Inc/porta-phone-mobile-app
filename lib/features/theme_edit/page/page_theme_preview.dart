import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/share/exports/exports.dart';

import '../bloc/configurator/configurator_cubit.dart';
import '../bloc/focus/focus_group_cubit.dart';
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
  var _focusScreenPosition = 0;

  final ScrollController _eventLogScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemePropertyCubit, ThemePropertyState>(
      builder: (BuildContext context, state) {
        return BlocConsumer<FocusGroupCubit, FocusGroupState>(
          listener: _listenSynchronizeState,
          builder: (BuildContext context, focus) {
            final appBloc = MockAppBloc.allScreen(
              themeSettings: ThemeSettings(
                  seedColor: state.theme.colorScheme?.primary ?? Colors.transparent,
                  lightColorSchemeOverride: state.theme.colorScheme,
                  primaryGradientColors: state.theme.toCustomColorGradientCollection,
                  fontFamily: state.theme.fontFamily),
              themeMode: ThemeMode.light,
              locale: const Locale('en'),
            );

            final screenshots = [
              ScreenshotApp(
                appBloc: appBloc,
                child: const LoginScreenScreenshot(LoginStep.modeSelect),
              ),
              ScreenshotApp(
                appBloc: appBloc,
                child: const MainScreenScreenshot(MainFlavor.favorites),
              ),
              ScreenshotApp(
                appBloc: appBloc,
                child: const MainScreenScreenshot(MainFlavor.recents),
              ),
              ScreenshotApp(
                appBloc: appBloc,
                child: const MainScreenScreenshot(MainFlavor.keypad),
              ),
              ScreenshotApp(
                appBloc: appBloc,
                child: const SettingScreenScreenshot(),
              ),
              ScreenshotApp(
                appBloc: appBloc,
                child: const CallScreenScreenshot(false),
              ),
              ScreenshotApp(
                appBloc: appBloc,
                child: const CallScreenScreenshot(true),
              ),
            ];

            return Scaffold(
              endDrawer: Drawer(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 2, bottom: 2),
                  child: ListView.builder(
                    itemCount: screenshots.length,
                    padding: const EdgeInsets.only(right: 8),
                    itemBuilder: (BuildContext context, int index) {
                      final isActive = index == _focusScreenPosition;
                      return MockSmallPreviewCard(
                        onTap: () => _onSelectPreview(index),
                        isActive: isActive,
                        child: screenshots[index],
                      );
                    },
                  ),
                ),
              ),
              body: Builder(
                builder: (context) => Column(
                  children: [
                    MenuSpace(
                      isTopPosition: true,
                      background: const Color(0xfffafafa),
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () => Scaffold.of(context).openEndDrawer(),
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
                                    child: screenshots[_focusScreenPosition],
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
                                  onClick: (int screen) {
                                    BlocProvider.of<FocusGroupCubit>(context).updateCurrentScreen(screen);
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
              ),
            );
          },
        );
      },
    );
  }

  void _onSelectPreview(int screen) {
    _focusScreenPosition = screen;
    Scaffold.of(context).closeDrawer();
    setState(() {});
  }

  void _listenSynchronizeState(BuildContext context, FocusGroupState state) {
    _eventLogScrollController.animateTo(_eventLogScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
  }
}
