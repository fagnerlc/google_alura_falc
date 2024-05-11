import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:google_alura_falc/core/utils/constants/endpoints.dart';
import 'package:google_alura_falc/core/utils/settings/setting_dio.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

//nossa url base
var baseUrl = Endpoints.aiStudioUrl;
// final model =
//     GenerativeModel(model: 'gemini-1.5-pro', apiKey: Endpoints.aiStudioKey);

//nossa classe responsável por encapsular os métodos http
class GeminiProvider {
  var dioHttpClient = SettingDio.createDio();
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  GeminiProvider();

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  postResposta() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    // await remoteConfig.setDefaults({'apiKeyGemini': 'apiKeyGemini'});
    await remoteConfig.fetchAndActivate();
    String apiKeyGemini = remoteConfig.getString('apiKeyGemini');

    var url = baseUrl + apiKeyGemini;
    var body = {
      "contents": [
        {
          "parts": [
            {"text": "Write a story about a magic backpack"}
          ]
        }
      ]
    };
    try {
      //usando dio
      var response = await dioHttpClient.post(url, data: body);
      if (response.statusCode == 200) {
        print('Response body: ${response.data}');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }

      var teste = await findExchangeRate({
        'currencyDate': '2024-04-17',
        'currencyFrom': 'USD',
        'currencyTo': 'SEK'
      });
      print(teste);
      ExecuteGenerativeModel();
    } catch (e) {
      print('Error: $e');
    }
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

  // final exchangeRateToolPort = FunctionDeclaration(
  //     'encontrarTaxaDeCambio',
  //     'Retorna a taxa de câmbio entre moedas em uma data específica.',
  //     Schema(SchemaType.object, properties: {
  //       'currencyDate': Schema(SchemaType.string,
  //           description: 'Uma data no formato YYYY-MM-DD ou '
  //               'o valor exato "mais recente" se um período de tempo não for especificado.'),
  //       'currencyFrom': Schema(SchemaType.string,
  //           description: 'O código da moeda da moeda para converter,'
  //               'como "USD".'),
  //       'currencyTo': Schema(SchemaType.string,
  //           description: 'O código da moeda da moeda para converter, '
  //               'como "USD".')
  //     }, requiredProperties: [
  //       'dataDaMoeda',
  //       'origemDaMoeda'
  //     ]));

  ExecuteGenerativeModel() async {
    final model = GenerativeModel(
      // Use a model that supports function calling, like Gemini 1.0 Pro
      // See "Supported models" in the "Introduction to function calling" page.
      model: 'gemini-1.0-pro',
      // model: 'gemini-1.5-pro-latest',
      apiKey: Endpoints.aiStudioKey,

      // Specify the function declaration.
      tools: [
        Tool(functionDeclarations: [exchangeRateTool])
      ],
    );

    final chat = model.startChat();
    final prompt = 'How much is 50 US dollars worth in Swedish krona?';

// Send the message to the generative model.
    var response = await chat.sendMessage(Content.text(prompt));

    final functionCalls = response.functionCalls.toList();
// When the model response with a function call, invoke the function.
    if (functionCalls.isNotEmpty) {
      final functionCall = functionCalls.first;
      final result = switch (functionCall.name) {
        // Forward arguments to the hypothetical API.
        'findExchangeRate' => await findExchangeRate(functionCall.args),
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
