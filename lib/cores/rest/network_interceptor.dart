import 'package:dio/dio.dart';
import 'package:imsakiyah_mobile/cores/constants/cons.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({});

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 500) {
      logg.clear();
    }
    super.onResponse(response, handler);
  }
}
