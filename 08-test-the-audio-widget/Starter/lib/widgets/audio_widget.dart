import 'dart:ui';

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
  double _sliderValue;
  bool _userIsMovingSlider;

  @override
  void initState() {
    super.initState();
    _sliderValue = _getSliderValue();
    _userIsMovingSlider = false;
  }

  double _getSliderValue() {
    if (widget.currentTime == null) {
      return 0;
    }
    return widget.currentTime.inMilliseconds / widget.totalTime.inMilliseconds;
  }

  Duration _getCurrentDuration(double sliderValue) {
    final seconds = widget.totalTime.inSeconds * sliderValue;
    return Duration(seconds: seconds.toInt());
  }

  String _getTimeString(double sliderValue) {
    final time = _getCurrentDuration(sliderValue);

    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final minutes =
        twoDigits(time.inMinutes.remainder(Duration.minutesPerHour));
    final seconds =
        twoDigits(time.inSeconds.remainder(Duration.secondsPerMinute));

    final hours = widget.totalTime.inHours > 0 ? '${time.inHours}:' : '';
    return "$hours$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    if (!_userIsMovingSlider) {
      _sliderValue = _getSliderValue();
    }
    return Container(
      height: 60,
      color: Colors.grey[300],
      child: Row(
        children: [
          _buildPlayPauseButton(),
          _buildCurrentTimeLabel(),
          _buildSeekBar(context),
          _buildTotalTimeLabel(),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  Text _buildTotalTimeLabel() => Text(_getTimeString(1.0));

  Text _buildCurrentTimeLabel() => Text(
        _getTimeString(_sliderValue),
        style: TextStyle(
          fontFeatures: [FontFeature.tabularFigures()],
        ),
      );

  Expanded _buildSeekBar(BuildContext context) {
    return Expanded(
      child: Slider(
        value: _sliderValue,
        activeColor: Theme.of(context).textTheme.bodyText2.color,
        inactiveColor: Theme.of(context).disabledColor,
        onChangeStart: (value) {
          _userIsMovingSlider = true;
        },
        onChanged: (double value) {
          setState(() {
            _sliderValue = value;
          });
        },
        onChangeEnd: (value) {
          _userIsMovingSlider = false;
          if (widget.onSeekBarMoved != null) {
            final currentTime = _getCurrentDuration(value);
            widget.onSeekBarMoved(currentTime);
          }
        },
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
