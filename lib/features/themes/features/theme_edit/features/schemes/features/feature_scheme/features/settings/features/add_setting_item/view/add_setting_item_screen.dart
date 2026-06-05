import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/extensions/extensions.dart';

import 'package:webtrit_phone/extensions/string.dart';
import 'package:webtrit_phone/models/models.dart';

import 'package:webtrit_configurator/features/features.dart';

class AddSettingItemScreen extends StatefulWidget {
  const AddSettingItemScreen({super.key});

  @override
  State<AddSettingItemScreen> createState() => _AddSettingItemScreenState();
}

class _AddSettingItemScreenState extends State<AddSettingItemScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _iconController;
  late final TextEditingController _iconColorController;

  bool _showEmbeddedError = false;

  ManageSettingItemCubit get _cubit => context.read<ManageSettingItemCubit>();

  @override
  void initState() {
    super.initState();
    final state = _cubit.state;

    _titleController = TextEditingController(text: state.titleL10n);
    _iconController = TextEditingController(text: state.settingItemIcon);
    _iconColorController = TextEditingController(text: state.settingItemColor);

    _titleController.addListener(
      () => _cubit.changeTitleL10n(_titleController.text),
    );
    _iconController.addListener(
      () => _cubit.changeSettingItemIcon(_iconController.text),
    );
    _iconColorController.addListener(
      () => _cubit.changeIconColor(_iconColorController.text),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _iconController.dispose();
    _iconColorController.dispose();
    super.dispose();
  }

  void _onSavePressed() {
    setState(() => _showEmbeddedError = false);

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final state = _cubit.state;

    if (state.type == SettingsFlavor.embedded &&
        state.selectedEmbeddedResource == null) {
      setState(() => _showEmbeddedError = true);
      _showErrorSnackBar('Required: Please select an embedded resource.');
      return;
    }

    _cubit.apply();
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _handleEmbeddedNavigation() async {
    if (_showEmbeddedError) setState(() => _showEmbeddedError = false);

    final selectedEmbedded = await context.pushNamed<EmbeddedResourceModel>(
      SchemeRoute.appFeatureSchemeCollectionEmbedded.name,
    );
    if (selectedEmbedded != null && mounted) {
      _cubit.assignEmbeddedPage(selectedEmbedded);
    }
  }

  void _handleBlocListener(BuildContext context, ManageSettingItemState state) {
    if (state.resultSettingItem != null) {
      context.pop(state.resultSettingItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageSettingItemCubit, ManageSettingItemState>(
      listener: _handleBlocListener,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('New Setting Item'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _onSavePressed,
            icon: const Icon(Icons.check_rounded),
            label: const Text('Save Item'),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
              children: [
                const _SectionLabel('General Information'),
                _GeneralSection(
                  type: state.type,
                  titleController: _titleController,
                  iconController: _iconController,
                  iconColorController: _iconColorController,
                  onTypeChanged: _cubit.changeType,
                ),
                const SizedBox(height: 24),
                const _SectionLabel('Behavior & Visibility'),
                _VisibilityCard(
                  isEnabled: state.enable,
                  onChanged: _cubit.changeEnable,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) => SizeTransition(
                    sizeFactor: animation,
                    alignment: AlignmentDirectional.topStart,
                    child: FadeTransition(opacity: animation, child: child),
                  ),
                  child: state.type == SettingsFlavor.embedded
                      ? Column(
                          key: const ValueKey('embedded_section'),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),
                            const _SectionLabel('Embedded Configuration'),
                            _EmbeddedSelectorCard(
                              resource: state.selectedEmbeddedResource,
                              onTap: _handleEmbeddedNavigation,
                              hasError: _showEmbeddedError,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _GeneralSection extends StatelessWidget {
  const _GeneralSection({
    required this.type,
    required this.titleController,
    required this.iconController,
    required this.iconColorController,
    required this.onTypeChanged,
  });

  final SettingsFlavor? type;
  final TextEditingController titleController;
  final TextEditingController iconController;
  final TextEditingController iconColorController;
  final ValueChanged<SettingsFlavor> onTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainer,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField<SettingsFlavor>(
                initialValue: type,
                decoration: const InputDecoration(
                  labelText: 'Settings Flavor',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.tune_rounded),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                ),
                items: SettingsFlavor.values.map((flavor) {
                  return DropdownMenuItem(
                    value: flavor,
                    child: Text(flavor.name),
                  );
                }).toList(),
                onChanged: (v) {
                  if (v != null) onTypeChanged(v);
                },
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Localization Key',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.language_rounded),
                hintText: 'e.g. settings_profile',
                helperText: 'Key used for translation',
              ),
              validator: (v) =>
                  (v?.trim().isEmpty ?? true) ? 'This field is required' : null,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _IconSelectionField(controller: iconController),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _ColorSelectionField(controller: iconColorController),
          ],
        ),
      ),
    );
  }
}

class _IconSelectionField extends StatelessWidget {
  const _IconSelectionField({required this.controller});

  final TextEditingController controller;

  IconData _getIcon(String text) {
    if (text.isEmpty) return Icons.image_not_supported_outlined;
    try {
      return text.toIconData();
    } catch (_) {
      return Icons.broken_image_rounded;
    }
  }

  Future<void> _handleIconPick(BuildContext context) async {
    final iconName = await context.showFontPicker();
    if (iconName != null && context.mounted) {
      controller.text = iconName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final iconData = _getIcon(value.text);

        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Icon Name',
            border: const OutlineInputBorder(),
            hintText: 'e.g. person_outline',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(iconData),
            ),
            suffixIcon: IconButton(
              onPressed: () => _handleIconPick(context),
              icon: const Icon(Icons.manage_search_rounded),
              tooltip: 'Select Icon',
            ),
          ),
          validator: (v) =>
              (v?.trim().isEmpty ?? true) ? 'Icon name is required' : null,
        );
      },
    );
  }
}

class _ColorSelectionField extends StatefulWidget {
  const _ColorSelectionField({required this.controller});

  final TextEditingController controller;

  @override
  State<_ColorSelectionField> createState() => _ColorSelectionFieldState();
}

class _ColorSelectionFieldState extends State<_ColorSelectionField> {
  Future<void> _handleColorPick(
    BuildContext context,
    Color? currentColor,
  ) async {
    final result = await context.showColorPicker(currentColor: currentColor);

    if (result != null && mounted) {
      widget.controller.text = result.toHex(includeAlpha: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.controller,
      builder: (context, value, _) {
        final color = value.text.tryParseColor(returnNullOnFailure: true);
        final isValid = value.text.isEmpty || color != null;

        return TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: 'Icon Color (Hex)',
            hintText: '#FF0000',
            helperText: 'Leave empty to use application default',
            border: const OutlineInputBorder(),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () => _handleColorPick(context, color),
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color ?? Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  child: color == null
                      ? const Icon(Icons.colorize, size: 18)
                      : null,
                ),
              ),
            ),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[#a-fA-F0-9]')),
            LengthLimitingTextInputFormatter(9),
          ],
          validator: (_) => !isValid ? 'Invalid Hex format' : null,
        );
      },
    );
  }
}

class _VisibilityCard extends StatelessWidget {
  const _VisibilityCard({required this.isEnabled, required this.onChanged});

  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: isEnabled
          ? colorScheme.primaryContainer
          : colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SwitchListTile(
        title: Text(
          'Enable Setting Item',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isEnabled
                ? colorScheme.onPrimaryContainer
                : colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          isEnabled ? 'Visible to users' : 'Hidden from users',
          style: TextStyle(
            color: isEnabled
                ? colorScheme.onPrimaryContainer.withValues(alpha: 0.8)
                : colorScheme.onSurfaceVariant,
          ),
        ),
        value: isEnabled,
        onChanged: onChanged,
        secondary: Icon(
          isEnabled ? Icons.visibility_rounded : Icons.visibility_off_rounded,
          color: isEnabled ? colorScheme.primary : colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _EmbeddedSelectorCard extends StatelessWidget {
  const _EmbeddedSelectorCard({
    required this.resource,
    required this.onTap,
    this.hasError = false,
  });

  final EmbeddedResourceModel? resource;
  final VoidCallback onTap;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasResource = resource != null;

    final borderColor = hasError
        ? colorScheme.error
        : (hasResource ? colorScheme.primary : colorScheme.outline);

    final borderWidth = (hasResource || hasError) ? 1.5 : 1.0;

    return Card(
      elevation: 0,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: borderColor, width: borderWidth),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: hasResource
                      ? colorScheme.primaryContainer
                      : colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  hasResource ? Icons.link_rounded : Icons.add_link_rounded,
                  color: hasResource
                      ? colorScheme.onPrimaryContainer
                      : colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hasResource ? (resource!.uri) : 'Select Resource',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hasResource
                          ? 'ID: ${resource!.id}'
                          : 'Tap to link external content',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontFamily: hasResource ? 'monospace' : null,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: colorScheme.outline),
            ],
          ),
        ),
      ),
    );
  }
}
