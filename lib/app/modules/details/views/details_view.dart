import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedb/app/data/movie-details.dart';
import 'package:flutter_moviedb/app/modules/details/controller/details_controller.dart';
import 'package:flutter_moviedb/app/modules/details/views/detail_body.dart';
import 'package:flutter_moviedb/app/services/movie-details_service.dart';
import 'package:get/get.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsController());

    return controller.obx((movie) => Scaffold(
        appBar: AppBar(
          title: Text(movie['title']),
          centerTitle: true,
          backgroundColor: Color.fromARGB(0, 34, 34, 53),
        ),
        backgroundColor: Color.fromARGB(255, 25, 25, 50),
        body: MovieDetailBody(movie: MovieDetails.fromJson(movie))), onLoading: Container(
          color: Color.fromARGB(255, 25, 25, 50),
        ));
  }
}
