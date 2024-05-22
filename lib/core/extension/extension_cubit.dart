import 'package:bloc/bloc.dart';

// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: invalid_use_of_visible_for_testing_member
extension CubitExtensions<T> on Cubit<T> {
  // Temporarily emits a new state and then reverts to the old state.
  void emitRollback(T newState) {
    final oldState = state;
    emit(newState);
    emit(oldState);
  }
}
