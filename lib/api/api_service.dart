import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_picker/models/genre.dart';
import '../models/movie.dart';

class ApiService {

  Future<List<Movie>> fetchMovies() async {
    String baseUrl = 'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';

    final Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYWFiYTA4YmU5YzAwNmNjYmZiMGU1YTJjNDUxMDM0YiIsIm5iZiI6MTcyNjE0OTEzNy40MjA0MDQsInN1YiI6IjYzNjk0MzViMTY4NGY3MDA4YWViYzYyMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KqwXTcKkHdgq1R3R1WzQvxL2rAESZKvqlDpl-HdhmOo',
    };
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> results = jsonResponse['results'];  // Extract 'results' field
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  Future<List<Movie>> fetchGenreMovies(int id) async {
    String baseUrl = 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=$id';

    final Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYWFiYTA4YmU5YzAwNmNjYmZiMGU1YTJjNDUxMDM0YiIsIm5iZiI6MTcyNjE0OTEzNy40MjA0MDQsInN1YiI6IjYzNjk0MzViMTY4NGY3MDA4YWViYzYyMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KqwXTcKkHdgq1R3R1WzQvxL2rAESZKvqlDpl-HdhmOo',
    };
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> results = jsonResponse['results'];  // Extract 'results' field
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }

  Future<List<Genre>> fetchGenres() async {
    const url = 'https://api.themoviedb.org/3/genre/movie/list?language=en';

    final Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYWFiYTA4YmU5YzAwNmNjYmZiMGU1YTJjNDUxMDM0YiIsIm5iZiI6MTcyNjE0OTEzNy40MjA0MDQsInN1YiI6IjYzNjk0MzViMTY4NGY3MDA4YWViYzYyMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KqwXTcKkHdgq1R3R1WzQvxL2rAESZKvqlDpl-HdhmOo',
    };
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> results = jsonResponse['genres'];  // Extract 'results' field
        return results.map((json) => Genre.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
