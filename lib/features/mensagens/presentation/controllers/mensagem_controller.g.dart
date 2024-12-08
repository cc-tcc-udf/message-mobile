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

  late final _$favoritoAtom =
      Atom(name: 'MensagemControllerBase.favorito', context: context);

  @override
  bool get favorito {
    _$favoritoAtom.reportRead();
    return super.favorito;
  }

  @override
  set favorito(bool value) {
    _$favoritoAtom.reportWrite(value, super.favorito, () {
      super.favorito = value;
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

  late final _$indexAtom =
      Atom(name: 'MensagemControllerBase.index', context: context);

  @override
  IndexModel? get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(IndexModel? value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$listarMensagensAsyncAction =
      AsyncAction('MensagemControllerBase.listarMensagens', context: context);

  @override
  Future<MensagemModel?> listarMensagens(String id, String flag) {
    return _$listarMensagensAsyncAction
        .run(() => super.listarMensagens(id, flag));
  }

  late final _$detalhesMensagemAsyncAction =
      AsyncAction('MensagemControllerBase.detalhesMensagem', context: context);

  @override
  Future<DetalheMensagemModel?> detalhesMensagem(String id, String idAluno) {
    return _$detalhesMensagemAsyncAction
        .run(() => super.detalhesMensagem(id, idAluno));
  }

  late final _$indexMensagensAsyncAction =
      AsyncAction('MensagemControllerBase.indexMensagens', context: context);

  @override
  Future<IndexModel?> indexMensagens(String id) {
    return _$indexMensagensAsyncAction.run(() => super.indexMensagens(id));
  }

  late final _$viewFavoriteAsyncAction =
      AsyncAction('MensagemControllerBase.viewFavorite', context: context);

  @override
  Future<dynamic> viewFavorite(EnvioViewFavoriteModel envio) {
    return _$viewFavoriteAsyncAction.run(() => super.viewFavorite(envio));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
mensagem: ${mensagem},
favorito: ${favorito},
detalheMensagem: ${detalheMensagem},
index: ${index}
    ''';
  }
}
