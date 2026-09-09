import 'package:webtrit_callkeep/webtrit_callkeep.dart';
import 'package:phone_number/phone_number.dart';

extension CallkeepHandleExtension on CallkeepHandle {
  String normalizedValue() {
    if (isNumber) {
      return PhoneParser.normalize(value);
    } else {
      return value;
    }
  }
}
