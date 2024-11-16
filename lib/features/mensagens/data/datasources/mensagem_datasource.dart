import '../../../../core/config/endpoints_consts.dart';
import '../../../../core/config/http_config.dart';
import '../../../../core/http/http_client_dio.dart';
import '../../../../core/http/server_exception.dart';
import '../../../../core/localstorage/security_local_storage.dart';
import '../../../../core/localstorage/security_shared_preference.dart';
import '../models/detalhe_mensagem_model.dart';
import '../models/mensagem_model.dart';


abstract class MensagemDatasource {
  Future<MensagemModel?> listarMensagens();
  Future<DetalheMensagemModel?> detalheMensagem(int id);
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
      print(result.data);

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

  @override
  Future<DetalheMensagemModel?> detalheMensagem(int id) async {
    try {
      final SecurityLocalStorage storage = SecuritySharedPreference();
      var result = await client.get(
        baseOptions: HttpConfig.apiCampus,
        endpoint: EndPointsConsts.detalheMensagem(id: id),
      );

      if (result.statusCode == 200) {
        final mensagem = DetalheMensagemModel.fromJson(result.data);
        return mensagem;
      } else {
        throw ServerException(result.statusMessage);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
