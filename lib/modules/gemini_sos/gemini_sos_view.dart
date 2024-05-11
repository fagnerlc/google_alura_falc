import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_alura_falc/modules/gemini_sos/gemini_sos_controller.dart';
import 'package:google_alura_falc/modules/gemini_sos/widgets/custom_dropdown.dart';
import 'package:google_alura_falc/modules/gemini_sos/widgets/custom_radio.dart';

class GeminiSosView extends GetView<GeminiSosController> {
  const GeminiSosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(controller.resposta.value),
                )),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth:
                        500, // Defina o valor máximo de largura que você deseja aqui
                    // Defina o valor máximo de altura que você deseja aqui
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Preencha o formulário para solicitar ajuda',
                            style: TextStyle(fontSize: 21),
                          ),
                        ),
                        Form(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                CustomRadio(),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CustomDropdown(),
                                ),
                              ],
                            ),
                            Wrap(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    controller: controller.paisEstadoTec,
                                    decoration: const InputDecoration(
                                      labelText: 'País/Estado',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    controller: controller.cidadeTec,
                                    decoration: const InputDecoration(
                                      labelText: 'Cidade',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: controller.descricaoTec,
                                decoration: const InputDecoration(
                                  labelText: 'Descreva sua situação de risco:',
                                ),
                              ),
                            ),
                            Obx(() => Visibility(
                                  visible: !controller.isLoading.value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        controller.onSubmit();
                                      },
                                      icon: const Icon(Icons.sos),
                                      label: const Text('Solicitar'),
                                    ),
                                  ),
                                )),
                            Obx(() => Visibility(
                                  visible: controller.isLoading.value,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                )),
                          ],
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
