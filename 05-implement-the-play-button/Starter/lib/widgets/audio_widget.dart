import 'package:flutter/material.dart';

class AudioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[300],
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.play_arrow), onPressed: () {}),
          Text("00:37"),
          Expanded(
            child: Slider(
              value: 0.5,
              activeColor: Theme.of(context).textTheme.bodyText2.color,
              inactiveColor: Theme.of(context).disabledColor,
              onChanged: (double value) {},
            ),
          ),
          Text("01:15"),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
