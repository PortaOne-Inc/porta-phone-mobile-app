import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

final _logger = Logger('AuthCubit');

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._monitorTokenExpirationUsecase,
    this._usecaseAuthIsLoggedIn,
  ) : super(const AuthState()) {
    init();
  }

  final MonitorTokenExpirationUsecase _monitorTokenExpirationUsecase;
  final GetAuthStatusUsecase _usecaseAuthIsLoggedIn;
  StreamSubscription<AuthenticationStatus>? _tokenExpirationSubscription;

  void init() {
    _logger.info('Initializing AuthCubit');
    _tokenExpirationSubscription = _monitorTokenExpirationUsecase.execute().listen(
      onDone: () {
        _logger.info('Token expiration monitoring done');
      },
      (status) {
        switch (status) {
          case AuthenticationStatus.expired:
            emit(state.copyWith(status: AuthStatus.expired));
            _logger.info('Token expired');
            //   emit(const AuthState.unauthenticated());
            break;

          case AuthenticationStatus.authenticated:
            _logger.info('Token authenticated');
            emit(state.copyWith(status: AuthStatus.authenticated));

            break;
          case AuthenticationStatus.unauthenticated:
            _logger.info('Token not authenticated');
            emit(state.copyWith(status: AuthStatus.notAuthenticated));
        }
      },
      onError: (error) {
        emit(state.copyWith(status: AuthStatus.init));
        _logger.severe('Error monitoring token expiration: $error');
        //  emit(AuthState.error(error.toString()));
      },
    );
  }

  FutureOr<AuthenticationStatus> get status => _usecaseAuthIsLoggedIn.execute();

  @override
  Future<void> close() async {
    _logger.info('Closing AuthCubit');
    await _tokenExpirationSubscription?.cancel();
    return super.close();
  }
}
