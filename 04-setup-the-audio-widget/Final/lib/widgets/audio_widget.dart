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

class AudioWidget extends StatelessWidget {
  // Add default class constructor with key parameter, it is requred for every
  // widget. This constructor is used to construct the widget instance.
  const AudioWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[300],
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.play_arrow), onPressed: () {}),
          // Const keyword is used to create a constant value, be it a variable
          // or a widget. The Text value is going to remain the same throughout 
          // the widget's lifecycle. Hence we add a const keyword so that the 
          // widget is not rebuilt every time.
          // This helps in improving performance.

          const Text('00:37'),
          Expanded(
            child: Slider(
              value: 0.5,
              activeColor: Theme.of(context).textTheme.bodyText2!.color,
              inactiveColor: Theme.of(context).disabledColor,
              onChanged: (value) {},
            ),
          ),
          const Text('01:15'),
          // SizedBox widget is used to add space between widgets.The value wont
          // be changesd in the widget's lifecycle so we add a const keyword.
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
