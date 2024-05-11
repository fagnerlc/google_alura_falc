import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_alura_falc/modules/home/controllers/home_controller.dart';
import 'package:google_alura_falc/routes/app_pages.dart';

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
            SizedBox(
              height: 200, // Defina a altura desejada aqui
              width: 200,
              child: InkWell(
                onTap: () => Get.toNamed(AppRoutes.geminiSos),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0), // Defina o raio da borda aqui
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        15.0), // Deve ser o mesmo raio da borda do Card
                    child: Stack(
                      children: [
                        Container(
                          height: 200, // Defina a altura desejada aqui
                          width: 200, // Defina a largura desejada aqui
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/desastre.png'), // Substitua pelo caminho da sua imagem
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 2,
                              sigmaY: 2), // Defina o filtro desejado aqui
                          child: Container(
                            color: Colors.black.withOpacity(
                                0.5), // Defina a cor e a opacidade do filtro aqui
                          ),
                        ),
                        Container(
                            height: 50, // Defina a altura desejada aqui
                            width: 200, // Defina a largura desejada aqui
                            decoration:
                                const BoxDecoration(color: Colors.black45),
                            child: const Center(
                              child: Text(
                                'Gemini SOS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
