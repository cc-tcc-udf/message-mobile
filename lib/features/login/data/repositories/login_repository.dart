

import 'package:campus_connect/features/login/data/models/cadastro_usuario_model.dart';
import 'package:campus_connect/features/login/data/models/login_model.dart';
import 'package:campus_connect/features/login/data/models/response_cadastro_usuario_model.dart';

import '../datasources/login_datasource.dart';

abstract class LoginRepository {
  Future<LoginModel?> login(String cpf, String senha, bool isMobile);
  Future<ResponseCadastroUsuarioModel?> cadastro(CadastroUsuarioModel usuario);
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;
  LoginRepositoryImpl(
      {required this.datasource});

  @override
  Future<LoginModel?> login(String email, String senha, bool isMobile) async {
    try {
      return await datasource.login(email, senha, isMobile);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseCadastroUsuarioModel?> cadastro(CadastroUsuarioModel usuarios) async {
    try {
      return await datasource.cadastroUsuario(usuarios);
    } catch (e) {
      rethrow;
    }
  }



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
