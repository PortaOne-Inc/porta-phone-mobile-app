import 'package:webtrit_configurator/app/application.dart';

import 'package:get_it/get_it.dart';

import 'bootstrap.dart';

void main() {
  bootstrap((GetIt di) async {
    return MaterialApplication(getIt: di);
  });
}
