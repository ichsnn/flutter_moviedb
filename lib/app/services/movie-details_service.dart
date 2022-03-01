import 'package:flutter_moviedb/app/constant/api_key.dart';
import 'package:get/get.dart';

class MovieDetailsService extends GetConnect {

  Future<List<dynamic>> fetchMovie(String movieID) async {
    final responseMovie = await get('https://api.themoviedb.org/3/movie/$movieID?api_key=$API_KEY');

    final responseCredits = await get(
        'https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$API_KEY');

    if(responseMovie.status.hasError) {
      return Future.error(responseMovie.statusText!);
    }

    if(responseCredits.status.hasError) {
      return Future.error(responseCredits.statusText!);
    }

    return [responseMovie.body, responseCredits.body];
  }
}