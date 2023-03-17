import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/models.dart';

part 'focus_group_state.dart';

class FocusGroupCubit extends Cubit<FocusGroupState> {
  FocusGroupCubit() : super(FocusGroupInitial());

  void updateFocusPrimary(bool isFocus) {
    var currentPageFocus = state.focusGroup.groups[state.currentScreen] ?? {};
    if (currentPageFocus.containsKey(FocusModel.colorPrimary)) {
      currentPageFocus[FocusModel.colorPrimary] = isFocus;
      state.focusGroup.groups[state.currentScreen] = currentPageFocus;
      emit(state.copyWith(focusGroup: state.focusGroup));
    }
  }

  void updateColorBackground(bool isFocus) {
    var currentPageFocus = state.focusGroup.groups[state.currentScreen] ?? {};
    if (currentPageFocus.containsKey(FocusModel.colorBackground)) {
      currentPageFocus[FocusModel.colorBackground] = isFocus;
      state.focusGroup.groups[state.currentScreen] = currentPageFocus;
      emit(state.copyWith(focusGroup: state.focusGroup));
    } else {
      if (isFocus) {
        var messages = state.messages;
        messages.add(EventLogModel(styleName: FocusModel.colorBackground, screen: state.currentScreen));
        emit(state.copyWith(messages: messages));
      }
    }
  }

  void updateColorSecondary(bool isFocus) {
    const currentKey = FocusModel.colorSecondary;

    var currentPageFocus = state.focusGroup.groups[state.currentScreen] ?? {};
    if (currentPageFocus.containsKey(currentKey)) {
      currentPageFocus[currentKey] = isFocus;
      state.focusGroup.groups[state.currentScreen] = currentPageFocus;
      emit(state.copyWith(focusGroup: state.focusGroup));
    } else {
      List<int> availableScreens = [];

      if (isFocus) {
        state.focusGroup.groups.forEach((key, value) {
          if (value.containsKey(currentKey)) availableScreens.add(key);
        });

        var messages = state.messages;
        messages
            .add(EventLogModel(availableScreens: availableScreens, styleName: currentKey, screen: state.currentScreen));
        emit(state.copyWith(messages: messages));
      }
    }
  }

  void updateCurrentScreen(int screen) {
    emit(state.copyWith(currentScreen: screen));
  }
}
