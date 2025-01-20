import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../models/models.dart';

class BuildLoginConfig extends StatefulWidget {
  const BuildLoginConfig({
    required this.callback,
    required this.sourceAppConfigLogin,
    super.key,
  });

  final AppConfigLogin sourceAppConfigLogin;
  final ObjectCallback<AppConfigLogin> callback;

  @override
  State<BuildLoginConfig> createState() => _BuildLoginConfigState();
}

class _BuildLoginConfigState extends State<BuildLoginConfig> {
  EnvLoginType loginType = EnvLoginType.defaultLogin;
  CustomLoginOption customLoginOption = CustomLoginOption.url;
  String welcomeText = '';
  String customUrl = '';
  String htmlFilePath = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Select Login Type',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDropdownRow<EnvLoginType>(
                  label: 'Login Type:',
                  value: loginType,
                  items: EnvLoginType.values,
                  itemLabelBuilder: (type) => type == EnvLoginType.defaultLogin ? 'Default Login' : 'Custom Login',
                  onChanged: (value) {
                    setState(() {
                      loginType = value;
                    });
                  },
                ),
                if (loginType == EnvLoginType.defaultLogin) _buildDefaultLoginOptions(),
                if (loginType == EnvLoginType.customLogin) _buildCustomLoginOptions(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownRow<T>({
    required String label,
    required T value,
    required List<T> items,
    required String Function(T) itemLabelBuilder,
    required ValueChanged<T> onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        FocusScope(
          canRequestFocus: false,
          child: DropdownButton<T>(
            value: value,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            items: items
                .map(
                  (item) => DropdownMenuItem<T>(
                    value: item,
                    child: Text(itemLabelBuilder(item)),
                  ),
                )
                .toList(),
            focusColor: Colors.transparent,
            underline: Container(),
          ),
        ),
      ],
    );
  }

  /// Builds UI for default login options.
  Widget _buildDefaultLoginOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildLabeledInputField(
          label: 'Welcome Text:',
          value: widget.sourceAppConfigLogin.label ?? '',
          onChanged: (value) {
            setState(() {
              widget.callback(widget.sourceAppConfigLogin.copyWith(label: value));
            });
          },
        ),
      ],
    );
  }

  /// Builds UI for custom login options, including additional configuration fields.
  Widget _buildCustomLoginOptions() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 2,
          color: colorScheme.surfaceContainerLow,
        ),
        _buildDropdownRow<CustomLoginOption>(
          label: 'Custom Option:',
          value: customLoginOption,
          items: CustomLoginOption.values,
          itemLabelBuilder: (option) => option == CustomLoginOption.url ? 'Provide URL' : 'Provide HTML File',
          onChanged: (value) {
            setState(() {
              customLoginOption = value;
            });
          },
        ),
        const SizedBox(height: 8),
        if (customLoginOption == CustomLoginOption.url)
          _buildLabeledInputField(
            label: 'Custom Login URL:',
            value: customUrl,
            onChanged: (value) {
              setState(() {
                customUrl = value;
              });
            },
          ),
        if (customLoginOption == CustomLoginOption.html) _buildHtmlFilePicker(),
      ],
    );
  }

  /// Builds the file picker button for HTML file selection.
  Widget _buildHtmlFilePicker() {
    return Row(
      children: [
        const Expanded(
          child: Text('HTML File Path:', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        OutlinedButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['html'],
            );
            if (result != null && result.files.single.path != null) {
              setState(() {
                htmlFilePath = result.files.single.path!;
              });
            }
          },
          child: Text(
            htmlFilePath.isNotEmpty ? htmlFilePath : 'Select HTML File',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: htmlFilePath.isNotEmpty ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds an input field with a label.
  Widget _buildLabeledInputField({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            initialValue: value,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              border: OutlineInputBorder(),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
