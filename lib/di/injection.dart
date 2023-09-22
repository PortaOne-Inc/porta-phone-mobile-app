
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'package:data/di/injection.module.dart';
import 'package:domain/di/injection.module.dart';

import '../app/application.dart';
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
  @Named('baseUrl')
  String baseUrl(AppEnvironment appEnvironment) {
    return appEnvironment.endpoints.host;
  }
}
