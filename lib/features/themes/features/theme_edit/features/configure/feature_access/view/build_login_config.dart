import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

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
  EnvLoginType _loginType = EnvLoginType.defaultLogin;
  CustomLoginOption _customLoginOption = CustomLoginOption.url;
  String _customUrl = '';
  String _htmlFilePath = '';

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
                DropdownRow<EnvLoginType>(
                  label: 'Login Type:',
                  value: _loginType,
                  items: EnvLoginType.values,
                  itemLabelBuilder: (type) => type == EnvLoginType.defaultLogin ? 'Default Login' : 'Custom Login',
                  onChanged: _onLoginTypeChanged,
                ),
                if (_loginType == EnvLoginType.defaultLogin)
                  DefaultLoginOption(
                    sourceAppConfigLogin: widget.sourceAppConfigLogin,
                    onWelcomeTextChanged: (it) => widget.callback(widget.sourceAppConfigLogin.copyWith(label: it)),
                  ),
                if (_loginType == EnvLoginType.customLogin)
                  CustomLoginOptions(
                    customLoginOption: _customLoginOption,
                    customUrl: _customUrl,
                    htmlFilePath: _htmlFilePath,
                    onCustomLoginOptionChanged: _onCustomLoginOptionChanged,
                    onCustomUrlChanged: _onCustomUrlChanged,
                    onSelectHtmlFile: _onSelectHtmlFile,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onLoginTypeChanged(EnvLoginType? value) {
    if (value != null) {
      setState(() {
        _loginType = value;
      });
    }
  }

  void _onCustomLoginOptionChanged(CustomLoginOption value) {
    setState(() {
      _customLoginOption = value;
    });
  }

  void _onCustomUrlChanged(String value) {
    setState(() {
      _customUrl = value;
    });
  }

  Future<void> _onSelectHtmlFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['html'],
    );
    if (result != null && result.files.single.path != null) {
      //     onHtmlFilePathChanged(result.files.single.path!);
    }
  }
}
