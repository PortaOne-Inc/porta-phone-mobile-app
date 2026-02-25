import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/app/application.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/themes.dart';

class ThemeCreatePage extends StatefulWidget {
  const ThemeCreatePage({super.key});

  @override
  State<ThemeCreatePage> createState() => _ThemeCreatePageState();
}

class _ThemeCreatePageState extends State<ThemeCreatePage> with MixinMessages {
  late final ThemeCreateCubit _bloc = BlocProvider.of<ThemeCreateCubit>(
    context,
  );

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return BlocConsumer<ThemeCreateCubit, ThemeCreateState>(
      listener: _listenState,
      builder: (ctx, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.l10n.feature_theme_create_title,
            style: t.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            ThemeModeSwitcher(
              themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
              onThemeChange: (mode) => _onThemeModeChanged(context, mode),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const VersionInfo(),
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
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                24,
                20,
                24,
                96,
              ), // space for the action bar
              sliver: SliverToBoxAdapter(
                child: _GridArea(
                  children: [
                    // Manual
                    SectionCard(
                      title: 'Manual',
                      child: _ManualContent(
                        nameValue: state.nameInput?.value,
                        nameErrorBuilder: state.nameInput?.errorL10n,
                        onNameChanged: _bloc.updateNameChange,
                        descriptionValue: state.description ?? '',
                        onDescriptionChanged: _bloc.updateDescription,
                      ),
                    ),
                    // AI
                    SectionCard(
                      title: 'AI Generator',
                      trailing: Switch.adaptive(
                        value: state.useAi ?? false,
                        onChanged: _bloc.updateUseAi,
                      ),
                      child: _AiContent(
                        enabled: state.useAi ?? false,
                        prompt: state.prompt ?? '',
                        onPromptChanged: _bloc.updatePrompt,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _ActionBar(
          busy: state.status.isProgress,
          useAi: state.useAi ?? false,
          onPressed: _bloc.trySubmit,
        ),
      ),
    );
  }

  void _listenState(BuildContext context, ThemeCreateState state) {
    if (state.status == ThemeCreateStateStatus.error) {
      showFailureMessage(context, state.error ?? 'Unknown error');
    }
    if (state.status == ThemeCreateStateStatus.success) {
      GoRouter.of(context).goNamed(
        AppRoutInfo.applicationDetails.name,
        pathParameters: {AppRoutInfo.keyApplicationId: _bloc.applicationId},
      );
    }
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }

  void _logout(BuildContext context) {
    BlocProvider.of<CommonBloc>(context).logout();
    Navigator.pop(context);
  }

  void _openApplicationCollection(BuildContext context) {
    GoRouter.of(context).goNamed(AppRoutInfo.applicationCollection.name);
  }
}

/// ---------- Layout pieces ----------

/// Adaptive two-column layout using Wrap:
/// each card has minWidth 420, so on narrow screens it falls back to a single column.
class _GridArea extends StatelessWidget {
  const _GridArea({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: children
          .map(
            (w) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 420, maxWidth: 720),
              child: w,
            ),
          )
          .toList(),
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({
    required this.title,
    required this.child,
    super.key,
    this.trailing,
  });

  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: t.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

/// Bottom sticky bar with a single action button.
class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.busy,
    required this.useAi,
    required this.onPressed,
  });

  final bool busy;
  final bool useAi;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: busy ? null : onPressed,
            icon: Icon(useAi ? Icons.auto_fix_high : Icons.add),
            label: Text(useAi ? 'Generate with AI' : 'Create'),
          ),
        ),
      ),
    );
  }
}

/// ---------- Section content ----------

class _ManualContent extends StatelessWidget {
  const _ManualContent({
    required this.nameValue,
    required this.nameErrorBuilder,
    required this.onNameChanged,
    required this.descriptionValue,
    required this.onDescriptionChanged,
  });

  final String? nameValue;
  final String? Function(BuildContext)? nameErrorBuilder;
  final ValueChanged<String> onNameChanged;

  final String descriptionValue;
  final ValueChanged<String> onDescriptionChanged;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.feature_theme_create_title, style: t.labelLarge),
        const SizedBox(height: 6),
        TextFormField(
          onChanged: onNameChanged,
          maxLength: 24,
          initialValue: nameValue,
          decoration: InputDecoration(
            errorText: nameErrorBuilder?.call(context),
            hintText: context.l10n.feature_theme_create_title,
            suffixIcon: Tooltip(
              message: context.l10n.feature_theme_create_title,
              child: Icon(Icons.info_outline, color: cs.secondary),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Description', style: t.labelLarge),
        const SizedBox(height: 6),
        TextFormField(
          minLines: 3,
          maxLines: 6,
          onChanged: onDescriptionChanged,
          initialValue: descriptionValue,
          decoration: const InputDecoration(
            hintText: 'Optional: describe the theme to store with it',
          ),
        ),
      ],
    );
  }
}

class _AiContent extends StatelessWidget {
  const _AiContent({
    required this.enabled,
    required this.prompt,
    required this.onPromptChanged,
  });

  final bool enabled;
  final String prompt;
  final ValueChanged<String> onPromptChanged;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return AnimatedCrossFade(
      crossFadeState: enabled
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 180),
      firstChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Prompt', style: t.labelLarge),
          const SizedBox(height: 6),
          TextFormField(
            minLines: 6,
            maxLines: 10,
            onChanged: onPromptChanged,
            initialValue: prompt,
            decoration: const InputDecoration(
              hintText: 'Describe brand, mood, palette constraints, usage…',
            ),
          ),
        ],
      ),
      secondChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          'Enable the switch to configure a prompt.',
          style: t.bodyMedium?.copyWith(color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}
