import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/localization/localization.dart';

import '../bloc/translations_cubit.dart';
import '../widgets/widgets.dart';

class TranslationsPage extends StatefulWidget {
  const TranslationsPage({super.key});

  @override
  State<TranslationsPage> createState() => _TranslationsPageState();
}

class _TranslationsPageState extends State<TranslationsPage> {
  void _showLocaleSettingsDialog(BuildContext context, TranslationsCubit bloc, TranslationsState state) {
    final availableLocales = state.translations.original.map((e) => e.locale).toSet().toList()..sort();

    showDialog<void>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: bloc,
        child: BlocBuilder<TranslationsCubit, TranslationsState>(
          builder: (_, dialogState) => AlertDialog(
            title: Text(context.l10n.feature_translation_LocaleSettings_title),
            content: SizedBox(
              width: 280,
              child: availableLocales.isEmpty
                  ? Text(context.l10n.feature_translation_LocaleSettings_empty)
                  : ListView(
                      shrinkWrap: true,
                      children: availableLocales
                          .map(
                            (locale) => CheckboxListTile(
                              value: dialogState.filter.activeLocales.contains(locale),
                              title: Text(locale),
                              onChanged: (_) {
                                final current = dialogState.filter.activeLocales;
                                final updated = current.contains(locale)
                                    ? current.difference({locale})
                                    : current.union({locale});
                                bloc.updateActiveLocales(updated);
                              },
                            ),
                          )
                          .toList(),
                    ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(context.l10n.feature_translation_LocaleSettings_close),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final commonBloc = context.read<CommonBloc>();
    final bloc = context.read<TranslationsCubit>();

    final listLinearBackground = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [theme.colorScheme.onSurface, Colors.transparent, Colors.transparent, theme.colorScheme.onSurface],
      stops: const [0.0, 0.05, 0.95, 1.0],
    );
    return BlocBuilder<TranslationsCubit, TranslationsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Translations', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                tooltip: context.l10n.feature_translation_LocaleSettings_tooltip,
                icon: const Icon(Icons.tune),
                onPressed: state.isCommon ? () => _showLocaleSettingsDialog(context, bloc, state) : null,
              ),
              ThemeModeSwitcher(
                themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
                onThemeChange: commonBloc.setThemeMode,
              ),
            ],
          ),
          body: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      ControlBar(
                        enabled: state.isCommon,
                        locales: state.translations.original
                            .map((e) => e.locale)
                            .toSet()
                            .intersection(state.filter.activeLocales),
                        localeFilter: state.filter.localeFilter,
                        searchMode: state.filter.searchMode,
                        onLocaleChanged: bloc.updateLocaleFilter,
                        onSearchChanged: bloc.updateSearchFilter,
                        onSearchModeChanged: bloc.updateSearchMode,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Card(
                          elevation: 1,
                          child: ShaderMask(
                            shaderCallback: listLinearBackground.createShader,
                            blendMode: BlendMode.dstOut,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              itemCount: state.filteredTranslations.length,
                              itemBuilder: (context, index) {
                                final translation = state.filteredTranslations[index];
                                final override = state.findOverride(translation.locale, translation.key);

                                return TranslationItem(
                                  originalTranslation: translation,
                                  overrideTranslation: override,
                                  onChange: (value) => bloc.setOverride(translation, value),
                                  onRestore: () => bloc.deleteOverride(translation),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (state.isInitializingError) ErrorMessage(error: state.exception, onPressed: bloc.fetchTranslation),
                  if (state.isInitializing) const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
