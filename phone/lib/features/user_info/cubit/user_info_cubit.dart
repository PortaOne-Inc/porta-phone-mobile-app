import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

import 'package:webtrit_phone/repositories/repositories.dart';
import 'package:webtrit_phone/services/services.dart';

final _logger = Logger('UserInfoCubit');

/// Holds the session's user record and lets the UI ask for a fresh copy.
///
/// The record itself keeps arriving on the repository stream; [refresh] runs
/// the shared polling task through [PollingTaskRunner], so a pull gesture joins
/// a scheduled cycle instead of starting a second request path.
class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this._userRepository, {required PollingTaskRunner syncRunner})
    : _syncRunner = syncRunner,
      super(const UserInfoState()) {
    _userInfoSub = _userRepository.getAndListen().listen(_handleUserInfo);
  }

  final UserRepository _userRepository;
  final PollingTaskRunner _syncRunner;
  StreamSubscription? _userInfoSub;

  void _handleUserInfo(UserInfo? userInfo) async {
    _logger.finer('_handleUserInfo: $userInfo');
    emit(UserInfoState(userInfo: userInfo));
  }

  /// Fetches the user record now and reports whether the cycle succeeded.
  /// The refreshed record still arrives through the stream, not this call.
  Future<bool> refresh() async {
    try {
      await _syncRunner.runNow();
      return true;
    } catch (e, stackTrace) {
      _logger.warning('refresh failed', e, stackTrace);
      return false;
    }
  }

  @override
  Future<void> close() {
    _userInfoSub?.cancel();
    return super.close();
  }
}

class UserInfoState extends Equatable {
  const UserInfoState({this.userInfo});

  final UserInfo? userInfo;

  @override
  List<Object?> get props => [userInfo];

  @override
  toString() => 'UserInfoState(userInfo: $userInfo)';
}
