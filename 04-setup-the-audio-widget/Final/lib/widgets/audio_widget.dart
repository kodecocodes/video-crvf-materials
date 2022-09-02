import 'package:flutter/material.dart';

class AudioWidget extends StatelessWidget {
  // Add default class constructor with key parameter, it is requred for every
  // widget. This constructor is used to construct the widget instance.
  const AudioWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[300],
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.play_arrow), onPressed: () {}),
          const Text('00:37'),
          Expanded(
            child: Slider(
              value: 0.5,
              activeColor: Theme.of(context).textTheme.bodyText2!.color,
              inactiveColor: Theme.of(context).disabledColor,
              onChanged: (double value) {},
            ),
          ),
          const Text('01:15'),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
