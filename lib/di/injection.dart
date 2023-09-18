import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'package:data/di/injection.module.dart';
import 'package:domain/di/injection.module.dart';

import 'injection.config.dart';

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(DataPackageModule),
    ExternalModule(DomainPackageModule),
  ],
)
Future<GetIt> configureDependencies(String environment) async => GetIt.asNewInstance().init(environment: environment);

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named('baseUrl')
  String get baseUrl {
    return 'https://us-central1-webtrit-configurator-stage.cloudfunctions.net/api/v1';
  }
}
