import 'package:flutter/material.dart';
import 'package:google_alura_falc/modules/gemini_sos/widgets/custom_dropdown.dart';
import 'package:google_alura_falc/modules/gemini_sos/widgets/custom_radio.dart';

class GeminiSosView extends StatelessWidget {
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
            const SelectableText('data'),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          CustomRadio(selectedOption: 'Preciso de Ajuda'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomDropdown(
                              selectedOption: 'Enchentes',
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              controller: TextEditingController(),
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
                              controller: TextEditingController(),
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
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                            labelText: 'Descreva sua situação de risco:',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.sos),
                          label: const Text('Solicitar'),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
