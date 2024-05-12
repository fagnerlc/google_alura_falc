import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_alura_falc/modules/home/controllers/home_controller.dart';
import 'package:google_alura_falc/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(
                  0xFF06A77D), // Substitua pelas cores que você deseja usar no degradê
              Color.fromARGB(255, 2, 31, 62),
            ],
          ),
          // image: DecorationImage(
          //   image: AssetImage(
          //       'assets/images/desastre.png'), // Substitua pelo caminho da sua imagem
          //   fit: BoxFit.fill,
          // ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 7,
              left: 7,
              child: Image.asset('assets/images/google.png',
                  width: 100), // Substitua pelo caminho da sua imagem
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Image.asset('assets/images/alura.png',
                  width: 100), // Substitua pelo caminho da sua imagem
            ),
            Positioned(
              bottom: 7,
              left: 7,
              child: Image.asset('assets/images/flutter.png',
                  width: 100), // Substitua pelo caminho da sua imagem
            ),
            Positioned(
              bottom: 7,
              right: 7,
              child: Image.asset('assets/images/firebase.png',
                  width: 100), // Substitua pelo caminho da sua imagem
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                      child:
                          Image.asset('assets/images/gemini.png', width: 300)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'AJUDA',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                            ),
                            TextSpan(
                              text: ' A ',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                            ),
                            TextSpan(
                              text: 'DESASTRES',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                            ),
                            TextSpan(
                              text: ' NATURAIS',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                                  decoration: const BoxDecoration(
                                      color: Colors.black45),
                                  child: const Center(
                                    child: Text(
                                      'Gemini SOS',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                      ),
                                    ),
                                  )),
                              const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.warning,
                                        color: Colors.red, size: 50),
                                    Text('Clique aqui',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 21)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
