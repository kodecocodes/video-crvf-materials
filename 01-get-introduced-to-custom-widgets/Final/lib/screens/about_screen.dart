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

class AboutScreen extends StatelessWidget {
  // Add default class constructor with key parameter, it is requred for every
  // widget. This constructor is used to construct the widget instance.
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Yogacast'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // OVERVIEW SECTION
          AppOverview(textTheme: textTheme),
          const SizedBox(height: 32),
          // DEVELOPER INFO SECTION
          DeveloperInfo(textTheme: textTheme),
          const SizedBox(height: 32),
          // LICENSE SECTION
          LicenseSection(textTheme: textTheme),
        ],
      ),
    );
  }
}

class LicenseSection extends StatelessWidget {
  const LicenseSection({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('License', style: textTheme.headline6),
        SizedBox(height: 8),
        const Text(
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem '
          'accusantium doloremque laudantium, totam rem aperiam, eaque '
          'ipsa quae ab illo inventore veritatis et quasi architecto '
          'beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem '
          'quia voluptas sit aspernatur aut odit aut fugit, sed quia '
          'consequuntur magni dolores eos qui ratione voluptatem sequi '
          'nesciunt. Neque porro quisquam est, qui dolorem ipsum '
          'quia dolor sit amet, consectetur, adipisci velit, sed quia '
          'non numquam eius modi tempora incidunt ut labore et dolore '
          'magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, '
          'quis nostrum exercitationem ullam corporis suscipit laboriosam, '
          'nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum '
          'iure reprehenderit qui in ea voluptate velit esse quam nihil '
          'molestiae consequatur, vel illum qui dolorem eum fugiat '
          'quo voluptas nulla pariatur?',
        ),
      ],
    );
  }
}

class DeveloperInfo extends StatelessWidget {
  const DeveloperInfo({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Developer', style: textTheme.headline6),
        const SizedBox(height: 8),
        const Text('Mystic Inc'),
      ],
    );
  }
}

class AppOverview extends StatelessWidget {
  const AppOverview({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Yogacast 2.0', style: textTheme.headline6),
        const SizedBox(height: 32),
        Text('Description', style: textTheme.headline6),
        const SizedBox(height: 8),
        const Text(
          '''Yogacast delivers health and wellness information to you in audio 
format.'''
          'Hosted by renowned yoga practitioners.',
        ),
      ],
    );
  }
}
