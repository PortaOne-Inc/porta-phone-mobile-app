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
  var _isFrameVisible = true;
  var _previewType = PreviewType.single;
  var _focusScreenPosition = 0;

  final _eventLogScrollController = ScrollController();

  final _screenshots = <Widget>[];

  final scaleIcon = [
    Icons.grid_view_rounded,
    Icons.grid_on,
    Icons.crop_square_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8, top: 2, bottom: 2),
          child: ListView.builder(
            itemCount: _screenshots.length,
            padding: const EdgeInsets.only(right: 8),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: TypeOfPreview(
                  isFocused: index == _focusScreenPosition,
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: _screenshots[index],
                ),
                onTap: () {
                  Scaffold.of(context).closeEndDrawer();
                  setState(
                    () {
                      _focusScreenPosition = index;
                    },
                  );
                },
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
                    onTap: () {
                      setState(() {
                        _isFrameVisible = !_isFrameVisible;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        _isFrameVisible ? Icons.phone_android : Icons.phonelink_erase_outlined,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _previewType = PreviewType.values[(_previewType.index + 1) % PreviewType.values.length];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        scaleIcon[(_previewType.index) % PreviewType.values.length],
                        size: 20,
                      ),
                    ),
                  ),
                ),
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
              child: BlocBuilder<ThemePropertyCubit, ThemePropertyState>(
                builder: (BuildContext context, state) {
                  return BlocConsumer<FocusGroupCubit, FocusGroupState>(
                    listener: _listenSynchronizeState,
                    builder: (BuildContext context, focus) {
                      _updatePreviewScreens(state);
                      return Column(
                        children: [
                          Expanded(
                            child: PreviewDetails(
                              type: _previewType,
                              screens: _screenshots,
                              screenFocus: _focusScreenPosition,
                              isFrameVisible: _isFrameVisible,
                              onFocusPosition: (position) {
                                setState(() {
                                  _focusScreenPosition = position;
                                });
                              },
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
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _updatePreviewScreens(ThemePropertyState state) {
    final appBloc = MockAppBloc.allScreen(
      themeSettings: ThemeSettings(
          seedColor: state.theme.colorScheme?.primary ?? Colors.transparent,
          lightColorSchemeOverride: state.theme.colorScheme,
          primaryGradientColors: state.theme.toCustomColorGradientCollection,
          fontFamily: state.theme.fontFamily),
      themeMode: ThemeMode.light,
      locale: const Locale('en'),
    );

    _screenshots.clear();
    _screenshots.addAll([
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
    ]);
  }

  void _listenSynchronizeState(BuildContext context, FocusGroupState state) {
    _eventLogScrollController.animateTo(_eventLogScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
  }
}
