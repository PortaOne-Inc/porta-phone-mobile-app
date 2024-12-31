import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webtrit_configurator/app/application.dart';

import 'package:webtrit_configurator/features/common/common.dart';
import 'package:webtrit_configurator/features/themes/features/theme_create/extension/extension.dart';
import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../bloc/theme_create_cubit.dart';
import '../widgets/widgets.dart';

class ThemeCreatePage extends StatefulWidget {
  const ThemeCreatePage({
    super.key,
  });

  @override
  State<ThemeCreatePage> createState() => _ThemeCreatePageState();
}

class _ThemeCreatePageState extends State<ThemeCreatePage> with MixinMessages, MixinMessages {
  late final ThemeCreateCubit _bloc = BlocProvider.of<ThemeCreateCubit>(context);

  bool _colorGeneratorEnabled = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

    return BlocConsumer<ThemeCreateCubit, ThemeCreateState>(
      listener: (BuildContext context, ThemeCreateState state) => _listenAppCreateState(state),
      builder: (ctx, state) => Scaffold(
        appBar: BaseToolBar(
          isVisibleProgress: state.status == ThemeCreateStateStatus.progress,
          child: ThemeCreateToolbar(
            themeMode: BlocProvider.of<CommonBloc>(context).state.themeMode,
            onThemeChange: (mode) => _onThemeModeChanged(context, mode),
            onSwitchedLanguage: () => _languageChanged(context),
          ),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800, minWidth: 200),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _colorGeneratorEnabled
                  ? ChooseSeedColor(
                      key: const ValueKey('chooseSeedColor'),
                      onApply: (Color color) {
                        _colorGeneratorEnabled = false;
                        _bloc.updateSeedColor(color);
                      },
                      onCancel: () {
                        _colorGeneratorEnabled = false;
                      },
                    )
                  : Card(
                      key: const ValueKey('createThemeCard'),
                      elevation: 2,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.l10n.feature_theme_create_title,
                                style: textScheme.labelLarge,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                onChanged: _bloc.updateNameChange,
                                maxLength: 24,
                                initialValue: state.nameInput?.value,
                                decoration: InputDecoration(
                                    errorText: state.nameInput?.errorL10n(context),
                                    hintText: context.l10n.feature_theme_create_title,
                                    // hintStyle: textScheme.bodyMedium,
                                    suffixIcon: Tooltip(
                                      message: context.l10n.feature_theme_create_title,
                                      child: Icon(
                                        Icons.info_outlined,
                                        color: colorScheme.secondary,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Text(
                                  'Color scheme',
                                  style: textScheme.labelLarge,
                                ),
                                Tooltip(
                                  message: 'Creating a color scheme based on seed color',
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Icon(
                                      Icons.info_outlined,
                                      color: colorScheme.secondary,
                                    ),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                height: 8,
                              ),
                              if (state.seedColor == null)
                                Container(
                                  decoration: BoxDecoration(
                                      color: colorScheme.surfaceContainer,
                                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                                  width: double.infinity,
                                  height: 56,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 8),
                                          child: RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Will be used default WebTrit color scheme',
                                                  style: textScheme.labelLarge
                                                      ?.copyWith(color: colorScheme.onSurfaceVariant.withOpacity(0.75)),
                                                ),
                                                TextSpan(
                                                  text: ' or ',
                                                  style: textScheme.labelLarge
                                                      ?.copyWith(color: colorScheme.onSurfaceVariant),
                                                ),
                                                TextSpan(
                                                    text: 'Generate color scheme by Material 3',
                                                    style: textScheme.labelLarge?.copyWith(
                                                      color: colorScheme.primary,
                                                      fontWeight: FontWeight.w500,
                                                      decoration: TextDecoration.underline,
                                                    ),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        setState(() {
                                                          _colorGeneratorEnabled = true;
                                                        });
                                                      }),
                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              if (state.seedColor != null)
                                SizedBox(
                                  height: 56,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ColorField(
                                            title: 'Seed color',
                                            color: state.seedColor,
                                            constraints: const BoxConstraints(maxWidth: 200, maxHeight: 100),
                                            onTap: (color) {
                                              _colorGeneratorEnabled = true;
                                              setState(() {});
                                            }),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        height: double.infinity,
                                        width: 56,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.surfaceContainer,
                                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                                        ),
                                        child: GestureDetector(
                                          child: Icon(
                                            Icons.remove_circle_outlined,
                                            color: colorScheme.error,
                                          ),
                                          onTap: () {
                                            _bloc.deleteSeedColor();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              const SizedBox(
                                height: 40,
                              ),
                              Button(
                                title: context.l10n.feature_theme_create,
                                onPressed: () => _bloc.tryCreateTheme(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  void _listenAppCreateState(ThemeCreateState state) {
    if (state.status == ThemeCreateStateStatus.error) {
      showFailureMessage(context, state.error.toString());
    }
    if (state.status == ThemeCreateStateStatus.success) {
      GoRouter.of(context).goNamed(
        AppRoutInfo.applicationDetails.name,
        pathParameters: <String, String>{
          AppRoutInfo.keyApplicationId: _bloc.applicationId,
        },
      );
    }
  }

  void _languageChanged(BuildContext context) {
    showTopSnakeMessageSuccess(context, context.l10n.common_not_implemented);
  }

  void _onThemeModeChanged(BuildContext context, ThemeMode themeMode) {
    BlocProvider.of<CommonBloc>(context).setThemeMode(themeMode);
  }
}
