// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  //  final wordpair=WordPair.random();
    return MaterialApp(
      title: 'New Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
          body: const Center(
            child: RandomWords(),
          )
      ),
    );
  }
}

class RandomWords extends StatefulWidget{
  const RandomWords({super.key});
  @override
  State<RandomWords> createState() => _RandomWordsstate();
  }

class _RandomWordsstate extends State<RandomWords>{
  final _suggestions=<WordPair>[];
  final _biggerFont= const TextStyle(fontSize: 20);
  final _saved = <WordPair>{};     // NEW

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        final alreadySaved = _saved.contains(_suggestions[index]); // NEW

        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
          trailing: Icon(    // NEW from here ...
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
            semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
          ),
          onTap: ()
          {
            setState(() {
              if (alreadySaved) {
                _saved.remove(_suggestions[index]);
              } else {
                _saved.add(_suggestions[index]);
              }
            });
          },

        );
        },
    );
  }
}


