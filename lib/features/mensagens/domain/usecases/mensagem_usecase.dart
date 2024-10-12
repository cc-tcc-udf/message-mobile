
import 'package:campus_connect/features/login/data/models/cadastro_usuario_model.dart';
import 'package:campus_connect/features/login/data/models/response_cadastro_usuario_model.dart';

import '../../data/models/mensagem_model.dart';
import '../../data/repositories/mensagem_repository.dart';


abstract class MensagemUsecase {
  Future<MensagemModel?> listarMensagens();
  // Future<ResponseCadastroUsuarioModel?> cadastro(
  //     CadastroUsuarioModel usuario);
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
}
