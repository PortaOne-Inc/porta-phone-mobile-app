part of 'focus_group_cubit.dart';

@immutable
class FocusGroupState {
  const FocusGroupState({
    required this.focusGroup,
    required this.messages,
    required this.currentScreen,
  });

  final FocusModel focusGroup;
  final List<EventLogModel> messages;
  final ScreenEnum currentScreen;

  FocusGroupState copyWith({
    final FocusModel? focusGroup,
    final List<EventLogModel>? messages,
    final ScreenEnum? currentScreen,
  }) {
    return FocusGroupState(
      focusGroup: focusGroup ?? this.focusGroup,
      messages: messages ?? this.messages,
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }
}

class FocusGroupInitial extends FocusGroupState {
  FocusGroupInitial()
      : super(
          currentScreen: ScreenEnum.auth,
          messages: [],
          focusGroup: FocusModel(
            groups: {
              ScreenEnum.auth: {
                FocusModel.colorPrimary: false,
                FocusModel.colorOnPrimary: false,
                FocusModel.colorOnBackground: false,
                FocusModel.colorBackground: false,
                FocusModel.gradientTabColor: false,
              },
              ScreenEnum.main: {
                FocusModel.colorPrimary: false,
                FocusModel.colorSecondary: false,
                FocusModel.colorSecondaryContainer: false,
                FocusModel.colorOnSecondaryContainer: false,
                FocusModel.colorTertiary: false,
                FocusModel.colorBackground: false,
                FocusModel.colorSurface: false,
                FocusModel.colorOnSurface: false,
              },
              ScreenEnum.setting: {
                FocusModel.colorPrimary: false,
                FocusModel.colorOnPrimary: false,
                FocusModel.colorSecondary: false,
                FocusModel.colorSecondaryContainer: false,
                FocusModel.colorTertiary: false,
                FocusModel.colorBackground: false,
                FocusModel.colorSurface: false,
                FocusModel.colorOnSurface: false,
              },
            },
          ),
        );
}
