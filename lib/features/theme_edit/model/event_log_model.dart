import 'screens_enum.dart';

enum TypeMessage { noStyle }

class EventLogModel {
  final String styleName;
  final ScreenEnum screen;
  final List<ScreenEnum> availableScreens;
  final TypeMessage typeMessage;

  EventLogModel({
    this.availableScreens = const [],
    required this.styleName,
    required this.screen,
    this.typeMessage = TypeMessage.noStyle,
  });
}
