import 'package:webtrit_phone/features/cdrs/cdrs.dart';
import 'package:webtrit_phone/features/user_info/user_info.dart';

/// The refresh a finished call asks for.
///
/// A call changes both the history and the balance, so both owners get the
/// same post-call request; the CDR owner is absent when call history is
/// disabled for the session. Bound to `CallBloc.onCallEnded` by the shell.
class PostCallRefresh {
  const PostCallRefresh({required this.userInfoSync, this.cdrsSync});

  final UserInfoSync userInfoSync;
  final CdrsSync? cdrsSync;

  void call() {
    cdrsSync?.requestPostCallRefresh();
    userInfoSync.requestPostCallRefresh();
  }
}
