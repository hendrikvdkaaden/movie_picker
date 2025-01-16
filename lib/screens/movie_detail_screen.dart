import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final String title;
  final String genre;
  final String backDropUrl;
  final double score;
  final String description;
  final String posterUrl;

  const MovieDetailScreen(
      {super.key,
      required this.title,
      required this.genre,
      required this.backDropUrl,
      required this.score,
      required this.description,
      required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          // Backdrop Image
          SizedBox(
            height: 300,
            child: Image.network(
              "http://image.tmdb.org/t/p/w500/$backDropUrl",
              fit: BoxFit.cover,
              width: double.infinity, // Ensure it takes the full width
            ),
          ),
          // Scrollable Content (Movie Info)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 250), // Spacer for backdrop image height
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Poster
                    SizedBox(
                      width: 100,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          // Same borderRadius as ClipRRect
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // Adjust shadow color and opacity
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(
                                  2, 4), // Adjust position of the shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          child: Image.network(
                            "http://image.tmdb.org/t/p/w500/$posterUrl",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10.0),
                    // Movie Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 55),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          genre,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "Rating: $score",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5.0),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
