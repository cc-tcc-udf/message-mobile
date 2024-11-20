import '../datasources/mensagem_datasource.dart';
import '../models/detalhe_mensagem_model.dart';
import '../models/mensagem_model.dart';

abstract class MensagemRepository {
  Future<MensagemModel?> listarMensagens(String id);
  Future<DetalheMensagemModel?> detalheMensagem(String id);
}

class MensagemRepositoryImpl implements MensagemRepository {
  final MensagemDatasource datasource;
  MensagemRepositoryImpl(
      {required this.datasource});

  @override
  Future<MensagemModel?> listarMensagens(String id) async {
    try {
      return await datasource.listarMensagens(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DetalheMensagemModel?> detalheMensagem(String id) async {
    try {
      return await datasource.detalheMensagem(id);
    } catch (e) {
      rethrow;
    }
  }

}
