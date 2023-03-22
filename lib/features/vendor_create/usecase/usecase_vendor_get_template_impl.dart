import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/utility/utility.dart';
import 'package:webtrit_configurator/share/share.dart';

import 'usecase_vendor_get_template.dart';

@Injectable(as: UsecaseVendorGetTemplate)
class UsecaseVendorGetTemplateImpl extends UsecaseVendorGetTemplate {
  UsecaseVendorGetTemplateImpl();

  @override
  FutureOr<ApplicationModel> execute({void argument}) async {
    final applicationUUID = UtilityUUID().generate();
    return ApplicationModel(uuid: applicationUUID);
  }
}
