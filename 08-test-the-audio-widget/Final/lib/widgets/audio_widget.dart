// Copyright (c) 2022 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended or marketed for pedagogical
// or instructional purposes related to programming, coding, application
// development, or information technology.  Permission for such use, copying,
// modification, merger, publication, distribution, sublicensing, creation of
// derivative works or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import 'dart:ui';

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
    final seconds = widget.totalTime.inSeconds * sliderValue;
    return Duration(seconds: seconds.toInt());
  }

  String _getTimeString(double sliderValue) {
    final time = _getCurrentDuration(sliderValue);

    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final minutes =
        twoDigits(time.inMinutes.remainder(Duration.minutesPerHour));
    final seconds =
        twoDigits(time.inSeconds.remainder(Duration.secondsPerMinute));

    final hours = widget.totalTime.inHours > 0 ? '${time.inHours}:' : '';
    return '$hours$minutes:$seconds';
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
          _buildCurrentTimeLabel(),
          _buildSeekBar(context),
          _buildTotalTimeLabel(),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Text _buildTotalTimeLabel() => Text(_getTimeString(1.0));

  Text _buildCurrentTimeLabel() => Text(
        _getTimeString(_sliderValue!),
        style: const TextStyle(
          fontFeatures: [FontFeature.tabularFigures()],
        ),
      );

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
          final currentTime = _getCurrentDuration(value);
          widget.onSeekBarMoved!(currentTime);
        },
      ),
    );
  }

  IconButton _buildPlayPauseButton() => IconButton(
        icon: (widget.isPlaying!) ? const Icon(Icons.pause) 
        : const Icon(Icons.play_arrow),
        onPressed: () {
          widget.onPlayStateChanged!(!widget.isPlaying!);
        },
      );
}
