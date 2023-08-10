// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class EnvironmentConfig {
  EnvironmentConfig._();

  static const IDENTIFIER_PREFIX = String.fromEnvironment(
    'IDENTIFIER_PREFIX',
    defaultValue: 'com.',
  );

  static const APP_NAME = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Webtrit Configurator',
  );
}
