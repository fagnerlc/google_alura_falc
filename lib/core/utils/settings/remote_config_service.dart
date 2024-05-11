import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:google_alura_falc/core/utils/constants/endpoints.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfigService({required this.remoteConfig});

  Future<void> initialize() async {
    try {
      await remoteConfig.setDefaults({'apiKeyGemini': 'default_value'});
      await remoteConfig.fetchAndActivate();
    } catch (e) {
      print('Failed to initialize remote config: $e');
    }
    Endpoints.aiStudioKey = apiKeyGemini;
    // print(apiKeyGemini);
  }

  String get apiKeyGemini {
    return remoteConfig.getString('apiKeyGemini');
  }
}
