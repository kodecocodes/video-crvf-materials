import 'package:flutter/material.dart';
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
          SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Episodes',
                style: theme.textTheme.headline6,
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
