import 'package:flutter_moviedb/app/data/movie-credits.dart';

Cast ? searchCrewByJobFromMovieCredits(String job, MovieCredits movieCredits) {
  for(int i = 0; i < movieCredits.crew!.length; i++) {
    if(movieCredits.crew![i].job == job) {
      return movieCredits.crew![i];
    }
  }
  return null;
}