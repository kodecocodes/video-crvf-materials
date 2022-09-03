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

import 'package:flutter/material.dart';

class AudioWidget extends StatefulWidget {
  // As per the Flutter lint rules the final varibalbes should be initialized.
// That is why they are initialised in the constructor.
// The constructor is called when the widget is created.
// The parameter can either be required or optional.
// The required keyword is used to make the parameter required.
// And "?" is used to make the parameter optional.

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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[300],
      child: Row(
        children: [
          _buildPlayPauseButton(),
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

  IconButton _buildPlayPauseButton() => IconButton(
        icon: (widget.isPlaying!)
            ? const Icon(Icons.pause)
            : const Icon(Icons.play_arrow),
        onPressed: () {
          // TO use optional parameters we need to check if they are null or not.
          // We are using if else case to check if the value is null or not.
          // We need to use bang operator "!" with the optional value
          // To tell the compiler that we are sure that the value is not null.
          // If this value is found null, you code will break.
          if (widget.onPlayStateChanged != null) {
            widget.onPlayStateChanged!(!widget.isPlaying!);
          }
        },
      );
}
