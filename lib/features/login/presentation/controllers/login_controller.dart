import 'package:campus_connect/features/login/data/models/cadastro_usuario_model.dart';
import 'package:campus_connect/features/login/data/models/response_cadastro_usuario_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/localstorage/security_shared_preference.dart';
import '../../data/models/login_model.dart';
import '../../domain/usecases/login_usecase.dart';
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginUsecase loginUsecase;
  final SecuritySharedPreference secureStorage = SecuritySharedPreference();

  LoginControllerBase({
    required this.loginUsecase,
  });

  @observable
  bool isLoading = false;

  @observable
  TextEditingController nome = TextEditingController();
  @observable
  TextEditingController telefone = TextEditingController();
  @observable
  TextEditingController email = TextEditingController();
  @observable
  TextEditingController senha = TextEditingController();
  @observable
  TextEditingController confirmar = TextEditingController();

  @observable
  String error = '';

  @observable
  bool passwordVisible = false;

  @observable
  bool manterConectado = true;

  @observable
  LoginModel? loginEntity;

  @observable
  ResponseCadastroUsuarioModel? cadastro;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  Future<void> login({required String email, required String senha}) async {
    isLoading = true;
    error = '';
    try {
      loginEntity = await loginUsecase(email: email, senha: senha, isMobile: true);
    } catch (e) {
      error = e.toString();
      loginEntity = null;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> cadastrar(CadastroUsuarioModel usuario) async {
    isLoading = true;
    try {
      cadastro = await loginUsecase.cadastro(usuario);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

// @observable
// ClienteModel? cliente;

// @action
// Future<void> getDadosCliente({required int idCliente}) async {
//   isLoading = true;
//   error = '';
//   try {
//     cliente = await obterDadosClienteUsecase(idCliente: idCliente);
//   } catch (e) {
//     error = e.toString();
//     clienteLoginEntity = null;
//   } finally {
//     isLoading = false;
//   }
// }

// Future<void> deslogar() async {
//   cliente = null;
//   clienteLoginEntity = null;
//   await secureStorage.removeAll();
//   await removerDadosCacheUsecase(
//       key: CadastroClienteConfig.cacheDadosPessoais);
//   await removerDadosCacheUsecase(
//       key: CadastroClienteConfig.cacheDocumentosVinculo);
//   await removerDadosCacheUsecase(key: CadastroClienteConfig.cacheEndereco);
//   await removerDadosCacheUsecase(key: CadastroClienteConfig.cacheDocumentos);
//   await removerDadosCacheUsecase(
//       key: CadastroClienteConfig.cacheComprovantesResidencia);
// }
//
// Future<void> abrirCadastroSite() async {
//   if (!await launchUrl(Uri.parse('${HttpConfig.portal}/cadastro'))) {
//     throw Exception('Erro');
//   }
// }
}
