import 'package:get/get.dart';
import 'package:google_alura_falc/modules/gemini_sos/gemini_sos_view.dart';
import 'package:google_alura_falc/modules/home/bindings/home_binding.dart';
import 'package:google_alura_falc/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.geminiSos,
      page: () => const GeminiSosView(),
    ),
  ];
}
