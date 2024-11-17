import 'package:campus_connect/features/mensagens/data/models/detalhe_mensagem_model.dart';
import 'package:campus_connect/features/mensagens/data/models/mensagem_model.dart';
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

  @observable
  DetalheMensagemModel? detalheMensagem;

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
    return null;
  }

  @action
  Future<DetalheMensagemModel?> detalhesMensagem(String id) async {
    isLoading = true;
    error = '';
    try {
      detalheMensagem = await usecase.detalheMensagem(id);
    } catch (e) {
      error = e.toString();
      mensagem = null;
    } finally {
      isLoading = false;
    }
    return null;
  }
}
