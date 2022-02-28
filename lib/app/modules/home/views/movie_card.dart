import 'package:flutter/material.dart';
import 'package:flutter_moviedb/app/modules/details/views/details_view.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  final dynamic movie;
  const MovieCard({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movieID = movie['id'].toString();
    final String title = movie['title'];
    final String releaseDate = movie['release_date'];
    final String rating = movie['vote_average'].toString();
    final String poster = movie['poster_path'];

    const TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    );

    const TextStyle releaseDateStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: Color.fromARGB(255, 215, 215, 215),
    );

    const TextStyle ratingStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Colors.white,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/$poster',
                          fit: BoxFit.cover,
                        )),
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Text(
                            title,
                            style: titleStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Text(
                            releaseDate,
                            style: releaseDateStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                rating,
                                style: ratingStyle,
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 229, 37, 37),
                                minimumSize: Size.fromHeight(35),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                            onPressed: () =>
                                Get.to(() => DetailsView(), arguments: movieID),
                            child: const Text('More Details'))
                      ],
                    ),
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
