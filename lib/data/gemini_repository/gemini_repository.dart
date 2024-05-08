import 'package:google_alura_falc/data/gemini_provider/gemini_provider.dart';

//Repositório responsável pela entidade post !!
//lembrando que cada entidade que persiste de alguma forma com o banco de dados, seja ela uma api ou sqlite
//deve possuir um repositório excluisivo
class GeminiRepository {
  final GeminiProvider apiClient;

  GeminiRepository({required this.apiClient});

  postResposta() {
    return apiClient.postResposta();
  }
}
