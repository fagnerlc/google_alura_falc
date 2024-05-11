import 'package:google_alura_falc/data/gemini_provider/gemini_provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

//Repositório responsável pela entidade post !!
//lembrando que cada entidade que persiste de alguma forma com o banco de dados, seja ela uma api ou sqlite
//deve possuir um repositório excluisivo
class GeminiRepository {
  final GeminiProvider apiClient;

  GeminiRepository({required this.apiClient});

  getResposta(
    String solicitacao,
    String tipoDesastre,
    String cidade,
    String paisEstado,
    String descricao,
  ) {
    return apiClient.getResposta(
      solicitacao,
      tipoDesastre,
      cidade,
      paisEstado,
      descricao,
    );
  }

  Future<void> executeGenerativeModel(
    GenerativeModel model,
  ) {
    return apiClient.executeGenerativeModel(model);
  }
}
