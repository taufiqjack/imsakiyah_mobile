import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imsakiyah_mobile/cores/constants/cons.dart';

class RestConfig {
  static BaseOptions options() => BaseOptions(
        baseUrl: '${dotenv.env[BASE_URL]}',
        sendTimeout: const Duration(hours: 24),
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 100000),
        followRedirects: false,
        validateStatus: (status) => true,
      );
  final Dio _dio;

  RestConfig(this._dio);

  Dio dio() {
    return _dio;
  }
}
