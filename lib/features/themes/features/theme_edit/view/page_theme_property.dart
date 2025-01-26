// import 'package:flutter/material.dart';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:webtrit_configurator/core/core.dart';
// import 'package:webtrit_configurator/features/themes/features/theme_edit/features/configure/assets/view/assets_page.dart';
// import 'package:webtrit_configurator/localization/localization.dart';
// import '../features/features.dart';
// import '../theme_edit.dart';
// import '../widgets/group_title_list_tile.dart' as widgets;
//
// class PageThemeProperty extends StatelessWidget with MixinMessages {
//   const PageThemeProperty({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = context.read<UpdateThemCubit>();
//
//     final colorScheme = Theme.of(context).colorScheme;
//
//     const borderSide = BorderSide(width: 0.1, color: Colors.black87);
//
//     return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
//       bloc: bloc,
//       builder: (ctx, state) => SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const widgets.GroupTitleListTile(
//               titleData: 'Application Runtime configuration',
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//               decoration: BoxDecoration(border: Border(bottom: borderSide)),
//             ),
//             ListTile(
//               leading: Icon(Icons.palette, color: colorScheme.primary),
//               title: Text(context.l10n.configurator_color_template_title),
//               subtitle: const Text('Defines the material color scheme used for theming all UI components.'),
//               trailing: const Icon(Icons.keyboard_arrow_right),
//               onTap: () => _navigateToChangeColorScheme(context, bloc),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings_display, color: colorScheme.primary),
//               title: const Text(
//                 'Special Widget Configuration',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               subtitle: const Text(
//                 'Adjust settings for custom and advanced widgets in the app.',
//               ),
//               trailing: const Icon(Icons.keyboard_arrow_right),
//               onTap: () => _navigateToChangeWidgetConfiguration(context, bloc),
//             ),
//             ListTile(
//               leading: Icon(Icons.screenshot_outlined, color: colorScheme.primary),
//               title: const Text(
//                 'Special page Configuration',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               subtitle: const Text(
//                 'Adjust settings for pages in the app.',
//               ),
//               trailing: const Icon(Icons.keyboard_arrow_right),
//               onTap: () => _navigateToChangePagesConfiguration(context, bloc),
//             ),
//             ListTile(
//               leading: Icon(Icons.view_comfy_alt_rounded, color: colorScheme.primary),
//               title: const Text(
//                 'Feature Access',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               subtitle: const Text(
//                 'Manage and configure features available in the current build.',
//               ),
//               trailing: const Icon(Icons.keyboard_arrow_right),
//               onTap: () => _navigateToChangeAppFeatureConfiguration(context, bloc),
//             ),
//             const widgets.GroupTitleListTile(
//               titleData: 'Static Data',
//             ),
//             ListTile(
//               leading: Icon(Icons.file_present_rounded, color: colorScheme.primary),
//               title: const Text(
//                 'HTML assets',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               subtitle: const Text(
//                 'Add HTML assets for app configuration.',
//               ),
//               trailing: const Icon(Icons.keyboard_arrow_right),
//               onTap: () => _navigateToAssetsConfiguration(context, bloc),
//             ),
//             ListTile(
//               leading: Icon(Icons.rocket_launch_outlined, color: colorScheme.primary),
//               title: const Text(
//                 'Launch Icons & Splash Screen',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               subtitle: const Text(
//                 'Configure and prepare resources for app launch icons and splash screens.',
//               ),
//               trailing: const Icon(Icons.keyboard_arrow_right),
//               onTap: () => _navigateToChangeLaunchAssetsConfiguration(context, bloc),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _navigateToChangeColorScheme(BuildContext context, UpdateThemCubit cubit) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => const ColorSchemeConfigurationView(),
//       ),
//     );
//   }
//
//   Future<void> _navigateToChangeWidgetConfiguration(BuildContext context, UpdateThemCubit cubit) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => const ConfigureWidgetsView(),
//       ),
//     );
//   }
//
//   Future<void> _navigateToChangePagesConfiguration(BuildContext context, UpdateThemCubit cubit) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => const ConfigureThemePageView(),
//       ),
//     );
//   }
//
//   Future<void> _navigateToChangeAppFeatureConfiguration(BuildContext context, UpdateThemCubit cubit) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => const ConfigureAppConfigView(),
//       ),
//     );
//   }
//
//   Future<void> _navigateToAssetsConfiguration(BuildContext context, UpdateThemCubit cubit) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => AssetsPage(),
//       ),
//     );
//   }
//
//   Future<void> _navigateToChangeLaunchAssetsConfiguration(BuildContext context, UpdateThemCubit cubit) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => LaunchAssetsConfigurationView(
//           themeModel: cubit.state.theme!,
//         ),
//       ),
//     );
//   }
// }
