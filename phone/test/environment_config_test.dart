import 'package:flutter_test/flutter_test.dart';

import 'package:webtrit_phone/environment_config.dart';

void main() {
  group('EnvRegistry', () {
    late EnvRegistry registry;

    setUp(() => registry = EnvRegistry());

    test('string: override wins; empty and missing fall back to compile-time', () {
      registry.apply({'A': 'override'});
      expect(registry.string('A', 'default'), 'override');

      registry.apply({'A': ''});
      expect(registry.string('A', 'default'), 'default');

      registry.apply({});
      expect(registry.string('A', 'default'), 'default');
    });

    test('stringOrNull: empty and missing fall back (may be null)', () {
      registry.apply({'A': ''});
      expect(registry.stringOrNull('A', null), isNull);
      expect(registry.stringOrNull('A', 'd'), 'd');

      registry.apply({'A': 'x'});
      expect(registry.stringOrNull('A', 'd'), 'x');
    });

    test('boolean: true/false honoured; malformed and empty fall back', () {
      registry.apply({'B': 'TRUE'});
      expect(registry.boolean('B', false), isTrue);

      registry.apply({'B': 'false'});
      expect(registry.boolean('B', true), isFalse);

      registry.apply({'B': 'yes'}); // malformed -> compile-time
      expect(registry.boolean('B', true), isTrue);

      registry.apply({'B': ''}); // empty -> compile-time
      expect(registry.boolean('B', true), isTrue);

      registry.apply({});
      expect(registry.boolean('B', false), isFalse);
    });

    test('integer: numeric honoured; malformed and empty fall back', () {
      registry.apply({'N': '42'});
      expect(registry.integer('N', 1), 42);

      registry.apply({'N': 'abc'});
      expect(registry.integer('N', 7), 7);

      registry.apply({'N': ''});
      expect(registry.integer('N', 7), 7);
    });

    test('has / clear', () {
      registry.apply({'A': 'x'});
      expect(registry.has('A'), isTrue);

      registry.clear();
      expect(registry.has('A'), isFalse);
    });
  });

  group('EnvironmentConfig overrides', () {
    tearDown(EnvironmentConfig.clearOverrides);

    test('APP_NAME reflects an override and falls back when empty/cleared', () {
      EnvironmentConfig.applyOverrides({EnvironmentConfig.APP_NAME__NAME: 'Custom'});
      expect(EnvironmentConfig.APP_NAME, 'Custom');

      EnvironmentConfig.applyOverrides({EnvironmentConfig.APP_NAME__NAME: ''});
      expect(EnvironmentConfig.APP_NAME, 'PortaPhone');

      EnvironmentConfig.clearOverrides();
      expect(EnvironmentConfig.APP_NAME, 'PortaPhone');
    });

    test('a non-positive polling-interval override falls back to the default', () {
      const name = EnvironmentConfig.USER_REPOSITORY_POLLING_INTERVAL_SECONDS__NAME;

      EnvironmentConfig.applyOverrides({name: '0'});
      expect(EnvironmentConfig.USER_REPOSITORY_POLLING_INTERVAL_SECONDS, 10);

      EnvironmentConfig.applyOverrides({name: '-5'});
      expect(EnvironmentConfig.USER_REPOSITORY_POLLING_INTERVAL_SECONDS, 10);

      EnvironmentConfig.applyOverrides({name: '30'});
      expect(EnvironmentConfig.USER_REPOSITORY_POLLING_INTERVAL_SECONDS, 30);
    });

    test('CDR polling interval is configurable and keeps its positive default', () {
      const name = EnvironmentConfig.CDRS_REPOSITORY_POLLING_INTERVAL_SECONDS__NAME;

      EnvironmentConfig.applyOverrides({name: '25'});
      expect(EnvironmentConfig.CDRS_REPOSITORY_POLLING_INTERVAL_SECONDS, 25);

      EnvironmentConfig.applyOverrides({name: '0'});
      expect(EnvironmentConfig.CDRS_REPOSITORY_POLLING_INTERVAL_SECONDS, 10);
    });

    group('polling backoff cap', () {
      const name = EnvironmentConfig.POLLING_MAX_BACKOFF_SECONDS__NAME;
      // Run this group with --dart-define=$name=<value> as well to exercise
      // build-time parsing, including malformed and non-positive values.
      const configured = int.fromEnvironment('WEBTRIT_APP_POLLING_MAX_BACKOFF_SECONDS', defaultValue: 900);
      const fallback = configured > 0 ? configured : 900;

      test('uses the positive build value or the 900-second default', () {
        expect(name, 'WEBTRIT_APP_POLLING_MAX_BACKOFF_SECONDS');
        expect(EnvironmentConfig.POLLING_MAX_BACKOFF_SECONDS, fallback);
      });

      test('positive runtime values win and clearing restores the build value', () {
        for (final seconds in [1, 300, 1800]) {
          EnvironmentConfig.applyOverrides({name: '$seconds'});
          expect(EnvironmentConfig.POLLING_MAX_BACKOFF_SECONDS, seconds);
        }

        EnvironmentConfig.clearOverrides();
        expect(EnvironmentConfig.POLLING_MAX_BACKOFF_SECONDS, fallback);
      });

      for (final invalid in ['', 'abc', '1.5', '0', '-5']) {
        test('invalid runtime value "$invalid" falls back to the validated build value', () {
          EnvironmentConfig.applyOverrides({name: invalid});
          expect(EnvironmentConfig.POLLING_MAX_BACKOFF_SECONDS, fallback);
        });
      }
    });

    test('APP_LINK_DOMAIN is trimmed, so it matches the host the build put in the manifest', () {
      const name = EnvironmentConfig.APP_LINK_DOMAIN__NAME;

      EnvironmentConfig.applyOverrides({name: '  app.example.com  '});
      expect(EnvironmentConfig.APP_LINK_DOMAIN, 'app.example.com');

      // Whitespace only leaves deep links off here too, matching a build that declares no filter.
      EnvironmentConfig.applyOverrides({name: '   '});
      expect(EnvironmentConfig.APP_LINK_DOMAIN, isEmpty);
    });
  });
}
