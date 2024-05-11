import 'package:get/get.dart';
import 'package:google_alura_falc/data/gemini_provider/gemini_provider.dart';
import 'package:google_alura_falc/data/gemini_repository/gemini_repository.dart';
import 'package:google_alura_falc/modules/gemini_sos/gemini_sos_controller.dart';

class GeminiSosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeminiSosController(
        repository: GeminiRepository(apiClient: GeminiProvider())));
  }
}
