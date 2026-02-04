import 'package:webtrit_phone/data/data.dart';

class MockAppMetadataProvider implements AppMetadataProvider {
  const MockAppMetadataProvider();

  @override
  String get exportFilenamePrefix => 'WebTrit_Phone_1.0.0_Mock_Device_Android_14';

  @override
  Map<String, String> get logLabels => {
        'app': 'WebTrit Phone',
        'appVersion': '1.0.0',
        'buildNumber': '100',
        'packageName': 'com.webtrit.phone',
        'manufacturer': 'Google',
        'model': 'Mock Device',
        'os': 'Android',
        'osVersion': '14',
        'authorization': 'authorized',
      };

  @override
  String get userAgent => 'WebTrit Phone/1.0.0 (Mock Device; Android: 14)';

  @override
  String get appInfo => 'WebTrit Phone/1.0.0 (Mock Device; Android: 14)';

  @override
  String get deviceInfo => 'Google/Mock Device/14';
}
