import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

/// Editor for the order of the native sign-in tabs (login switch screen).
///
/// The app shows only the sign-in types advertised by the backend, but renders
/// them in this configured order and selects the first one by default. The
/// editor always exposes every known type so the order is fully controllable;
/// types the app does not support are simply skipped at runtime.
class LoginSchemeSigninOrder extends StatefulWidget {
  const LoginSchemeSigninOrder({required this.signinOrder, required this.callback, super.key});

  final List<String> signinOrder;
  final ObjectCallback<List<String>> callback;

  @override
  State<LoginSchemeSigninOrder> createState() => _LoginSchemeSigninOrderState();
}

class _LoginSchemeSigninOrderState extends State<LoginSchemeSigninOrder> {
  /// Known sign-in type names, matching the phone `LoginType` enum.
  static const _knownTypes = ['passwordSignin', 'otpSignin', 'signup'];

  static const _labels = {'passwordSignin': 'Password', 'otpSignin': 'OTP', 'signup': 'Sign up'};

  static const _descriptions = {
    'passwordSignin': 'Username and password sign-in',
    'otpSignin': 'One-time code sign-in',
    'signup': 'Demo / self sign-up',
  };

  late List<String> _order;

  @override
  void initState() {
    super.initState();
    _order = _normalize(widget.signinOrder);
  }

  @override
  void didUpdateWidget(LoginSchemeSigninOrder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.signinOrder != widget.signinOrder) {
      _order = _normalize(widget.signinOrder);
    }
  }

  /// Keeps the stored order (known types only, de-duplicated), then appends any
  /// known type that is missing, so the list always contains every known type
  /// exactly once and in a stable order.
  List<String> _normalize(List<String> source) {
    final result = <String>[];
    for (final type in source) {
      if (_knownTypes.contains(type) && !result.contains(type)) result.add(type);
    }
    for (final type in _knownTypes) {
      if (!result.contains(type)) result.add(type);
    }
    return result;
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = _order.removeAt(oldIndex);
      _order.insert(newIndex, item);
    });
    widget.callback(List<String>.unmodifiable(_order));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Sign-in tabs order', style: theme.textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(
          'Drag to set the order of the sign-in tabs. The first one is selected '
          'by default. Only the methods enabled on the server are shown to users.',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        ReorderableListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          buildDefaultDragHandles: false,
          itemCount: _order.length,
          onReorderItem: _onReorder,
          itemBuilder: (context, index) {
            final type = _order[index];
            return Card(
              key: ValueKey('signin_$type'),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(_labels[type] ?? type),
                subtitle: Text(_descriptions[type] ?? type),
                trailing: ReorderableDragStartListener(
                  index: index,
                  child: const Padding(padding: EdgeInsets.all(8), child: Icon(Icons.drag_handle)),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
