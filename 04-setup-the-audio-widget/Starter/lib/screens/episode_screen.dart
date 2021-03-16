import 'package:flutter/material.dart';
import 'package:rw_custom_reusable_widgets/widgets/episode_card.dart';
import '../models/episode.dart';
import '../viewmodels/audio_viewmodel.dart';
import 'package:stacked/stacked.dart';

class EpisodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Episode episode = ModalRoute.of(context).settings.arguments;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Episode Title"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            episode.title,
            style: theme.textTheme.headline4,
          ),
          SizedBox(height: 32),
          AudioPlayer(audioUrl: episode.audioUrl),
          SizedBox(height: 32),
          Text(
            episode.description,
            style: theme.textTheme.subtitle1,
          ),
          SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Episodes",
                style: theme.textTheme.headline6,
              ),
              Container(
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

  const AudioPlayer({Key key, @required this.audioUrl}) : super(key: key);

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
