// import 'package:flutter/material.dart';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resizable_columns/resizable_columns.dart';
//
// import 'package:domain/domain.dart';
//
// import 'package:webtrit_configurator/core/core.dart';
// import 'package:webtrit_configurator/features/common/common.dart';
// import 'package:webtrit_configurator/features/themes/models/models.dart';
// import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
// import 'package:webtrit_configurator/features/themes/constants/constants.dart';
// import 'package:webtrit_phone/models/models.dart';
//
// import '../../theme_edit/features/widgets_preview/preview_layout_view.dart';
// import '../bloc/theme_preview_cubit.dart';
//
// class ThemePreviewPage extends StatefulWidget with MixinMessages {
//   ThemePreviewPage({
//     required this.title,
//     this.draggable = false,
//     super.key,
//   });
//
//   final String title;
//   final bool draggable;
//
//   @override
//   State<ThemePreviewPage> createState() => _ThemePreviewPageState();
// }
//
// class _ThemePreviewPageState extends State<ThemePreviewPage> {
//   var _isFrameVisible = true;
//   var _previewType = PreviewType.single;
//   var _focusScreenPosition = 0;
//   var _typeScreen = ThemePreviewScreen.layouts;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemePreviewCubit, ThemePreviewState>(builder: (BuildContext context, state) {
//       return Scaffold(
//         appBar: AppToolbar(
//           isVisibleProgress: state.status == ThemePreviewStatus.progress,
//           themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
//           onThemeChange: (mode) => BlocProvider.of<CommonBloc>(context).setThemeMode(mode),
//           name: 'Preview of "${state.theme?.name}" theme',
//         ),
//         body: Column(
//           children: [
//             // MenuPreview(
//             //   isEnableFrame: _isFrameVisible,
//             //   onScaleTab: (PreviewType type) {
//             //     _previewType = type;
//             //     setState(() {});
//             //   },
//             //   onTypeOfPreview: (ThemePreviewScreen type) {
//             //     _typeScreen = type;
//             //     setState(() {});
//             //   },
//             //   onFrameTab: (visibility) {
//             //     _isFrameVisible = visibility;
//             //     setState(() {});
//             //   },
//             // ),
//             Expanded(
//               child: Builder(
//                 builder: (BuildContext context) {
//                   Widget layout;
//
//                   switch (_typeScreen) {
//                     case ThemePreviewScreen.layouts:
//                       layout = TypePreview(
//                         type: _previewType,
//                         screens: _phoneScreenshots(state.theme, state.applicationModel),
//                         screenFocus: _focusScreenPosition,
//                         isFrameVisible: _isFrameVisible,
//                         onFocusPosition: _setFocusedScreen,
//                       );
//                     case ThemePreviewScreen.assets:
//                       layout = ThemeAssetsPreview(
//                         theme: state.theme!,
//                       );
//                     case ThemePreviewScreen.widgets:
//                       layout = WidgetsPreview();
//                   }
//                   return ResizableColumns(
//                     orientation: ResizableOrientation.vertical,
//                     dividerColor: Theme.of(context).colorScheme.surfaceContainerLow,
//                     dividerThickness: 4,
//                     minChildSize: MediaQuery.of(context).size.height * 0.3,
//                     children: [
//                       (context) => layout,
//                       if (_previewType == PreviewType.single && _typeScreen == ThemePreviewScreen.layouts)
//                         (context) => DrawerPreview(
//                               screenshots: _phoneScreenshots(state.theme, state.applicationModel),
//                               focusScreenPosition: _focusScreenPosition,
//                               onTapScreen: _setFocusedScreen,
//                             ),
//                     ],
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       );
//     });
//   }
//
//   List<Widget> _phoneScreenshots(ThemeModel? theme, ApplicationModel? applicationModel) {
//     final appBloc = MockAppBloc.allScreen(
//       themeSettings: (theme ?? const ThemeModel()).toThemeSettings(),
//       themeMode: ThemeMode.light,
//       locale: const Locale('en'),
//     );
//     return [
//       const LoginModeSelectScreenScreenshot(),
//       const LoginCoreUrlAssignScreenScreenshot(),
//       const LoginOtpSignInScreenshot(),
//       const LoginOtpVerifyInScreenshot(),
//       const LoginPasswordSignInScreenshot(),
//       const LoginSignUpScreenshot(),
//       const LoginSignUpVerifyScreenshot(),
//       MainScreenScreenshot(
//         MainFlavor.favorites,
//         Text(applicationModel?.name ?? ''),
//       ),
//       MainScreenScreenshot(
//         MainFlavor.recents,
//         Text(applicationModel?.name ?? ''),
//       ),
//       MainScreenScreenshot(
//         MainFlavor.keypad,
//         Text(applicationModel?.name ?? ''),
//       ),
//       const SettingScreenScreenshot(),
//       const CallScreenScreenshot(false),
//       const CallScreenScreenshot(
//         true,
//         localePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef1,
//         remotePlaceholderImageUrl: ImagePlaceholdersConstants.previewVideoCallRef2,
//       ),
//     ].map((e) => ScreenshotApp(appBloc: appBloc, child: e)).toList();
//   }
//
//   void _setFocusedScreen(int position) {
//     _previewType = PreviewType.single;
//     _focusScreenPosition = position;
//     setState(() {});
//   }
// }
