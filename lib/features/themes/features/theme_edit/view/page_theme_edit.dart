import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/app/route/app_route_consts.dart';

import 'package:webtrit_configurator/features/common/bloc/common_bloc.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

class PageThemeEdit extends StatefulWidget with MixinMessages {
  const PageThemeEdit({required this.title, required this.children, super.key});

  final String title;

  final List<Router<dynamic>> children;

  @override
  State<PageThemeEdit> createState() => _PageThemeEditState();
}

class _PageThemeEditState extends State<PageThemeEdit> {
  UpdateThemCubit get _cubit => BlocProvider.of<UpdateThemCubit>(context);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<UpdateThemCubit, UpdateThemeState>(
      listener: _handleStateChanges,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: ListTile(
              title: Text(
                'Theme configuration',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                state.loadingStatusText(),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              Tooltip(
                message: 'Fetch latest theme from server',
                child: TextButton.icon(
                  icon: const Icon(Icons.update),
                  label: const Text('Update'),
                  onPressed: state.isProgress
                      ? null
                      : () => _cubit.add(const InitializeEvent()),
                ),
              ),
              Tooltip(
                message: 'Save all changes which you have made',
                child: TextButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                  onPressed: state.isProgress
                      ? null
                      : () => _cubit.add(const SyncConfigEvent()),
                ),
              ),
              ThemeModeSwitcher(
                themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
                onThemeChange: (mode) =>
                    context.read<CommonBloc>().setThemeMode(mode),
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                const VersionInfo(),
                ListTile(
                  title: Text(
                    state.theme?.title ?? '...',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.arrow_back_ios),
                  title: const Text('Application details'),
                  subtitle: Text(state.applicationModel?.name ?? '...'),
                  onTap: () => _openApplicationDetailsCollection(
                    context,
                    state.applicationModel?.id ?? '',
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('Applications'),
                  onTap: () => _openApplicationCollection(context),
                ),
                const Divider(),
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Logout'),
                  onTap: () => _logout(context),
                ),
              ],
            ),
          ),
          body: ThemeShellRoute(
            child: ResizableColumns(
              orientation: ResizableOrientation.horizontal,
              dividerColor: colorScheme.surfaceContainerLow,
              dividerThickness: 4,
              minChildSize: 200,
              initialProportions: const [.65, .35],
              children: widget.children
                  .map(
                    (child) =>
                        (_) => child,
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  void _handleStateChanges(BuildContext context, UpdateThemeState state) {
    if (state.isHasError) {
      _showErrorDialog(context, state.error);
    }
  }

  void _showErrorDialog(BuildContext context, Object? error) {
    final message = (error is ThemeIsNotValidException)
        ? 'The theme is not valid.'
        : error?.toString() ?? 'An error occurred.';

    showDialog<void>(
      context: context,
      builder: (BuildContext context) => FailureDialog(message: message),
    );
  }

  void _openApplicationDetailsCollection(
    BuildContext context,
    String applicationId,
  ) {
    GoRouter.of(context).goNamed(
      AppRoutInfo.applicationDetails.name,
      pathParameters: <String, String>{
        AppRoutInfo.keyApplicationId: applicationId,
      },
    );
  }

  void _openApplicationCollection(BuildContext context) {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
  }

  void _logout(BuildContext context) {
    BlocProvider.of<CommonBloc>(context).logout();
    Navigator.pop(context);
  }
}
