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

    const TextStyle titleDetail = TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);

    const TextStyle ratingStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);

    const TextStyle tagStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
        fontStyle: FontStyle.italic);

    const TextStyle overviewStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        height: 1.5);

    String genres = '';
    if (movie.genres!.isNotEmpty) {
      for (int i = 0; i < movie.genres!.length; i++) {
        genres += movie.genres![i].name!;
        if (i < movie.genres!.length - 1) {
          genres += " ";
        }
      }
    }

    return ListView(
      children: [
        SizedBox(
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
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  "${movie.title} (${movie.releaseDate!.year})",
                  style: titleStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                    '${movie.releaseDate!.year}-${movie.releaseDate!.month}-${movie.releaseDate!.day} (${movie.productionCountries![0].iso31661}) • ${genres} • ${movie.runtime}m', style: titleDetail,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
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
