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
import 'package:rw_custom_reusable_widgets/widgets/episode_card.dart';
import '../models/episode.dart';
import '../viewmodels/audio_viewmodel.dart';
import 'package:stacked/stacked.dart';

class EpisodeScreen extends StatelessWidget {
  // Add default class constructor with key parameter, it is requred for every
  // widget. This constructor is used to construct the widget instance.
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // over here as per the latest Flutter version, varibales which are decalred
    // locally are not required to have a type.
    // Also "!" operator is required to make sure the variable is not null.
    final episode = ModalRoute.of(context)!.settings.arguments as Episode;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode Title'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            episode.title,
            style: theme.textTheme.headline4,
          ),
          const SizedBox(height: 32),
          AudioPlayer(audioUrl: episode.audioUrl),
          const SizedBox(height: 32),
          Text(
            episode.description,
            style: theme.textTheme.subtitle1,
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Episodes',
                style: theme.textTheme.headline6,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...episodes
                        .map((Episode e) => EpisodeCard(
                              episode: e,
                              isWideCard: true,
                            ))
                        .toList()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AudioPlayer extends StatelessWidget {
  final String audioUrl;

  const AudioPlayer({Key? key, required this.audioUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AudioViewModel>.reactive(
      viewModelBuilder: () => AudioViewModel(),
      onModelReady: (model) => model.loadData(audioUrl),
      builder: (context, model, child) {
        return Container(); // TODO delete this line
        //return AudioWidget(); // TODO uncomment this line
      },
    );
  }
}
