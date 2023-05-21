import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webtrit_configurator/share/exports/exports.dart';

import '../color/color_scheme_model.dart';
import '../image/image_scheme_model.dart';
import '../texts/texts_model.dart';

part 'application_model.freezed.dart';

@freezed
class ApplicationModel with _$ApplicationModel {
  const ApplicationModel._();

  const factory ApplicationModel({
    final String? id,
    final String? name,
    final String? platformIdentifier,
    final String? theme,
    @Default(0) final int version,
  }) = _ApplicationModel;
}
