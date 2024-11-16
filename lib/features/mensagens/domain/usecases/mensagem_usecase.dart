import '../../data/models/detalhe_mensagem_model.dart';
import '../../data/models/mensagem_model.dart';
import '../../data/repositories/mensagem_repository.dart';


abstract class MensagemUsecase {
  Future<MensagemModel?> listarMensagens();
  Future<DetalheMensagemModel?> detalheMensagem(int id);
}

class MensagemUsecaseImpl implements MensagemUsecase {
  final MensagemRepository repository;

  MensagemUsecaseImpl({required this.repository});

  @override
  Future<MensagemModel?> listarMensagens() async {
    try {
      return await repository.listarMensagens();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DetalheMensagemModel?> detalheMensagem(int id) async {
    try {
      return await repository.detalheMensagem(id);
    } catch (e) {
      rethrow;
    }
  }
}
