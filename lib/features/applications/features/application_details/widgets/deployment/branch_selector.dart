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
    this.isDropdownInitially = true,
    super.key,
  });

  final String title;
  final TextStyle? titleStyle;
  final String initialBranch;
  final List<String> branches;
  final bool isDropdownInitially;

  final ObjectCallback<String> onUpdate;

  @override
  State<BranchSelector> createState() => _BranchSelectorState();
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

    final borderSideColor = theme.colorScheme.primary.withValues(alpha: 0.1);
    final decoration = InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderSideColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderSideColor),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderSideColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: borderSideColor),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      isDense: true,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: widget.titleStyle ?? theme.textTheme.labelLarge,
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: _switchInputType,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  _isDropdown
                      ? context
                            .l10n
                            .feature_application_details_BranchSelector_input_custom_branch
                      : context
                            .l10n
                            .feature_application_details_BranchSelector_choose_branch,
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (_isDropdown)
            DropdownButtonFormField<String>(
              initialValue: _selectedBranch,
              decoration: decoration,
              items: widget.branches.map(_buildDropdownMenuItem).toList(),
              onChanged: _updateBranch,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
            )
          else
            TextFormField(
              initialValue: _selectedBranch,
              decoration: decoration,
              onChanged: _updateBranch,
            ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> _buildDropdownMenuItem(String branch) {
    return DropdownMenuItem<String>(value: branch, child: Text(branch));
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
