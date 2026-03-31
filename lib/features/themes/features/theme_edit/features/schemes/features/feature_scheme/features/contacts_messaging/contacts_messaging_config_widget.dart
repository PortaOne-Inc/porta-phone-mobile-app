import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class ContactsMessagingConfigWidget extends StatelessWidget {
  const ContactsMessagingConfigWidget({
    required this.contacts,
    required this.messaging,
    required this.onContactsChanged,
    required this.onMessagingChanged,
    super.key,
  });

  final AppConfigContacts contacts;
  final AppConfigMessaging messaging;
  final ValueChanged<AppConfigContacts> onContactsChanged;
  final ValueChanged<AppConfigMessaging> onMessagingChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BorderContainer(
          title: 'Contacts',
          descriptionWidget: DescriptionRow.info('Configure actions available in contact detail screens.'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ActionListField(
                label: 'App Bar Actions',
                helperText: 'Action IDs shown in the contact details app bar.',
                values: contacts.details.actions.appBar,
                onChanged: (list) => onContactsChanged(
                  contacts.copyWith(
                    details: contacts.details.copyWith(actions: contacts.details.actions.copyWith(appBar: list)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _ActionListField(
                label: 'Phone Tile Actions',
                helperText: 'Action IDs shown on phone number tiles.',
                values: contacts.details.actions.phoneTile,
                onChanged: (list) => onContactsChanged(
                  contacts.copyWith(
                    details: contacts.details.copyWith(actions: contacts.details.actions.copyWith(phoneTile: list)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _ActionListField(
                label: 'Email Tile Actions',
                helperText: 'Action IDs shown on email tiles.',
                values: contacts.details.actions.emailTile,
                onChanged: (list) => onContactsChanged(
                  contacts.copyWith(
                    details: contacts.details.copyWith(actions: contacts.details.actions.copyWith(emailTile: list)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Messaging',
          descriptionWidget: DescriptionRow.info('Configure chat and messaging feature visibility.'),
          child: Column(
            children: [
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Show Group Chat Button'),
                subtitle: const Text('Displays the button to create a new group chat.'),
                value: messaging.chats.groupChatButtonEnabled,
                onChanged: (v) =>
                    onMessagingChanged(messaging.copyWith(chats: messaging.chats.copyWith(groupChatButtonEnabled: v))),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Show Video Button in Chat Contact Info'),
                subtitle: const Text('Displays the video call button in chat contact info screen.'),
                value: messaging.chats.contactInfo.showVideoButtonAction,
                onChanged: (v) => onMessagingChanged(
                  messaging.copyWith(
                    chats: messaging.chats.copyWith(
                      contactInfo: messaging.chats.contactInfo.copyWith(showVideoButtonAction: v),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionListField extends StatefulWidget {
  const _ActionListField({
    required this.label,
    required this.helperText,
    required this.values,
    required this.onChanged,
  });

  final String label;
  final String helperText;
  final List<String>? values;
  final ValueChanged<List<String>?> onChanged;

  @override
  State<_ActionListField> createState() => _ActionListFieldState();
}

class _ActionListFieldState extends State<_ActionListField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.values?.join(', ') ?? '');
  }

  @override
  void didUpdateWidget(covariant _ActionListField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newText = widget.values?.join(', ') ?? '';
    if (_controller.text != newText) {
      _controller.text = newText;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: widget.label,
        helperText: widget.helperText,
        hintText: 'e.g. audio_call, video_call',
        border: const OutlineInputBorder(),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, size: 18),
                onPressed: () {
                  _controller.clear();
                  widget.onChanged(null);
                },
              )
            : null,
      ),
      onChanged: (v) {
        if (v.trim().isEmpty) {
          widget.onChanged(null);
        } else {
          final list = v.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
          widget.onChanged(list.isEmpty ? null : list);
        }
      },
    );
  }
}
