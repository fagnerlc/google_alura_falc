// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_alura_falc/modules/gemini_sos/gemini_sos_controller.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  final List<String> _options = [
    'Enchentes',
    'Incêndios',
    'Maremotos',
    'Deslizamentos',
    'Tsunami',
    'Terremotos',
    'Vulcões',
    'Furacões',
    'Tornados',
    'Secas',
    'Outros',
    // Adicione mais opções aqui
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GeminiSosController>();
    return Column(
      children: [
        const Text('Selecione o tipo de desastre:'),
        DropdownButton<String>(
          value: controller.selectedOptionTipoDesastre,
          items: _options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              controller.selectedOptionTipoDesastre = newValue!;
            });
          },
          hint: const Text('Selecione uma opção'),
        ),
      ],
    );
  }
}
