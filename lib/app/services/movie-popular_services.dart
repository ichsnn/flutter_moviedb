import 'package:flutter_moviedb/app/constant/api_key.dart';
import 'package:get/get.dart';

class PopularMovieService extends GetConnect {
  Future<List<dynamic>> fetchMovie() async{
    final response = await get('https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY');
    if(response.status.hasError) {
      return Future.error(response.statusText!);
    }
    return response.body['results'];
  }
}