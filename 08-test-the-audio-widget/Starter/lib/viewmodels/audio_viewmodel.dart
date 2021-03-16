// Copyright (c) 2020 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
//     copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom
// the Software is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify,
//     merge, publish, distribute, sublicense, create a derivative work,
// and/or sell copies of the Software in any work that is designed,
// intended, or marketed for pedagogical or instructional purposes
// related to programming, coding, application development, or
// information technology. Permission for such use, copying,
//    modification, merger, publication, distribution, sublicensing,
//    creation of derivative works, or sale is expressly withheld.
//
// This project and source code may use libraries or frameworks
// that are released under various Open-Source licenses. Use of
// those libraries and frameworks are governed by their own
// individual licenses.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

import 'package:flutter/foundation.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioViewModel extends ChangeNotifier {
  static AudioCache _audioCache = AudioCache();
  AudioPlayer _player;

  bool _isPlaying = false;
  Duration _currentTime = Duration();
  Duration _totalTime = Duration(milliseconds: 1);

  bool get isPlaying => _isPlaying;

  Duration get currentTime => _currentTime;

  Duration get totalTime => _totalTime;

  Future loadData(String audioUrl) async {
    // _player = await _audioCache.play('furelise.mp3');
    _player = await _audioCache.play(audioUrl);

    var stream;
    stream = _player.onDurationChanged.listen((Duration d) {
      _totalTime = d;
      stream.cancel();
      _player.pause();
      notifyListeners();
    });

    _player.onAudioPositionChanged.listen((Duration position) {
      // print(position);
      if (position.compareTo(_totalTime) >= 0) {
        _player.stop();
        _currentTime = Duration();
        _isPlaying = false;
      } else {
        _currentTime = position;
      }
      notifyListeners();
    });

    _player.onPlayerStateChanged.listen((AudioPlayerState s) {
      if (s == AudioPlayerState.COMPLETED) {
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
