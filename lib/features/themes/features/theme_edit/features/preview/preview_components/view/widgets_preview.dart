import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/widgets/phone_context.dart';
import 'package:webtrit_phone/app/constants.dart';
import 'package:webtrit_phone/features/login/widgets/onboarding_logo.dart';
import 'package:webtrit_phone/features/login/widgets/onboarding_picture_logo.dart';
import 'package:webtrit_phone/features/settings/widgets/widgets.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/widgets/widgets.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';
import '../models/widget_preview_type.dart';
import '../widgets/single_expansion_tile.dart';

class WidgetsPreview extends StatelessWidget {
  const WidgetsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);

    return BlocBuilder<PreviewThemeCubit, PreviewThemeState>(builder: (BuildContext context, PreviewThemeState state) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleExpansionTile(
                tile: 'Session statuses:',
                key: ValueKey('${WidgetPreviewType.sessionStatus}}'),
                initiallyExpanded: state.requestFocus == WidgetPreviewType.sessionStatus,
                child: PhoneContext(
                  key: ValueKey('${WidgetPreviewType.sessionStatus}'),
                  child: const SessionStatusListTile(status: SessionStatus.ready),
                ),
              ),
              SingleExpansionTile(
                tile: 'Snack Bars:',
                initiallyExpanded: state.requestFocus == WidgetPreviewType.snakeBar,
                child: Column(
                  children: _buildColorBlocks([
                    Colors.red,
                    Colors.green,
                    Colors.grey,
                  ]),
                ),
              ),
              const SingleExpansionTile(
                tile: 'Group Title List Tile:',
                child: GroupTitleListTile(
                  titleData: 'Permissions Group Title',
                ),
              ),
              SingleExpansionTile(
                tile: 'Extended Tab Bar:',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: kMainAppBarBottomPaddingGap),
                  child: DefaultTabController(
                    length: 2,
                    child: ExtTabBar(
                      width: mediaQueryData.size.width * 0.75,
                      height: kMainAppBarBottomTabHeight - kMainAppBarBottomPaddingGap,
                      tabs: const [
                        Tab(text: 'Source Type 1'),
                        Tab(text: 'Source Type 2'),
                      ],
                    ),
                  ),
                ),
              ),
              SingleExpansionTile(
                tile: 'BottomNavigationBar:',
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: theme.textTheme.bodySmall,
                  unselectedLabelStyle: theme.textTheme.bodySmall,
                  currentIndex: 1,
                  items: _buildNavBarItems([
                    BottomMenuTab(
                      enabled: true,
                      initial: false,
                      flavor: MainFlavor.contacts,
                      title: 'Contacts',
                      icon: Icons.contacts,
                    ),
                    BottomMenuTab(
                      enabled: true,
                      initial: true,
                      flavor: MainFlavor.favorites,
                      title: 'Favorites',
                      icon: Icons.favorite,
                    ),
                    BottomMenuTab(
                      enabled: true,
                      initial: false,
                      flavor: MainFlavor.keypad,
                      title: 'Keypad',
                      icon: Icons.dialpad,
                    ),
                    BottomMenuTab(
                      enabled: true,
                      initial: false,
                      flavor: MainFlavor.recents,
                      title: 'Recents',
                      icon: Icons.history,
                    ),
                  ]),
                  onTap: (index) {
                    // Handle navigation
                  },
                ),
              ),
              const SingleExpansionTile(
                tile: 'Onboarding Picture Logo:',
                child: OnboardingPictureLogo(
                  text: 'Test',
                ),
              ),
              const SingleExpansionTile(
                tile: 'Onboarding Logo:',
                child: OnboardingLogo(),
              ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _buildColorBlocks(List<Color> colors) {
    return colors
        .map(
          (color) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              height: 40,
              width: double.infinity,
              color: color,
            ),
          ),
        )
        .toList();
  }

  List<BottomNavigationBarItem> _buildNavBarItems(List<BottomMenuTab> tabs) {
    return tabs.map((tab) {
      return BottomNavigationBarItem(
        icon: Icon(tab.icon),
        label: tab.title,
      );
    }).toList();
  }
}

class BottomMenuTab {
  BottomMenuTab({
    required this.enabled,
    required this.initial,
    required this.flavor,
    required this.title,
    required this.icon,
  });

  final bool enabled;
  final bool initial;
  final MainFlavor flavor;
  final String title;
  final IconData icon;
}
