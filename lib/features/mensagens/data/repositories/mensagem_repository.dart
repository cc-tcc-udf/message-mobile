import '../datasources/mensagem_datasource.dart';
import '../models/mensagem_model.dart';

abstract class MensagemRepository {
  Future<MensagemModel?> listarMensagens();
  // Future<ResponseCadastroUsuarioModel?> cadastro(CadastroUsuarioModel usuario);
}

class MensagemRepositoryImpl implements MensagemRepository {
  final MensagemDatasource datasource;
  MensagemRepositoryImpl(
      {required this.datasource});

  @override
  Future<MensagemModel?> listarMensagens() async {
    try {
      return await datasource.listarMensagens();
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<ResponseCadastroUsuarioModel?> cadastro(CadastroUsuarioModel usuarios) async {
  //   try {
  //     return await datasource.cadastroUsuario(usuarios);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<bool> alterarSenha(
  //     {required AlterarSenhaEntity alterarSenhaEntity}) async {
  //   try {
  //     return datasource.alterarSenha(alterarSenhaEntity: alterarSenhaEntity);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

}
