import 'dart:async';
import 'dart:typed_data';

import 'package:webtrit_configurator/core/core.dart';

abstract class UsecaseApplicationEdit {
  FutureOr<ApplicationModel> execute({
    required final String id,
    required final String name,
    required final String platformIdentifier,
    final String? theme,
    Uint8List? newAndroidGoogleServices,
    Uint8List? newIosGoogleServices,
    String? applicationAndroidGoogleServicesUrl,
    String? applicationIosGoogleServicesUrl,
    final int version = 0,
  });
}
