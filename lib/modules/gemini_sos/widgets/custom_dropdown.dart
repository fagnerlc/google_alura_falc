// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  String selectedOption;
  CustomDropdown({
    super.key,
    required this.selectedOption,
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
    return Column(
      children: [
        const Text('Selecione o tipo de desastre:'),
        DropdownButton<String>(
          value: widget.selectedOption,
          items: _options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              widget.selectedOption = newValue!;
            });
          },
          hint: const Text('Selecione uma opção'),
        ),
      ],
    );
  }
}
