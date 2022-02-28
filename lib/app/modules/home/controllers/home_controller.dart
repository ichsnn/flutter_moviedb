import 'package:flutter_moviedb/app/services/movie-popular_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    PopularMovieService().fetchMovie().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
