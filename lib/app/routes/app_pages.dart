import 'package:flutter_moviedb/app/modules/details/bindings/details_binding.dart';
import 'package:flutter_moviedb/app/modules/details/views/details_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static var id = '';

  AppPages._();

  static const INITIAL = Routes.HOME;
  static const DETAILPAGE = Routes.DETAILS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.DETAILS,
        page: () => DetailsView(),
        binding: DetailBinding())
  ];
}
