import 'package:get/get.dart';
import 'package:google_alura_falc/modules/gemini_sos/gemini_sos_controller.dart';

class GeminiSosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeminiSosController());
  }
}
