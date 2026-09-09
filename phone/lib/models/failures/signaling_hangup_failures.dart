import 'package:signaling/signaling.dart';

class SignalingHangupFailure implements Exception {
  SignalingHangupFailure(this.code);

  final SignalingResponseCode code;
}
