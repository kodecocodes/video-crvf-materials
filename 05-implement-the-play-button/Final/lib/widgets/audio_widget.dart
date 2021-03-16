import 'package:flutter/material.dart';

class AudioWidget extends StatefulWidget {
  final bool isPlaying;
  final ValueChanged<bool> onPlayStateChanged;
  final Duration currentTime;
  final ValueChanged<Duration> onSeekBarMoved;
  final Duration totalTime;

  const AudioWidget({
    Key key,
    this.isPlaying = false,
    this.onPlayStateChanged,
    this.currentTime,
    this.onSeekBarMoved,
    @required this.totalTime,
  }) : super(key: key);

  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[300],
      child: Row(
        children: [
          _buildPlayPauseButton(),
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

  IconButton _buildPlayPauseButton() => IconButton(
        icon: (widget.isPlaying) ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        onPressed: () {
          if (widget.onPlayStateChanged != null) {
            widget.onPlayStateChanged(!widget.isPlaying);
          }
        },
      );
}
