import 'package:dio/dio.dart';

class SettingDio {
  static Duration duration = const Duration(microseconds: 5000);
  static Dio createDio() {
    BaseOptions options = BaseOptions(
      contentType: Headers.jsonContentType,
      // connectTimeout: duration, //Timeout in milliseconds for opening connection
      // receiveTimeout: duration, // Timeout in milliseconds for receiving data
    );

    Dio dio = Dio(options);

    // Add interceptors if needed
    dio.interceptors.add(LogInterceptor());

    return dio;
  }
}
