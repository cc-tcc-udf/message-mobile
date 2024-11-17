// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensagem_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MensagemController on MensagemControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MensagemControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'MensagemControllerBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$mensagemAtom =
      Atom(name: 'MensagemControllerBase.mensagem', context: context);

  @override
  MensagemModel? get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(MensagemModel? value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  late final _$detalheMensagemAtom =
      Atom(name: 'MensagemControllerBase.detalheMensagem', context: context);

  @override
  DetalheMensagemModel? get detalheMensagem {
    _$detalheMensagemAtom.reportRead();
    return super.detalheMensagem;
  }

  @override
  set detalheMensagem(DetalheMensagemModel? value) {
    _$detalheMensagemAtom.reportWrite(value, super.detalheMensagem, () {
      super.detalheMensagem = value;
    });
  }

  late final _$listarMensagensAsyncAction =
      AsyncAction('MensagemControllerBase.listarMensagens', context: context);

  @override
  Future<MensagemModel?> listarMensagens() {
    return _$listarMensagensAsyncAction.run(() => super.listarMensagens());
  }

  late final _$detalhesMensagemAsyncAction =
      AsyncAction('MensagemControllerBase.detalhesMensagem', context: context);

  @override
  Future<DetalheMensagemModel?> detalhesMensagem(String id) {
    return _$detalhesMensagemAsyncAction.run(() => super.detalhesMensagem(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
mensagem: ${mensagem},
detalheMensagem: ${detalheMensagem}
    ''';
  }
}
