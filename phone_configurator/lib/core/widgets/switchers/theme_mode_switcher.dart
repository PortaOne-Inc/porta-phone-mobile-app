import 'package:flutter/material.dart';

class ThemeModeSwitcher extends StatefulWidget {
  const ThemeModeSwitcher({
    required this.themeMode,
    required this.onThemeChange,
    super.key,
  });

  final ThemeMode themeMode;
  final void Function(ThemeMode) onThemeChange;

  @override
  State<ThemeModeSwitcher> createState() => _ThemeModeSwitcherState();
}

class _ThemeModeSwitcherState extends State<ThemeModeSwitcher> {
  late int _themeModePosition = widget.themeMode.index + 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: _onThemeChanged,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Icon(_getIconForThemeMode(_currentTheme())),
      ),
    );
  }

  ThemeMode _currentTheme() {
    return ThemeMode.values[_themeModePosition % 3];
  }

  IconData _getIconForThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return Icons.nightlight_round;
      case ThemeMode.light:
        return Icons.wb_sunny_rounded;
      case ThemeMode.system:
        return Icons.auto_awesome;
    }
  }

  void _onThemeChanged() {
    widget.onThemeChange(_currentTheme());
    _themeModePosition++;
    setState(() {});
  }
}
