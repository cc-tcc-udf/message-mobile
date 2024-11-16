import '../../../../core/config/endpoints_consts.dart';
import '../../../../core/config/http_config.dart';
import '../../../../core/http/http_client_dio.dart';
import '../../../../core/http/server_exception.dart';
import '../../../../core/localstorage/security_local_storage.dart';
import '../../../../core/localstorage/security_shared_preference.dart';
import '../../domain/entities/login_entity.dart';
import '../models/cadastro_usuario_model.dart';
import '../models/login_model.dart';
import '../models/response_cadastro_usuario_model.dart';

abstract class LoginDatasource {
  Future<LoginModel?> login(String email, String password);
  Future<ResponseCadastroUsuarioModel?> cadastroUsuario(CadastroUsuarioModel usuarios);
}

class LoginDatasourceImpl implements LoginDatasource {
  final HttpClientDio httpClient;
  final SecurityLocalStorage localStorage;

  LoginDatasourceImpl({required this.httpClient, required this.localStorage});

  @override
  Future<LoginModel?> login(String email, String password) async {
    try {
      final SecurityLocalStorage storage = SecuritySharedPreference();
      var result = await httpClient.post(
          baseOptions: HttpConfig.apiCampus,
          endpoint: EndPointsConsts.login,
          data: {
            "email": email,
            "password": password,
          });

      if (result.statusCode == 200) {
        final login = LoginModel.fromJson(result.data);
        await storage.write("token", login.token);
        await storage.write("email", login.email);
        return login;
      } else {
        throw ServerException(result.statusMessage);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ResponseCadastroUsuarioModel?> cadastroUsuario(CadastroUsuarioModel usuarios) async {
    try {
      final SecurityLocalStorage storage = SecuritySharedPreference();
      var result = await httpClient.post(
          baseOptions: HttpConfig.apiCampus,
          endpoint: EndPointsConsts.cadastro,
          data: usuarios.toJson()
      );

      print(result.toString());

      if (result.statusCode == 200) {
        final cadastro = ResponseCadastroUsuarioModel.fromJson(result.data);
        await storage.write('token', cadastro.token);
        return cadastro;
      } else {
        throw ServerException(result.statusMessage);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // @override
  // Future<bool> alterarSenha(
  //     {required AlterarSenhaEntity alterarSenhaEntity}) async {
  //   try {
  //     var response = await httpClient.post(
  //         baseOptions: HttpConfig.optionsSIGOPPortal,
  //         endpoint: EndPointsConsts.alterarSenha,
  //         data: {
  //           "idCliente": alterarSenhaEntity.idCliente,
  //           "senhaAtual": alterarSenhaEntity.senhaAtual,
  //           "novaSenha": alterarSenhaEntity.novaSenha,
  //           "novaSenhaConfirmacao": alterarSenhaEntity.novaSenhaConfirmacao
  //         });
  //     if (response.statusCode == 200) {
  //       return response.data;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
