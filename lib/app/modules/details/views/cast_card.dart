import 'package:flutter/material.dart';
import 'package:flutter_moviedb/app/data/movie-credits.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w276_and_h350_face/${cast.profilePath}',
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cast.name}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${cast.character}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
