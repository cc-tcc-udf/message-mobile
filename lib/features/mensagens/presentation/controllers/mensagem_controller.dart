import 'package:campus_connect/features/login/data/models/cadastro_usuario_model.dart';
import 'package:campus_connect/features/login/data/models/response_cadastro_usuario_model.dart';
import 'package:campus_connect/features/mensagens/data/models/mensagem_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/localstorage/security_shared_preference.dart';

import '../../domain/usecases/mensagem_usecase.dart';


part 'mensagem_controller.g.dart';

class MensagemController = MensagemControllerBase with _$MensagemController;

abstract class MensagemControllerBase with Store {
  final MensagemUsecase usecase;
  final SecuritySharedPreference secureStorage = SecuritySharedPreference();

  MensagemControllerBase({
    required this.usecase,
  });

  @observable
  bool isLoading = false;

  @observable
  String error = '';

  @observable
  MensagemModel? mensagem;

  @action
  Future<MensagemModel?> listarMensagens() async {
    isLoading = true;
    error = '';
    try {
      mensagem = await usecase.listarMensagens();

    } catch (e) {
      error = e.toString();
      mensagem = null;
    } finally {
      isLoading = false;
    }
  }

  // @action
  // Future<void> cadastrar(CadastroUsuarioModel usuario) async {
  //   isLoading = true;
  //   try {
  //     cadastro = await loginUsecase.cadastro(usuario);
  //
  //   } catch (e) {
  //     error = e.toString();
  //   } finally {
  //     isLoading = false;
  //   }
  // }

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
