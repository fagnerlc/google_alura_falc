import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiFunctionsDeclarations {
  final saidaRiscoNecessitado = FunctionDeclaration(
    'encontrarSaidaRiscoNecessitado',
    'Retornar uma saída da situação de risco especificada.',
    Schema(SchemaType.object,
        properties: {
          'tipoDeDesastre': Schema(
            SchemaType.string,
            description: 'O tipo de desastre a ser tratado.',
          ),
          'pais': Schema(
            SchemaType.string,
            description: 'O país onde o desastre ocorreu.',
          ),
          'estado': Schema(
            SchemaType.string,
            description: 'O estado onde o desastre ocorreu.',
          ),
          'cidade': Schema(
            SchemaType.string,
            description: 'A cidade onde o desastre ocorreu.',
          ),
          'descricao': Schema(
            SchemaType.string,
            description: 'Uma descrição da situação de risco.',
          ),
        },
        requiredProperties: [
          'tipoDeDesastre',
          'pais',
          'estado',
          'cidade',
          'descricao',
        ],
        description: ''),
  );
  final exchangeRateToolPort = FunctionDeclaration(
      'encontrarTaxaDeCambio',
      'Retorna a taxa de câmbio entre moedas em uma data específica.',
      Schema(SchemaType.object, properties: {
        'currencyDate': Schema(SchemaType.string,
            description: 'Uma data no formato YYYY-MM-DD ou '
                'o valor exato "mais recente" se um período de tempo não for especificado.'),
        'currencyFrom': Schema(SchemaType.string,
            description: 'O código da moeda da moeda para converter,'
                'como "USD".'),
        'currencyTo': Schema(SchemaType.string,
            description: 'O código da moeda da moeda para converter, '
                'como "USD".')
      }, requiredProperties: [
        'dataDaMoeda',
        'origemDaMoeda'
      ]));
}
