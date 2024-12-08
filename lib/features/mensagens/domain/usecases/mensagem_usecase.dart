import '../../data/models/detalhe_mensagem_model.dart';
import '../../data/models/envio_view_favorite_model.dart';
import '../../data/models/index_model.dart';
import '../../data/models/mensagem_model.dart';
import '../../data/repositories/mensagem_repository.dart';


abstract class MensagemUsecase {
  Future<MensagemModel?> listarMensagens(String id, String flag);
  Future<DetalheMensagemModel?> detalheMensagem(String id, String idAluno);
  Future<dynamic> viewFavorite(EnvioViewFavoriteModel envio);
  Future<IndexModel?> indexMensagens(String id);
}

class MensagemUsecaseImpl implements MensagemUsecase {
  final MensagemRepository repository;

  MensagemUsecaseImpl({required this.repository});

  @override
  Future<MensagemModel?> listarMensagens(String id, String flag) async {
    try {
      return await repository.listarMensagens(id, flag);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DetalheMensagemModel?> detalheMensagem(String id, String idAluno) async {
    try {
      return await repository.detalheMensagem(id, idAluno);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> viewFavorite(EnvioViewFavoriteModel envio) async {
    try {
      return repository.viewFavorite(envio);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<IndexModel?> indexMensagens(String id) async {
    try {
      return await repository.indexMensagens(id);
    } catch (e) {
      rethrow;
    }
  }
}
