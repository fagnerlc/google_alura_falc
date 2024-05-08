import 'package:google_alura_falc/core/utils/constants/endpoints.dart';
import 'package:google_alura_falc/core/utils/settings/setting_dio.dart';

//nossa url base
var baseUrl = Endpoints.aiStudioUrl;

//nossa classe responsável por encapsular os métodos http
class GeminiProvider {
  var dioHttpClient = SettingDio.createDio();
//seu client http, pode ser http, http.Client, dio, apenas traga seus métodos para cá e funcionarão normalmente :D
  GeminiProvider();

  //um exemplo rápido, aqui estamos recuperando todos os posts disponibilizados pela api(100)
  postResposta() async {
    var url = baseUrl + Endpoints.aiStudioKey;
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
    } catch (e) {
      print('Error: $e');
    }
  }
}
