import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_moviedb/app/data/movie-details.dart';

class MovieDetailBody extends StatelessWidget {
  final MovieDetails movie;
  const MovieDetailBody({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Font Style
    const TextStyle titleStyle = TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);

    const TextStyle ratingStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);

    const TextStyle tagStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
        fontStyle: FontStyle.italic);

    const TextStyle overviewStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white, height: 1.5);

    return ListView(
      children: [
        Container(
          width: 500,
          child: Image.network(
              'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "${movie.title} (${movie.releaseDate!.year})",
                  style: titleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20,),
                  Text(
                    "${movie.voteAverage}",
                    style: ratingStyle,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  '${movie.tagline}',
                  style: tagStyle,
                ),
              ),
              Text(
                '${movie.overview}',
                style: overviewStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
