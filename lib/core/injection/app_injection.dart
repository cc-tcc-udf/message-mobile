import 'package:campus_connect/core/localstorage/security_shared_preference.dart';
import 'package:campus_connect/features/mensagens/data/datasources/mensagem_datasource.dart';
import 'package:campus_connect/features/mensagens/data/repositories/mensagem_repository.dart';
import 'package:campus_connect/features/mensagens/domain/usecases/mensagem_usecase.dart';
import 'package:campus_connect/features/mensagens/presentation/controllers/mensagem_controller.dart';
import 'package:campus_connect/features/usuarios/data/datasources/usuarios_datasource.dart';
import 'package:campus_connect/features/usuarios/data/repositories/usuario_repository.dart';
import 'package:campus_connect/features/usuarios/domain/usecases/usuario_usecase.dart';
import 'package:campus_connect/features/usuarios/presentation/controllers/usuario_controller.dart';
import 'package:get_it/get_it.dart';
import '../../features/login/data/datasources/login_datasource.dart';
import '../../features/login/data/repositories/login_repository.dart';
import '../../features/login/domain/usecases/login_usecase.dart';

import '../../features/login/presentation/controllers/login_controller.dart';
import '../http/http_client_dio.dart';
import '../http/http_client_impl.dart';

class AppInjection {
  static final GetIt getIt = GetIt.instance;

  static Future<void> init() async {
    getIt
      ..registerFactory<HttpClientDio>(() => HttpClientImpl())
      ..registerLazySingleton(() => SecuritySharedPreference())
      ..registerFactory<LoginDatasource>(() => LoginDatasourceImpl(
          httpClient: getIt.get<HttpClientDio>(),
          localStorage: getIt.get<SecuritySharedPreference>()))
      ..registerFactory<LoginRepository>(
          () => LoginRepositoryImpl(datasource: getIt.get<LoginDatasource>()))
      ..registerFactory<LoginUsecase>(
          () => LoginUsecaseImpl(repository: getIt.get<LoginRepository>()))
      ..registerLazySingleton(
          () => LoginController(loginUsecase: getIt.get<LoginUsecase>()))

      //Usuarios
      ..registerFactory<UsuariosDatasource>(() => UsuariosDatasourceImpl(
            client: getIt.get<HttpClientDio>(),
          ))
      ..registerFactory<UsuarioRepository>(() =>
          UsuarioRepositoryImpl(datasource: getIt.get<UsuariosDatasource>()))
      ..registerFactory<UsuarioUsecase>(
          () => UsuarioUsecaseImpl(repository: getIt.get<UsuarioRepository>()))
      ..registerLazySingleton(
          () => UsuarioController(usecase: getIt.get<UsuarioUsecase>()))
      //Mensagem
      ..registerFactory<MensagemDatasource>(() => MensagemDatasourceImpl(
            client: getIt.get<HttpClientDio>(),
          ))
      ..registerFactory<MensagemRepository>(() =>
          MensagemRepositoryImpl(datasource: getIt.get<MensagemDatasource>()))
      ..registerFactory<MensagemUsecase>(
          () => MensagemUsecaseImpl(repository: getIt.get<MensagemRepository>()))
      ..registerLazySingleton(
          () => MensagemController(usecase: getIt.get<MensagemUsecase>()));
  }
}
