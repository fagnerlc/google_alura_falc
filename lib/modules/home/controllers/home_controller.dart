// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:google_alura_falc/data/gemini_provider/gemini_provider.dart';
import 'package:google_alura_falc/data/gemini_repository/gemini_repository.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    var repository = GeminiRepository(apiClient: GeminiProvider());
    repository.postResposta();
    super.onInit();
  }
}
