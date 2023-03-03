import 'package:uuid/uuid.dart';

class UtilityUUID {
  static final UtilityUUID _instance = UtilityUUID._internal();
  final uuid = const Uuid();

  factory UtilityUUID() {
    return _instance;
  }

  UtilityUUID._internal();

  String generate() {
    return uuid.v4();
  }
}
