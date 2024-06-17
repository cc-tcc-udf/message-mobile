import 'package:campus_connect/core/localstorage/security_shared_preference.dart';
import 'package:get_it/get_it.dart';
import '../http/http_client_dio.dart';
import '../http/http_client_impl.dart';

class AppInjection {
  static final GetIt getIt = GetIt.instance;

  static Future<void> init() async {
    getIt
      ..registerFactory<HttpClientDio>(() => HttpClientImpl())
      ..registerLazySingleton(() => SecuritySharedPreference());
  }
}
