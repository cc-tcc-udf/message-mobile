import '../../../../core/config/endpoints_consts.dart';
import '../../../../core/config/http_config.dart';
import '../../../../core/http/http_client_dio.dart';
import '../../../../core/http/server_exception.dart';
import '../../../../core/localstorage/security_local_storage.dart';
import '../../../../core/localstorage/security_shared_preference.dart';
import '../models/mensagem_model.dart';


abstract class MensagemDatasource {
  Future<MensagemModel?> listarMensagens();
  // Future<ResponseCadastroUsuarioModel?> cadastroUsuario(CadastroUsuarioModel usuarios);
}

class MensagemDatasourceImpl implements MensagemDatasource {
  final HttpClientDio client;

  MensagemDatasourceImpl({required this.client});


  @override
  Future<MensagemModel?> listarMensagens() async {
    try {
      final SecurityLocalStorage storage = SecuritySharedPreference();
      var result = await client.get(
          baseOptions: HttpConfig.apiCampus,
          endpoint: EndPointsConsts.listaMensagens,
      );

      if (result.statusCode == 200) {
        final mensagem = MensagemModel.fromJson(result.data);
        return mensagem;
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
