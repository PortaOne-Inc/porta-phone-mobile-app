import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';

import '../model/event_log_model.dart';

class LogEvent extends StatefulWidget {
  const LogEvent({
    super.key,
    required this.onClick,
    required this.isSelected,
    required this.messages,
  });

  final Function(bool isSelected) onClick;
  final bool isSelected;
  final List<EventLogModel> messages;

  @override
  State<LogEvent> createState() => _LogEventState();
}

class _LogEventState extends State<LogEvent> {
  int lastMessageCount = 0;

  @override
  void setState(VoidCallback fn) {
    lastMessageCount = widget.messages.length;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick.call(!widget.isSelected);
        lastMessageCount = widget.messages.length;
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: lastMessageCount == widget.messages.length || widget.isSelected ? Colors.grey : Colors.red,
            ),
            duration: Duration.zero,
            child: SizedBox(
                child: Center(
              child: Text(
                widget.messages.length.toString(),
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            )),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4, right: 8),
            child: Text(
              context.l10n.feature_theme_edit_LogEvent_title,
            ),
          ),
        ],
      ),
    );
  }
}
