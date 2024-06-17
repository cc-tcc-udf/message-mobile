import 'package:campus_connect/core/localstorage/security_shared_preference.dart';
import 'package:dio/dio.dart';

class AuthInterceptorDio extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final SecuritySharedPreference storage = SecuritySharedPreference();

    if (options.headers['Authorization'] == null) {
      var token = await storage.read("token");
      if (token != null) {
        options.headers = {"Authorization": 'Bearer $token'};
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ignore: avoid_print
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
