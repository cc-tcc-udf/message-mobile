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

  late final _$loginAsyncAction =
      AsyncAction('LoginControllerBase.login', context: context);

  @override
  Future<void> login({required String email, required String senha}) {
    return _$loginAsyncAction
        .run(() => super.login(email: email, senha: senha));
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
error: ${error},
passwordVisible: ${passwordVisible},
manterConectado: ${manterConectado},
loginEntity: ${loginEntity}
    ''';
  }
}
