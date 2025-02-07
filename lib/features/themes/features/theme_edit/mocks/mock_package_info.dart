import 'package:webtrit_phone/data/data.dart';

class PackageInfoMock implements PackageInfo {
  @override
  String get appName => 'Webtrit configurator';

  @override
  String get packageName => 'com.webtrit.configurator';

  @override
  String get version => '1.0.0';

  @override
  String get buildNumber => '1';
}
