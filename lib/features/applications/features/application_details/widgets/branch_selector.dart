import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

class BranchSelector extends StatefulWidget {
  const BranchSelector({
    required this.initialBranch,
    required this.branches,
    required this.title,
    required this.onUpdate,
    this.titleStyle,
    super.key,
    this.isDropdownInitially = true,
  });

  final String title;
  final TextStyle? titleStyle;
  final String initialBranch;
  final List<String> branches;
  final bool isDropdownInitially;

  final ObjectCallback<String> onUpdate;

  @override
  _BranchSelectorState createState() => _BranchSelectorState();
}

class _BranchSelectorState extends State<BranchSelector> {
  late String _selectedBranch;
  late bool _isDropdown;

  @override
  void initState() {
    super.initState();
    _selectedBranch = widget.initialBranch;
    _isDropdown = widget.isDropdownInitially;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderSideColor = theme.colorScheme.primary.withOpacity(.10);
    final decoration = InputDecoration(
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderSideColor)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderSideColor)),
      disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderSideColor)),
      border: UnderlineInputBorder(borderSide: BorderSide(color: borderSideColor)),
    );

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: widget.titleStyle ?? Theme.of(context).textTheme.labelLarge,
          ),
          InkWell(
            onTap: _switchInputType,
            child: Text(
              _isDropdown
                  ? context.l10n.feature_application_details_BranchSelector_input_custom_branch
                  : context.l10n.feature_application_details_BranchSelector_choose_branch,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
      subtitle: _isDropdown
          ? DropdownButtonFormField<String>(
              value: _selectedBranch,
              decoration: decoration,
              items: widget.branches.map((branch) {
                return DropdownMenuItem(value: branch, child: Text(branch));
              }).toList(),
              onChanged: _updateBranch,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              dropdownColor: Colors.white,
            )
          : TextFormField(
              initialValue: _selectedBranch,
              decoration: decoration,
              onChanged: _updateBranch,
            ),
    );
  }

  void _updateBranch(String? newBranch) {
    if (newBranch != null) {
      _selectedBranch = newBranch;
      widget.onUpdate(newBranch);

      setState(() {});
    }
  }

  void _switchInputType() {
    _isDropdown = !_isDropdown;

    setState(() {});
  }
}
