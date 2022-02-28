import 'package:get/get.dart';
import 'package:flutter_moviedb/app/modules/details/controller/details_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );
  }
}
