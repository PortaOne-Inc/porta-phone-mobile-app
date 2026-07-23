import 'package:webtrit_phone/data/data.dart';

class DeviceInfoMock implements DeviceInfo {
  @override
  Map<String, dynamic> get data => {
    'manufacturer': 'MockManufacturer',
    'model': 'MockModel',
    'systemName': 'MockOS',
    'systemVersion': '1.0.0',
  };

  @override
  String get manufacturer => 'MockManufacturer';

  @override
  String get model => 'MockModel';

  @override
  String get systemName => 'MockOS';

  @override
  String get systemVersion => '1.0.0';

  @override
  int? get sdkVersion => 30;
}
