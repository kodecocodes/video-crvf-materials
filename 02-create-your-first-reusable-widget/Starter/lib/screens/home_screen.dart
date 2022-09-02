import 'package:flutter/material.dart';
import '../models/episode.dart';
import '../widgets/episode_card.dart';

class HomeScreen extends StatelessWidget {
  // Add default class constructor with key parameter, it is requred for every
  // widget. This constructor is used to construct the widget instance.
  
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YogaCast'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Open About Screen',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/about',
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ...episodes
              .map((Episode e) => EpisodeCard(
                    episode: e,
                    // isWide: true,
                  ))
              .toList()
        ],
      ),
    );
  }
}
