import 'package:flutter/material.dart';
import 'package:flutter_moviedb/app/data/movie-credits.dart';
import 'package:flutter_moviedb/app/data/movie-details.dart';
import 'package:flutter_moviedb/app/modules/details/views/cast_card.dart';
import 'package:flutter_moviedb/app/utils/utils.dart';

class MovieDetailBody extends StatelessWidget {
  final MovieDetails movieDetails;
  final MovieCredits movieCredits;
  const MovieDetailBody(
      {Key? key, required this.movieDetails, required this.movieCredits})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String genres = '';
    if (movieDetails.genres!.isNotEmpty) {
      for (int i = 0; i < movieDetails.genres!.length; i++) {
        genres += movieDetails.genres![i].name!;
        if (i < movieDetails.genres!.length - 1) {
          genres += " ";
        }
      }
    }

    String? director =
        searchCrewByJobFromMovieCredits('Director', movieCredits)!.name;

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

    const TextStyle crewNameStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    const TextStyle crewJobStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);

    return ListView(
      children: [
        Image.network(
            'https://image.tmdb.org/t/p/w500/${movieDetails.backdropPath}', width: double.infinity,),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 24, 8, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "${movieDetails.title} (${movieDetails.releaseDate!.year})",
                  style: titleStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  '${movieDetails.releaseDate!.year}-${movieDetails.releaseDate!.month}-${movieDetails.releaseDate!.day} (${movieDetails.productionCountries![0].iso31661}) • ${genres} • ${movieDetails.runtime}m',
                  style: titleDetail,
                ),
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
                    "${movieDetails.voteAverage}",
                    style: ratingStyle,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  '${movieDetails.tagline}',
                  style: tagStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  '${movieDetails.overview}',
                  style: overviewStyle,
                ),
              ),
              Text(
                '$director',
                style: crewNameStyle,
              ),
              const Text(
                'Director',
                style: crewJobStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Top Cast',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Wrap(
                children: [
                  CastCard(cast: Cast.fromJson(movieCredits.cast![0].toJson())),
                  CastCard(cast: Cast.fromJson(movieCredits.cast![1].toJson())),
                  CastCard(cast: Cast.fromJson(movieCredits.cast![2].toJson())),
                  CastCard(cast: Cast.fromJson(movieCredits.cast![4].toJson()))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
