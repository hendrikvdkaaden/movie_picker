import 'package:flutter/material.dart';
import 'package:movie_picker/widgets/genre_section.dart';

import '../api/api_service.dart';
import '../models/genre.dart';
import '../models/movie.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late Future<List<Movie>> _allMovies;
  late Future<List<Genre>> _allGenres;
  late Future<List<Movie>> _allActionMovies;

  @override
  void initState() {
    super.initState();
    _allMovies = ApiService().fetchMovies(); // Fetches all movies from API
    _allActionMovies = ApiService().fetchGenreMovies(28); // Fetches action movies from API
    _allGenres = ApiService().fetchGenres(); // Fetches all genres from API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Movie Picker",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GenreSection(
                allMovies: _allMovies,
                allGenres: _allGenres,
                title: "Trending Now",
              ),
              const SizedBox(height: 10.0),
              GenreSection(
                allMovies: _allActionMovies,
                allGenres: _allGenres,
                title: "Action",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
