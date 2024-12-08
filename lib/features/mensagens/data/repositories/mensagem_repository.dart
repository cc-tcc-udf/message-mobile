import '../datasources/mensagem_datasource.dart';
import '../models/detalhe_mensagem_model.dart';
import '../models/envio_view_favorite_model.dart';
import '../models/index_model.dart';
import '../models/mensagem_model.dart';

abstract class MensagemRepository {
  Future<MensagemModel?> listarMensagens(String id, String flag);
  Future<DetalheMensagemModel?> detalheMensagem(String id, String idAluno);
  Future<dynamic> viewFavorite(EnvioViewFavoriteModel envio);
  Future<IndexModel?> indexMensagens(String id);
}

class MensagemRepositoryImpl implements MensagemRepository {
  final MensagemDatasource datasource;
  MensagemRepositoryImpl(
      {required this.datasource});

  @override
  Future<MensagemModel?> listarMensagens(String id, String flag) async {
    try {
      return await datasource.listarMensagens(id, flag);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DetalheMensagemModel?> detalheMensagem(String id, String idAluno) async {
    try {
      return await datasource.detalheMensagem(id, idAluno);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> viewFavorite(EnvioViewFavoriteModel envio) async {
    try {
      return datasource.viewFavorite(envio);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<IndexModel?> indexMensagens(String id) async {
    try {
      return await datasource.indexMensagens(id);
    } catch (e) {
      rethrow;
    }
  }
}
