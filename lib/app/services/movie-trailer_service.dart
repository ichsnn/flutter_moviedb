import 'package:flutter_moviedb/app/env/api-key.dart';
import 'package:get/get.dart';

class MovieTrailerService extends GetConnect {
  Future<dynamic> fetchVideo(String movieID) async {
    final response = await get('https://api.themoviedb.org/3/movie/$movieID/videos?api_key=$API_KEY');

    if(response.status.hasError) {
      return Future.error(response.statusText!);
    }
    return response.body;
  }
}