import 'package:flutter_moviedb/env/api-key.dart';
import 'package:get/get.dart';

class MovieDetailsService extends GetConnect {

  Future<dynamic> fetchMovie(String movieID) async {
    final response = await get('https://api.themoviedb.org/3/movie/$movieID?api_key=$API_KEY');

    if(response.status.hasError) {
      return Future.error(response.statusText!);
    }
    return response.body;
  }
}