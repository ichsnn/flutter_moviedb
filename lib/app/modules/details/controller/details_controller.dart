import 'package:flutter/cupertino.dart';
import 'package:flutter_moviedb/app/services/movie-credits_service.dart';
import 'package:flutter_moviedb/app/services/movie-details_service.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController with StateMixin<List> {
  @override
  void onInit() {
    super.onInit();
    MovieDetailsService().fetchMovie(Get.arguments).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
    // MovieCreditsService().fetchCredits(Get.arguments).then((value) {
    //   change(value, status: RxStatus.success());
    // }, onError: (err) {
    //   change(null, status: RxStatus.error(err.toString()));
    // });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print('init');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
