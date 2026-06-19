// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

class PlayStoreConfigForm extends StatefulWidget {
  const PlayStoreConfigForm({
    required this.track,
    required this.availableTrack,
    required this.status,
    required this.availableStatuses,
    required this.updatePriority,
    required this.userFractionAvailability,
    required this.onChangedTrack,
    required this.onChangedStatus,
    required this.onChangedUpdatePriority,
    required this.onChangedUserFraction,
    this.userFraction,
    this.formKey,
    super.key,
  });

  final GlobalKey<FormState>? formKey;
  final String track;
  final List<String> availableTrack;
  final List<String> availableStatuses;
  final String status;
  final int updatePriority;
  final double? userFraction;
  final bool userFractionAvailability;

  final ObjectCallback<String> onChangedTrack;
  final ObjectCallback<String> onChangedStatus;
  final ObjectCallback<int> onChangedUpdatePriority;
  final ObjectCallback<double> onChangedUserFraction;

  @override
  _PlayStoreConfigFormState createState() => _PlayStoreConfigFormState();
}

class _PlayStoreConfigFormState extends State<PlayStoreConfigForm> {
  late String _track;
  late String _status;
  late int _updatePriority;
  late double? _userFraction;

  late GlobalKey<FormState>? _formKey;

  @override
  void initState() {
    super.initState();
    _track = widget.track;
    _status = widget.status;
    _updatePriority = widget.updatePriority;
    _userFraction = widget.userFraction;

    _formKey = widget.formKey ?? GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderSideColor = theme.colorScheme.primary.withValues(alpha: .10);
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
    );

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: DropdownButtonFormField<String>(
              decoration: decoration.copyWith(
                label: Text(
                  context
                      .l10n
                      .feature_application_details_PlayStoreConfigForm_track_label,
                ),
              ),
              initialValue: widget.availableTrack.contains(_track)
                  ? _track
                  : null,
              onChanged: (newValue) {
                if (_formKey!.currentState!.validate()) {
                  _track = newValue!;
                  widget.onChangedTrack(newValue);
                  setState(() {});
                }
              },
              items: widget.availableTrack.map<DropdownMenuItem<String>>((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: DropdownButtonFormField<String>(
              decoration: decoration.copyWith(
                label: Text(
                  context
                      .l10n
                      .feature_application_details_PlayStoreConfigForm_status_label,
                ),
              ),
              initialValue: widget.availableStatuses.contains(_status)
                  ? _status
                  : null,
              onChanged: (newValue) {
                if (_formKey!.currentState!.validate()) {
                  _status = newValue!;
                  widget.onChangedStatus(newValue);
                  setState(() {});
                }
              },
              items: widget.availableStatuses.map<DropdownMenuItem<String>>((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormField(
              decoration: decoration.copyWith(
                label: Text(
                  context
                      .l10n
                      .feature_application_details_PlayStoreConfigForm_update_priority_label,
                ),
              ),
              keyboardType: TextInputType.number,
              initialValue: _updatePriority.toString(),
              validator: (value) {
                final priority = int.tryParse(value!);
                if (priority == null || priority < 0 || priority > 5) {
                  return context
                      .l10n
                      .feature_application_details_PlayStoreConfigForm_update_priority_validator;
                }
                return null;
              },
              onChanged: (value) {
                if (_formKey!.currentState!.validate()) {
                  final priority = int.tryParse(value);
                  if (priority != null) {
                    _updatePriority = priority;
                    widget.onChangedUpdatePriority(priority);
                    setState(() {});
                  }
                }
              },
            ),
          ),
          if (widget.userFractionAvailability)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                enabled: widget.userFractionAvailability,
                decoration: decoration.copyWith(
                  label: Text(
                    context
                        .l10n
                        .feature_application_details_PlayStoreConfigForm_user_fraction_label,
                  ),
                ),
                keyboardType: TextInputType.number,
                initialValue: _userFraction.toString(),
                validator: (value) {
                  final fraction = double.tryParse(value!);
                  if (fraction == null || fraction < 0.0 || fraction > 1.0) {
                    return context
                        .l10n
                        .feature_application_details_PlayStoreConfigForm_user_fraction_validator;
                  }
                  return null;
                },
                onChanged: (value) {
                  if (_formKey!.currentState!.validate()) {
                    final fraction = double.tryParse(value);
                    if (fraction != null) {
                      _userFraction = fraction;
                      widget.onChangedUserFraction(fraction);
                      setState(() {});
                    }
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
