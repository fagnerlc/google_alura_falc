// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRadio extends StatefulWidget {
  String selectedOption;
  CustomRadio({
    super.key,
    required this.selectedOption,
  });

  @override
  CustomRadioState createState() => CustomRadioState();
}

class CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        children: [
          RadioListTile<String>(
            title: const Text('Preciso de Ajuda'),
            value: 'Preciso de Ajuda',
            groupValue: widget.selectedOption,
            onChanged: (String? value) {
              setState(() {
                widget.selectedOption = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Quero ajudar'),
            value: 'Quero ajudar',
            groupValue: widget.selectedOption,
            onChanged: (String? value) {
              setState(() {
                widget.selectedOption = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
