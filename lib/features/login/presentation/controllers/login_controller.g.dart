// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'LoginControllerBase.isLoading', context: context);

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

  late final _$nomeAtom =
      Atom(name: 'LoginControllerBase.nome', context: context);

  @override
  TextEditingController get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(TextEditingController value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: 'LoginControllerBase.telefone', context: context);

  @override
  TextEditingController get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(TextEditingController value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'LoginControllerBase.email', context: context);

  @override
  TextEditingController get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(TextEditingController value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: 'LoginControllerBase.senha', context: context);

  @override
  TextEditingController get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(TextEditingController value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$confirmarAtom =
      Atom(name: 'LoginControllerBase.confirmar', context: context);

  @override
  TextEditingController get confirmar {
    _$confirmarAtom.reportRead();
    return super.confirmar;
  }

  @override
  set confirmar(TextEditingController value) {
    _$confirmarAtom.reportWrite(value, super.confirmar, () {
      super.confirmar = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'LoginControllerBase.error', context: context);

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

  late final _$passwordVisibleAtom =
      Atom(name: 'LoginControllerBase.passwordVisible', context: context);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  late final _$manterConectadoAtom =
      Atom(name: 'LoginControllerBase.manterConectado', context: context);

  @override
  bool get manterConectado {
    _$manterConectadoAtom.reportRead();
    return super.manterConectado;
  }

  @override
  set manterConectado(bool value) {
    _$manterConectadoAtom.reportWrite(value, super.manterConectado, () {
      super.manterConectado = value;
    });
  }

  late final _$loginEntityAtom =
      Atom(name: 'LoginControllerBase.loginEntity', context: context);

  @override
  LoginModel? get loginEntity {
    _$loginEntityAtom.reportRead();
    return super.loginEntity;
  }

  @override
  set loginEntity(LoginModel? value) {
    _$loginEntityAtom.reportWrite(value, super.loginEntity, () {
      super.loginEntity = value;
    });
  }

  late final _$cadastroAtom =
      Atom(name: 'LoginControllerBase.cadastro', context: context);

  @override
  ResponseCadastroUsuarioModel? get cadastro {
    _$cadastroAtom.reportRead();
    return super.cadastro;
  }

  @override
  set cadastro(ResponseCadastroUsuarioModel? value) {
    _$cadastroAtom.reportWrite(value, super.cadastro, () {
      super.cadastro = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginControllerBase.login', context: context);

  @override
  Future<void> login({required String email, required String senha}) {
    return _$loginAsyncAction
        .run(() => super.login(email: email, senha: senha));
  }

  late final _$cadastrarAsyncAction =
      AsyncAction('LoginControllerBase.cadastrar', context: context);

  @override
  Future<void> cadastrar(CadastroUsuarioModel usuario) {
    return _$cadastrarAsyncAction.run(() => super.cadastrar(usuario));
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
nome: ${nome},
telefone: ${telefone},
email: ${email},
senha: ${senha},
confirmar: ${confirmar},
error: ${error},
passwordVisible: ${passwordVisible},
manterConectado: ${manterConectado},
loginEntity: ${loginEntity},
cadastro: ${cadastro}
    ''';
  }
}
