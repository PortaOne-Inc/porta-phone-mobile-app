import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/widgets/widgets.dart';
import 'package:webtrit_configurator/features/common/common.dart';

import '../bloc/translations_cubit.dart';
import '../widgets/widgets.dart';

class TranslationsPage extends StatefulWidget {
  const TranslationsPage({super.key});

  @override
  State<TranslationsPage> createState() => _TranslationsPageState();
}

class _TranslationsPageState extends State<TranslationsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final commonBloc = context.read<CommonBloc>();
    final bloc = context.read<TranslationsCubit>();

    final listLinearBackground = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        theme.colorScheme.onSurface,
        Colors.transparent,
        Colors.transparent,
        theme.colorScheme.onSurface,
      ],
      stops: const [0.0, 0.05, 0.95, 1.0],
    );
    return BlocBuilder<TranslationsCubit, TranslationsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Translations',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
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
                            .toSet(),
                        localeFilter: state.filter.localeFilter,
                        onLocaleChanged: bloc.updateLocaleFilter,
                        onSearchChanged: bloc.updateSearchFilter,
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
                                final translation =
                                    state.filteredTranslations[index];
                                final override = state.findOverride(
                                  translation.locale,
                                  translation.key,
                                );

                                return TranslationItem(
                                  originalTranslation: translation,
                                  overrideTranslation: override,
                                  onChange: (value) =>
                                      bloc.setOverride(translation, value),
                                  onRestore: () =>
                                      bloc.deleteOverride(translation),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (state.isInitializingError)
                    ErrorMessage(
                      error: state.exception,
                      onPressed: bloc.fetchTranslation,
                    ),
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
