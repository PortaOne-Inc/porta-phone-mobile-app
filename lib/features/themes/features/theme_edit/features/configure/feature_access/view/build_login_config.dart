import 'package:domain/domain.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class BuildLoginConfig extends StatefulWidget {
  const BuildLoginConfig({
    required this.callback,
    required this.sourceAppConfigLogin,
    required this.assets,
    super.key,
  });

  final AppConfigLogin sourceAppConfigLogin;
  final List<ThemeAssetModel> assets;
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
                    url: _customUrl,
                    onCustomLoginOptionChanged: _onCustomLoginOptionChanged,
                    onCustomUrlChanged: _onCustomUrlChanged,
                    onHtmlAssetChanged: _onSelectHtmlFile,
                    assets: widget.assets,
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

  Future<void> _onSelectHtmlFile(ThemeAssetModel model) async {
    const modeSelection = AppConfigModeSelectAction(
      enabled: true,
      type: 'embedded',
      titleL10n: '',
      embeddedId: 0,
    );
    final embedded = AppConfigLoginEmbedded(
      id: 0,
      titleL10n: '',
      resource: "${model.id}.html",
    );

    widget.callback(widget.sourceAppConfigLogin.copyWith(modeSelectActions: [modeSelection], embedded: [embedded]));
  }
}
