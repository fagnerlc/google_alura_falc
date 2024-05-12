// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_alura_falc/modules/gemini_sos/gemini_sos_controller.dart';

// ignore: must_be_immutable
class CustomRadio extends StatefulWidget {
  CustomRadio({
    super.key,
  });

  @override
  CustomRadioState createState() => CustomRadioState();
}

class CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GeminiSosController>();
    return SizedBox(
      width: 280,
      child: Column(
        children: [
          RadioListTile<String>(
            title: const Text('Preciso de ajuda'),
            value: 'Preciso de Ajuda',
            groupValue: controller.selectedOptionSolicitacao,
            onChanged: (String? value) {
              setState(() {
                controller.selectedOptionSolicitacao = value!;
                print(controller.selectedOptionSolicitacao);
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Quero ajudar'),
            value: 'Quero ajudar',
            groupValue: controller.selectedOptionSolicitacao,
            onChanged: (String? value) {
              setState(() {
                controller.selectedOptionSolicitacao = value!;
                print(controller.selectedOptionSolicitacao);
              });
            },
          ),
        ],
      ),
    );
  }
}
