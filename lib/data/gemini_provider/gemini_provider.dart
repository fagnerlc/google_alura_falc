import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:google_alura_falc/core/utils/constants/endpoints.dart';
import 'package:google_alura_falc/core/utils/settings/setting_dio.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

//nossa url base
var baseUrl = Endpoints.aiStudioUrl;
// final model =
//     GenerativeModel(model: 'gemini-1.0-pro', apiKey: Endpoints.aiStudioKey);

//nossa classe responsável por encapsular os métodos http
class GeminiProvider {
  var dioHttpClient = SettingDio.createDio();

//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  GeminiProvider();

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  Future<String> getResposta(
    String solicitacao,
    String tipoDesastre,
    String cidade,
    String paisEstado,
    String descricao,
  ) async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    // await remoteConfig.setDefaults({'apiKeyGemini': 'apiKeyGemini'});
    await remoteConfig.fetchAndActivate();
    String apiKeyGemini = remoteConfig.getString('apiKeyGemini');

    var url = baseUrl + apiKeyGemini;
    var body = {
      "contents": [
        {
          "parts": [
            {
              "text":
                  "Ignore todos assuntos que tiver depois disso que não seja relacionado a sobrevivencia e salvar vidas:$solicitacao e estou na seguinte situação de risco em um(a) $tipoDesastre $descricao, me localizo na cidade $cidade do país/estado, $paisEstado. Me dê dicas, habilidades necessárias e soluções de como sobreviver e salvar vidas. Me dê dicas relevantes referente a gelocalização da cidade informada, aonde vou encontrar maior segurança na cidade a depender do tipo de desastre e informe os contatos dos serviços de emergência local."
            }
          ]
        }
      ]
    };
    try {
      //usando dio
      var response = await dioHttpClient.post(url, data: body);
      if (response.statusCode == 200) {
        print(
            'Response body: ${response.data['candidates'][0]['content']['parts'][0]['text']}');
        return response.data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return 'Request failed with status: ${response.statusCode}.';
      }

      // ExecuteGenerativeModel();
    } catch (e) {
      print('Error: $e');
    }
    return '';
  }

  Future<Map<String, Object?>> findExchangeRate(
    Map<String, Object?> arguments,
  ) async =>
      // This hypothetical API returns a JSON such as:
      // {"base":"USD","date":"2024-04-17","rates":{"SEK": 0.091}}
      {
        'date': arguments['currencyDate'],
        'base': arguments['currencyFrom'],
        'rates': <String, Object?>{arguments['currencyTo'] as String: 0.091}
      };
  Future<Map<String, Object?>> findRiscoDesastre(
    Map<String, Object?> arguments,
  ) async =>
      // This hypothetical API returns a JSON such as:
      // {"tipoDeDesastre":"Enchente","pais":"Brasil","estado":"SP","cidade":"São Paulo","descricao":"Estou ilhado pela enchente}
      {
        'tipoDeDesastre': 'Enchente',
        'pais': 'Brasil',
        'estado': 'RS',
        'cidade': 'Canela',
        'descricao': 'Estou ilhado pela enchente',
      };

  final exchangeRateTool = FunctionDeclaration(
      'findExchangeRate',
      'Returns the exchange rate between currencies on given date.',
      Schema(SchemaType.object, properties: {
        'currencyDate': Schema(SchemaType.string,
            description: 'A date in YYYY-MM-DD format or '
                'the exact value "latest" if a time period is not specified.'),
        'currencyFrom': Schema(SchemaType.string,
            description: 'The currency code of the currency to convert from, '
                'such as "USD".'),
        'currencyTo': Schema(SchemaType.string,
            description: 'The currency code of the currency to convert to, '
                'such as "USD".')
      }, requiredProperties: [
        'currencyDate',
        'currencyFrom'
      ]));

  Future<void> executeGenerativeModel(
    GenerativeModel model,
  ) async {
    var teste = await findExchangeRate({
      'currencyDate': '2024-04-17',
      'currencyFrom': 'USD',
      'currencyTo': 'SEK'
    });
    print(teste);
    final chat = model.startChat();
    const prompt = 'Estou ilhado pela enchente';

// Send the message to the generative model.
    var response = await chat.sendMessage(Content.text(prompt));

    final functionCalls = response.functionCalls.toList();
// When the model response with a function call, invoke the function.
    if (functionCalls.isNotEmpty) {
      final functionCall = functionCalls.first;
      final result = switch (functionCall.name) {
        // Forward arguments to the hypothetical API.
        'encontrarSaidaRiscoNecessitado' =>
          await findRiscoDesastre(functionCall.args),
        // Throw an exception if the model attempted to call a function that was
        // not declared.
        _ => throw UnimplementedError(
            'Function not implemented: ${functionCall.name}')
      };
      // Send the response to the model so that it can use the result to generate
      // text for the user.
      response = await chat
          .sendMessage(Content.functionResponse(functionCall.name, result));
    }
// When the model responds with non-null text content, print it.
    if (response.text case final text?) {
      print(text);
    }
  }
}
