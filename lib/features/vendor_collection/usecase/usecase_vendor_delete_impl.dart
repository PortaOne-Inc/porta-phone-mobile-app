import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_vendor_delete.dart';

@Injectable(as: UsecaseVendorDeleteTemplate)
class UsecaseVendorDeleteTemplateImpl implements UsecaseVendorDeleteTemplate {
  UsecaseVendorDeleteTemplateImpl(this.applicationRepository, this.authRepository, this.applicationMapper);

  final VendorRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<VendorDTO, ApplicationModel> applicationMapper;

  @override
  FutureOr<void> execute({required ApplicationModel model}) async {
    final uid = await authRepository.getUserUID();
    applicationRepository.deleteApplication(uid!, applicationMapper.mapToDto(model));
  }
}
