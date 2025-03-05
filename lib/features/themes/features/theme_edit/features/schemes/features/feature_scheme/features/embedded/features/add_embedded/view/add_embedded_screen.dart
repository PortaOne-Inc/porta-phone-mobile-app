import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/routes/scheme_route.dart';

import '../../../models/models.dart';
import '../../../extensions/extensions.dart';
import '../bloc/add_embedded_cubit.dart';

class AddEmbeddedDataScreen extends StatefulWidget {
  const AddEmbeddedDataScreen({
    super.key,
  });

  @override
  _AddEmbeddedDataScreenState createState() => _AddEmbeddedDataScreenState();
}

class _AddEmbeddedDataScreenState extends State<AddEmbeddedDataScreen> {
  final _toolbarTitleL10nTextEditingController = TextEditingController();
  final _urlResourceTextEditingController = TextEditingController();

  @override
  void initState() {
    _toolbarTitleL10nTextEditingController.addListener(() {
      context.read<AddEmbeddedCubit>().setToolbarTitle(_toolbarTitleL10nTextEditingController.text.trim());
    });

    _urlResourceTextEditingController.addListener(() {
      context.read<AddEmbeddedCubit>().setConfigurationUrl(_urlResourceTextEditingController.text.trim());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<AddEmbeddedCubit, AddEmbeddedState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Embedded Data',
              style: textTheme.titleMedium,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () => context.read<AddEmbeddedCubit>().saveEmbeddedData(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: TextField(
                          controller: TextEditingController(text: 'ID'),
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Name of resource',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.title),
                          ),
                        ),
                      ),
                      OutlineInput(
                        label: 'Name of resource',
                        icon: Icons.title,
                        controller: _toolbarTitleL10nTextEditingController,
                        margin: const EdgeInsets.only(bottom: 16),
                      ),
                      DropdownButtonExt<EmbeddedResourceType>(
                        label: 'Embedded Resource Type',
                        value: state.resourceType,
                        options: EmbeddedResourceType.values,
                        onChanged: (value) => context.read<AddEmbeddedCubit>().setConfigurationResourceType(value),
                        optionBuilder: (value) => value.name,
                      ),
                      DropdownButtonExt<EmbeddedResourceSource>(
                        label: 'HTML Source',
                        value: state.resourceSource,
                        options: EmbeddedResourceSource.values,
                        onChanged: (value) => context.read<AddEmbeddedCubit>().setConfigurationResourceSource(value),
                        optionBuilder: (value) => value.l10n(),
                      ),
                      Visibility(
                        visible: state.resourceSource.isUrl,
                        child: OutlineInput(
                          label: 'URL',
                          icon: Icons.link,
                          controller: _urlResourceTextEditingController,
                          margin: const EdgeInsets.only(bottom: 16),
                        ),
                      ),
                      Visibility(
                        visible: state.resourceSource.isHtml,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(state.asset == null ? 'Select HTML file' : 'Change HTML file'),
                          subtitle: Text(
                            state.asset == null
                                ? 'Select the HTML file to use as the embedded resource.'
                                : state.asset!.name,
                          ),
                          trailing: const Icon(Icons.navigate_next),
                          onTap: () async {
                            final result = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
                              SchemeRoute.assetsScheme.name,
                              extra: [ThemeAssetType.html],
                            );

                            if (result != null && context.mounted) {
                              context.read<AddEmbeddedCubit>().setConfigurationAsset(result);
                            }
                          },
                        ),
                      ),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Show Toolbar'),
                        value: state.toolbarConfig.showToolbar,
                        onChanged: (value) => context.read<AddEmbeddedCubit>().setToolbarVisibility(value),
                      ),
                    ],
                  ),
                ),
                AttributesWidget(
                  attributes: Map.from(state.attributes),
                  onAddAttribute: () {},
                  onUpdateAttribute: (String key, String value) {},
                  onRemoveAttribute: (String key) {},
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, AddEmbeddedState state) {
        if (state.embeddedResource != null) {
          GoRouter.of(context).pop(state.embeddedResource);
        }
      },
    );
  }
}
