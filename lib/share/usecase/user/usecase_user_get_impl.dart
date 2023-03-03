import 'dart:async';

import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/share.dart';

@Injectable(as: UsecaseUserGet)
class UsecaseThemeDeleteCreateImpl implements UsecaseUserGet {
  UsecaseThemeDeleteCreateImpl(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<UserModel> execute() async {
    // TODO: Add validation
    final uid = await authRepository.getUserUID();
    return UserModel(uid!);
  }
}
