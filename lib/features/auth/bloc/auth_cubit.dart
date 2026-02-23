import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:domain/domain.dart';
import 'package:webtrit_configurator/app/route/app_route_consts.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

/// Logger for the AuthCubit class
final _logger = Logger('AuthCubit');

/// A Cubit that manages authentication state and handles token expiration.
class AuthCubit extends Cubit<AuthState> {
  /// Creates an instance of AuthCubit.
  ///
  /// Takes a [MonitorTokenExpirationUsecase] to monitor token expiration.
  AuthCubit(this._monitorTokenExpirationUsecase) : super(const AuthState()) {
    _init();
  }

  final MonitorTokenExpirationUsecase _monitorTokenExpirationUsecase;
  StreamSubscription<AuthenticationStatus>? _tokenExpirationSubscription;

  /// Initializes the AuthCubit by setting up a listener for token expiration.
  void _init() {
    _logger.info('Initializing AuthCubit');
    _tokenExpirationSubscription = _monitorTokenExpirationUsecase
        .execute()
        .listen(
          (status) {
            _logger.info('Token status: $status');
            emit(state.copyWith(status: status));
          },
          onError: (Object error) {
            emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
            _logger.severe('Error monitoring token expiration: $error');
          },
          onDone: () => _logger.info('Token expiration monitoring done'),
        );
  }

  /// Redirects based on the authentication status.
  ///
  /// If the user is authenticated and currently on the login page, redirects to the application collection page.
  /// If the user is not authenticated, redirects to the login page.
  /// If the token is expired, no redirection occurs.
  ///
  /// Returns a [Future] that completes with the redirection path or null.
  Future<String?> redirectGuard(GoRouterState goRouterState) async {
    final currentLocation = goRouterState.fullPath;

    if (state.status == null) {
      await stream.firstWhere((updatedState) => updatedState.status != null);
    }

    return state.status == AuthenticationStatus.authenticated
        ? (currentLocation == AppRoutInfo.login.path
              ? AppRoutInfo.applicationCollection.path
              : null)
        : (state.status == AuthenticationStatus.expired
              ? null
              : AppRoutInfo.login.path);
  }

  /// Closes the AuthCubit and cancels the token expiration subscription.
  ///
  /// Returns a [Future] that completes when the cubit is closed.
  @override
  Future<void> close() async {
    _logger.info('Closing AuthCubit');
    await _tokenExpirationSubscription?.cancel();
    return super.close();
  }
}
