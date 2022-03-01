import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'movie_card.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Catalog'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(0, 34, 34, 53),
      ),
      backgroundColor: Color.fromARGB(255, 25, 25, 50),
      body: controller.obx((data) => ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) => MovieCard(movie: data[index]),
          )),
    );
  }
}
