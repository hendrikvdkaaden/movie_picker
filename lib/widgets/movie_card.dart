import 'package:flutter/material.dart';
import 'package:movie_picker/models/movie.dart';

import '../screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final String genre;
  final VoidCallback? onAddPressed;

  const MovieCard({
    super.key,
    this.onAddPressed,
    required this.movie, required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              title: movie.title,
              genre: genre,
              backDropUrl: movie.backdropPath,
              score: movie.voteAverage,
              description: movie.overview,
              posterUrl: movie.posterPath,
            ),
          ),
        );
      },
      child: Card(
        color: Theme.of(context).cardColor,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            // Movie Image
            SizedBox(
              width: 80,
              height: 100,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(8)),
                child: Image.network(
                  "http://image.tmdb.org/t/p/w500/${movie.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            // Movie Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    genre,
                    // You can modify this to show actual genres if available
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "Score: ${movie.voteAverage}", // Movie score
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            // Plus Icon
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: onAddPressed,
            ),
          ],
        ),
      ),
    );
  }
}
