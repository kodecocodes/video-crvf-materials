import 'package:flutter/material.dart';

class AudioWidget extends StatefulWidget {
  final bool? isPlaying;
  final ValueChanged<bool>? onPlayStateChanged;
  final Duration? currentTime;
  final ValueChanged<Duration>? onSeekBarMoved;
  final Duration totalTime;

  const AudioWidget({
    Key? key,
    this.isPlaying = false,
    this.onPlayStateChanged,
    this.currentTime,
    this.onSeekBarMoved,
    required this.totalTime,
  }) : super(key: key);

  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  double? _sliderValue;
  bool? _userIsMovingSlider;

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
    return widget.currentTime!.inMilliseconds / widget.totalTime.inMilliseconds;
  }

  Duration _getCurrentDuration(double sliderValue) {
    final seconds = widget.totalTime.inSeconds * _sliderValue!;
    return Duration(seconds: seconds.toInt());
  }

  @override
  Widget build(BuildContext context) {
    if (!_userIsMovingSlider!) {
      _sliderValue = _getSliderValue();
    }
    return Container(
      height: 60,
      color: Colors.grey[300],
      child: Row(
        children: [
          _buildPlayPauseButton(),
          const Text('00:37'),
          _buildSeekBar(context),
          const Text('01:15'),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Expanded _buildSeekBar(BuildContext context) {
    return Expanded(
      child: Slider(
        value: _sliderValue!,
        activeColor: Theme.of(context).textTheme.bodyText2!.color,
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
            widget.onSeekBarMoved!(currentTime);
          }
        },
      ),
    );
  }

  IconButton _buildPlayPauseButton() => IconButton(
        icon: (widget.isPlaying!)
            ? const Icon(Icons.pause)
            : const Icon(Icons.play_arrow),
        onPressed: () {
          if (widget.onPlayStateChanged != null) {
            widget.onPlayStateChanged!(!widget.isPlaying!);
          }
        },
      );
}
