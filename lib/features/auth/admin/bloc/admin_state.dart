part of 'admin_cubit.dart';

@freezed
class AdminState with _$AdminState {
  factory AdminState({
    ColorModel? colors,
  }) = _AdminState;

  factory AdminState.update({
    ColorModel? colors,
  }) = AdminStateUpdate;
}
