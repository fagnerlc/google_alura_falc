// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_alura_falc/core/utils/constants/endpoints.dart';
import 'package:google_alura_falc/data/gemini_repository/gemini_repository.dart';
// import 'package:google_alura_falc/modules/gemini_sos/services/gemini_functions_declarations.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiSosController extends GetxController {
  TextEditingController paisEstadoTec = TextEditingController();
  TextEditingController cidadeTec = TextEditingController();
  TextEditingController descricaoTec = TextEditingController();
  String selectedOptionSolicitacao = 'Preciso de Ajuda';
  String selectedOptionTipoDesastre = 'Enchentes';
  final GeminiRepository repository;
  var isLoading = false.obs;
  var resposta = ''.obs;
  GeminiSosController({
    required this.repository,
  });

  onSubmit() async {
    isLoading.value = true;
    isLoading.refresh();
    resposta.value = await repository.getResposta(
      selectedOptionSolicitacao,
      selectedOptionTipoDesastre,
      cidadeTec.text,
      paisEstadoTec.text,
      descricaoTec.text,
    );
    isLoading.value = false;
    isLoading.refresh();
    // repository.executeGenerativeModel(
    //   GenerativeModel(
    //     model: 'gemini-1.0-pro',
    //     apiKey: Endpoints.aiStudioKey,
    //     tools: [
    //       Tool(functionDeclarations: [
    //         GeminiFunctionsDeclarations().saidaRiscoNecessitado
    //       ])
    //     ],
    //   ),
    // );
  }

  @override
  void onInit() {
    super.onInit();
  }
}
