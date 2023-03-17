import 'package:flutter/material.dart';

import '../model/models.dart';

class LogEventMessage extends StatelessWidget {
  const LogEventMessage({
    super.key,
    required this.model,
    required this.onClick,
  });

  final EventLogModel model;
  final Function(int index) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: '${capitalize(model.styleName)} ',
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: Colors.deepOrange),
                children: [
                  const TextSpan(
                    text: 'does not use in ',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.deepOrange),
                  ),
                  TextSpan(
                    text: model.screen.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: Colors.deepOrange),
                  )
                ]),
          ),
          const SizedBox(
            height: 4,
          ),
          RichText(
            text: TextSpan(
              text: 'Screens where using a style ',
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black45),
              children: [
                TextSpan(
                  text: model.styleName,
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: model.availableScreens
                .map(
                  (e) => InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Text(
                        ' - ${e.toString()}',
                        style: const TextStyle(
                            color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w100, letterSpacing: 1.25),
                      ),
                    ),
                    onTap: () => onClick(e),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  String capitalize(String value) {
    var result = value[0].toUpperCase();
    bool cap = true;
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == ' ' && cap == true) {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
        cap = false;
      }
    }
    return result;
  }
}
