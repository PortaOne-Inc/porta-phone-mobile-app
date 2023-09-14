import 'dart:async';
import 'dart:typed_data';

import 'package:webtrit_configurator/core/core.dart';

abstract class ApplicationCreate {
  FutureOr<ApplicationModel> execute({
    required final String name,
    required final String platformIdentifier,
    final String? coreUrl,
    final String? theme,
    final Uint8List? androidGoogleServices,
    final Uint8List? iosGoogleServices,
    final int version = 0,
  });
}
