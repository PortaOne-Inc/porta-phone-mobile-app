// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:injectable/injectable.dart';

class EnvironmentConfig {
  EnvironmentConfig._();

  static const ENV = String.fromEnvironment(
    'ENV',
    defaultValue: Environment.prod,
  );

  static const APP_NAME = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Webtrit configurator',
  );
}
