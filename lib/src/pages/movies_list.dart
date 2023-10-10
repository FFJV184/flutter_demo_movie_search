import 'package:flutter/material.dart';
import 'package:movie_searcher/src/Widgets/movie_tile.dart';
import 'package:movie_searcher/src/services/movies_service.dart';
import 'package:rxdart/rxdart.dart';

import '../models/movie_model.dart';
import '../models/movies_list_model.dart';

class MoviesList extends StatelessWidget{
  MoviesList({super.key});
  final MoviesService moviesService = MoviesService();
  final BehaviorSubject<MovieList> movieList = BehaviorSubject.seeded(MovieList(movies: []));

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        cursorColor: const Color(0xFFAAAAAA),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.amber,
            hintText: 'Write a movie to search',
            hintStyle: const TextStyle(color: Color(0xFFAAAAAA)),
            helperStyle: const TextStyle(height: 0.7),
            errorStyle: const TextStyle(height: 0.7, color: Colors.red),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            )
        ),
        style: const TextStyle(color: Colors.black),
        onChanged: (newValue) async {
          print(newValue);
          final movies = await moviesService.searchMovies(newValue);
          this.movieList.add(movies);
        },
      ),
      const SizedBox(height: 25,),
      StreamBuilder(
          stream: movieList,
          builder: (context, snapshot){
            if(snapshot.data?.movies.isEmpty ?? true){
              return const Center(child: Text('No movies to display yet.'));
            }
            return Expanded(child: ListView(children: buildList(snapshot.data?.movies ?? []),));
          })

    ],);
  }

  List<Widget> buildList(List<Movie> movies){
    return movies.map<Widget>((e) => MovieTile(movie: e)).toList();
  }
}