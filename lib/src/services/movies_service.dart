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
              'Your API Token from https://developer.themoviedb.org/reference/intro/getting-started'
        });
    final json = jsonDecode(response.body);
    return MovieList.fromJson(json);
  }
}
