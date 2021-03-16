import 'package:flutter/material.dart';
import '../models/episode.dart';
import '../widgets/episode_card.dart';

// sdk: ">=2.2.0 <3.0.0"
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YogaCast"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            tooltip: 'Open About Screen',
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/about",
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
                  ))
              .toList()
        ],
      ),
    );
  }
}
