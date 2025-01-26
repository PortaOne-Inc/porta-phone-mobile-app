import 'package:flutter/material.dart';

class AppConfigCallWidget extends StatefulWidget {
  const AppConfigCallWidget({
    required this.initialVideoEnabled,
    required this.initialBlindTransferEnabled,
    required this.initialAttendedTransferEnabled,
    required this.onVideoEnabledChanged,
    required this.onBlindTransferChanged,
    required this.onAttendedTransferChanged,
    super.key,
  });

  final bool initialVideoEnabled;
  final bool initialBlindTransferEnabled;
  final bool initialAttendedTransferEnabled;
  final ValueChanged<bool> onVideoEnabledChanged;
  final ValueChanged<bool> onBlindTransferChanged;
  final ValueChanged<bool> onAttendedTransferChanged;

  @override
  _AppConfigCallWidgetState createState() => _AppConfigCallWidgetState();
}

class _AppConfigCallWidgetState extends State<AppConfigCallWidget> {
  late bool videoEnabled;
  late bool blindTransferEnabled;
  late bool attendedTransferEnabled;

  @override
  void initState() {
    super.initState();
    videoEnabled = widget.initialVideoEnabled;
    blindTransferEnabled = widget.initialBlindTransferEnabled;
    attendedTransferEnabled = widget.initialAttendedTransferEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: const Text('Enable Video'),
            value: videoEnabled,
            onChanged: (value) {
              setState(() {
                videoEnabled = value;
              });
              widget.onVideoEnabledChanged(value);
            },
          ),
          SwitchListTile(
            title: const Text('Enable Blind Transfer'),
            value: blindTransferEnabled,
            onChanged: (value) {
              setState(() {
                blindTransferEnabled = value;
              });
              widget.onBlindTransferChanged(value);
            },
          ),
          SwitchListTile(
            title: const Text('Enable Attended Transfer'),
            value: attendedTransferEnabled,
            onChanged: (value) {
              setState(() {
                attendedTransferEnabled = value;
              });
              widget.onAttendedTransferChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
