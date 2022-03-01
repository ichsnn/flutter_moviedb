import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedb/app/data/movie-credits.dart';
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

    // return controller.obx((state) => Scaffold(
    //       appBar: AppBar(
    //         title: Text('${state![0]}'),
    //       ),
    //     ));

    // return Scaffold(
    //   appBar: AppBar(title: Text('tes')),
    // );

    return controller.obx(
        (details) => Scaffold(
            appBar: AppBar(
              title: Text(details![0]['title']),
              centerTitle: true,
              backgroundColor: Color.fromARGB(0, 34, 34, 53),
            ),
            backgroundColor: Color.fromARGB(255, 25, 25, 50),
            body: MovieDetailBody(
              movieDetails: MovieDetails.fromJson(details[0]),
              movieCredits: MovieCredits.fromJson(details[1]),
            )),
        onLoading: Container(
          color: Color.fromARGB(255, 25, 25, 50),
        ));
  }
}
