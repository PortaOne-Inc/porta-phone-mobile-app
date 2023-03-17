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
  final int currentScreen;

  FocusGroupState copyWith({
    final FocusModel? focusGroup,
    final List<EventLogModel>? messages,
    final int? currentScreen,
  }) {
    return FocusGroupState(
      focusGroup: focusGroup ?? this.focusGroup,
      messages: messages ?? this.messages,
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }
}

// TODO: Actualize log state
class FocusGroupInitial extends FocusGroupState {
  FocusGroupInitial()
      : super(
          currentScreen: 0,
          messages: [],
          focusGroup: FocusModel(
            groups: {
              0: {
                FocusModel.colorPrimary: false,
                FocusModel.colorOnPrimary: false,
                FocusModel.colorOnBackground: false,
                FocusModel.colorBackground: false,
                FocusModel.gradientTabColor: false,
              },
              1: {
                FocusModel.colorPrimary: false,
                FocusModel.colorSecondary: false,
                FocusModel.colorSecondaryContainer: false,
                FocusModel.colorOnSecondaryContainer: false,
                FocusModel.colorTertiary: false,
                FocusModel.colorBackground: false,
                FocusModel.colorSurface: false,
                FocusModel.colorOnSurface: false,
              },
              2: {
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
