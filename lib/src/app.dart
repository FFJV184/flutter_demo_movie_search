

import 'package:flutter/material.dart';
import 'package:movie_searcher/src/pages/movies_list.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(child: Container(
              margin: const EdgeInsets.all(30),child: MoviesList()),)),
    );
  }
}