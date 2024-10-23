import '../../../../../../../core/config/http_config.dart';
import '../../../../../../../core/http/http_client_dio.dart';
import '../../../../../../../core/http/server_exception.dart';
import '../../../../core/config/endpoints_consts.dart';
import '../../../../core/localstorage/security_local_storage.dart';
import '../../../../core/localstorage/security_shared_preference.dart';
import '../../../login/data/models/response_cadastro_usuario_model.dart';
import '../models/atualizar_usuario_model.dart';
import '../models/response_data_user_model.dart';
import '../models/response_list_courses_model.dart';

abstract class UsuariosDatasource {
  Future<ResponseListCoursesModel?> getListCursos();
  Future<ResponseDataUserModel?> getDadosUsuario({required String email});
  Future<ResponseDataUserModel?> atualizarUsuario(AtualizarUsuarioModel usuario);
}

class UsuariosDatasourceImpl implements UsuariosDatasource {
  final HttpClientDio client;

  UsuariosDatasourceImpl({required this.client});

  @override
  Future<ResponseListCoursesModel?> getListCursos() async {
    try {
      var result = await client.get(
        baseOptions: HttpConfig.apiCampus,
        endpoint: EndPointsConsts.listaCursos,
      );

      if (result.statusCode == 200) {
        return ResponseListCoursesModel.fromJson(result.data);
      } else {
        throw ServerException(result.statusMessage ?? "Unknown error");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ResponseDataUserModel?> getDadosUsuario({required String email}) async {
    try {
      final SecurityLocalStorage storage = SecuritySharedPreference();
      var token = await storage.read("token");

      var result = await client.get(
        baseOptions: HttpConfig.apiCampus,
        headers: [{"Accept": '*/*', "Authorization": 'Bearer $token'}],
        endpoint: EndPointsConsts.dadosUsuario(email: email),
      );

      if (result.statusCode == 200) {
        return ResponseDataUserModel.fromJson(result.data);
      } else {
        throw ServerException(result.statusMessage ?? "Unknown error");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // @override
  // Future<RespostaEnvioAnexoModel> envioArquivo({
  //   required AnexoModel arquivo,
  // }) async {
  //   try {
  //     final SecurityLocalStorage storage = SecuritySharedPreference();
  //     var token = await storage.read("token");
  //
  //     MultipartFile multipartFile = MultipartFile.fromBytes(
  //       arquivo.arquivo,
  //       filename: 'image.jpg',
  //     );
  //
  //     FormData formData = FormData.fromMap({
  //       'arquivo': multipartFile,
  //     });
  //
  //     var result = await client.post(
  //       baseOptions: HttpConfig.apiRetaguarda,
  //       headers: [{
  //         "Accept": '*/*',
  //         "Authorization": 'Bearer $token',
  //       }],
  //       endpoint: EndPointsConsts.anexo,
  //       data: formData,
  //     );
  //
  //     if (result.statusCode == 200) {
  //       final arquivo = RespostaEnvioAnexoModel.fromJson(result.data);
  //       return arquivo;
  //     } else {
  //       throw ServerException('Erro ao enviar arquivo: ${result.statusCode}');
  //     }
  //   } catch (e) {
  //     throw ServerException(e.toString());
  //   }
  // }

  @override
  Future<ResponseDataUserModel?> atualizarUsuario(AtualizarUsuarioModel usuario) async {
    try {
      final SecurityLocalStorage storage = SecuritySharedPreference();
      var token = await storage.read("token");
      var result = await client.put(
          baseOptions: HttpConfig.apiCampus,
          headers: [{"Accept": '*/*', "Authorization": 'Bearer $token'}],
          endpoint: EndPointsConsts.atualizarUsuario,
          data: usuario.toJson()
      );

      if (result.statusCode == 200) {
        final atualizar = ResponseDataUserModel.fromJson(result.data);
        return atualizar;
      } else {
        throw ServerException(result.statusMessage);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

}
