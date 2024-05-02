enum TypeMessage { noStyle }

class EventLogModel {
  EventLogModel({
    required this.styleName,
    required this.screen,
    this.availableScreens = const [],
    this.typeMessage = TypeMessage.noStyle,
  });

  final String styleName;
  final int screen;
  final List<int> availableScreens;
  final TypeMessage typeMessage;
}
