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
import '../models/episode.dart';

class EpisodeCard extends StatelessWidget {
  final Episode episode;
  final bool isWideCard;

  const EpisodeCard({
    Key? key,
    required this.episode,
    this.isWideCard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // As per the new lint rule by Flutter. There is no need mention the type of
    // the variable if the varibale is locally declared. Also final keyword is
    // used if the variable wont be reassigned.
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/episode',
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
              offset: const Offset(0, 3),
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
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const SizedBox(
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
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            const SizedBox(
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
    Key? key,
    required this.episode,
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
              Text('Host: ${episode.host}'),
              const Spacer(),
              Text('Episode: ${episode.id}'),
            ],
          ),
        ],
      ),
    );
  }
}
