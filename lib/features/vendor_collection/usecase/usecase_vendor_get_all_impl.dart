import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

import 'usecase_vendor_get_all.dart';

@Injectable(as: UsecaseVendorGetAll)
class UsecaseVendorGetAllImpl implements UsecaseVendorGetAll {
  UsecaseVendorGetAllImpl(this.applicationRepository, this.authRepository, this.applicationMapper);

  final VendorRepository applicationRepository;
  final AuthRepository authRepository;
  final Mapper<VendorDTO, ApplicationModel> applicationMapper;

  @override
  FutureOr<List<ApplicationModel>> execute({void argument}) async {
    final uid = await authRepository.getUserUID();
    final result = await applicationRepository.getUserApplications(uid!);
    return result.map((e) => applicationMapper.mapToModel(e)).toList();
  }
}
