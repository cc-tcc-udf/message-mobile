import 'package:campus_connect/features/login/data/models/cadastro_usuario_model.dart';
import 'package:campus_connect/features/login/data/models/response_cadastro_usuario_model.dart';

import '../../data/models/login_model.dart';
import '../../data/repositories/login_repository.dart';

abstract class LoginUsecase {
  Future<LoginModel?> call({required String email, required String senha});

  Future<ResponseCadastroUsuarioModel?> cadastro(CadastroUsuarioModel usuario);
}

class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository repository;

  LoginUsecaseImpl({required this.repository});

  @override
  Future<LoginModel?> call(
      {required String email, required String senha}) async {
    try {
      return await repository.login(email, senha);
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<ResponseCadastroUsuarioModel?> cadastro(
      CadastroUsuarioModel usuario) async {
    try {
      return await repository.cadastro(usuario);
    } catch (e) {
      return Future.error(e);
    }
  }
}
