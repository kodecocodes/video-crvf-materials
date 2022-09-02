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

import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioViewModel extends ChangeNotifier {
  // Create an AudioPlayer instance. As per the new audio player package, you
  // need to initialise the audio player before it can be used. This is
  // to prevent the audio player from being null.
  final AudioPlayer _player = AudioPlayer();

  bool _isPlaying = false;
  Duration _currentTime = const Duration();
  Duration _totalTime = const Duration(seconds: 5);

  bool get isPlaying => _isPlaying;

  Duration get currentTime => _currentTime;

  Duration get totalTime => _totalTime;

  Future loadData(String audioUrl) async {
    // You cannot use player to play from audio cache. You can play audio
    // directly from the audio player initialised above.
    // You have to use AssestSource as you are using name from the assest
    await _player.play(AssetSource(audioUrl));
    // Here the flag isPlaying is set to true, so that when the audio is
    // playing the play button is replaced by pause button.
    // and rest of the code is executed.
    _isPlaying = true;
    notifyListeners();
    var stream;
    stream = _player.onDurationChanged.listen((Duration d) {
      _totalTime = d;
      stream.cancel();
      _player.pause();
      notifyListeners();
    });

    _player.onPositionChanged.listen((Duration position) {
      if (position.compareTo(_totalTime) >= 0) {
        _player.stop();
        _currentTime = Duration();
        _isPlaying = false;
      } else {
        _currentTime = position;
      }
      notifyListeners();
    });

    _player.onPlayerStateChanged.listen((PlayerState s) {
      if (s == PlayerState.completed) {
        _isPlaying = false;
        _currentTime = Duration();
        notifyListeners();
      }
    });
  }

  Future onPlayStateChanged(bool isPlaying) async {
    if (isPlaying) {
      await _player.resume();
    } else {
      await _player.pause();
    }
    _isPlaying = isPlaying;
    notifyListeners();
  }

  void seek(Duration position) async {
    await _player.seek(position);
  }

}
