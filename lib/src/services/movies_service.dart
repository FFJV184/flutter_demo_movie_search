import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movies_list_model.dart';

class MoviesService {
  Future<MovieList> searchMovies(String searchTerm) async {
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/search/movie?query=$searchTerm&include_adult=false&language=en-US&page=1'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZGQ0Mzg3NjE4Y2UxMTY4YWFmZjhiM2QyOWIyMzBhYSIsInN1YiI6IjVlNGFhNmI4OWI4NjE2MDAxNjY0MWQxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.f_Zj3UfmYxpEld-RB8aCTAaXcsD-pEiaXn5M77UCgM8'
        });
    final json = jsonDecode(response.body);
    return MovieList.fromJson(json);
  }
}
