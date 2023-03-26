part of 'common_bloc.dart';

@freezed
class CommonState with _$CommonState {
  const factory CommonState.initial() = _Initial;

  const factory CommonState.logout() = _CommonStateLogout;
}

extension ThemeCollectionStateGetters on CommonState {
  bool get isLogOut => this is _CommonStateLogout;
}
