import 'dart:convert';

import 'package:webtrit_phone/models/models.dart';

// ignore: depend_on_referenced_packages
import 'package:pub_semver/pub_semver.dart';

class SystemInfoBuilder {
  const SystemInfoBuilder({
    // Emulate a current core so the preview matches a live backend: this gates
    // version-aware features (hybrid presence >=0.28.0-alpha.1, remote favorites
    // >=0.25, remote caller-id >=0.23). The previous 0.0.0/0.15.3 made the preview
    // behave like an ancient core, so e.g. presence indicators never appeared.
    this.coreVersion = '1.0.0',
    this.adapterName = 'Demo DB which hosts multiple tenants',
    this.adapterVersion = '0.1.13',
    this.adapterSupported = const [
      'extensions',
      'userEvents',
      'internalMessaging',
      'signup',
      'voicemail',
      'autoProvision',
      'customMethods',
    ],
    this.postgresVersion = '15.0',
    this.janusVersion = '1.3.1',
  });

  final String coreVersion;
  final String adapterName;
  final String adapterVersion;
  final List<String> adapterSupported;
  final String postgresVersion;
  final String janusVersion;

  SystemInfoBuilder copyWith({
    String? coreVersion,
    String? adapterName,
    String? adapterVersion,
    List<String>? adapterSupported,
    String? postgresVersion,
    String? janusVersion,
  }) {
    return SystemInfoBuilder(
      coreVersion: coreVersion ?? this.coreVersion,
      adapterName: adapterName ?? this.adapterName,
      adapterVersion: adapterVersion ?? this.adapterVersion,
      adapterSupported: adapterSupported ?? this.adapterSupported,
      postgresVersion: postgresVersion ?? this.postgresVersion,
      janusVersion: janusVersion ?? this.janusVersion,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'core': {'version': coreVersion},
      'adapter': {
        'custom': <dynamic, dynamic>{},
        'name': adapterName,
        'supported': adapterSupported,
        'version': adapterVersion,
      },
      'postgres': {'version': postgresVersion},
      'janus': {
        'version': janusVersion,
        'plugins': {
          'sip': {'version': '0.0.9'},
        },
        'transports': {
          'websocket': {'version': '0.0.1'},
        },
      },
    };
  }

  String build() => jsonEncode(toMap());

  /// Tolerant parse so a malformed editor-entered version never crashes the
  /// preview; falls back to a current core that advertises modern features.
  static Version _parseCoreVersion(String value) {
    try {
      return Version.parse(value);
    } catch (_) {
      return Version(1, 0, 0);
    }
  }

  WebtritSystemInfo buildInfo() {
    return WebtritSystemInfo(
      core: CoreInfo(version: _parseCoreVersion(coreVersion)),
      adapter: AdapterInfo(name: adapterName, version: adapterVersion, supported: List.from(adapterSupported)),
      postgres: PostgresInfo(version: postgresVersion),
      janus: JanusInfo(version: janusVersion),
    );
  }
}
