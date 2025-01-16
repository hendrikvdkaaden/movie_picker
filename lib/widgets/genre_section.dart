import 'package:flutter/material.dart';
import 'package:movie_picker/models/genre.dart';
import 'package:movie_picker/models/movie.dart';
import 'package:movie_picker/widgets/movie_card.dart';

import 'genre_header.dart';

class GenreSection extends StatelessWidget {
  final Future<List<Movie>> allMovies;
  final Future<List<Genre>> allGenres;
  final String title;

  const GenreSection({
    super.key,
    required this.allMovies,
    required this.allGenres,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GenreHeader(title: title),
        FutureBuilder<List<Movie>>(
          future: allMovies,
          builder: (context, movieSnapshot) {
            if (movieSnapshot.hasData) {
              List<Movie> trendingMovies = movieSnapshot.data!;
              return FutureBuilder<List<Genre>>(
                future: allGenres,
                builder: (context, genreSnapshot) {
                  if (genreSnapshot.hasData) {
                    List<Genre> genres = genreSnapshot.data!;
                    return SizedBox(
                      height: 330, // Set a fixed height for the section
                      child: Column( // Use Column instead of ListView
                        children: List.generate(3, (i) {
                          // Ensure there are enough movies to avoid index out of range
                          if (i < trendingMovies.length) {
                            // Find the first genre name for this movie
                            String firstGenreName = "Unknown";
                            if (trendingMovies[i].genreIds.isNotEmpty) {
                              int firstGenreId = trendingMovies[i].genreIds.first;
                              Genre? matchingGenre = genres.firstWhere(
                                    (genre) => genre.id == firstGenreId,
                                orElse: () => Genre(id: 0, name: "Unknown"),
                              );
                              firstGenreName = matchingGenre.name;
                            }
                            return MovieCard(
                              movie: trendingMovies[i],
                              genre: firstGenreName, // Display the first genre
                            );
                          } else {
                            return const SizedBox.shrink(); // Return an empty widget if no movie is available
                          }
                        }),
                      ),
                    );
                  } else if (genreSnapshot.hasError) {
                    return Text("Error loading genres: ${genreSnapshot.error}");
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              );
            } else if (movieSnapshot.hasError) {
              return Text("Error loading movies: ${movieSnapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}