import 'package:flutter/material.dart';
import '../models/episode.dart';

class EpisodeCard extends StatelessWidget {
  final Episode episode;
  final bool isWideCard;

  const EpisodeCard({
    Key key,
    @required this.episode, this.isWideCard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        "/episode",
        arguments: episode,
      ),
      child: Container(
        width: isWideCard ? 350 : mediaQuery.size.width,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        // child: TallCard(episode: episode),
        child: isLandscape || isWideCard
            ? WideCard(episode: episode)
            : TallCard(episode: episode),
      ),
    );
  }
}

class TallCard extends StatelessWidget {
  const TallCard({
    Key key,
    @required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 200,
              child: Icon(Icons.mic, size: 64),
            )
          ],
        ),
        CardDetail(episode: episode),
      ],
    );
  }
}

class WideCard extends StatelessWidget {
  const WideCard({
    Key key,
    @required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: 120,
              width: 100,
              child: Icon(Icons.mic, size: 64),
            )
          ],
        ),
        Expanded(child: CardDetail(episode: episode)),
      ],
    );
  }
}

class CardDetail extends StatelessWidget {
  const CardDetail({
    Key key,
    @required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            episode.title,
            style: Theme.of(context).textTheme.headline6,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text("Host: ${episode.host}"),
              Spacer(),
              Text("Episode: ${episode.id}"),
            ],
          ),
        ],
      ),
    );
  }
}
