enum TypeMessage { noStyle }

class EventLogModel {
  EventLogModel({
    this.availableScreens = const [],
    required this.styleName,
    required this.screen,
    this.typeMessage = TypeMessage.noStyle,
  });

  final String styleName;
  final int screen;
  final List<int> availableScreens;
  final TypeMessage typeMessage;
}
