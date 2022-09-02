// Copyright (c) 2022 Razeware LLC
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

class Episode {
  final int id;
  final String title;
  final String host;
  final String audioUrl;
  final String description;

  // As per the new flutter update the parameter which are not optional must
  // be passed as required parameter. This is done to avoid the error.
  // To make an argument required use the required keyword is added.

  Episode({required this.title, required this.id, required this.host, 
  required this.audioUrl, required this.description});
}

// With darts new update it is adviced to use string with single quotes where
// double quotes are not need

List<Episode> episodes = [
  Episode(
    id: 3,
    title: 'A Beginners Guide to Meditation',
    host: 'Sanjay Agarwal',
    audioUrl: 'audio/ep_3.m4a',
    description:
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.''',
  ),
  Episode(
    id: 2,
    title: '10 ways to improve your flexibility with Lupita Samirez',
    host: 'James Gordon',
    audioUrl: 'audio/ep_2.m4a',
    description:
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.''',
  ),
  Episode(
    id: 1,
    title: 'How Yoga can heal your soul',
    audioUrl: 'audio/ep_1.m4a',
    host: 'Pete Derrick',
    description:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.''',
  ),
];
