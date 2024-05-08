import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_alura_falc/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Sair")),
          ],
        ),
      ),
    );
  }
}
