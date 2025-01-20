import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/widgets/decoration/border_container.dart';

class AboutPageView extends StatelessWidget {
  const AboutPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'About Page Config',
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: '',
                  decoration: const InputDecoration(labelText: 'Picture Path'),
                  onChanged: (value) {
                    // Update picture field
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
