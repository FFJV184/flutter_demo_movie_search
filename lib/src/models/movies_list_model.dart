import 'movie_model.dart';

class MovieList{
  List<Movie> movies = [];

  MovieList({required this.movies}){}

  factory MovieList.fromJson(Map<String, dynamic> json){
    final results = json['results'].map<Movie>((element) => Movie.fromJson(element)).toList();
    return MovieList(movies: results ?? []);
  }
}